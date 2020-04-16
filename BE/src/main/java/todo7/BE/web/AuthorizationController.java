package todo7.BE.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import todo7.BE.domain.User;
import todo7.BE.domain.UserRepository;
import todo7.BE.utils.JwtUtils;
import todo7.BE.web.exception.NotFoundException;

@RestController
@RequestMapping("/auth")
public class AuthorizationController {

    private Logger logger = LoggerFactory.getLogger(AuthorizationController.class);

    private UserRepository users;

    public AuthorizationController(UserRepository users) {
        this.users = users;
    }

    @GetMapping("/{userId}")
    public ResponseEntity<String> create(@PathVariable int userId) {
        User user = users.findById(userId).orElseThrow(() -> new NotFoundException("User " + userId));
        String token = JwtUtils.createToken(user);
        logger.info("{}", token);
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.AUTHORIZATION, token);
        return ResponseEntity.accepted()
                .headers(headers)
                .body(token);
    }
}
