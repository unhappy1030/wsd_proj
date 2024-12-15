package org.example.wsd_proj.Service;

import org.example.wsd_proj.DAO.RecipeDAO;
import org.example.wsd_proj.VO.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecipeService {

    @Autowired
    private RecipeDAO recipeDAO;

    // 레시피 목록 가져오기
    public List<Recipe> getAllRecipes() {
        return recipeDAO.selectAllRecipes();
    }

    public List<Recipe> searchRecipes(String query) {
        return recipeDAO.findByRecipeNameContaining(query);
    }

    // 레시피 상세 정보 가져오기
    public Recipe getRecipeById(String rcpSeq) {
        Recipe recipe = recipeDAO.selectRecipeById(rcpSeq);
        if (recipe != null) {
            recipe.setNutritionInfo(recipeDAO.selectNutritionById(rcpSeq));
            recipe.setManualSteps(recipeDAO.selectManualById(rcpSeq));
        }
        return recipe;
    }
}
