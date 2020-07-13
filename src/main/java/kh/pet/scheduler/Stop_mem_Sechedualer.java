package kh.pet.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.pet.service.AdminService;


@Service
public class Stop_mem_Sechedualer {
	
	@Autowired
	private AdminService service;

	/*
	 * @Scheduled(cron = "0 0 18 * * *")
	 */
	@Scheduled(cron = "0 */10 * * * ?")
	public void stop_count(){
		System.out.println("count");
		service.stop_scaduler();
	}
}
