package kr.co.teaspoon.service;

import kr.co.teaspoon.dao.AnnouncementDAO;
import kr.co.teaspoon.dto.Announcement;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AnnouncementServiceImpl implements AnnouncementService{

    @Autowired
    private AnnouncementDAO announcementDAO;

    @Override
    public List<Announcement> announcementList(Page page) throws Exception {
        return announcementDAO.announcementList(page);
    }

    @Override
    public int count(Page page) throws Exception {
        return announcementDAO.count(page);
    }

    @Override
    public Announcement announcementDetail(int ano) throws Exception {
        return announcementDAO.announcementDetail(ano);
    }

    @Override
    public void announcementInsert(Announcement dto) throws Exception {
        announcementDAO.announcementInsert(dto);
    }

    @Override
    public void announcementUpdate(Announcement dto) throws Exception {
        announcementDAO.announcementUpdate(dto);
    }

    @Override
    public void announcementDelete(int ano) throws Exception {
        announcementDAO.announcementDelete(ano);
    }
}
