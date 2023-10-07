package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.Announcement;
import kr.co.teaspoon.service.AnnouncementService;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/announcement/*")
public class AnnouncementController {

    @Autowired
    HttpSession session;

    @Autowired
    private AnnouncementService announcementService;

    @GetMapping("list.do")
    public String announcementList(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();

        //페이징에 필요한 데이터 저장
        int total = announcementService.count(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Announcement> annList = announcementService.announcementList(page);

        model.addAttribute("annList",annList);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        return "/event/announcement";
    }

    @GetMapping("detail.do")
    public String getDetail(HttpServletRequest request, Model model) throws Exception {
        int ano = Integer.parseInt(request.getParameter("ano"));
        Announcement dto = announcementService.announcementDetail(ano);
        model.addAttribute("dto", dto);
        return "/event/announcementDetail";
    }


    @GetMapping("delete.do")
    public String getDelete(HttpServletRequest request, Model model) throws Exception {
        int ano = Integer.parseInt(request.getParameter("ano"));
        announcementService.announcementDelete(ano);
        return "redirect:list.do";
    }
}
