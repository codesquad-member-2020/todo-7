package todo7.BE.domain;

import org.springframework.data.annotation.Id;

public class Card {

    @Id
    private int id;

    private String contents;

    public Card(String contents) {
        this.contents = contents;
    }

    public int getId() {
        return id;
    }

    public String getContents() {
        return contents;
    }
}
