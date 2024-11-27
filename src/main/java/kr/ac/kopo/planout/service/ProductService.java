package kr.ac.kopo.planout.service;

import java.util.List;
import java.util.Set;

import kr.ac.kopo.planout.pager.Pager;
import kr.ac.kopo.planout.model.Photo;
import kr.ac.kopo.planout.model.Product;

public interface ProductService {

	List<Product> list(Pager pager);

	void add(Product item);

	Product item(Long id);

	void update(Product item);

	void delete(Long id);

	void dummy(String id);

	void init();

	void deletePhoto(Long id);

	Photo itemPhoto(Long id);
	
	List<Product> list(Set<Long> keySet);

	List<Product> cardlist();

}
