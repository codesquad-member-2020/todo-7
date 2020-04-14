package todo7.BE.web;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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
        project.addCard(categoryId, card);
        project = projects.save(project);
        return ResponseEntity.status(HttpStatus.CREATED).body(project.getNewCard(categoryId));
    }

    @PutMapping("/{cardId}")
    public ResponseEntity<Card> updateCard(@PathVariable int projectId, @PathVariable int categoryId, @PathVariable int cardId, @RequestBody Card newCard) {
        Project project = projects.findById(projectId).orElseThrow(() -> new NotFoundException("Project " + projectId));
        project.updateCard(categoryId, cardId, newCard);
        project = projects.save(project);
        return ResponseEntity.accepted().body(project.findCategory(categoryId).findCard(cardId));
    }

    @DeleteMapping("/{cardId}")
    public ResponseEntity<String> deleteCard(@PathVariable int projectId, @PathVariable int categoryId, @PathVariable int cardId) {
        Project project = projects.findById(projectId).orElseThrow(() -> new NotFoundException("Project " + projectId));
        project.removeCard(categoryId, cardId);
        projects.save(project);
        return ResponseEntity.accepted().body("success");
    }
}
