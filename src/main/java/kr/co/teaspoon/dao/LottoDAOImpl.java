package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Apply;
import kr.co.teaspoon.dto.Lotto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LottoDAOImpl implements LottoDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Apply> applyList(int eno) throws Exception {
        return sqlSession.selectList("lotto.applyList", eno);
    }

    @Override
    public void randomList(int eno) throws Exception {
        sqlSession.insert("lotto.randomList", eno);
    }

    @Override
    public List<Lotto> lottoList(int eno) throws Exception {
        return sqlSession.selectList("lotto.lottoList", eno);
    }

    @Override
    public void closeEvent(int eno) throws Exception {
        sqlSession.update("lotto.closeEvent", eno);
    }
}
