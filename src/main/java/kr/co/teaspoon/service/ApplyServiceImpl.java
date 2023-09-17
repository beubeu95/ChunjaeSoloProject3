package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.ApplyDAO;
import kr.co.teaspoon.dto.Apply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyServiceImpl implements ApplyService{

    @Autowired
    private ApplyDAO applyDAO;

    @Override
    public int getCount(int appNo) throws Exception {
        return applyDAO.getCount(appNo);
    }

    @Override
    public void applyInsert(Apply apply) throws Exception {
        applyDAO.applyInsert(apply);
    }

    @Override
    public void applyDelete(int appNo) throws Exception {
        applyDAO.applyDelete(appNo);
    }
}
