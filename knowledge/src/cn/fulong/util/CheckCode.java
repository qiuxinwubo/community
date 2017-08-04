package cn.fulong.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/checkCode")
public class CheckCode extends HttpServlet {
	private static final long serialVersionUID = 6400059892553421968L;
	private Font mFont = new Font("Arial Black", Font.BOLD, 16);

	public void init() throws ServletException {
		super.init();
	}

	Color getRandColor(int fc, int bc) {
		Random random = new Random();
		if (fc > 255)
			fc = 255;
		if (bc > 255)
			bc = 255;
		int r = fc + random.nextInt(bc - fc);
		int g = fc + random.nextInt(bc - fc);
		int b = fc + random.nextInt(bc - fc);
		return new Color(r, g, b);
	}
    /*
     * 生成图片验证码
     * 
     */
	@RequestMapping(value = "/service")
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0L);
		response.setContentType("image/jpeg");
		int width = 80;
		int height = 20;
		BufferedImage image = new BufferedImage(width, height, 1);

		Graphics g = image.getGraphics();
		Random random = new Random();
		g.setColor(getRandColor(200, 250));
		g.fillRect(1, 1, width - 1, height - 1);
		g.setColor(new Color(102, 102, 102));
		g.drawRect(0, 0, width - 1, height - 1);
		g.setFont(this.mFont);

		g.setColor(getRandColor(160, 200));
		for (int i = 0; i < 155; i++) {
			int x = random.nextInt(width - 1);
			int y = random.nextInt(height - 1);
			int xl = random.nextInt(6) + 1;
			int yl = random.nextInt(12) + 1;
			g.drawLine(x, y, x + xl, y + yl);
		}
		for (int i = 0; i < 70; i++) {
			int x = random.nextInt(width - 1);
			int y = random.nextInt(height - 1);
			int xl = random.nextInt(12) + 1;
			int yl = random.nextInt(6) + 1;
			g.drawLine(x, y, x - xl, y - yl);
		}

		String sRand = "";
		for (int i = 0; i < 4; i++) {
			String tmp = getRandomChar();
			sRand = sRand + tmp;
			g.setColor(new Color(20 + random.nextInt(110), 20 + random
					.nextInt(110), 20 + random.nextInt(110)));
			g.drawString(tmp, 15 * i + 10, 15);
		}

		HttpSession session = request.getSession();
		session.removeAttribute("rand");
		session.setAttribute("rand", sRand);
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}

	private String getRandomChar() {
		long i = 0L;
		char c = '\000';

		i = Math.round(Math.random() * 25.0D + 65.0D);
		c = (char) (int) i;
		return String.valueOf(c);
	}
	/*
     * 校验图片验证码
     * 
     */
	@RequestMapping(value = "/check")
	public void check(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String checkcode = request.getParameter("checkcode");
		HttpSession session = request.getSession();
		String sessioncode = (String) session.getAttribute("rand");
		response.setContentType("text/html");
		response.setHeader("Content-Type", "text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache, must-revalidate");
		PrintWriter out = response.getWriter();
		if (StringUtils.isBlank(checkcode)) {
			out.print("1");
		} else if (!checkcode.equalsIgnoreCase(sessioncode)) {
			out.print("2");
		} else {
			out.print("0");
		}
	}

}
