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

    public int insertCRecipe(CRecipe cRecipe) {
        return cRecipeDAO.insertCRecipe(cRecipe);
    }
    public int insertCNutrition(CNutrition cNutrition) {
        return cRecipeDAO.insertCNutrition(cNutrition);
    }
    public int insertCManual(List<CManual> cManuals) {
        return cRecipeDAO.insertCManual(cManuals);
    }
    public int insertCManualStep(CManual cManual) {
        return cRecipeDAO.insertCManualStep(cManual);
    }

    public List<CRecipe> getAllRecipes(String userId) {
        return cRecipeDAO.selectAllCRecipes(userId);
    }
    public CRecipe getRecipeById(int id) {
        CRecipe recipe = cRecipeDAO.selectCRecipeById(id);
        if (recipe != null) {
            recipe.setNutritionInfo(cRecipeDAO.selectCNutritionById(id));
            recipe.setManualSteps(cRecipeDAO.selectCManualById(id));
        }
        return recipe;
    }

    public void updateCNutrition(CNutrition cNutrition) {
        cRecipeDAO.updateCNutrition(cNutrition);
    }
    public void updateCManual(List<CManual> cManual) {
        cRecipeDAO.updateCManual(cManual);
    }
    public void updateCRecipe(CRecipe cRecipe) {
        cRecipeDAO.updateCRecipe(cRecipe);
    }

    public void deleteRecipe(int id) {
        cRecipeDAO.deleteCNutritionById(id);
        cRecipeDAO.deleteCManualById(id);
        cRecipeDAO.deleteCRecipeById(id);
    }
    public void deleteCManualStep(CManual cManual) {
        cRecipeDAO.deleteCManualByIdOrder(cManual);
    }
}
