package kr.ac.kopo.planout.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	private Map<Long, Integer> cart = new HashMap<Long, Integer>();
	
	public void setCart(Long productId, Integer amount) {
		if(cart.containsKey(productId))
			cart.put(productId, cart.get(productId) + amount);
		else
			cart.put(productId, amount);			
	}
	
	public Map<Long, Integer> getCart() {
		return cart;
	}

	public void delete(Long productId) {
		cart.remove(productId);
	}
}
