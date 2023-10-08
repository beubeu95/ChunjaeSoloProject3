package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventVO {
    private int eno;
    private String title;
    private String content;
    private String status;
    private int appNo;
    private String id;
    private String name;
    private String tel;
}
