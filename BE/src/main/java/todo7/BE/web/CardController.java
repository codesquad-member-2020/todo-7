package todo7.BE.web;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import todo7.BE.domain.Card;
import todo7.BE.domain.Project;
import todo7.BE.domain.ProjectRepository;
import todo7.BE.web.exception.NotFoundException;

@Controller
@RequestMapping("/projects/{projectId}/categories/{categoryId}/cards")
public class CardController {

    private ProjectRepository projects;

    public CardController(ProjectRepository projects) {
        this.projects = projects;
    }

    @PostMapping
    public ResponseEntity<Card> createCard(@PathVariable int projectId, @PathVariable int categoryId, @RequestBody Card card) {
        Project project = projects.findById(projectId).orElseThrow(() -> new NotFoundException("Project " + projectId));
        project.add(categoryId, card);
        return ResponseEntity.status(HttpStatus.CREATED).body(projects.save(project).getNewCard(categoryId));
    }
}
