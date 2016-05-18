package com.museum_web.controller;

import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.service.ThemeService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Amanda
 */
@Controller
public class ThemeController {
     @RequestMapping("theme")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("theme/list");		
		return mv;
	}
        
    @RequestMapping("actions/SaveTheme")
    public ModelAndView saveTheme(Theme theme, HttpServletRequest request) throws Exception {
        new ThemeService().createTheme(theme);
        ModelAndView mv = new ModelAndView("theme/list");
        
        return mv;
    }
    
}
