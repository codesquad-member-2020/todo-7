package todo7.BE.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class Project {

    @Id
    private int id;

    private String title;

    private List<Category> categories = new ArrayList<>();

    public Project(String title) {
        this.title = title;
    }

    public void add(Category category) {
        categories.add(category);
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public List<Category> getCategories() {
        return categories;
    }
}
