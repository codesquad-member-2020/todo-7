import CardForm from "../component/cardForm.js";
import Card from "../component/card.js";

class Column {
  constructor(columnNum,columnData) {
    this.columnNum = columnNum;
    this.columnData = columnData;
    this.columnName = columnData.title;
    this.cardForm = new CardForm(this.columnName);
    this.columnHTML = `<div class="column">
    <div class="column-header">
        <div class="list-total"></div>
        <div class="column-title">${this.columnName}</div>
        <button class="btn-add" id="add-${this.columnName}" value="0"><i class="fas fa-plus"></i></button>
        <button class="btn-close"><i class="fas fa-times"></i></button></div>
    <div class="column-content">
        <div class="add-list-wrap" id="add-list-wrap-${this.columnName}"></div>
        <ul class="list"></ul></div></div>`;
    this.init();
  }

  render() {
    const columnWrap = document.querySelector(".column-wrap");
    columnWrap.insertAdjacentHTML("afterbegin", this.columnHTML);
  }
  init() {
    this.render();
    this.registerEventListener();
    this.renderCard();
    this.renderCardTotal();
  }

  registerEventListener() {
    const btnID = `add-${this.columnName}`;
    const btnAdd = document.getElementById(btnID);

    btnAdd.addEventListener("click", () => {
      this.columnPlusBtnClickHandler(btnAdd);
    });
  }

  renderCardTotal(){
    const listTotal = document.querySelector('.list-total');
    listTotal.innerHTML = this.columnData.cards.length;
  }

  renderCard(){
    const cards = this.columnData.cards;
    for (let i = 0; i < cards.length; i++) {
      new Card(cards[i].contents);
    }
  }

  columnPlusBtnClickHandler(btnAdd) {
    const addListWrapID = `add-list-wrap-${this.columnName}`;
    const addListWrap = document.getElementById(addListWrapID);

    if (btnAdd.value == 0) {
      addListWrap.innerHTML = this.cardForm.cardFormHTML;
      btnAdd.value = 1;
      this.cardForm.addBtnCancelEvent(btnAdd, addListWrap);
    } else if (btnAdd.value == 1) {
      addListWrap.innerHTML = "";
      btnAdd.value = 0;
    }
  }
}

export default Column;
