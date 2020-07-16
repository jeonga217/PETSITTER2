package kh.pet.service;

import org.springframework.stereotype.Service;

@Service
public class PointService {

	public int Pointexchange(String point) {
		if(point.equals("general")) {
			return 100;
		}else if( point.equals("gold")) {
			return 50000;
		}else if( point.equals("Diamonds")) {
			return 100000;
		}
		return 0;
	}
}
