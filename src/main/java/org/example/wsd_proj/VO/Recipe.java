package org.example.wsd_proj.VO;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class Recipe {
    private String rcpSeq;
    private String recipeName;
    private String cookingMethod;
    private String dishType;
    private String ingredients;
    private String hashTag;
    private String lowSodiumTip;
    private String mainImagePath;
    private Nutrition nutritionInfo;
    private List<Manual> manualSteps;
}