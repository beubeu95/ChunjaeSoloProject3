package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Apply;
import kr.co.teaspoon.dto.Lotto;

import java.util.List;

public interface LottoDAO {
    public List<Apply> applyList(int eno) throws Exception;
    public void randomList(int eno) throws Exception;
    public List<Lotto> lottoList(int eno) throws Exception;
    public void closeEvent(int eno) throws Exception;
}
