package kr.ac.kopo.planout.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.planout.pager.Pager;
import kr.ac.kopo.planout.model.Member;
import kr.ac.kopo.planout.model.Product;
import kr.ac.kopo.planout.service.MemberService;
import kr.ac.kopo.planout.service.ProductService;

@Controller
public class RootController {
	
	@Autowired
	MemberService service;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/nav")
	String nav() {
		return "nav";
	}
	
	@GetMapping("/")
	String index(Model model) {
		List<Product> products= productService.list(new Pager());
		
		model.addAttribute("products",products);
		
		return "index";
	}
	@GetMapping("/login")
	String login() {
		return "login";
	}
	
	@PostMapping("/login")
	String login(Member item, HttpSession session) {
		if(service.login(item)) {
			session.setAttribute("member", item);
			
			return "redirect:.";
		} else {
			return "login";
		}
	}
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	@GetMapping("/signup")
	String signup() {
		return "signup";
	}
	@PostMapping("/signup")
	String signup(Member item) {
		service.signup(item);
		
		return "redirect:.";
	}
	@ResponseBody
	@GetMapping("userid_check/{userid}")
	String useridcheck(@PathVariable String userid) {
		
		if(service.isUnique(userid))
			return "OK";
		
			return "FAIL";
	}
}

