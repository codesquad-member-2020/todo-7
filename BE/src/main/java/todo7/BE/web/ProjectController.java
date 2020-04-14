package todo7.BE.web;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import todo7.BE.domain.Project;
import todo7.BE.domain.ProjectRepository;
import todo7.BE.web.exception.NotFoundException;

@RestController
@RequestMapping("/projects")
public class ProjectController {

    private ProjectRepository projects;

    public ProjectController(ProjectRepository projects) {
        this.projects = projects;
    }

    @GetMapping("/{id}")
    public ResponseEntity<Project> fetch(@PathVariable int id) {
        return ResponseEntity.ok(projects.findById(id).orElseThrow(() -> new NotFoundException("Project " + id)));
    }

}
