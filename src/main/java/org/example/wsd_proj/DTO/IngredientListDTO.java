package org.example.wsd_proj.DTO;

import lombok.Data;
import org.example.wsd_proj.VO.CRecipeIngredient;

import java.util.List;

@Data
public class IngredientListDTO {
    private List<CRecipeIngredient> ingredients;
}