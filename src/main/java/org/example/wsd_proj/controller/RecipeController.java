package org.example.wsd_proj.controller;
import org.example.wsd_proj.Service.RecipeService;
import org.example.wsd_proj.VO.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Controller
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    // 레시피 목록 페이지
    @GetMapping("/recipes")
    public String getAllRecipes(Model model) {
        List<Recipe> recipes = recipeService.getAllRecipes();
        System.out.println("recipe list: ");
        for (Recipe recipe : recipes) {
            System.out.println(recipe);
        }
        model.addAttribute("recipes", recipes); // 모델에 레시피 리스트 추가
        return "recipe-list";  // 'recipe-list.jsp' 파일을 렌더링
    }

    // 레시피 상세 페이지
    @GetMapping("/recipe/{rcpSeq}")
    public String getRecipeDetail(@PathVariable("rcpSeq") String rcpSeq, Model model) {
        Recipe recipe = recipeService.getRecipeById(rcpSeq);
        model.addAttribute("recipe", recipe); // 모델에 레시피 객체 추가
        return "recipe-detail";  // 'recipe-detail.jsp' 파일을 렌더링
    }
}
