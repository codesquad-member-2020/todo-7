package todo7.BE.domain;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import org.springframework.data.annotation.Id;
import todo7.BE.web.MoveCardCommand;
import todo7.BE.web.exception.NotFoundException;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@JsonAutoDetect(
        fieldVisibility = JsonAutoDetect.Visibility.ANY,
        getterVisibility = JsonAutoDetect.Visibility.NONE
)
public class Project {

    @Id
    private int id;

    private String title;

    private List<Category> categories = new ArrayList<>();


    public Optional<Category> findCategory(int categoryId) {
        return categories.stream().filter(category -> category.checkId(categoryId)).findAny();
    }

    public Optional<Card> findCard(int cardId) {
        for (Category category : categories) {
            Optional<Card> optionalCard = category.findCard(cardId);
            if (optionalCard.isPresent()) {
                return optionalCard;
            }
        }
        return Optional.empty();
    }

    public void addNewCard(int categoryId, Card newCard) {
        this.findCategory(categoryId)
                .orElseThrow(() -> new NotFoundException("Category " + categoryId))
                .addCard(newCard);
    }

    public Card getNewCard(int categoryId) {
        return this.findCategory(categoryId)
                .orElseThrow(() -> new NotFoundException("Category " + categoryId))
                .getCard(0);
    }


    public void updateCard(int cardId, Card newCard) {
        this.findCard(cardId)
                .orElseThrow(() -> new NotFoundException("Card " + cardId))
                .merge(newCard);
    }

    public Card removeCard(int cardId) {
        for (Category category : categories) {
            Optional<Card> optionalCard = category.findCard(cardId);
            if (optionalCard.isPresent()) {
                Card card = optionalCard.get();
                category.removeCard(card);
                return card;
            }
        }

        throw new NotFoundException("Card " + cardId);
    }

    public void moveCard(MoveCardCommand moveCardCommand, int categoryId) {
        Card card = this.removeCard(moveCardCommand.getCardId());
        Category category = this.findCategory(categoryId)
                .orElseThrow(() -> new NotFoundException("Category " + categoryId));

        if (moveCardCommand.getPrevCardId().isPresent()) {
            category.addCard(moveCardCommand.getPrevCardId().get(), card);
        } else {
            category.addCard(card);
        }
    }
}
