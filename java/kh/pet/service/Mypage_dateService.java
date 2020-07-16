package kh.pet.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import kh.pet.dto.PointDTO;

@Service
public class Mypage_dateService {

	public List<int[]> datesetting(List<PointDTO> list) {
		SimpleDateFormat formats = new SimpleDateFormat("MM");
		List<int[]> cntpoint = new ArrayList<int[]>();
		int[] plus = new int[11];
		int[] minus = new int[11];
		for (int i = 0; i < list.size(); i++) {
			String day = formats.format(list.get(i).getP_date());
			list.get(i).setP_dates(day);
			for(int j = 0; j<12; j++) {
				if(day.contentEquals("0"+(j+1))) {
					if(list.get(i).getP_method().contentEquals("입금")) {
						plus[j] += list.get(i).getP_point();
					}
					else if(list.get(i).getP_method().contentEquals("사용") ||list.get(i).getP_method().contentEquals("환전")) {
						minus[j] += list.get(i).getP_point();
					}
				}
			}
		}
		cntpoint.add(plus);
		cntpoint.add(minus);
		return cntpoint;
	}
}
