package kr.ac.kopo.planout.dao;

import java.util.List;

import kr.ac.kopo.planout.model.Member;

public interface MemberDao {
	
	List<Member> list();

	void add(Member item);

	Member item(String userid);

	void update(Member item);

	void delete(String userid);

}
