package kr.ac.kopo.planout.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.planout.model.Member;
import kr.ac.kopo.planout.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	final String path="member/";
	
	@Autowired
	MemberService service;
	
	@GetMapping("/list")
	String list(Model model, @SessionAttribute Member member) {
		List<Member> list = service.list();
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	String add() {
	return path + "add";
	}
	
	@PostMapping("/add")
	String add(Member item){
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{userid}")
	String update(@PathVariable String userid, Model model) {
		Member item = service.item(userid);
		model.addAttribute("item",item);
		return path + "update";
	}
	
	@PostMapping("/update/{userid}")
	String update(@PathVariable String userid, Member item) {
		item.setUserid(userid);
		service.update(item);
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{userid}")
	String delete(@PathVariable String userid) {
		service.delete(userid);
		
		return "redirect:../list";
	}
}
