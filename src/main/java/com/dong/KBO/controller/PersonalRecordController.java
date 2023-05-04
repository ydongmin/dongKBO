package com.dong.KBO.controller;

import com.dong.KBO.domain.H_recordDto;
import com.dong.KBO.domain.P_recordDto;
import com.dong.KBO.service.H_recordService;
import com.dong.KBO.service.P_recordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class PersonalRecordController {
    @Autowired
    P_recordService p_recordService;
    @Autowired
    H_recordService h_recordService;

    @GetMapping("/pitcherRecord")
    public String p_Record(Model m) throws Exception {
        List<P_recordDto> p_recordDto = p_recordService.getList();

        m.addAttribute("list", p_recordDto);
//        return "p_record";
        return "p_record";

    }

    @GetMapping("/hitterRecord")
    public String h_Record(Model m) throws Exception {
        List<H_recordDto> h_recordDto = h_recordService.getList();

        m.addAttribute("list", h_recordDto);

        return "h_record";
    }



}
