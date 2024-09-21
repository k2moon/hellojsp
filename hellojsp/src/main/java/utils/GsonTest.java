package utils;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

import model2.member.dto.MemberDTO;


public class GsonTest {

	public static void main(String[] args) {
		String id = "hong";
		String pass = "1111";
		String name = "홍길동";
		
		MemberDTO dto = new MemberDTO(id, pass, name);
		
		Gson gson = new Gson();
		String memberJson = gson.toJson(dto);
		System.out.println(memberJson);
		
		List<MemberDTO> mList = new ArrayList<MemberDTO>();
		mList.add(dto);
		mList.add(dto);
		mList.add(dto);
		
		String mListJson = gson.toJson(mList);
		System.out.println(mListJson);
		
		MemberDTO dto2 = gson.fromJson(memberJson, MemberDTO.class);
		System.out.println(dto2);		

	}

}
