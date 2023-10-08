package kr.co.teaspoon.dao;

import kr.co.teaspoon.dto.Event;
import kr.co.teaspoon.dto.EventVO;
import kr.co.teaspoon.util.Page;

import java.util.List;

public interface EventDAO {
    public List<Event> eventList(Page page) throws Exception;
    public List<EventVO> myEventList(String id) throws Exception;
    public Event eventDetail(int eno) throws Exception;
    public int getCount(Page page) throws Exception;
    public void eventInsert(Event event) throws Exception;
    public void eventDelete(int eno) throws Exception;
    public void eventEdit(Event event) throws Exception;
}
