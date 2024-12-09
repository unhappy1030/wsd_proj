package org.example.wsd_proj.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CManual {
    private String recipeId;
    private int stepOrder;
    private String stepDescription;
    private String stepImagePath;
}
