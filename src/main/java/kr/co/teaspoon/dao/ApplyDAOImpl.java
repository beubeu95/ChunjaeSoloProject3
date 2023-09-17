package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Apply;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDAOImpl implements ApplyDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public int getCount(int appNo) throws Exception {
        return sqlSession.selectOne("apply.getCount", appNo);
    }

    @Override
    public void applyInsert(Apply apply) throws Exception {
        sqlSession.insert("apply.applyInsert", apply);
    }

    @Override
    public void applyDelete(int appNo) throws Exception {
        sqlSession.delete("apply.applyDelete", appNo);
    }
}
