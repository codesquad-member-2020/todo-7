package todo7.BE.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Category {

    @Id
    private int id;

    private String title;

    @JsonProperty("curPosition")
    private int projectKey;

    private List<Card> cards = new ArrayList<>();

    public Category(String title) {
        this.title = title;
    }


    public boolean compare(int id) {
        return this.id == id;
    }

    public void add(Card card) {
        cards.add(card);
    }

    public Card getLastCard() {
        return cards.get(cards.size() - 1);
    }
}
