package todo7.BE.web;

import jdk.internal.jline.internal.Nullable;

import java.util.Optional;

public class MoveCardCommand {

    private int cardId;
    private Optional<Integer> prevCardId;

    public int getCardId() {
        return cardId;
    }

    public void setCardId(int cardId) {
        this.cardId = cardId;
    }

    public Optional<Integer> getPrevCardId() {
        return prevCardId;
    }

    public void setPrevCardId(@Nullable Integer prevCardId) {
        this.prevCardId = Optional.ofNullable(prevCardId);
    }
}
