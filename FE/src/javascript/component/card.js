class Card {
  constructor(columnName,cardContent) {
    this.columnName = columnName;
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
      const listULID = `list-${this.columnName}`;
      const listUL = document.getElementById(listULID);
      listUL.insertAdjacentHTML("afterbegin", this.cardHTML);
  }

}

export default Card;
