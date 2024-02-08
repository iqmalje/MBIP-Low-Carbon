package com.mbip.controller;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mbip.dbUtil.KawasanDAO;
import com.mbip.dbUtil.PenggunaanAirDAO;
import com.mbip.dbUtil.PenggunaanElektrikDAO;
import com.mbip.dbUtil.PenggunaanKitarSemulaDAO;
import com.mbip.dbUtil.UserDAO;
import com.mbip.dbUtil.pengurursanBandarDAO;
import com.mbip.dbUtil.pengurusanKarbonDAO;
import com.mbip.model.Alamat;
import com.mbip.model.Kawasan;
import com.mbip.model.PenggunaanAir;
import com.mbip.model.PenggunaanElektrik;
import com.mbip.model.PenggunaanKitarSemula;
import com.mbip.model.User;

@Controller
@RequestMapping("/auth")
public class AuthController {

    @RequestMapping("/popup")
    public ModelAndView test() {
        return new ModelAndView("elektrik/Popup_PenggunaanElektrik");
    }

    @RequestMapping("/")
    public ModelAndView isLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView mv;
        if (session.getAttribute("user") == null) {
            // user did not log in yet!
            mv = new ModelAndView("redirect:/auth/loginformpeserta");

        } else {
            mv = new ModelAndView("redirect:/auth/dashboard");
        }

