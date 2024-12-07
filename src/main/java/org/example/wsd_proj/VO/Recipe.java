package org.example.wsd_proj.VO;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter @Setter
public class Recipe {
    private String RCP_SEQ;
    private String recipe_name;
    private String cooking_method;
    private String dish_type;
    private String ingredients;
    private String hash_tag;
    private String low_sodium_tip;
    private String main_image_path;
    private Nutrition nutritionInfo;
    private List<Manual> manualSteps;
}