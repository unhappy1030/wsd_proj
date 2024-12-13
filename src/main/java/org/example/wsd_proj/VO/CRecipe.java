package org.example.wsd_proj.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CRecipe {
    private int id;
    private String userId;
    private String recipeName;
    private String cookingMethod;
    private String dishType;
    private String ingredients;
    private String hashTag;
    private String lowSodiumTip;
    private String mainImagePath;
    private CNutrition nutritionInfo;
    private List<CManual> manualSteps;
    @Override
    public String toString() {
        return "CRecipe{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", recipeName='" + recipeName + '\'' +
                ", cookingMethod='" + cookingMethod + '\'' +
                ", dishType='" + dishType + '\'' +
                ", ingredients='" + ingredients + '\'' +
                ", hashTag='" + hashTag + '\'' +
                ", lowSodiumTip='" + lowSodiumTip + '\'' +
                ", mainImagePath='" + mainImagePath + '\'' +
                '}';
    }
}