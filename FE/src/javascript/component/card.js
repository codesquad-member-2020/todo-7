class Card {
  constructor(columnName, cardContent) {
    this.columnName = columnName;
    this.cardContent = cardContent;
    this.cardHTML = `<li class="card">
        <div class="list-icon"><i class="far fa-newspaper"></i></div>
        <div class="card-content">
            <div class="content">${this.cardContent}</div>
            <div class="writer-message">Added by <span class="writer-id">hyewon3938</span></div>
        </div>
        <button class="btn-list-delete" id="btn-list-delete-${this.cardContent}"><i class="fas fa-times"></i></button>
    </li>`;
    this.makeCard();
    this.registerEventListener();
  }
  registerEventListener() {
    const btnDelete = document.getElementById(`btn-list-delete-${this.cardContent}`);
    btnDelete.addEventListener("click", () => {
      this.btnDeleteClickHandler();
    });
  }
  makeCard() {
    const listULID = `list-${this.columnName}`;
    const listUL = document.getElementById(listULID);
    listUL.insertAdjacentHTML("afterbegin", this.cardHTML);
  }
  btnDeleteClickHandler() {
    if (confirm("선택하신 카드를 삭제하시겠습니까?")) {
      this.removeCard();
      this.renderCardTotal();
    } else {
      return;
    }
  }
  removeCard(){
    const btnDelete = document.getElementById(`btn-list-delete-${this.cardContent}`);
    const targetCard = btnDelete.closest(".card");
    targetCard.remove();
  }
  renderCardTotal() {
    const listTotal = document.getElementById(`list-total-${this.columnName}`);
    const listUL = document.getElementById(`list-${this.columnName}`);
    listTotal.innerHTML = listUL.childElementCount;
  }
}

export default Card;
