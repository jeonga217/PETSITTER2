package kh.pet.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler
	public String exceptionHandler(Exception e) {
		e.printStackTrace();
		return "에러";
	}
	
	@ExceptionHandler
	public String exceptionHandler(NumberFormatException nfe) {
		nfe.printStackTrace();
		return "에러";
	}
	
	@ExceptionHandler
	public String exceptionHandler(NullPointerException nfe) {
		nfe.printStackTrace();
		return "에러";
	}
	
}
