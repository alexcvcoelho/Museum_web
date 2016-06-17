/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;



import com.lpsmuseum.dto.scenario.Challenge;
import com.lpsmuseum.service.ChallengeService;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author filip_000
 */
@Controller
public class ChallengeController {
    
    List<Challenge> lista = new ArrayList<Challenge>();    
    
    @RequestMapping("/challenge")
	public ModelAndView list() {
            
            lista = new ChallengeService().listChallenges();
            ModelAndView mv = new ModelAndView("challenge/list");
            mv.addObject("lista", lista);
            mv.addObject("challenge", new Challenge());
            return mv;
            
	}
    
        
    @RequestMapping("/challenge/")
	public ModelAndView create() {
            
            
            ModelAndView mv = new ModelAndView("challenge/create");            
            mv.addObject("challenge", new Challenge());
            
            return mv;
            
	}
    
    @RequestMapping("actions/DeleteChallenge/{id}")
        public ModelAndView delete(@PathVariable("id") Long id, HttpServletRequest request) {


            ModelAndView mv = new ModelAndView("challenge/create");

            mv.addObject("challenge", new Challenge());
            return mv;

        }
}
