package todo7.BE.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AuthCheckInterceptor implements HandlerInterceptor {

    private static final String HEADER_AUTH = "Authorization";

    @Autowired
    private JwtUtils jwtUtils;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String token = request.getHeader(HEADER_AUTH);

        if (token != null && jwtUtils.checkJwt(token));
        return true;
    }
}
