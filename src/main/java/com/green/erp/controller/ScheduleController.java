package com.green.erp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/calender")
public class ScheduleController {

   @GetMapping("/schedulePopup")
   public String schedulePopup() {
      
      return "schedulePopup";
   }
   
   @GetMapping("/scheduleView")
   public String scheduleView() {
      
      return "scheduleView";
   }
   
}