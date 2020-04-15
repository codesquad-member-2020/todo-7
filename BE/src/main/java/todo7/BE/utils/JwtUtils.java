package todo7.BE.utils;

import io.jsonwebtoken.*;
import io.jsonwebtoken.security.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import java.security.Key;
import java.util.HashMap;
import java.util.Map;

public class JwtUtils {
    private JwtUtils() {}

    private static Logger logger = LoggerFactory.getLogger(JwtUtils.class);
    private static final Key key = Keys.secretKeyFor(SignatureAlgorithm.HS256);

    public static String createToken(Long id, String userName) {
        Map<String, Object> headers = new HashMap<>();
        headers.put("typ", "JWT");
        headers.put("alg", "HS256");

        Map<String, Object> payloads = new HashMap<>();
        payloads.put("id", id);
        payloads.put("aud", userName);

        String jwt = Jwts.builder()
                .setHeader(headers)
                .setClaims(payloads)
                .signWith(key)
                .compact();
        return jwt;
    }

    public static boolean checkJwt(String jwt) {
        try {
            Claims claims = Jwts.parserBuilder()
                    .setSigningKey(key)
                    .build()
                    .parseClaimsJws(jwt)
                    .getBody();
            return true;
        } catch (ExpiredJwtException exception) {
            logger.info("토큰 만료");
            return false;
        } catch (JwtException e) {
            logger.info("토큰 변조");
            return false;
        }
    }
}
