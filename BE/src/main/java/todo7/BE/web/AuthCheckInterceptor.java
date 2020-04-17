package todo7.BE.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import todo7.BE.utils.JwtUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AuthCheckInterceptor implements HandlerInterceptor {
    private final String HEADER_AUTH = "Authorization";
    private Logger logger = LoggerFactory.getLogger(AuthCheckInterceptor.class);
    private JwtUtils jwtUtils;

    public AuthCheckInterceptor(JwtUtils jwtUtils) {
        this.jwtUtils = jwtUtils;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        logger.info("preHandle Interceptor");
        logger.info("method : {}", request.getMethod());
        logger.info("method type : {}", request.getMethod().getClass());

        if (request.getMethod().equals("OPTIONS")) {
            logger.info("options 메서드는 통과");
            return true;
        }
        String token = request.getHeader(HEADER_AUTH);
        jwtUtils.checkJwt(token);

        return true;
    }
}
