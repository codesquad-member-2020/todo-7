package todo7.BE.utils;

import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AuthCheckInterceptor implements HandlerInterceptor {

    private static final String HEADER_AUTH = "Authorization";

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(HEADER_AUTH);

        if (token != null && JwtUtils.checkJwt(token));
        return true;
    }
}
