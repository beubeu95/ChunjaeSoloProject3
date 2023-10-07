package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Announcement;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface AnnouncementDAO {
    public List<Announcement> announcementList (Page page) throws Exception;
    public int count(Page page) throws Exception;
    public Announcement announcementDetail(int ano) throws Exception;
    public void announcementInsert(Announcement dto) throws Exception;
    public void announcementUpdate(Announcement dto) throws Exception;
    public void announcementDelete(int ano) throws Exception;

}
