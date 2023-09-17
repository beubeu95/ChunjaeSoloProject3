package kr.co.teaspoon.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Apply {
    private int appNo;
    private int eno;
    private String name;
    private String email;
    private String tel;
    private String addr1;
    private String addr2;
    private String postcode;
}
