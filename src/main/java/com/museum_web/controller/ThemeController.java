package com.museum_web.controller;

import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.entity.ThemeDO;
import com.lpsmuseum.service.ThemeService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

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
@EnableWebMvc
public class ThemeController {
          
     private ThemeService service;
     
     public ThemeController() {
        service = new ThemeService();
    }
     
    /**
     *
     */
    @RequestMapping("theme")
	public ModelAndView  list(){
            List<Theme> listTheme = service.listThemes();
            ModelAndView mv = new ModelAndView("theme/list"); 
            mv.addObject("listTheme", listTheme);
            return mv;            
	}
        
    @RequestMapping("actions/SaveTheme")
    public ModelAndView saveTheme(Theme theme, HttpServletRequest request) throws Exception {
        if(theme.getId()==0)
        theme.setId(null);
        new ThemeService().createTheme(theme);
        ModelAndView mv = new ModelAndView("theme/list");        
        return mv;
    }
    
    
}
