/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;

import com.lpsmuseum.dto.Annotation;
import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.dto.Museum;
import com.lpsmuseum.dto.scenario.Answer;
import com.lpsmuseum.service.AnnotationService;
import com.lpsmuseum.service.AnswerService;
import com.lpsmuseum.service.MuseologicalObjectService;
import com.lpsmuseum.service.MuseumService;
import java.util.ArrayList;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
/**
 *
 * @author filip_000
 */
@Controller
public class AnnotationController {
    
    AnnotationService as = new AnnotationService();
    
    @RequestMapping("/annotation")
        public ModelAndView list() {
            List<Annotation> annotations = as.listAnnotations();
            List<Museum> museums = (ArrayList<Museum>) new MuseumService().listMuseum();
            List<MuseologicalObject> objects = (ArrayList<MuseologicalObject>) new MuseologicalObjectService().listObjects();
            annotations = new AnnotationService().listAnnotations();
            ModelAndView mv = new ModelAndView("annotation/list");
            mv.addObject("lista", annotations);
            mv.addObject("museums", museums);
            mv.addObject("objects", objects);
            return mv;
            
	}
        
    
    @RequestMapping("/actions/SaveAnnotation")
    public void saveAnnotation(Annotation annotation, HttpServletResponse response) throws Exception {
        
        if(annotation.getId()==0)
        {
            annotation.setId(null);
            as.createAnnotation(annotation);
        }
        else
            as.editAnnotation(annotation);
                
        response.sendRedirect("../annotation");
        
        
    }
    
    @RequestMapping("/actions/DeleteAnnotation/{id}")
    public void deleteAnnotation(@PathVariable("id") Long id, HttpServletResponse response) throws Exception {
        
        as.deleteAnnotation(id);
                
        response.sendRedirect("../../annotation");
        
        
    }
    
}
