package kr.co.teaspoon.service;

import kr.co.teaspoon.dto.Apply;

public interface ApplyService {
    public int getCount(int appNo) throws Exception;
    public void applyInsert(Apply apply) throws Exception;
    public void applyDelete(int appNo) throws Exception;
}
