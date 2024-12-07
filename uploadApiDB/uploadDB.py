import os
from dotenv import load_dotenv
import requests
import pymysql
import json

load_dotenv()

# MariaDB 연결 정보
db_config = {
    "host": os.getenv("DB_HOST"),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("DB_NAME"),
    "charset": "utf8mb4"
}

# OpenAPI 호출 정보
API_URL = "http://openapi.foodsafetykorea.go.kr/api/{key}/COOKRCP01/json/{start}/{end}"
API_KEY = "3649564af8f14222a7d2"

# API에서 데이터 가져오기
def fetch_api_data(start_idx, end_idx):
    url = API_URL.format(key=API_KEY, start=start_idx, end=end_idx)
    response = requests.get(url)
    if response.status_code == 200:
        return response.json()
    else:
        print(f"API 호출 실패: {response.status_code}")
        return None

# 데이터를 MariaDB에 저장
def insert_data_to_db(data):
    connection = pymysql.connect(**db_config)
    cursor = connection.cursor()

    recipe_insert_query = """
        INSERT INTO recipes (recipe_name, cooking_method, dish_type, ingredients, hash_tag, low_sodium_tip)
        VALUES (%s, %s, %s, %s, %s, %s)
    """

    nutrition_insert_query = """
        INSERT INTO nutrition_info (recipe_id, weight, calories, carbohydrates, protein, fat, sodium)
        VALUES (%s, %s, %s, %s, %s, %s, %s)
    """

    manual_insert_query = """
        INSERT INTO manual_steps (recipe_id, step_order, step_description, step_image_path)
        VALUES (%s, %s, %s, %s)
    """

    try:
        for recipe in data.get("COOKRCP01", {}).get("row", []):
            # recipes 테이블 삽입
            cursor.execute(recipe_insert_query, (
                recipe.get("RCP_NM"),
                recipe.get("RCP_WAY2"),
                recipe.get("RCP_PAT2"),
                recipe.get("RCP_PARTS_DTLS"),
                recipe.get("HASH_TAG"),
                recipe.get("RCP_NA_TIP")
            ))
            recipe_id = cursor.lastrowid  # 삽입된 레시피 ID 가져오기

            # nutrition_info 테이블 삽입
            cursor.execute(nutrition_insert_query, (
                recipe_id,
                recipe.get("INFO_WGT"),
                recipe.get("INFO_ENG"),
                recipe.get("INFO_CAR"),
                recipe.get("INFO_PRO"),
                recipe.get("INFO_FAT"),
                recipe.get("INFO_NA")
            ))

            # manual_steps 테이블 삽입
            for i in range(1, 21):  # 최대 20단계
                step_description = recipe.get(f"MANUAL{i:02}")
                step_image_path = recipe.get(f"MANUAL_IMG{i:02}")
                if step_description:  # 단계가 존재하는 경우에만 삽입
                    cursor.execute(manual_insert_query, (
                        recipe_id, i, step_description, step_image_path
                    ))

        connection.commit()
        print("데이터 삽입 완료!")
    except Exception as e:
        print(f"DB 삽입 중 오류 발생: {e}")
        connection.rollback()
    finally:
        cursor.close()
        connection.close()

# 실행
if __name__ == "__main__":
    start_idx = 1
    end_idx = 10

    api_data = fetch_api_data(start_idx, end_idx)
    if api_data:
        insert_data_to_db(api_data)
