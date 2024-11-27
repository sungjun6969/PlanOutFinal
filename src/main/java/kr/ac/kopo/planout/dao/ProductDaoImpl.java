package kr.ac.kopo.planout.dao;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.planout.pager.Pager;
import kr.ac.kopo.planout.model.Photo;
import kr.ac.kopo.planout.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Product> list(Pager pager) {
		return sql.selectList("product.list", pager);
	}

	@Override
	public void add(Product item) {
		sql.insert("product.add", item);
	}

	@Override
	public Product item(Long id) {
		return sql.selectOne("product.item",id);
	}

	@Override
	public void update(Product item) {
		sql.update("product.update", item);
		
	}

	@Override
	public void delete(Long id) {
		sql.delete("product.delete", id);
		
	}

	@Override
	public int total(Pager pager) {
		return sql.selectOne("product.total",pager);
	}

	@Override
	public void addPhoto(Photo photo) {
		sql.insert("product.add_photo", photo);
		
	}

	@Override
	public List<Photo> getPhoto(Long id) {
		return sql.selectList("product.get_photo", id);
	}

	@Override
	public void deletePhotos(Long id) {
		sql.delete("product.delete_photos", id);
		
	}

	@Override
	public void deletePhoto(Long id) {
		sql.delete("product.delete_photo", id);
		
	}

	@Override
	public Photo itemPhoto(Long id) {
		return sql.selectOne("product.item_photo", id);
	}

	@Override
	public List<Product> list(Set<Long> keySet) {
	    // keySet이 null이면 빈 Set으로 초기화
	    if (keySet == null) {
	        keySet = new HashSet<>();
	    }

	    HashMap<String, Set<Long>> map = new HashMap<>();
	    map.put("keyset", keySet);

	    return sql.selectList("product.list_keyset", map);
	}

	@Override
	public List<Product> cardlist() {
		
		return sql.selectList("product.cardlist");
	}

}
