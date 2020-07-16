package kh.pet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.pet.dao.MypageDAO;

@Service
public class BoardService {

	@Autowired
	private MypageDAO bdao;
	
	
	
}
