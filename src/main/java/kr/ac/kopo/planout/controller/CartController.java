package kr.ac.kopo.planout.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.planout.model.Cart;
import kr.ac.kopo.planout.model.Member;
import kr.ac.kopo.planout.model.Product;
import kr.ac.kopo.planout.service.ProductService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	ProductService service;

	@GetMapping
	String cart(@SessionAttribute(required = false) Cart cart, Model model) {
		if (cart == null)
			cart = new Cart();

		// keySet이 null이거나 비어있으면 빈 리스트를 전달
		if (cart.getCart().keySet() == null || cart.getCart().keySet().isEmpty()) {
			model.addAttribute("list", new ArrayList<Product>());
		} else {

			List<Product> list = service.list(cart.getCart().keySet());

			model.addAttribute("list", list);

		}
		return "cart";
	}

	@ResponseBody
	@GetMapping("/{productId}/{amount}")
	Cart add(@PathVariable Long productId, @PathVariable int amount, @SessionAttribute Member member,
			@SessionAttribute(required = false) Cart cart, HttpSession session) {
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		cart.setCart(productId, amount);

		return cart;
	}

	@ResponseBody
	@DeleteMapping("/{productId}")
	void delete(@PathVariable Long productId, @SessionAttribute Cart cart) {
		cart.delete(productId);
	}

	// 주문 페이지로 이동하며 장바구니 정보를 전달
	@GetMapping("orders")
	String orderPage(@SessionAttribute(required = false) Cart cart, Model model) {
		if (cart == null || cart.getCart().isEmpty()) {
			model.addAttribute("list", new ArrayList<Product>());
			model.addAttribute("totalAmount", 0);
		} else {
			// 장바구니에 있는 productId 목록으로 상품 조회
			List<Product> list = service.list(cart.getCart().keySet());
			model.addAttribute("list", list);

			// 총 주문 금액 계산
			double totalAmount = list.stream()
					.mapToDouble(product -> product.getPrice() * cart.getCart().get(product.getId())).sum();
			model.addAttribute("totalAmount", totalAmount);
		}

		return "orders";
	}
	
	// 결제 확인 페이지
    @GetMapping("/confirm")
    public String confirmOrder(@SessionAttribute(required = false) Cart cart, Model model) {
        if (cart == null || cart.getCart().isEmpty()) {
            model.addAttribute("list", new ArrayList<Product>());
            model.addAttribute("totalAmount", 0);
            model.addAttribute("message", "장바구니가 비어 있습니다. 상품을 추가해주세요.");
            return "orders";
        }

        List<Product> list = service.list(cart.getCart().keySet());
        model.addAttribute("list", list);

        double totalAmount = list.stream()
                .mapToDouble(product -> product.getPrice() * cart.getCart().get(product.getId())).sum();
        model.addAttribute("totalAmount", totalAmount);

        return "confirm";
    }


    @PostMapping("/payment/complete")
    public String completePayment(@SessionAttribute(required = false) Cart cart, HttpSession session) {
        if (cart == null || cart.getCart().isEmpty()) {
            return "redirect:/cart/orders"; // 비어있으면 이동하게끔 설정하는데 null 이상값이면 아님
        }

        // 장바구니 비우기
        session.removeAttribute("cart");

        return "redirect:/payment/success"; //결제 성공 페이지로 이동하게하는데 null 값이면 cart로?
    }

    // 결제 성공 페이지
    @GetMapping("/success")
    public String paymentSuccess() {
        return "success";
    }
}

