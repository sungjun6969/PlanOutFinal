package kr.ac.kopo.planout.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.planout.dao.MemberDao;
import kr.ac.kopo.planout.model.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao dao;

	@Override
	public List<Member> list() {
		return dao.list();
	}

	@Override
	public void add(Member item) {
		dao.add(item);

	}

	@Override
	public Member item(String userid) {
		return dao.item(userid);
	}

	@Override
	public void update(Member item) {
		dao.update(item);

	}

	@Override
	public void delete(String userid) {
		dao.delete(userid);

	}

	 @Override
	   public boolean login(Member item) {
	      Member member = dao.item(item.getUserid());
	      if(member != null) {
	    	  if(item.getPassword().equals(member.getPassword())) {
	    		  BeanUtils.copyProperties(member, item);
	    		  item.setPassword(null);
	         return true;
	    	  }
	      }
	      
	      return false;
	   }
	 
	 @Override
	 public void signup(Member item) {
		 item.setAdmin(1);
		 
		 dao.add(item);
	 }

	@Override
	public boolean isUnique(String userid) {
		if(dao.item(userid)==null)
			return true;
		
			return false;
	}

}
