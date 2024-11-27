package kr.ac.kopo.planout.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.planout.pager.Pager;
import kr.ac.kopo.planout.model.Member;
import kr.ac.kopo.planout.model.Photo;
import kr.ac.kopo.planout.model.Product;
import kr.ac.kopo.planout.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	final String path = "product/";
	final String uploadPath = "d:/upload/";
	
	@Autowired
	ProductService service;
	
	@GetMapping("/dummy")
	String dummy(@SessionAttribute Member member) {
		service.dummy(member.getUserid());
		
		return "redirect:list";
	}
	
	@GetMapping("/init")
	String init() {
		service.init();
		
		return "redirect:list";
	}
	
	@GetMapping("/list")
	String list(Model model, Pager pager) {
		List<Product> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return path + "list";
	}
	@GetMapping("/cardlist")
	String cardlist(Model model) {
		List<Product> cardlist = service.cardlist();
		
		model.addAttribute("cardlist", cardlist);
		
		return path + "cardlist";
	}
	@GetMapping("/add")
	String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	String add(Product item, List<MultipartFile> uploadFile, @SessionAttribute (value = "member", required = false) Member member) {
		List<Photo> photos = new ArrayList<Photo>();
		
		if (member == null) {
	        return "redirect:login"; // 로그인 페이지로 리다이렉트
	    }
	
		for(MultipartFile file : uploadFile) {
	if(file != null && !file.isEmpty()) {
		String filename = file.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		try {
			file.transferTo(new File(uploadPath + uuid + "_" + filename));
			
			Photo photo = new Photo();
			photo.setFilename(filename);
			photo.setUuid(uuid);
			
			photos.add(photo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}	
	item.setPhoto(photos);
	
	service.add(item);
	
	return "redirect:list";
	}
	
	@GetMapping("/update/{id}")
	String update(@PathVariable Long id,Model model) {
		Product item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{id}")
	String update(@PathVariable Long id, Product item,List<MultipartFile> uploadFile, @SessionAttribute Member member) {
		List<Photo> photos = new ArrayList<Photo>();
	
		for(MultipartFile file : uploadFile) {
	if(file != null && !file.isEmpty()) {
		String filename = file.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		try {
			file.transferTo(new File(uploadPath + uuid + "_" + filename));
			
			Photo photo = new Photo();
			photo.setFilename(filename);
			photo.setUuid(uuid);
			
			photos.add(photo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
	}	
	item.setPhoto(photos);
		item.setId(id);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{id}")
	String delete(@PathVariable Long id) {
		Product item = service.item(id);
		
		service.delete(id);
		
		for(Photo photo : item.getPhoto()) {
			File file = new File(uploadPath + photo.getUuid() + "_" + photo.getFilename());
			file.delete();
		}
		
		return "redirect:../list";
	}
	
	@GetMapping("/view/{id}")
	String view(@PathVariable Long id, Model model) {
		Product item = service.item(id);
		
		model.addAttribute("item", item);
		
		return path + "view";
	}
	
	@GetMapping("/item/{id}")
	String item(@PathVariable Long id, Model model) {
		view(id, model);
		
		return path + "item";
	}
	
	@ResponseBody
	@GetMapping("/delete/photo/{id}")
	String deletePhoto(@PathVariable Long id) {
		Photo item = service.itemPhoto(id);
		
		service.deletePhoto(id);
		
		File file = new File(uploadPath+ item.getUuid() + "_" + item.getFilename());
		file.delete();
		
		return id.toString();
	}
}






