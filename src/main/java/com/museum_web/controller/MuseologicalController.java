/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.museum_web.controller;

import com.lpsmuseum.dto.MuseologicalObject;
import com.lpsmuseum.service.MuseologicalObjectService;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class MuseologicalController {

    @RequestMapping("museological")
    public ModelAndView list() {
        ModelAndView mv = new ModelAndView("museological/list");
        ArrayList<MuseologicalObject> list = (ArrayList<MuseologicalObject>) new MuseologicalObjectService().listObjects();
        mv.addObject("list", list);
        DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        mv.addObject("sdf", sdf);
        return mv;
    }

    @RequestMapping("actions/saveMuseological")
    public void save(MuseologicalObject museum, HttpServletRequest request, HttpServletResponse response) throws Exception {
        //ModelAndView mv = new ModelAndView("museum/list");
        String dateText = request.getParameter("dateText");
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        Calendar cal = Calendar.getInstance();
        cal.setTime(df.parse(dateText));
        museum.setDate(cal);
        if (museum.getId() == 0) {
            museum.setId(null);
            new MuseologicalObjectService().createObject(museum);
        } else {
            new MuseologicalObjectService().editObject(museum);
        }
        response.sendRedirect("../museological");
    }

    @RequestMapping("actions/deleteMuseological")
    public void delete(MuseologicalObject museum, HttpServletResponse response) throws Exception {
        new MuseologicalObjectService().deleteObject(museum.getId());
        response.sendRedirect("../museological");
    }
}
