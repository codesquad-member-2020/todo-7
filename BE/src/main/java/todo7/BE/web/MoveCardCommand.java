package todo7.BE.web;


import org.springframework.lang.Nullable;

import java.util.Optional;

public class MoveCardCommand {

    private Integer cardId;
    private Integer prevCardId;

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }

    public Optional<Integer> getPrevCardId() {
        return Optional.ofNullable(prevCardId);
    }

    public void setPrevCardId(@Nullable Integer prevCardId) {
        this.prevCardId = prevCardId;
    }
}
