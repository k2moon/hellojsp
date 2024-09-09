package model2.member.service;

import java.util.List;

import model2.member.dto.MemberDTO;


public interface MemberService {
	
	public List<MemberDTO> selectList();	
	public int insertWrite(MemberDTO dto);
	public MemberDTO selectView(String id);
	public int updateEdit(MemberDTO dto);
	public int delete(String id);
}
