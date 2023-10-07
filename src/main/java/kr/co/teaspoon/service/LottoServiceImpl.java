package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.LottoDAO;
import kr.co.teaspoon.dto.Apply;
import kr.co.teaspoon.dto.Lotto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LottoServiceImpl implements LottoService{

    @Autowired
    private LottoDAO lottoDAO;

    @Override
    public List<Apply> applyList(int eno) throws Exception {
        return lottoDAO.applyList(eno);
    }

    @Override
    public void randomList(int eno) throws Exception {
        lottoDAO.randomList(eno);
    }

    @Override
    public List<Lotto> lottoList(int eno) throws Exception {
        return lottoDAO.lottoList(eno);
    }

    @Override
    public void closeEvent(int eno) throws Exception {
        lottoDAO.closeEvent(eno);
    }
}
