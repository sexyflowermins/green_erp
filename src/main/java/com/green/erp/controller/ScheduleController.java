package com.green.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.erp.dto.ScheduleDto;
import com.green.erp.repository.model.Notice;
import com.green.erp.repository.model.Schedule;
import com.green.erp.service.NoticeService;
import com.green.erp.service.ScheduleService;

@Controller
@RequestMapping("/calender")
public class ScheduleController {

	@Autowired
	private NoticeService noticeService;
	
    @Autowired
    private ScheduleService scheduleService;
    
    @ModelAttribute("noticeList")
	public List<Notice> getNoticeList() {
		List<Notice> noticeList = noticeService.findWithName();
		return noticeList;
	}

    @GetMapping("/scheduleView")
    public String scheduleView(Model model) {
        List<Schedule> scheduleList = scheduleService.selectSchedule();
        if(scheduleList.isEmpty()) {
            model.addAttribute("scheduleList", null);
        } else {
            model.addAttribute("scheduleList", scheduleList);
        }

        return "scheduleView";
    }



}