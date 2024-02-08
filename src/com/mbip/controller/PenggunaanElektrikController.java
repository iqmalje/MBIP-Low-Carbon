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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mbip.dbUtil.PenggunaanElektrikDAO;
import com.mbip.model.PenggunaanElektrik;
import com.mbip.model.User;

@Controller
@RequestMapping("/penggunaanElektrik")
public class PenggunaanElektrikController {

    @RequestMapping("/")
    protected ModelAndView displayBorangElektrik(HttpServletRequest request) {

        HttpSession session = request.getSession();
        ModelAndView model;

        if (session.getAttribute("user") == null) {
            // user did not log in yet!
            model = new ModelAndView("redirect:/auth/loginformpeserta");

        } else {
            model = new ModelAndView("elektrik/MaklumatElektrik");
        }
        return model;
    }

    @RequestMapping(value = "/insertElektrik_nilai", method = RequestMethod.GET)
    public ModelAndView simpanElektrik_Nilai(HttpServletRequest request) {

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
            mv = new ModelAndView("elektrik/MaklumatElektrik");
            PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();

            PenggunaanElektrik penggunaanElektrik = penggunaanElektrikDAO.getPenggunaanElektrik(user.getAkaun_id(),
                    Integer.parseInt(bulan), Integer.parseInt(tahun));
            if (penggunaanElektrik == null) {
                penggunaanElektrik = new PenggunaanElektrik();

                penggunaanElektrik.setAkaun_id(user.getAkaun_id());
                penggunaanElektrik.setBulan(Integer.parseInt(bulan));
                penggunaanElektrik.setTahun(Integer.parseInt(tahun));
            }

            mv.addObject("elektrik", penggunaanElektrik);
            mv.addObject("kategori", kategori);
        }

        return mv;
    }

    @RequestMapping("/view/{akaunid}/{bulan}/{tahun}")
    public ModelAndView viewPenggunaan(@PathVariable("akaunid") int akaun_id, @PathVariable("bulan") int bulan,
            @PathVariable("tahun") int tahun, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;
        if (user == null || !user.getIsAdmin()) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            mv = new ModelAndView("elektrik/Popup_PenggunaanElektrik");
            PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();
            PenggunaanElektrik penggunaanElektrik = penggunaanElektrikDAO.getPenggunaanElektrik(akaun_id, bulan, tahun);
            mv.addObject("elektrik", penggunaanElektrik);
            mv.addObject("bulan", bulan);
            mv.addObject("tahun", tahun);
        }

        return mv;
    }

    @RequestMapping(value = "/updateElektrik_nilai", method = RequestMethod.GET)
    public ModelAndView updateElektrik_nilai(@RequestParam Map<String, String> rp, HttpServletRequest request,
            @ModelAttribute("elektrik") PenggunaanElektrik elektrik) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int akaun_id = user.getAkaun_id();
        elektrik.setAkaun_id(akaun_id);
        elektrik.setPelepasan_karbon(elektrik.getTenaga_elektrik() * 0.584);

        PenggunaanElektrikDAO elektrikDAO = new PenggunaanElektrikDAO();
        elektrikDAO.insertElektrik_Nilai(elektrik);
        ModelAndView mv = new ModelAndView("redirect:/auth/dashboard");
        return mv;

    }

    @RequestMapping(value = "/uploadfile", method = RequestMethod.POST, consumes = {
            MediaType.MULTIPART_FORM_DATA_VALUE })
    public ModelAndView test(@RequestPart("filePDF") MultipartFile file, @RequestParam("bulan") int bulan,
            @RequestParam("tahun") int tahun, HttpServletRequest request) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv = new ModelAndView("redirect:/auth/");
        // ModelAndView mv;
        if (user == null) {

        } else {
            // mv = new ModelAndView("redirect:/auth/dashboard");
            // writes file to salinanbil/elektrik on tomcat
            String filepath = request.getServletContext()
                    .getRealPath("/salinanbil/elektrik/" + user.getAkaun_id() + bulan + "" + tahun + ".pdf");

            // writes file to local folder
            String filepathLOCAL = System.getProperty("user.dir");
            writeTo(filepathLOCAL + "/WebContent/salinanbil/elektrik/" + +user.getAkaun_id() + bulan + "" + tahun
                    + ".pdf", file);

            PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();
            penggunaanElektrikDAO.insertElektrik_Salinan(filepath, user.getAkaun_id(), (bulan), (tahun));

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
