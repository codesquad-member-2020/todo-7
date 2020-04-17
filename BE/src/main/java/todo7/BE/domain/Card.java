package todo7.BE.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.data.annotation.Id;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Card {

    @Id
    private int id;

    private String title;

    private String contents;


    public boolean checkId(int id) {
        return this.id == id;
    }

    public void merge(Card newCard) {
        this.title = newCard.title;
        this.contents = newCard.contents;
    }
}
