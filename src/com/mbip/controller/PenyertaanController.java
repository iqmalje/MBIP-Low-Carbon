package com.mbip.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.dao.DuplicateKeyException;
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
import com.mbip.dbUtil.PertandinganDAO;
import com.mbip.dbUtil.pengurusanKarbonDAO;
import com.mbip.model.Kawasan;
import com.mbip.model.PenggunaanAir;
import com.mbip.model.PenggunaanElektrik;
import com.mbip.model.PenggunaanKitarSemula;
import com.mbip.model.Penyertaan;
import com.mbip.model.Pertandingan;
import com.mbip.model.User;

@Controller
@RequestMapping("/penyertaan")
public class PenyertaanController {

	@RequestMapping("/senarai")
	public ModelAndView displaySenaraiPertandingan() {
		ModelAndView mv = new ModelAndView("penyertaan/senaraipertandingan");
		PertandinganDAO pertandinganDAO = new PertandinganDAO();
		List<Pertandingan> pertandinganList = pertandinganDAO.getAllPertandingan();

		mv.addObject("items", pertandinganList);

		return mv;
	}

	@RequestMapping("/sertai/{pertandingan_id}")
	public ModelAndView sertaiPertandingan(@PathVariable("pertandingan_id") int pertandingan_id,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView mv;
		;
		if (user == null) {
			mv = new ModelAndView("redirect:/auth/loginformpeserta");
			Exception error = new Exception("Anda harus log masuk dahulu sebelum menyertai pertandingan!");
			redirectAttributes.addFlashAttribute("error", error);
		} else {
			mv = new ModelAndView("redirect:/penyertaan/viewdetails/" + pertandingan_id);
			try {
				PertandinganDAO pertandinganDAO = new PertandinganDAO();
				pertandinganDAO.sertaiPertandingan(pertandingan_id, user.getAkaun_id());
				redirectAttributes.addFlashAttribute("notification", "Anda telah berjaya menyertai pertandingan!");
			} catch (DuplicateKeyException e) {
				redirectAttributes.addFlashAttribute("notification", "Anda telahpun menyertai pertandingan tersebut!");
			}

		}

		return mv;
	}

	@RequestMapping("/senaraiserta")
	public ModelAndView senaraiPertandinganSertai(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView mv;
		if (user == null) {
			mv = new ModelAndView("redirect:/auth/loginformpeserta");
			Exception exception = new Exception("Sila log masuk dahulu!");
			redirectAttributes.addFlashAttribute("error", exception);
		} else {
			mv = new ModelAndView("penyertaan/senaraipenyertaanpertandingan");
			PertandinganDAO pertandinganDAO = new PertandinganDAO();
			List<Penyertaan> pertandingans = pertandinganDAO.getJoinedPenyertaan(user);
			mv.addObject("items", pertandingans);
		}

		return mv;
	}

	@RequestMapping("/admin/senarai")
	public ModelAndView displaySenaraiAdmin(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		ModelAndView mv;
		if (user == null || !user.getIsAdmin()) {
			mv = new ModelAndView("redirect:/auth/");

		} else {
			mv = new ModelAndView("penyertaan/senaraipertandinganAdmin");
			PertandinganDAO pertandinganDAO = new PertandinganDAO();
			List<Pertandingan> pertandinganList = pertandinganDAO.getAllPertandingan();
			mv.addObject("pertandinganList", pertandinganList);
		}

		return mv;
	}

