package todo7.BE.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.data.annotation.Id;
import todo7.BE.web.exception.NotFoundException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Category {

    @Id
    private int id;

    private String title;

    private List<Card> cards = new ArrayList<>();


    public Optional<Card> findCard(int cardId) {
        return cards.stream().filter(category -> category.checkId(cardId)).findAny();
    }

    public boolean checkId(int id) {
        return this.id == id;
    }

    public void addCard(Card card) {
        cards.add(0, card);
    }

    public void addCard(int prevCardId, Card card) {
        Card prevCard = this.findCard(prevCardId).orElseThrow(() -> new NotFoundException("Card" + prevCardId));
        cards.add(cards.indexOf(prevCard) + 1, card);
    }

    public Card getCard(int position) {
        return cards.get(position);
    }

    public void removeCard(Card card) {
        cards.remove(card);
    }
}
