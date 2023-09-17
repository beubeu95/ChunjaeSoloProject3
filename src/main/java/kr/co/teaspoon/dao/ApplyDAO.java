package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Apply;
import kr.co.teaspoon.dto.Comment;

public interface ApplyDAO {
    public int getCount(int appNo) throws Exception;
    public void applyInsert(Apply apply) throws Exception;
    public void applyDelete(int appNo) throws Exception;
}
