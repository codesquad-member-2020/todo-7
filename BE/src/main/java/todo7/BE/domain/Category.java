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
public class Category {

    @Id
    private int id;

    private String title;

    private List<Card> cards = new ArrayList<>();


    public Card findCard(int cardId) {
        return cards.stream().filter(category -> category.checkId(cardId)).findAny()
                .orElseThrow(() -> new NotFoundException("Card " + cardId));
    }

    public boolean checkId(int id) {
        return this.id == id;
    }

    public void addCard(Card card) {
        cards.add(0, card);
    }
    public Card getCard(int position) {
        return cards.get(position);
    }

    public void updateCard(int cardId, Card newCard) {
        this.findCard(cardId).merge(newCard);
    }

    public void removeCard(int cardId) {
        cards.remove(findCard(cardId));
    }
}
