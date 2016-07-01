/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;

import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.dto.Scenario;
import com.lpsmuseum.dto.scenario.Challenge;
import com.lpsmuseum.dto.scenario.ScenarioChallenge;
import com.lpsmuseum.dto.scenario.Theme;
import com.lpsmuseum.service.ChallengeService;
import com.lpsmuseum.service.MuseologicalObjectService;
import com.lpsmuseum.service.MuseumService;
import com.lpsmuseum.service.ScenarioService;
import com.lpsmuseum.service.ThemeService;
import com.lpsmuseum.service.builders.ScenarioBuilder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Alex
 */
@Controller
public class ScenarioController {
    public static Scenario sc = new Scenario();
    @RequestMapping("/scenario")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("scenario/list");
        ArrayList<Museum> museums = (ArrayList<Museum>) new MuseumService().listMuseum();
        ArrayList<Theme> themes = (ArrayList<Theme>) new ThemeService().listThemes();
        ArrayList<Scenario> scenarios = (ArrayList<Scenario>) new ScenarioService().listScenarios();
        ArrayList<Challenge> challenges = (ArrayList<Challenge>) new ChallengeService().listChallenges();
        ArrayList<MuseologicalObject> objects = (ArrayList<MuseologicalObject>) new MuseologicalObjectService().listObjects();
        mv.addObject("themes",themes);
        mv.addObject("museums",museums);
        mv.addObject("scenarios",scenarios);
        mv.addObject("challenges",challenges);
        mv.addObject("objects",objects);
        mv.addObject("sc",sc);
        return mv;
    }

    @RequestMapping("actions/saveScenario")
    public void save(Scenario scenario, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ScenarioBuilder sb = new ScenarioBuilder();
        String[] objects = request.getParameterValues("Object");
        String[] challenges = request.getParameterValues("Challenge");
        
        for (String c : challenges) {
            sb.withChallenge(new ChallengeService().findById(Long.parseLong(c)));
        }
        for (String o : objects) {
             sb.withObject(new MuseologicalObjectService().findById(Long.parseLong(o)));
        }        
        sb.withTheme(new ThemeService().findById(Long.parseLong(request.getParameter("idTheme")))).build(scenario.getName(),scenario.getIdMuseum());    
        
        sc = new Scenario();
        response.sendRedirect("../scenario");
    }

    @RequestMapping("actions/deleteScenario")
    public void delete(Scenario scenario, HttpServletResponse response) throws Exception {
        new ScenarioService().deleteScenario(scenario.getId());
        response.sendRedirect("../scenario");
    }
    
    @RequestMapping("actions/editScenario")
    public void edit(Scenario scenario, HttpServletRequest request, HttpServletResponse response) throws Exception {
        sc = new ScenarioService().findById(scenario.getId());        
        sc.setTheme(new ThemeService().findById(Long.parseLong(request.getParameter("idTheme"))));
        response.sendRedirect("../scenario");
    }

}
