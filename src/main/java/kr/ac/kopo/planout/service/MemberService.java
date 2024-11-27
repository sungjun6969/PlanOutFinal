package kr.ac.kopo.planout.service;

import java.util.List;

import kr.ac.kopo.planout.model.Member;

public interface MemberService {

	List<Member> list();

	void add(Member item);

	Member item(String userid);

	void update(Member item);

	void delete(String userid);

	boolean login(Member item);

	void signup(Member item);

	boolean isUnique(String userid);

}
