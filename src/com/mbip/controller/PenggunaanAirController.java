package com.mbip.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mbip.dbUtil.PenggunaanAirDAO;
import com.mbip.model.PenggunaanAir;
import com.mbip.model.User;

@Controller
@RequestMapping("/penggunaanAir")
public class PenggunaanAirController {

    @RequestMapping("/")
    protected ModelAndView displayBorangAir(HttpServletRequest request) {

        HttpSession session = request.getSession();
        ModelAndView model;

        if (session.getAttribute("user") == null) {
            // user did not log in yet!
            model = new ModelAndView("redirect:/auth/loginformpeserta");

        } else {
            model = new ModelAndView("air/MaklumatAir");
        }
        return model;
    }

    @RequestMapping(value = "/insertAir_nilai", method = RequestMethod.GET)
    public ModelAndView simpanAir_nilai(HttpServletRequest request) {

        String bulan = request.getParameter("bulan");
        String tahun = request.getParameter("tahun");
        String kategori = request.getParameter("kategori");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView mv;

        if (user == null) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            // get form for this specific value of bulan and tahun and akaun id
            mv = new ModelAndView("air/MaklumatAir");
            PenggunaanAirDAO penggunaanAirDAO = new PenggunaanAirDAO();

            PenggunaanAir penggunaanAir = penggunaanAirDAO.getPenggunaanAir(user.getAkaun_id(), Integer.parseInt(bulan),
                    Integer.parseInt(tahun));
            if (penggunaanAir == null) {
                penggunaanAir = new PenggunaanAir();

                penggunaanAir.setAkaun_id(user.getAkaun_id());
                penggunaanAir.setBulan(Integer.parseInt(bulan));
                penggunaanAir.setTahun(Integer.parseInt(tahun));
            }

            mv.addObject("air", penggunaanAir);
            mv.addObject("kategori", kategori);
        }

        return mv;
    }

    @RequestMapping(value = "/updateAir_nilai", method = RequestMethod.GET)
    public ModelAndView updateAir_nilai(@RequestParam Map<String, String> rp, HttpServletRequest request,
            @ModelAttribute("air") PenggunaanAir air) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int akaun_id = user.getAkaun_id();
        air.setAkaun_id(akaun_id);
        air.setPelepasan_karbon(air.getIsipadu_air() * 0.419);

        PenggunaanAirDAO airDAO = new PenggunaanAirDAO();
        airDAO.insertAir_nilai(air);
        ModelAndView mv = new ModelAndView("redirect:/auth/dashboard");
        return mv;

    }

    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST, consumes = {
            MediaType.MULTIPART_FORM_DATA_VALUE })
    public ModelAndView test(@RequestPart("filePDF") MultipartFile file, @RequestParam("bulan") int bulan,
            @RequestParam("tahun") int tahun, HttpServletRequest request) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;
        if (user == null) {
            mv = new ModelAndView("redirect:/auth/");

        } else {
            mv = new ModelAndView("redirect:/auth/dashboard");
            // writes file to salinanbil/air on tomcat
            String filepath = request.getServletContext()
                    .getRealPath("/salinanbil/air/" + user.getAkaun_id() + bulan + "" + tahun + ".pdf");

            // writes file to local folder
            String filepathLOCAL = System.getProperty("user.dir");
            writeTo(filepathLOCAL + "/WebContent/salinanbil/air/" + +user.getAkaun_id() + bulan + "" + tahun + ".pdf",
                    file);

            PenggunaanAirDAO penggunaanAirDAO = new PenggunaanAirDAO();
            penggunaanAirDAO.insertAir_salinan(filepath, user.getAkaun_id(), (bulan), (tahun));

            // writes file to tomcat
            try {
                file.transferTo(new File(filepath));

            } catch (Exception e) {
                // TODO Auto-generated catch block
                mv = new ModelAndView("akaun/akaunerror");
                mv.addObject("error", e.getMessage());

            }
        }
        return mv;
    }

    private void writeTo(String path, MultipartFile file) {
        try (FileOutputStream fos = new FileOutputStream(new File(path))) {
            fos.write(file.getBytes());
            fos.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}