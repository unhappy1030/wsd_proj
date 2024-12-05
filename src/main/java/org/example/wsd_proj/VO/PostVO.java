package org.example.wsd_proj.VO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor @AllArgsConstructor
public class PostVO {
    private int id;
    private String title;
    private String author;
    private String content;
    private String createdAt;
    private String modifiedAt;
}
