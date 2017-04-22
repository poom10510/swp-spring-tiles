package com.websystique.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class AppController {

	@RequestMapping(value = { "/" }, method = RequestMethod.GET)
	public String homePage(ModelMap model) {
		return "home";
	}

	@RequestMapping(value = { "/sectionjs" }, method = RequestMethod.GET)
	public String productsPage(ModelMap model) {
		return "sectionjs";
	}

	@RequestMapping(value = { "/constants" }, method = RequestMethod.GET)
	public String contactUsPage(ModelMap model) {
		return "constants";
	}
}