package kh.pet.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "<script>alert('관리자에게 문의 하세요 188-5151');</script>";
	}
	
	@ExceptionHandler
	public String exceptionHandler(NumberFormatException nfe) {
		nfe.printStackTrace();
		return "<script>alert('관리자에게 문의 하세요 188-5151');</script>";
	}
	
	@ExceptionHandler
	public String exceptionHandler(NullPointerException nfe) {
		nfe.printStackTrace();
		return "<script>alert('관리자에게 문의 하세요 188-5151');</script>";
	}
	
}
