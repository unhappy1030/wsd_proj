package org.example.wsd_proj.VO;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CRecipeIngredient {
    private int id;
    private int recipeId;
    private String ingredientName;
    private int isAvailable;
}
