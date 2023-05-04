package com.dong.KBO.controller;

import com.dong.KBO.dao.TeamRankDao;
import com.dong.KBO.domain.BoardDto;
import com.dong.KBO.domain.PageHandler;
import com.dong.KBO.domain.SearchCondition;
import com.dong.KBO.domain.TeamRankDto;
import com.dong.KBO.service.TeamRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.RequestScope;

import javax.servlet.http.HttpServletRequest;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;

@Controller
public class HomeController {
    @Autowired
    TeamRankService teamRankService;

    @RequestMapping("/")
    public String main(Model m) throws Exception {
        List<TeamRankDto> teamRankDto = teamRankService.getList();

        m.addAttribute("list", teamRankDto);
        return "index";
    }

}
