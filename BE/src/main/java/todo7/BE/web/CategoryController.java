package todo7.BE.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import todo7.BE.domain.Project;
import todo7.BE.domain.ProjectRepository;
import todo7.BE.web.exception.NotFoundException;

@RestController
@RequestMapping("/projects/{projectId}/categories")
public class CategoryController {

    private ProjectRepository projects;

    public CategoryController(ProjectRepository projects) {
        this.projects = projects;
    }

    @PutMapping("/{categoryId}/cards")
    public ResponseEntity<Project> moveCard(@PathVariable int projectId, @PathVariable int categoryId, @RequestBody MoveCardCommand moveCardCommand) {
        Project project = projects.findById(projectId).orElseThrow(() -> new NotFoundException("Project " + projectId));
        project.moveCard(moveCardCommand, categoryId);
        project = projects.save(project);
        return ResponseEntity.accepted().body(project);
    }
}
