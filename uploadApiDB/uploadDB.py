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
# 데이터를 MariaDB에 저장
def insert_data_to_db(data):
    connection = None
    try:
        connection = pymysql.connect(**db_config)
        cursor = connection.cursor()

        recipe_insert_query = """
            INSERT IGNORE INTO recipes (RCP_SEQ, recipe_name, cooking_method, dish_type, ingredients, hash_tag, low_sodium_tip, main_image_path)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
        """

        nutrition_insert_query = """
            INSERT IGNORE INTO nutrition_info (RCP_SEQ, weight, calories, carbohydrates, protein, fat, sodium)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """

        manual_insert_query = """
            INSERT IGNORE INTO manual_steps (RCP_SEQ, step_order, step_description, step_image_path)
            VALUES (%s, %s, %s, %s)
        """

        for recipe in data.get("COOKRCP01", {}).get("row", []):
            parts_details = recipe.get("RCP_PARTS_DTLS", "").replace("\n", " ")
            main_image_path = recipe.get("ATT_FILE_NO_MAIN", "")  # 메인 이미지

            # 디버깅용 출력: 삽입되는 데이터 확인
            print(f"Inserting recipe: {recipe.get('RCP_NM', '')}, Main Image: {main_image_path}")

            cursor.execute(recipe_insert_query, (
                recipe.get("RCP_SEQ", ""),
                recipe.get("RCP_NM", ""),
                recipe.get("RCP_WAY2", ""),
                recipe.get("RCP_PAT2", ""),
                parts_details,
                recipe.get("HASH_TAG", ""),
                recipe.get("RCP_NA_TIP", ""),
                main_image_path
            ))

            rcp_seq = recipe.get("RCP_SEQ", "")

            cursor.execute(nutrition_insert_query, (
                rcp_seq,
                recipe.get("INFO_WGT", ""),
                recipe.get("INFO_ENG", ""),
                recipe.get("INFO_CAR", ""),
                recipe.get("INFO_PRO", ""),
                recipe.get("INFO_FAT", ""),
                recipe.get("INFO_NA", "")
            ))

            # 단계별 요리법 삽입
            for i in range(1, 21):  # 최대 20단계
                step_description = recipe.get(f"MANUAL{i:02}")
                step_image_path = recipe.get(f"MANUAL_IMG{i:02}")
                if step_description:
                    cursor.execute(manual_insert_query, (
                        rcp_seq, i, step_description, step_image_path
                    ))

        connection.commit()
        print("데이터 삽입 완료!")
    except Exception as e:
        print(f"DB 삽입 중 오류 발생: {e}")
        if connection:
            connection.rollback()
    finally:
        if connection:
            cursor.close()
            connection.close()


# 전체 데이터 가져오기
def fetch_all_data(total_count):
    start_idx = 0  # Adjust start index to 0-based
    end_idx = 500  # Fetch 500 records at a time
    while start_idx < total_count:  # Fetch until total_count
        print(f"Fetching data from {start_idx} to {end_idx}")
        api_data = fetch_api_data(start_idx, end_idx)
        if api_data:
            insert_data_to_db(api_data)
        start_idx += 500
        end_idx += 500
        if end_idx > total_count:
            end_idx = total_count

# 실행
if __name__ == "__main__":
    total_count = 1136  # 총 레시피 개수
    fetch_all_data(total_count)
