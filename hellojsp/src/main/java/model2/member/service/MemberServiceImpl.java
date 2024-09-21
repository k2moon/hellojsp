package model2.member.service;

import java.util.List;

import model2.member.dao.MemberDAO;
import model2.member.dto.MemberDTO;


public class MemberServiceImpl implements MemberService{

	MemberDAO dao;
	
	public MemberServiceImpl() {
		this.dao = new MemberDAO();
	}
	
	@Override
	public List<MemberDTO> selectList() {
		return this.dao.selectList();
	}

	@Override
	public int insertWrite(MemberDTO dto) {
		
		return this.dao.insertWrite(dto);
	}

	@Override
	public MemberDTO selectView(String id) {
		
		return this.dao.selectView(id);
	}

	@Override
	public int updateEdit(MemberDTO dto) {
		
		return this.dao.updateEdit(dto);
	}

	@Override
	public int delete(String id) {
		
		return this.dao.delete(id);
	}

}
