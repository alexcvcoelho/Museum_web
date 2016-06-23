/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;

import com.lpsmuseum.dto.scenario.Answer;
import com.lpsmuseum.service.AnswerService;
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
public class AnswerController {
    
    List<Answer> lista = new ArrayList<Answer>();
    
    
    
    @RequestMapping("/answer")
	public ModelAndView list() {
            
                lista = new AnswerService().listAnswers();
		ModelAndView mv = new ModelAndView("answer/list");
                mv.addObject("lista", lista);
		return mv;
	}
        
      
        
    @RequestMapping("/actions/SaveAnswer")
    public ModelAndView saveAnswer(Answer answer) throws Exception {
        
       
        
        if(answer.isCorrect() == null)
            answer.setCorrect(false);
        if(answer.getId() == 0)
        {
            answer.setId(null);
            new AnswerService().createAnswer(answer);
        }
        else
            new AnswerService().editAnswer(answer);
        
        
        ModelAndView mv = new ModelAndView("redirect:../answer");
        return mv;
        
    }
    
    
    @RequestMapping("actions/DeleteAnswer/{id}")
    public ModelAndView deleteAnswer(@PathVariable("id") Long id) throws Exception {


        ModelAndView mv = new ModelAndView("redirect:../../answer");
        
        new AnswerService().deleteAnswer(id);
        
        
        
        return mv;

    }
}

