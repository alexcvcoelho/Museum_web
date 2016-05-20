/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;

import com.lpsmuseum.dto.scenario.Answer;
import com.lpsmuseum.service.AnswerService;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author filip_000
 */
@Controller
public class AnswerController {
    
    @RequestMapping("answer")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("answer/list");		
		return mv;
	}
        
    @RequestMapping("actions/SaveAnswer")
    public ModelAndView saveAnswer(Answer answer, HttpServletRequest request) throws Exception {
        if(answer.getId() == 0)
            answer.setId(null);
        new AnswerService().createAnswer(answer);
        
        
        ModelAndView mv = new ModelAndView("answer/list");
        return mv;
    }
    
}

