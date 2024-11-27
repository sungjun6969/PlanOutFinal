package kr.ac.kopo.planout.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.planout.pager.Pager;
import kr.ac.kopo.planout.dao.ProductDao;
import kr.ac.kopo.planout.model.Photo;
import kr.ac.kopo.planout.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao dao;
	
	@Override
	public List<Product> list(Pager pager) {
		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}
	
	@Transactional
	@Override
	public void add(Product item) {
		
		dao.add(item);
		
		if(item.getPhoto() != null)
		for(Photo photo : item.getPhoto()) {
			photo.setProductId(item.getId());
			dao.addPhoto(photo);
		}
	}
	
	@Transactional
	@Override
	public Product item(Long id) {
		Product product = dao.item(id);
		/*List<Photo> photo = dao.getPhoto(id);
		
		product.setPhoto(photo);*/
		
		return product;
	}

	@Override
	public void update(Product item) {
		dao.update(item);
		
		if(item.getPhoto() != null)
			for(Photo photo : item.getPhoto()) {
				photo.setProductId(item.getId());
				dao.addPhoto(photo);
			}
	}
	
	@Transactional
	@Override
	public void delete(Long id) {
		dao.deletePhotos(id);
		dao.delete(id);
		
	}

	@Override
	public void dummy(String id) {
		for(int i = 1; i < 100; i++) {
			Product item = new Product();
			
			item.setName("제품이름"+i);
			item.setPrice(1000 * i);
			item.setInfo("");
			
			
			dao.add(item);
		}
		
	}
	
	@Override
	public void init() {
		Pager pager = new Pager();
		pager.setPerPage(0);
		
		List<Product> list = dao.list(pager);
		
		for(Product item : list)
			delete(item.getId());
		
	}

	@Override
	public void deletePhoto(Long id) {
		dao.deletePhoto(id);
		
	}

	@Override
	public Photo itemPhoto(Long id) {
		return dao.itemPhoto(id);
	}

	@Override
	public List<Product> list(Set<Long> keySet) {
		return dao.list(keySet);
	}

	@Override
	public List<Product> cardlist() {
		
		return dao.cardlist();
	}

}
