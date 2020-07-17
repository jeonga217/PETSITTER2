package kh.pet.scheduler;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.pet.service.AdminService;
import kh.pet.staticInfo.Log_Count;

@Service
public class Log_Count_DB {
	
	@Autowired
	private AdminService service;

	@Scheduled(cron = "0 */10 * * * ?")
	public void logWrite() {
		service.update_v();
	}
}
