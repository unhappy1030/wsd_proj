package org.example.wsd_proj.controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.wsd_proj.Service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
public class RecipeController {

    @Autowired
    private RecipeService recipeService;

    @GetMapping("/recipes")
    public String getRecipes(Model model) {
        try {
            JsonNode recipesNode = recipeService.getRecipes();
            if (recipesNode != null && recipesNode.has("COOKRCP01")) {
                JsonNode rows = recipesNode.get("COOKRCP01").get("row");
                ObjectMapper mapper = new ObjectMapper();
                List<Map<String, Object>> recipes = mapper.convertValue(rows, new TypeReference<List<Map<String, Object>>>() {});
                model.addAttribute("recipes", recipes);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "recipes";
    }
}