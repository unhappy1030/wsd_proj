package org.example.wsd_proj.controller;

import org.example.wsd_proj.Service.CRecipeService;
import org.example.wsd_proj.VO.CManual;
import org.example.wsd_proj.VO.CRecipe;
import org.example.wsd_proj.VO.Recipe;
import org.example.wsd_proj.VO.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/custom")
public class CRecipeController {

    @Autowired
    private CRecipeService cRecipeService;
    @GetMapping("/")
    public String myPage(Model model) {
        List<CRecipe> recipes = cRecipeService.getAllRecipes();
        model.addAttribute("recipes", recipes); // 모델에 레시피 리스트 추가
        return "crecipe-list";  // 'recipe-list.jsp' 파일을 렌더링
    }

    @PostMapping("/insert")
    public String insertRecipe(@ModelAttribute CRecipe cRecipe, Model model, HttpSession session) {
        UserVO loginvo = (UserVO) session.getAttribute("login");

        if (loginvo != null) {
            System.out.println("User : " + loginvo.getUserid());

            cRecipe.setUserId(loginvo.getUserid()); // getUserId() 로 수정
            System.out.println("cRecipe: " + cRecipe.toString());
            // CRecipeService를 사용하여 레시피 추가
            int insertedRecipeId = cRecipeService.insertCRecipe(cRecipe);
            System.out.println("insertedRecipeId: " + insertedRecipeId);
            // 추가된 레시피의 ID를 사용하여 CNutrition 및 CManual에 recipeId 설정
            cRecipe.getNutritionInfo().setRecipeId(String.valueOf(insertedRecipeId));
            int i = 0;
            for (CManual step : cRecipe.getManualSteps()) {
                step.setRecipeId(String.valueOf(insertedRecipeId));
                step.setStepOrder(i);
                System.out.println("step: " + step.toString());
                i++;
            }

            cRecipeService.insertCNutrition(cRecipe.getNutritionInfo());
            cRecipeService.insertCManualSteps(cRecipe.getManualSteps());

            return "redirect:/";
        } else {
            // 로그인되지 않은 경우 처리 (예: 로그인 페이지로 리다이렉트)
            return "redirect:/login";
        }
    }
}