package todo7.BE.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import todo7.BE.domain.Project;
import todo7.BE.domain.ProjectRepository;

@RestController
@RequestMapping("/projects")
public class ProjectController {

    @Autowired
    private ProjectRepository repository;

    @GetMapping("/{id}")
    public ResponseEntity<Project> fetch(@PathVariable int id) {
        return ResponseEntity.ok(repository.findById(id).orElse(null));
    }
}
