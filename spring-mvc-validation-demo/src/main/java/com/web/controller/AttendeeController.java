package com.web.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.model.Attendee;

@Controller
public class AttendeeController {

	@RequestMapping(value="/attendee", method=RequestMethod.GET)
	public String displayAttendees(Model model){
		Attendee attendee = new Attendee();
		attendee.setName("Tulasi");
		attendee.setEmail("ram.damarla@gmail.com");
		model.addAttribute(attendee);
		return "attendee";
	}
	
	@RequestMapping(value="/attendee", method=RequestMethod.POST)
	public String saveAttendee(@Valid Attendee attendee, BindingResult result, Model m){
		if(result.hasErrors()){
			return "attendee";
		}
		return "redirect:index";
	}
}
