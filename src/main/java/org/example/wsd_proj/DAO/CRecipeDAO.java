package org.example.wsd_proj.DAO;

import org.apache.ibatis.session.SqlSession;
import org.example.wsd_proj.VO.CManual;
import org.example.wsd_proj.VO.CNutrition;
import org.example.wsd_proj.VO.CRecipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CRecipeDAO {

    @Autowired
    private SqlSession sqlSession;

    // 레시피 정보 가져오기 (crecipes 테이블)
    public CRecipe selectRecipeById(String rcpSeq) {
        return sqlSession.selectOne("crecipe.selectRecipeById", rcpSeq);
    }

    // 영양 정보 가져오기 (cnutrition 테이블)
    public CNutrition selectNutritionByRecipeId(String rcpSeq) {
        return sqlSession.selectOne("crecipe.selectNutritionByRecipeId", rcpSeq);
    }

    // 조리법 단계 가져오기 (cmanual_steps 테이블)
    public List<CManual> selectManualStepsByRecipeId(String rcpSeq) {
        return sqlSession.selectList("crecipe.selectManualStepsByRecipeId", rcpSeq);
    }

    // 레시피 정보 수정 (crecipes 테이블)
    public void updateRecipe(CRecipe recipe) {
        sqlSession.update("crecipe.updateRecipe", recipe);
    }

    // 영양 정보 수정 (cnutrition 테이블)
    public void updateNutritionInfo(CNutrition nutritionInfo) {
        sqlSession.update("crecipe.updateNutritionInfo", nutritionInfo);
    }

    // 조리법 단계 수정 (cmanual_steps 테이블)
    public void updateManualSteps(List<CManual> manualSteps) {
        for (CManual step : manualSteps) {
            sqlSession.update("crecipe.updateManualStep", step);
        }
    }
}