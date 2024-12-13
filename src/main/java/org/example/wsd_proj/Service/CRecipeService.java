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
    public int insertCManualSteps(List<CManual> cManuals) {
        return cRecipeDAO.insertCManualSteps(cManuals);
    }
}