        return mv;
    }

    @RequestMapping("/loginformpeserta")
    public String displayLoginForm() {
        return "akaun/LogInPeserta";
    }

    @RequestMapping("/loginformadmin")
    public String displayAdminLoginForm() {
        return "akaun/LogInAdmin";
    }

    @RequestMapping("/registerformpeserta")
    public String requestMethodName() {
        return "akaun/ciptaAkaun";
    }

    @RequestMapping("/profile")
    public ModelAndView displayProfile(HttpServletRequest request) {
        ModelAndView mv;

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            mv = new ModelAndView("akaun/profilepage");
            // add list of kawasan
            UserDAO userDAO = new UserDAO();
            List<Kawasan> kawasans = userDAO.getListOfKawasan();
            mv.addObject("kawasans", kawasans);
            mv.addObject("user", user);
        }

        return mv;
    }

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public ModelAndView getDashboard(@RequestParam(value = "tahun", required = false) String tahun,
            @RequestParam(value = "kategori", required = false) String kategori, HttpServletRequest request) {
        HttpSession session = request.getSession();
        ModelAndView mv;
        User user = (User) session.getAttribute("user");
        try {
            if (user == null) {
                // user did not log in yet!
                mv = new ModelAndView("redirect:/auth/loginformpeserta");

            } else {
                mv = new ModelAndView("akaun/DashboardPeserta");

                // parse if user send data regarding form
                if (tahun == null && kategori == null) {

                    kategori = "elektrik";
                    tahun = "2024";
                    mv.addObject("kategori", kategori);
                    mv.addObject("tahun", tahun);

                }
                // get penggunaan
                if (kategori.equals("air")) {
                    PenggunaanAirDAO air = new PenggunaanAirDAO();
                    List<PenggunaanAir> airs = air.getUserPenggunaanAirOverview(user.getAkaun_id(),
                            Integer.parseInt(tahun));

                    mv.addObject("items", airs);
                    mv.addObject("controller", "penggunaanAir");
                    mv.addObject("method", "insertAir_nilai");
                    mv.addObject("tahun", tahun);
                } else if (kategori.equals("elektrik")) {
                    PenggunaanElektrikDAO elektrik = new PenggunaanElektrikDAO();
                    List<PenggunaanElektrik> elektriks = elektrik.getUserPenggunaanElektrikOverview(user.getAkaun_id(),
                            Integer.parseInt(tahun));

                    mv.addObject("items", elektriks);
                    mv.addObject("controller", "penggunaanElektrik");
                    mv.addObject("method", "insertElektrik_nilai");
                    mv.addObject("tahun", tahun);
                } else {
                    PenggunaanKitarSemulaDAO penggunaanKitarSemulaDAO = new PenggunaanKitarSemulaDAO();
                    List<PenggunaanKitarSemula> penggunaanKitarSemulaList = penggunaanKitarSemulaDAO
                            .getUserPenggunaanKitarSemulaOverview(user.getAkaun_id(), Integer.parseInt(tahun));

                    mv.addObject("items", penggunaanKitarSemulaList);
                    mv.addObject("controller", "penggunaanKitarSemula");
                    mv.addObject("method", "insertKitarSemula_nilai");
                    mv.addObject("tahun", tahun);
                }
                mv.addObject("kategori", kategori);
                mv.addObject("tahun", tahun);

                // DISPLAY VALUE CO2
                pengurusanKarbonDAO pengurusanKarbonDAO = new pengurusanKarbonDAO();

                // jumlah C02 elektrik
                double totalElektrik = pengurusanKarbonDAO.getJumlahKarbon_Elektrik();
                String formatted_totalElektrik = String.format("%.2f", totalElektrik);
                mv.addObject("totalElektrik", formatted_totalElektrik);

                // jumlah C02 air
                double totalAir = pengurusanKarbonDAO.getJumlahKarbon_Air();
                String formatted_totalAir = String.format("%.2f", totalAir);
                mv.addObject("totalAir", formatted_totalAir);

                // jumlah C02 kitar semula
                double totalKitarSemula = pengurusanKarbonDAO.getJumlahKarbon_KitarSemula();
                String formatted_totalKitarSemula = String.format("%.2f", totalKitarSemula);
                mv.addObject("totalKitarSemula", formatted_totalKitarSemula);
            }

        } catch (Exception e) {
            // TODO: handle exception
            mv = new ModelAndView("akaun/akaunerror");
            StringWriter sw = new StringWriter();
            e.printStackTrace(new PrintWriter(sw));

            mv.addObject("error", sw.toString());

        }
        return mv;

    }

    @RequestMapping("/admin/dashboard")
    public ModelAndView displayAdminDashboard(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;

        if (user == null) { // user has not yet logged in
            mv = new ModelAndView("redirect:/auth/");
        } else if (!user.getIsAdmin()) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            mv = new ModelAndView("akaun/PengurusanDataKarbon");

            pengurusanKarbonDAO pengurusanKarbonDAO = new pengurusanKarbonDAO();

            // jumlah peserta
            int totalPeserta = pengurusanKarbonDAO.getJumlahPeserta();
            mv.addObject("totalPeserta", totalPeserta);

            // jumlah C02 elektrik
            double totalElektrik = pengurusanKarbonDAO.getJumlahKarbon_Elektrik();
            String formatted_totalElektrik = String.format("%.2f", totalElektrik);
            mv.addObject("totalElektrik", formatted_totalElektrik);

            // jumlah C02 air
            double totalAir = pengurusanKarbonDAO.getJumlahKarbon_Air();
            String formatted_totalAir = String.format("%.2f", totalAir);
            mv.addObject("totalAir", formatted_totalAir);

            // jumlah C02 kitar semula
            double totalKitarSemula = pengurusanKarbonDAO.getJumlahKarbon_KitarSemula();
            String formatted_totalKitarSemula = String.format("%.2f", totalKitarSemula);
            mv.addObject("totalKitarSemula", formatted_totalKitarSemula);

            // jumlah semua CO2
            double totalKarbon = totalElektrik + totalAir + totalKitarSemula;
            String formatted_totalKarbon = String.format("%.2f", totalKarbon);
            mv.addObject("totalKarbon", formatted_totalKarbon);
        }

        return mv;
    }

    @RequestMapping("/admin/senaraikawasan")
    public ModelAndView displaySenaraiKawasan(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;
        if (user == null || !user.getIsAdmin()) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            mv = new ModelAndView("akaun/pengurusanData_SenaraiKawasan");
            // get list of kawasan
            KawasanDAO kawasanDAO = new KawasanDAO();

            List<Kawasan> kawasans = kawasanDAO.getAll();

            mv.addObject("kawasanlist", kawasans);
        }

        return mv;
    }

    @RequestMapping("/admin/kawasan/{kawasanid}")
    public ModelAndView displayKawasanDetail(@PathVariable("kawasanid") int kawasanid, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;

        if (user == null || !user.getIsAdmin()) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            mv = new ModelAndView("akaun/pengurusanData_RingkasanBandar");

            // get kawasan by id
            KawasanDAO kawasanDAO = new KawasanDAO();
            Kawasan kawasan = kawasanDAO.get(kawasanid);
            mv.addObject("kawasan", kawasan);

            // get jumlah peserta by kawasan_id
            pengurursanBandarDAO pengurursanBandarDAO = new pengurursanBandarDAO();
            int jumlahPesertaBandar = pengurursanBandarDAO.getJumlahPesertaBandar(kawasanid);
            mv.addObject("jumlahPesertaBandar", jumlahPesertaBandar);

            // get jumlah and co2 elektrik
            PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();
            float jumlahElektrik = penggunaanElektrikDAO.getJumlahElektrikKawasan(kawasanid);
            float jumlahElektrik_karbon = penggunaanElektrikDAO.getJumlahKarbonKawasan_Elektrik(kawasanid);

            mv.addObject("jumlahElektrik", jumlahElektrik);

            // get jumlah and co2 air
            PenggunaanAirDAO penggunaanAirDAO = new PenggunaanAirDAO();
            float jumlahAir = penggunaanAirDAO.getJumlahAirKawasan(kawasanid);
            float jumlahAir_karbon = penggunaanAirDAO.getJumlahKarbonKawasan_Air(kawasanid);

            mv.addObject("jumlahAir", jumlahAir);

            // get jumlah and co2 kitar semula
            PenggunaanKitarSemulaDAO penggunaanKitarSemulaDAO = new PenggunaanKitarSemulaDAO();
            float jumlahKitarSemula = penggunaanKitarSemulaDAO.getJumlahKitarSemulaKawasan(kawasanid);
            float jumlahKitarSemula_karbon = penggunaanKitarSemulaDAO.getJumlahKarbonKawasan_KitarSemula(kawasanid);

            mv.addObject("jumlahKitarSemula", jumlahKitarSemula);

            float totalKarbon = jumlahElektrik_karbon + jumlahAir_karbon + jumlahKitarSemula_karbon;
            mv.addObject("totalKarbon", totalKarbon);

        }

        return mv;
    }

    @RequestMapping("/admin/senaraipeserta/{kawasan_id}")
    public ModelAndView displaySenaraiPeserta(@PathVariable("kawasan_id") int kawasan_id, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;

        if (user == null || !user.getIsAdmin()) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            UserDAO userDAO = new UserDAO();
            List<User> users = userDAO.getUserInKawasan(kawasan_id);

            mv = new ModelAndView("akaun/pengurusanData_SenaraiPeserta");
            mv.addObject("users", users);
        }

        return mv;
    }

    @SuppressWarnings("null")
    @RequestMapping("/admin/peserta/{akaun_id}")
    public ModelAndView displayPesertaInfo(@PathVariable("akaun_id") int akaun_id,
            @RequestParam(value = "tahun", required = false) String tahun,
            @RequestParam(value = "kategori", required = false) String kategori, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        ModelAndView mv;
        if (user == null || !user.getIsAdmin()) {
            mv = new ModelAndView("redirect:/auth/");
        } else {
            mv = new ModelAndView("akaun/pengurusanData_Peserta");
            UserDAO userDAO = new UserDAO();
            User targetedUser = userDAO.getUser(akaun_id);
            Kawasan kawasan = userDAO.getKawasan(user.getAlamat().getKawasan_id());

            mv.addObject("targetuser", targetedUser);
            mv.addObject("kawasan", kawasan);

            if (kategori == null && tahun == null) {
                // auto set
                kategori = "elektrik";
                tahun = "2024";
                mv.addObject("controllername", "penggunaanElektrik");
            }

            switch (kategori) {
            case "elektrik":
                PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();
                List<PenggunaanElektrik> elektriks = penggunaanElektrikDAO.getUserPenggunaanElektrikOverview(akaun_id,
                        Integer.parseInt(tahun));
                mv.addObject("items", elektriks);
                mv.addObject("controllername", "penggunaanElektrik");
                break;
            case "air":
                PenggunaanAirDAO penggunaanAirDAO = new PenggunaanAirDAO();
                List<PenggunaanAir> airs = penggunaanAirDAO.getUserPenggunaanAirOverview(akaun_id,
                        Integer.parseInt(tahun));
                mv.addObject("items", airs);
                mv.addObject("controllername", "penggunaanAir");
                break;
            case "kitarsemula":
                PenggunaanKitarSemulaDAO penggunaanKitarSemulaDAO = new PenggunaanKitarSemulaDAO();
                List<PenggunaanKitarSemula> penggunaanKitarSemulas = penggunaanKitarSemulaDAO
                        .getUserPenggunaanKitarSemulaOverview(akaun_id, Integer.parseInt(tahun));
                mv.addObject("items", penggunaanKitarSemulas);
                mv.addObject("controllername", "penggunaanKitarSemula");
                break;

            }
            mv.addObject("kategori", kategori);
            mv.addObject("tahun", tahun);
        }

        return mv;
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {

        HttpSession session = request.getSession();

        session.removeAttribute("user");

        return "redirect:/auth/loginformpeserta";
    }

    @RequestMapping(value = "/loginpeserta", method = RequestMethod.POST)
    public ModelAndView login(@RequestParam("email") String email, @RequestParam("password") String password,
            HttpServletRequest request, RedirectAttributes redirectAttributes) {

        UserDAO userDAO = new UserDAO();

        try {
            User user = userDAO.loginPeserta(email, password);

            // set session
            HttpSession session = request.getSession();

            session.setAttribute("user", user);
            ModelAndView mv = new ModelAndView("redirect:/auth/");
            return mv;
        } catch (EmptyResultDataAccessException e) {
            // TODO: handle exception
            ModelAndView mv = new ModelAndView("redirect:/auth/loginformpeserta");
            Exception exception = new Exception("Incorrect username or password!");
            redirectAttributes.addFlashAttribute("error", exception);

            return mv;

        }

    }

    @RequestMapping(value = "/loginadmin", method = RequestMethod.POST)
    public ModelAndView loginAdmin(@RequestParam("email") String email, @RequestParam("password") String password,
            HttpServletRequest request, RedirectAttributes redirectAttributes) {
        UserDAO userDAO = new UserDAO();

        try {
            User user = userDAO.loginAdmin(email, password);

            // set session
            HttpSession session = request.getSession();

            if (user.getIsAdmin()) {
                session.setAttribute("user", user);
                ModelAndView mv = new ModelAndView("redirect:/auth/admin/dashboard");
                return mv;
            } else {
                ModelAndView mv = new ModelAndView("redirect:/auth/loginformadmin");
                Exception exception = new Exception("User is not an admin!");
                redirectAttributes.addFlashAttribute("error", exception);
                return mv;
            }

        } catch (EmptyResultDataAccessException e) {
            // TODO: handle exception
            ModelAndView mv = new ModelAndView("redirect:/auth/loginformadmin");
            Exception exception = new Exception("Incorrect email or password!");
            redirectAttributes.addFlashAttribute("error", exception);
            return mv;

        }

    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerUser(@RequestParam("fullname") String namapenuh, @RequestParam("email") String email,
            @RequestParam("password") String password) {
        // add user to DB
        UserDAO userDAO = new UserDAO();
        try {
            userDAO.register(email, namapenuh, password);
            return "redirect:/auth/loginformpeserta";
        } catch (Exception e) {
            // TODO: handle exception
            return "redirect:/auth/registerformpeserta";
        }

    }

    @RequestMapping("/update")
    public String updateUser(@ModelAttribute("user") User user, HttpServletRequest request) {
        UserDAO userDAO = new UserDAO();

        userDAO.update(user);
        // once updated

        HttpSession session = request.getSession();

        session.setAttribute("user", user);

        return "redirect:/auth/profile";
    }

    @RequestMapping("/updatealamat")
    public String updateAlamat(@ModelAttribute("alamat") Alamat alamat, HttpServletRequest request) {

        UserDAO userDAO = new UserDAO();
        // get user id
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("user");

        // session termninated
        if (user == null) {
            return "redirect:/auth/loginformpeserta";
        }

        userDAO.updateAlamat(alamat, user.getAkaun_id());
        // once updated, update alamat in model
        user.setAlamat(alamat);
        session.setAttribute("user", user);

        return "redirect:/auth/profile";
    }
}
