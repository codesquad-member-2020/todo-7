package todo7.BE.web.exception;

import org.apache.tomcat.util.http.parser.Authorization;

public class AuthorizationException extends RuntimeException {

    public static AuthorizationException emptyToken() {
        return new AuthorizationException("token doesn't exist");
    }

    public AuthorizationException(String msg) {
        super(msg);
    }
}
