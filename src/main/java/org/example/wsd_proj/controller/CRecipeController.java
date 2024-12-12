package org.example.wsd_proj.controller;

import org.example.wsd_proj.Service.CRecipeService;
import org.example.wsd_proj.VO.CManual;
import org.example.wsd_proj.VO.CRecipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/custom")
public class CRecipeController {

    @Autowired
    private CRecipeService cRecipeService;

    @PostMapping("/insert")
    public String insertRecipe(@ModelAttribute CRecipe cRecipe, Model model) {
        // CRecipeService를 사용하여 레시피 추가
        int insertedRecipeId = cRecipeService.insertCRecipe(cRecipe); // 레시피 먼저 추가

        // 추가된 레시피의 ID를 사용하여 CNutrition 및 CManual에 recipeId 설정
        cRecipe.getNutritionInfo().setRecipeId(String.valueOf(insertedRecipeId));
        for (CManual step : cRecipe.getManualSteps()) {
            step.setRecipeId(String.valueOf(insertedRecipeId));
        }

        cRecipeService.insertCNutrition(cRecipe.getNutritionInfo()); // 영양 정보 추가
        cRecipeService.insertCManualSteps(cRecipe.getManualSteps()); // 조리 단계 추가

        return "redirect:/custom";
    }
}