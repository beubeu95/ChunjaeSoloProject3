package kr.co.teaspoon.controller;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

@Controller
@RequestMapping("/crawler/*")
public class CrawlerController {

    public static HashMap<String, String> map;

    @RequestMapping(value = "list.do", method = RequestMethod.GET)
    public String startCrawl(Model model) throws IOException {
        int page = 1;
        ArrayList<String> n1 = new ArrayList<>();
        ArrayList<String> n2 = new ArrayList<>();
        ArrayList<String> n3 = new ArrayList<>();
        ArrayList<String> n4 = new ArrayList<>();

        while (page < 20) {
            String address = "https://www.hangyo.com/news/section_list_all.html?sec_no=1652&page=" + Integer.toString(page); //크롤링하고 싶은 페이지
            Document rawData = Jsoup.connect(address).timeout(5000).get();

            Elements newsItems = rawData.select("li");
            String realURL = "";
            String realTitle = "";
            String realContent = "";
            String realregdate = "";

            for (Element option : newsItems) {
                realURL = "https://www.hangyo.com" + option.select("a").attr("href");
                realTitle = option.select("h2").text();
                realContent = option.select("p").text();
                realregdate = option.select("em").text();

                n1.add(realURL);
                n2.add(realTitle);
                n3.add(realContent);
                n4.add(realregdate);

            }
            page += 10;
        }
        model.addAttribute("urls", n1);
        model.addAttribute("titles", n2);
        model.addAttribute("contents",n3);
        model.addAttribute("regdates", n4);


        return "/news/news";
    }
}