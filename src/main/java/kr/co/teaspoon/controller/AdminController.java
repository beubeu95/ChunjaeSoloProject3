package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.*;
import kr.co.teaspoon.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

    @Autowired
    HttpSession session;

    @Autowired
    private FileboardService fileboardService;

    @Autowired
    private MemberService memberService;

    @Autowired
    private AnnouncementService announcementService;

    @Autowired
    private LottoService lottoService;

    @Autowired
    private QnaService qnaService;

    @Autowired
    private EventService eventService;

    @Autowired
    private ApplyService applyService;


    @GetMapping("questionList.do")
    public String getNoAnswerList(HttpServletRequest request, Model model) throws Exception {
        //Page
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();

        int total = qnaService.noAnswerCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);
        model.addAttribute("curPage", curPage);     // 현재 페이지
        model.addAttribute("page", page);           // 페이징 데이터

        //QnaList
        List<Qna> noAnswerList = qnaService.noAnswerList();
        model.addAttribute("noAnswerList", noAnswerList);     //QnA 목록
        return "/admin/qnaList";
    }

    @GetMapping("eventlist.do")
    public String getEventList(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();

        // 페이징에 필요한 데이터 저장
        int total = eventService.getCount(page);
        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        List<Event> eventList = eventService.eventList(page);

        model.addAttribute("eventList", eventList);
        model.addAttribute("curPage", curPage);
        model.addAttribute("page", page);


        return "/admin/eventList";
    }

    @GetMapping("memberlist.do")
    public String adminMemberList(Model model) throws Exception {
        List<Member> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
        return "/admin/memberList";
    }

    @RequestMapping(value="memberDelete.do", method = RequestMethod.GET)
    public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        return "redirect: adminMemberList.do";
    }

    //이벤트 참여자 리스트
    @GetMapping("applyList.do")
    public String applyList(HttpServletRequest request, Model model) throws Exception {
        int eno = Integer.parseInt(request.getParameter("eno"));

        List<Apply> applyList = lottoService.applyList(eno);
        model.addAttribute("applyList", applyList);
        model.addAttribute("eno", eno);
        return "/admin/applyList";
    }

    //5명 추첨
    @GetMapping("lottoList.do")
    public String winners(HttpServletRequest request, Model model) throws Exception {
        int eno = Integer.parseInt(request.getParameter("eno"));

        List<Lotto> lottoList = lottoService.lottoList(eno);
        model.addAttribute("lottoList", lottoList);
        model.addAttribute("eno", eno);
        return "/admin/lottoList";
    }

    @GetMapping("lottoInsert.do")
    public String lottoInsert(HttpServletRequest request, Model model) throws Exception {
        int eno = Integer.parseInt(request.getParameter("eno"));
        List<Lotto> lottoList = lottoService.lottoList(eno);
        for(Lotto lotto : lottoList) {
            String name = lotto.getName();
            String firstName = name.substring(0,1);
            String lastName = name.substring(2,3);
            name = firstName+"*"+lastName;

            String id = lotto.getId();
            String hiddenid = id.substring(0,4);
            id = hiddenid+"***";

            lotto.setName(name);
            lotto.setId(id);
        }
        Event event = eventService.eventDetail(eno);
        model.addAttribute("lottoList", lottoList);
        model.addAttribute("event", event);

        return "/admin/lottoInsert";
    }

    @PostMapping("announcementInsert.do")
    public String getInsertPro(HttpServletRequest request, Model model) throws Exception {
        HttpSession session = request.getSession();
        Announcement dto = new Announcement();
        dto.setEno(Integer.parseInt(request.getParameter("eno")));
        dto.setTitle(request.getParameter("title"));
        dto.setContent(request.getParameter("content"));
        dto.setAuthor((String) session.getAttribute("sid"));
        announcementService.announcementInsert(dto);

        return "redirect:/lotto/list.do";
    }
}
