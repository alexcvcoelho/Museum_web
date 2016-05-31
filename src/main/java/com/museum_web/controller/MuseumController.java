/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;

import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.service.MuseumService;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Amanda
 */
@Controller
public class MuseumController {

    @RequestMapping("museum")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("museum/list");
        ArrayList<Museum> mus = (ArrayList<Museum>) new MuseumService().listMuseum();
        mv.addObject("list", mus);
        return mv;
    }

    @RequestMapping("museum/create")
    public ModelAndView create() {
        ModelAndView mv = new ModelAndView("museum/create");
        return mv;
    }
    
     @RequestMapping("actions/SaveMuseum")
    public ModelAndView saveTheme(Museum museum, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView("museum/list");
        if(museum.getId()==0){
            museum.setId(null);
            new MuseumService().createMuseum(museum);
        }
        else{
            new MuseumService().editMuseum(museum);
        }         
        return mv;
    }

}
