package kh.pet.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import kh.pet.staticInfo.Log_Count;

@Service
public class board_update {

	@Scheduled(cron = "0 */10 * * * ?")
	public void logWrite() {
		
	}
}
