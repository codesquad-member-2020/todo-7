package todo7.BE.domain;

import org.springframework.data.annotation.Id;

import java.util.ArrayList;
import java.util.List;

public class Category {

    @Id
    private int id;

    private String title;

    private List<Card> cards = new ArrayList<>();

    public Category(String title) {
        this.title = title;
    }

    public void add(Card card) {
        cards.add(card);
    }

    public void add(int i, Card card) {
        cards.add(i, card);
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public List<Card> getCards() {
        return cards;
    }
}
