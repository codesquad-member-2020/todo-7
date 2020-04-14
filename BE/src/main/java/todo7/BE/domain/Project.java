package todo7.BE.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import org.springframework.data.annotation.Id;
import todo7.BE.web.exception.NotFoundException;

import java.util.ArrayList;
import java.util.List;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Project {

    @Id
    private int id;

    private String title;

    private List<Category> categories = new ArrayList<>();

    public Project(String title) {
        this.title = title;
    }


    public void add(int categoryId, Card card) {
        this.findCategory(categoryId).add(card);
    }

    public Card getNewCard(int categoryId) {
        return this.findCategory(categoryId).getLastCard();
    }

    public Category findCategory(int categoryId) {
        return categories.stream().filter((category -> category.compare(categoryId))).findAny().orElseThrow(() -> new NotFoundException("Category " + categoryId));
    }
}
