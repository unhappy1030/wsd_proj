package org.example.wsd_proj.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.example.wsd_proj.Service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    @GetMapping("/recipes")
    public String showRecipes(Model model) throws JsonProcessingException {
        model.addAttribute("recipes", recipeService.getRecipes());
        return "recipes"; // recipes.jsp를 반환
    }
}