package todo7.BE.web;

import io.jsonwebtoken.JwtException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import todo7.BE.web.exception.AuthorizationException;

@ControllerAdvice
public class GeneralExceptionHandler {

    private static Logger logger = LoggerFactory.getLogger(GeneralExceptionHandler.class);

    @ExceptionHandler({JwtException.class, AuthorizationException.class})
    public ResponseEntity<String> UserNotFound(RuntimeException e) {
        return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("invalid token");
    }
}
