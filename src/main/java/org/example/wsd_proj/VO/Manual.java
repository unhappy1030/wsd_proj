package org.example.wsd_proj.VO;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Manual {
    private String rcpSeq;
    private int stepOrder;
    private String stepDescription;
    private String stepImagePath;
}