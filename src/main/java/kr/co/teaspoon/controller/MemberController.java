package kr.co.teaspoon.controller;

import kr.co.teaspoon.dto.*;
import kr.co.teaspoon.service.*;
import kr.co.teaspoon.util.CommentPage;
import kr.co.teaspoon.util.CommunityPage;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private EventService eventService;

    @Autowired
    private FileboardService fileboardService;

    @Autowired
    private CommunityService communityService;

    @Autowired
    private QnaService qnaService;

    @Autowired
    private CommentService commentService;

    @Autowired
    HttpSession session;

    BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();

    @RequestMapping("term.do")
    public String term(Model model) {
        return "/member/term";
    }

    @RequestMapping("join.do")
    public String join(Model model) {
        return "/member/join";
    }

    @RequestMapping(value="join.do", method=RequestMethod.POST)
    public String joinPro(ServletRequest request, ServletResponse response, Model model) throws Exception {
        Member member = new Member();
        String ppw = request.getParameter("pw");
        String pw = pwEncoder.encode(ppw);
        member.setId(request.getParameter("id"));
        member.setPw(pw);
        member.setName(request.getParameter("name"));
        member.setEmail(request.getParameter("email"));
        member.setTel(request.getParameter("tel"));
        member.setAddr1(request.getParameter("addr1"));
        member.setAddr2(request.getParameter("addr2"));
        member.setPostcode(request.getParameter("postcode"));
        member.setBirth(request.getParameter("birth"));
        memberService.memberInsert(member);

        return "/member/login";
    }

    @RequestMapping(value = "idCheck.do", method = RequestMethod.POST)
    public void idCheck(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        String id = request.getParameter("id");
        boolean result = memberService.idCheck(id);

        JSONObject json = new JSONObject();
        json.put("result", result);
        PrintWriter out = response.getWriter();
        out.println(json.toString());
    }

    @RequestMapping("login.do")
    public String memberLoginForm(Model model) throws Exception {
        return "/member/login";
    }
    @RequestMapping("login2.do")
    public String memberLoginForm2(Model model) throws Exception {
        return "/member/mypagecheck";
    }
    @RequestMapping(value = "loginpro.do", method = RequestMethod.POST)
    public String memberLogin(@RequestParam String id, @RequestParam String pw, Model model) throws Exception {
        boolean ps = memberService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            return "redirect:/";
        } else {
            return "redirect:login.do";
        }
    }

    @RequestMapping(value = "loginpro2.do", method = RequestMethod.POST)
    public String memberLogin2(HttpSession session, @RequestParam String pw, Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        boolean ps = memberService.loginCheck(id, pw);
        if(ps){
            session.setAttribute("sid", id);
            return "redirect:mypage.do";
        } else {
            return "redirect:login2.do";
        }
    }

    @GetMapping("logout.do")
    public String memberLogout(HttpSession session) throws Exception {
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value="update.do", method=RequestMethod.POST)
    public String memberUpdate(Member member, Model model) throws Exception {
        String pwd = "";
        if(member.getPw().length()<=16) {
            pwd = pwEncoder.encode(member.getPw());
            member.setPw(pwd);
        }
        memberService.memberEdit(member);
        return "redirect:/";
    }

    @RequestMapping(value="delete.do", method = RequestMethod.GET)
    public String memberDelete(@RequestParam String id, Model model, HttpSession session) throws Exception {
        memberService.memberDelete(id);
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("mypage.do")
    public String mypage(Model model) throws Exception {
        String id = (String) session.getAttribute("sid");
        Member member = memberService.getMember(id);
        model.addAttribute("member", member);
        return "/member/mypage";
    }

    @GetMapping("mngt.do")
    public String mypageMngt(HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
        String id = (String) session.getAttribute("sid");
        String category = request.getParameter("cate");

        List<Category> categories = communityService.categoryList();
        List<CommunityVO> community = communityService.myCommunityList("id");

        model.addAttribute("curCategory", category);
        model.addAttribute("categories", categories);
        model.addAttribute("community", community);

        return "/member/mypageMngt";
    }

    @GetMapping("getCommunity.do")
    public String communityDetail(HttpServletRequest request, Model model) throws Exception {
        CommunityVO comm = communityService.communityDetail(Integer.parseInt(request.getParameter("cno")));

        // 댓글 목록의 페이지
        int commentPage = request.getParameter("commentPage") != null ? Integer.parseInt(request.getParameter("commentPage")) : 1;

        // 댓글 페이징 처리
        CommentPage page = new CommentPage();

        List<Comment> commentList = commentService.commentList(page);

        model.addAttribute("detail", comm);
        model.addAttribute("commentList", commentList);
        model.addAttribute("commentPage", commentPage);
        model.addAttribute("page", page);
        model.addAttribute("cate", request.getParameter("cate"));

        return "/community/communityDetail";
    }

    @GetMapping("fileMngt.do")
    public String fileMngt(Model model) throws Exception{
        String id = (String) session.getAttribute("sid");

        List<Fileboard> fileboardList = fileboardService.myFileList("id");
        model.addAttribute("fileboardList", fileboardList);

        return "/member/fileMngt";
    }

    @GetMapping("qnaMngt.do")
    public String qnaMngt(Model model) throws Exception{
        String id = (String) session.getAttribute("sid");

        List<Qna> qnaList = qnaService.myQnaList("id");
        model.addAttribute("qnaList", qnaList);

        return "/member/qnaMngt";
    }

    @GetMapping("eventMngt.do")
    public String eventMngt(Model model) throws Exception{
        String id = (String) session.getAttribute("sid");

        List<EventVO> eventList = eventService.myEventList("id");
        model.addAttribute("eventList", eventList);

        return "/member/eventMngt";
    }



}