	@RequestMapping("/admin/addform")
	public String displayAddForm(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getIsAdmin()) {
			return "redirect:/auth/";
		} else {
			return "penyertaan/tambahtambahPertandinganAdmin";
		}
	}

	@RequestMapping(value = "/admin/addpertandingan", method = RequestMethod.POST)
	public String addPertandingan(@ModelAttribute("pertandingan") Pertandingan pertandingan, HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		User user = (User) request.getSession().getAttribute("user");
		if (user == null || !user.getIsAdmin()) {
			redirectAttributes.addFlashAttribute("notification", "User is not authenticated and authorized to do so!");
			return "redirect:/auth/dashboard";
		} else {
			PertandinganDAO pertandinganDAO = new PertandinganDAO();
			pertandinganDAO.addPertandingan(pertandingan);
			return "redirect:/penyertaan/admin/senarai";
		}
	}

	@RequestMapping("/admin/displayform/{pertandingan_id}")
	public ModelAndView displayPertandinganForm(@PathVariable("pertandingan_id") int pertandingan_id,
			HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		ModelAndView mv;
		if (user == null || !user.getIsAdmin()) {
			mv = new ModelAndView("redirect:/auth/");
		} else {
			mv = new ModelAndView("penyertaan/tambahPertandinganAdmin");
			PertandinganDAO pertandinganDAO = new PertandinganDAO();
			Pertandingan pertandingan = pertandinganDAO.getPertandingan(pertandingan_id);
			mv.addObject("pertandingan", pertandingan);
		}

		return mv;
	}

	@RequestMapping("/admin/updatepertandingan")
	public ModelAndView updatePertandingan(@ModelAttribute("pertandingan") Pertandingan pertandingan,
			HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		ModelAndView mv;
		if (user == null || !user.getIsAdmin()) {
			mv = new ModelAndView("redirect:/auth/");
		} else {
			mv = new ModelAndView("redirect:/penyertaan/admin/senarai");
			PertandinganDAO pertandinganDAO = new PertandinganDAO();
			pertandinganDAO.updatePertandingan(pertandingan);
		}

		return mv;
	}

	@RequestMapping("/hantarpenyertaan/{pertandingan_id}")
	public ModelAndView hantarBorangPernyataan(HttpServletRequest request, RedirectAttributes redirectAttributes,
			@PathVariable("pertandingan_id") int pertandingan_id) {
		User user = (User) request.getSession().getAttribute("user");
		ModelAndView mv;
		if (user == null) {
			redirectAttributes.addFlashAttribute("error", new Exception("Sila log masuk terdahulu!"));
			mv = new ModelAndView("redirect:/auth/loginformpeserta");
		} else {

			// check if all is completed
			PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();
			PenggunaanAirDAO penggunaanAirDAO = new PenggunaanAirDAO();
			PenggunaanKitarSemulaDAO penggunaanKitarSemulaDAO = new PenggunaanKitarSemulaDAO();

			Pertandingan pertandingan = new PertandinganDAO().getPertandingan(pertandingan_id);
			List<PenggunaanElektrik> elektrikList = penggunaanElektrikDAO
					.getUserPenggunaanElektrikOverview(user.getAkaun_id(), pertandingan.getTahun());
			List<PenggunaanAir> airList = penggunaanAirDAO.getUserPenggunaanAirOverview(user.getAkaun_id(),
					pertandingan.getTahun());
			List<PenggunaanKitarSemula> kitarSemulaList = penggunaanKitarSemulaDAO
					.getUserPenggunaanKitarSemulaOverview(user.getAkaun_id(), pertandingan.getTahun());

			elektrikList.subList(pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);
			airList.subList(pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);
			kitarSemulaList.subList(pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);

			boolean isElectricComplete = penggunaanElektrikDAO.isAllComplete(elektrikList,
					pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);
			boolean isAirComplete = penggunaanAirDAO.isAllComplete(airList, pertandingan.getStart_month() - 1,
					pertandingan.getEnd_month() - 1);
			boolean isKitarSemulaComplete = penggunaanKitarSemulaDAO.isAllComplete(kitarSemulaList,
					pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);

			if (isElectricComplete && isAirComplete && isKitarSemulaComplete) {
				// set status to SUBMITTED
				new PertandinganDAO().setStatusToDone(pertandingan_id, user.getAkaun_id());
				redirectAttributes.addFlashAttribute("notification", "Successfully submitted!");
				mv = new ModelAndView("redirect:/auth/dashboard");
			} else {
				// redirect back to viewdetails
				redirectAttributes.addFlashAttribute("notification", "Ensure that all bill is completed/lengkap!");
				mv = new ModelAndView("redirect:/penyertaan/viewdetails/" + pertandingan_id);
			}

		}
		return mv;
	}

	@RequestMapping("/admin/view/{pertandingan_id}")
	public ModelAndView displayAdminPertandinganView(@PathVariable("pertandingan_id") int pertandingan_id,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView mv;
		if (user == null || !user.getIsAdmin()) {
			mv = new ModelAndView("redirect:/MBIP-Low-Carbon/penyertaan/viewdetails/" + pertandingan_id);
		} else {

			mv = new ModelAndView("penyertaan/senaraiKawasanAdmin");
			// get pertandingan and kawasan details
			KawasanDAO kawasanDAO = new KawasanDAO();
			PertandinganDAO pertandinganDAO = new PertandinganDAO();

			List<Kawasan> kawasanList = kawasanDAO.getAll();
			Pertandingan pertandingan = pertandinganDAO.getPertandingan(pertandingan_id);
			int totalPeserta = pertandinganDAO.getPesertaCount(pertandingan_id);
			mv.addObject("kawasanList", kawasanList);
			mv.addObject("pertandingan", pertandingan);
			mv.addObject("totalpeserta", totalPeserta);
		}

		return mv;
	}

	@RequestMapping("/viewdetails/{pertandingan_id}")
	public ModelAndView displayUserPertandinganProgress(@PathVariable("pertandingan_id") int pertandingan_id,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		ModelAndView mv;
		if (user == null) {
			mv = new ModelAndView("redirect:/auth/loginformpeserta");
			redirectAttributes.addFlashAttribute("error", new Exception("Sila log masuk dahulu!"));

		} else {
			mv = new ModelAndView("penyertaan/penyertaanPeserta");
			mv.addObject("user", user);
			PertandinganDAO pertandinganDAO = new PertandinganDAO();
			PenggunaanElektrikDAO penggunaanElektrikDAO = new PenggunaanElektrikDAO();
			PenggunaanAirDAO penggunaanAirDAO = new PenggunaanAirDAO();
			PenggunaanKitarSemulaDAO penggunaanKitarSemulaDAO = new PenggunaanKitarSemulaDAO();
			Pertandingan pertandingan = pertandinganDAO.getPertandingan(pertandingan_id);
			List<PenggunaanElektrik> elektrikOverview = penggunaanElektrikDAO
					.getUserPenggunaanElektrikOverview(user.getAkaun_id(), pertandingan.getTahun());
			List<PenggunaanAir> airOverview = penggunaanAirDAO.getUserPenggunaanAirOverview(user.getAkaun_id(),
					pertandingan.getTahun());
			List<PenggunaanKitarSemula> kitarsemulaOverview = penggunaanKitarSemulaDAO
					.getUserPenggunaanKitarSemulaOverview(user.getAkaun_id(), pertandingan.getTahun());

			// check for completeness
			boolean isElectricComplete = penggunaanElektrikDAO.isAllComplete(elektrikOverview,
					pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);
			System.out.println(elektrikOverview.get(0).isComplete());
			boolean isAirComplete = penggunaanAirDAO.isAllComplete(airOverview, pertandingan.getStart_month() - 1,
					pertandingan.getEnd_month() - 1);
			boolean isKitarSemulaComplete = penggunaanKitarSemulaDAO.isAllComplete(kitarsemulaOverview,
					pertandingan.getStart_month() - 1, pertandingan.getEnd_month() - 1);
			mv.addObject("elektrikList", elektrikOverview);
			mv.addObject("airList", airOverview);
			mv.addObject("kitarSemulaList", kitarsemulaOverview);
			mv.addObject("electricComplete", isElectricComplete);
			mv.addObject("airComplete", isAirComplete);
			mv.addObject("kitarSemulaComplete", isKitarSemulaComplete);
			mv.addObject("tahun", pertandingan.getTahun());
			mv.addObject("pertandingan_id", pertandingan.getPertandingan_id());
			mv.addObject("start_month", pertandingan.getStart_month());
			mv.addObject("end_month", pertandingan.getEnd_month());

		}

		return mv;
	}

}
