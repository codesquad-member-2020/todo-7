package todo7.BE.utils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import todo7.BE.domain.User;
import todo7.BE.web.exception.AuthorizationException;

import javax.crypto.SecretKey;
import java.util.HashMap;
import java.util.Map;

public class JwtUtils {

    private Logger logger = LoggerFactory.getLogger(JwtUtils.class);

    private String secretKey;

    private SecretKey key = Keys.hmacShaKeyFor("Todo7SecretKeyForTheProjectAlgorithm".getBytes());

    public String createToken(User user) {

        Map<String, Object> headers = new HashMap<>();
        headers.put("typ", "JWT");
        headers.put("alg", "HS256");

        Map<String, Object> payloads = new HashMap<>();
        payloads.put("id", user.getId());
        payloads.put("aud", user.getUserName());

        String jwt = Jwts.builder()
                .setHeader(headers)
                .setClaims(payloads)
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
        return jwt;
    }

    public void checkJwt(String jwt) {
        if (jwt == null) {
            throw AuthorizationException.emptyToken();
        }

        Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(jwt)
                .getBody();
    }
}
