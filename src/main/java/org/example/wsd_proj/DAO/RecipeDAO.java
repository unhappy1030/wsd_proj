package org.example.wsd_proj.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.wsd_proj.VO.Recipe;
import org.example.wsd_proj.VO.Nutrition;
import org.example.wsd_proj.VO.Manual;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RecipeDAO {

    @Autowired
    private SqlSession sqlSession;

    // 모든 레시피 리스트 가져오기
    public List<Recipe> selectAllRecipes() {
        return sqlSession.selectList("recipe.selectAllRecipes");
    }

    public List<Recipe> findByRecipeNameContaining(String query) {
        return sqlSession.selectList("recipe.findByRecipeNameContaining", query);
    }

    // 특정 레시피 가져오기
    public Recipe selectRecipeById(String rcpSeq) {
        return sqlSession.selectOne("recipe.selectRecipeById", rcpSeq);
    }

    // 영양 정보 가져오기
    public Nutrition selectNutritionById(String rcpSeq) {
        return sqlSession.selectOne("recipe.selectNutritionById", rcpSeq);
    }

    // 요리법 단계 가져오기
    public List<Manual> selectManualById(String rcpSeq) {
        return sqlSession.selectList("recipe.selectManualById", rcpSeq);
    }
}
