package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Announcement;
import kr.co.teaspoon.util.Page;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public class AnnouncementDAOImpl implements AnnouncementDAO{

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<Announcement> announcementList(Page page) throws Exception {
        return sqlSession.selectList("announcement.announcementList", page);
    }

    @Override
    public int count(Page page) throws Exception {
        return sqlSession.selectOne("announcement.count", page);
    }

    @Transactional
    @Override
    public Announcement announcementDetail(int ano) throws Exception {
        sqlSession.update("announcement.Count", ano);
        return sqlSession.selectOne("announcement.announcementDetail", ano);
    }

    @Override
    public void announcementInsert(Announcement dto) throws Exception {
        sqlSession.insert("announcement.announcementInsert", dto);
    }

    @Override
    public void announcementUpdate(Announcement dto) throws Exception {
        sqlSession.update("announcement.announcementUpdate", dto);
    }

    @Override
    public void announcementDelete(int ano) throws Exception {
        sqlSession.delete("announcement.announcementDelete", ano);
    }
}
