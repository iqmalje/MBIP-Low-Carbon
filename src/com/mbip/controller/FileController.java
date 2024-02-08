package com.mbip.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/file")
public class FileController {

	@RequestMapping("/test")
	public String test(HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("\\salinanbil\\elektrik");
		return path;
	}

	@RequestMapping("/getfile/{akaun_id}/{bulan}/{tahun}/{kategori}")

	public ResponseEntity<byte[]> downloadPdf(@PathVariable("akaun_id") int akaun_id,
											  @PathVariable("bulan") int bulan,
											  @PathVariable("tahun") int tahun,
											  @PathVariable("kategori") String kategori,
											  HttpServletResponse response, HttpServletRequest request) {

		String filename = String.format("%d%d%d.pdf", akaun_id, bulan, tahun);
		String path = request.getServletContext().getRealPath("/salinanbil/" + kategori + "/");
		String filepath = path + filename;

		File file = new File(filepath);
		// File file = new File(
		// "/Users/iqmalaizat/Documents/college
		// files/INTERNET-PROGRAMMING/apache-tomcat-9.0.85/webapps/MBIP-Low-Carbon/salinanbil/elektrik/"
		// + filename);

		try {
			FileInputStream fis = new FileInputStream(file);

			byte[] bytes = new byte[(int) file.length()];
			fis.read(bytes);
			response.setHeader("Content-Disposition", "inline; filename" + filename);
			response.setContentType("application/pdf");
			response.setContentLength(bytes.length);
			response.getOutputStream().write(bytes);
			response.getOutputStream().flush();
			return null;
		} catch (FileNotFoundException e) {

			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}

	}
}
