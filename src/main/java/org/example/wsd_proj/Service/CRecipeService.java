package org.example.wsd_proj.Service;

import org.example.wsd_proj.DAO.CRecipeDAO;
import org.example.wsd_proj.VO.CManual;
import org.example.wsd_proj.VO.CNutrition;
import org.example.wsd_proj.VO.CRecipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CRecipeService {

    @Autowired
    private CRecipeDAO cRecipeDAO;

    public void updateCRecipe(CRecipe recipe, CNutrition nutritionInfo, List<CManual> manualSteps) {
        // `crecipes` 테이블에 레시피 정보 업데이트
        cRecipeDAO.updateRecipe(recipe);

        // `cnutrition` 테이블에 영양 정보 업데이트
        cRecipeDAO.updateNutritionInfo(nutritionInfo);

        // `cmanual_steps` 테이블에 조리 단계 정보 업데이트
        cRecipeDAO.updateManualSteps(manualSteps);
    }
}
