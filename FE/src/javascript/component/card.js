class Card {
  constructor(cardContent) {
    this.cardContent = cardContent;
    this.cardHTML = `<li class="card">
        <div class="list-icon"><i class="far fa-newspaper"></i></div>
        <div class="card-content">
            <div class="content">${this.cardContent}</div>
            <div class="writer-message">Added by <span class="writer-id">hyewon3938</span></div>
        </div>
        <button class="btn-list-delete"><i class="fas fa-times"></i></button>
    </li>`;
    this.makeCard();
  }
  makeCard(){
      const listUL = document.querySelector(".list");
      listUL.innerHTML += this.cardHTML;
  }

}

export default Card;
