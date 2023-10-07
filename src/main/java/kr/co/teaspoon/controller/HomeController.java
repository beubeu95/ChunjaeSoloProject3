package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Event;
import kr.co.teaspoon.dto.Notice;
import kr.co.teaspoon.service.EventService;
import kr.co.teaspoon.service.NoticeService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {
    //http:localhost:8081/pro03_war => / => /WEB-INF/views/index.jsp

    @Autowired
    private NoticeService noticeService;

    @Autowired
    private EventService eventService;

    @RequestMapping("/")
    public String home(Locale locale, Model model) throws Exception {
        Date date = new Date();
        DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                DateFormat.LONG, locale);
        String today = dateFormat.format(date);

        Page page = new Page();
        List<Notice> noticeList = noticeService.noticeList(page);
        List<Event> eventList = eventService.eventList(page);

        model.addAttribute("eventList", eventList);
        model.addAttribute("noticeList", noticeList);

        model.addAttribute("today", today);
        model.addAttribute("myName", "김현경");
        return "/index";
    }
}
