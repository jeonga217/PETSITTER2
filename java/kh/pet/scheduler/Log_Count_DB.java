package kh.pet.scheduler;


import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.pet.staticInfo.Log_Count;

@Service
public class Log_Count_DB {
	

	@Scheduled(cron = "0 */10 * * * ?")
	public void logWrite() {
		System.out.println(Log_Count.log_count);
	}
}
