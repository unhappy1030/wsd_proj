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

    public int insertCManual(List<CManual> cManuals) {
        return sqlSession.insert("crecipe.insertCManualSteps", cManuals);
    }
    public int insertCManualStep(CManual cManual) {
        return sqlSession.insert("crecipe.insertCManualStep", cManual);
    }

    public List<CRecipe> selectAllCRecipes(String userId) {
        return sqlSession.selectList("crecipe.selectAllRecipes", userId);
    }

    public CRecipe selectCRecipeById(int id) {
        return sqlSession.selectOne("crecipe.selectCRecipeById", id);
    }

    public CNutrition selectCNutritionById(int id) {
        return sqlSession.selectOne("crecipe.selectCNutritionById", id);
    }

    public List<CManual> selectCManualById(int id) {
        return sqlSession.selectList("crecipe.selectCManualById", id);
    }

    public void updateCNutrition(CNutrition cNutrition) {
        sqlSession.update("crecipe.updateCNutrition", cNutrition);
    }
    public void updateCManual(List<CManual> cManuals) {
        for (CManual manual : cManuals) {
            sqlSession.update("crecipe.updateSingleCManualStep", manual);
        }
    }
    public void updateCRecipe(CRecipe cRecipe) {
        sqlSession.update("crecipe.updateCRecipe", cRecipe);
    }

    public void deleteCManualById(int id) {
        sqlSession.delete("crecipe.deleteCManualStepsById", id);
    }

    public void deleteCNutritionById(int id) {
        sqlSession.delete("crecipe.deleteCNutritionById", id);
    }

    public void deleteCRecipeById(int id) {
        sqlSession.delete("crecipe.deleteCRecipeById", id);
    }
    public void deleteCManualByIdOrder(CManual cManual) {
        sqlSession.delete("crecipe.deleteCManualStepByIdOrder", cManual);
    }
}