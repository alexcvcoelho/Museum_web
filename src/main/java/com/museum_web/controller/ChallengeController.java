/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;



import com.lpsmuseum.dto.scenario.Answer;
import com.lpsmuseum.dto.scenario.Challenge;
import com.lpsmuseum.service.AnswerService;
import com.lpsmuseum.service.ChallengeService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    
      
    static Challenge c = new Challenge();
    ChallengeService cs = new ChallengeService();
    Boolean addError = false;
    
    @RequestMapping("/challenge")
	public ModelAndView list() {
            List<Challenge> lista = new ChallengeService().listChallenges();
            ModelAndView mv = new ModelAndView("challenge/list");
            mv.addObject("lista", lista);
            
            return mv;
            
	}
    
        
    @RequestMapping("/challengeCreate")
	public ModelAndView create(HttpServletRequest request) throws Exception {
            
            
            Long id = Long.parseLong(request.getParameter("id"));
            
            ModelAndView mv = new ModelAndView("challenge/create");
            
            c = new Challenge(); 
            
            
            if (id > 0 )
            {
                c = cs.findById(id);
            }
            
            List<Answer> answers = new AnswerService().listAnswers();
            List<Answer> aux = c.getAnswers();
            for(int j = 0; j < aux.size();j++)
            {
                
                for(int i = 0; i < answers.size();i++)
                {
                    if(aux.get(j).getId().compareTo(answers.get(i).getId())==0)
                    {
                        answers.remove(i);
                        break;
                    }
                }
                
            }
            
            
            
            
            mv.addObject("addError", addError );
            mv.addObject("challenge", c);
            mv.addObject("allAnswers",answers);
            
            addError=false;
           
            return mv;
            
	}
    
    @RequestMapping("actions/saveChallenge")
        public void add(Challenge challenge, HttpServletResponse response) throws Exception {

            c.setDescription(challenge.getDescription());
//            if(c.getChallengeId()<0)
//                c.setChallengeId(null);
            cs.createChallenge(c);
            response.sendRedirect("../challengeCreate?id="+c.getChallengeId());
           
        }
        
        
    @RequestMapping("actions/deleteChallenge")
        public void delete(Challenge c, HttpServletResponse response) throws IOException {

            cs.deleteChallenge(c.getChallengeId());   
            response.sendRedirect("../challenge");

        }
        
    @RequestMapping("actions/addAnswer/{Answer}")
        public void addAnswer(@PathVariable("Answer") Long answer , HttpServletRequest request,HttpServletResponse response) throws Exception {
            
            List<Answer> aux = c.getAnswers();
                        
            Answer a = new AnswerService().findById(answer);
            
            
            if(a.isCorrect() && c.getCorrectAnswer()!=null)
                addError = true;
            else
            {
                aux.add(a);
            
                c.setAnswers(aux);
            
                new ChallengeService().editChallenge(c);
                
                addError=false;
            }
            
            response.sendRedirect("../../challengeCreate?id=" + c.getChallengeId());

        }
        
    @RequestMapping("actions/removeAnswer/{Answer}")
        public void removeAnswer(@PathVariable("Answer") Long answer , HttpServletRequest request,HttpServletResponse response) throws Exception {
            
            List<Answer> aux = c.getAnswers();
            
            for(Answer x : aux)
            {
                if(x.getId().compareTo(answer)==0)
                {
                    aux.remove(x);
                    break;
                }
            }
            c.setAnswers(aux);
            
            new ChallengeService().editChallenge(c);
            
            response.sendRedirect("../../challengeCreate?id=" + c.getChallengeId());

        }
}
