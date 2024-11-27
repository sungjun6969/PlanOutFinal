package kr.ac.kopo.planout.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.planout.model.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSession sql;

	@Override
	public List<Member> list() {
		return sql.selectList("member.list");
	}

	@Override
	public void add(Member item) {
		sql.insert("member.add", item);
	}

	@Override
	public Member item(String userid) {
		return sql.selectOne("member.item", userid);
	}

	@Override
	public void update(Member item) {
		sql.update("member.update", item);
		
	}

	@Override
	public void delete(String userid) {
		sql.delete("member.delete", userid);
	}
}
