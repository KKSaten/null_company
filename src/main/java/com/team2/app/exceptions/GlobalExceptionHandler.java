package com.team2.app.exceptions;

import org.springframework.boot.context.config.ConfigDataResourceNotFoundException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.resource.NoResourceFoundException;

@ControllerAdvice
public class GlobalExceptionHandler {
	

    @ExceptionHandler(NoResourceFoundException.class)
    public String handleResourceNotFound(NoResourceFoundException ex, Model model) {
        return "exceptions/404"; 
    }

    @ExceptionHandler(Exception.class)
    public String handleException(Exception ex, Model model) {
        return "exceptions/500"; 
    }
	
}
