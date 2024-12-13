package org.example.wsd_proj.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.wsd_proj.VO.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CRecipeDAO {
    @Autowired
    private SqlSession sqlSession;

    public int insertCRecipe(CRecipe cRecipe) {
        sqlSession.insert("crecipe.insertCRecipe", cRecipe);
        return cRecipe.getId();
    }

    public int insertCNutrition(CNutrition cNutrition) {
        return sqlSession.insert("crecipe.insertCNutrition", cNutrition);
    }

    public int insertCManualSteps(List<CManual> cManuals) {
        return sqlSession.insert("crecipe.insertCManualSteps", cManuals);
    }

    public List<CRecipe> selectAllRecipes() {
        return sqlSession.selectList("crecipe.selectAllRecipes");
    }

    public CRecipe selectRecipeById(int id) {
        return sqlSession.selectOne("crecipe.selectCRecipeById", id);
    }

    public CNutrition selectNutritionById(int id) {
        return sqlSession.selectOne("crecipe.selectCNutritionById", id);
    }

    public List<CManual> selectManualById(int id) {
        return sqlSession.selectList("crecipe.selectCManualById", id);
    }

    public void deleteRecipeById(int id, String userId) {
        sqlSession.delete("crecipe.deleteCNutritionInfoById", id);
        sqlSession.delete("crecipe.deleteCManualStepsById", id);
        sqlSession.delete("crecipe.deleteCRecipeById", Map.of("id", id, "userId", userId));
    }
}