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

    @JsonProperty("curPosition")
    private int categoryKey;

    public Card(String title, String contents) {
        this.title = title;
        this.contents = contents;
    }
}
