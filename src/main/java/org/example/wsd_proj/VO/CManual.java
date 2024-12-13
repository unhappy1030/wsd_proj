package org.example.wsd_proj.VO;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CManual {
    private String recipeId;
    private int stepOrder;
    private String stepDescription;
    private String stepImagePath;
}
