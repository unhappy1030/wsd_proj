package org.example.wsd_proj.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CNutrition {
    private String recipeId;
    private String weight;
    private String calories;
    private String carbohydrates;
    private String protein;
    private String fat;
    private String sodium;
}
