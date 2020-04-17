import CardForm from "../component/cardForm.js";
import Card from "../component/card.js";
import dragAndDrop from "../dragAndDrop.js";
import util from "../util/util.js";
import {SERVICE_URL} from "../constants/serviceUrls.js";
import { fetchRequest } from "../util/fetchRequest.js";

class Column {
  constructor(columnData) {
    this.columnId = columnData.id;
    this.columnData = columnData;
    this.columnName = columnData.title;
    this.cardForm = new CardForm(this.columnId,this.columnName);
    this.columnHTML = `<div class="column" id="${this.columnId}">
    <div class="column-header">
        <div class="list-total" id="list-total-${this.columnId}"></div>
        <div class="column-title">${this.columnName}</div>
        <button class="btn-add" id="add-${this.columnId}" value="0"><i class="fas fa-plus"></i></button>
        <button class="btn-close"><i class="fas fa-times"></i></button></div>
    <div class="column-content">
        <div class="add-list-wrap" id="add-list-wrap-${this.columnId}"></div>
        <ul class="list" id="list-${this.columnId}" data-columnid="${this.columnId}"></ul></div></div>`;
    this.init();
  }

  render() {
    const columnWrap = document.querySelector(".column-wrap");
    columnWrap.insertAdjacentHTML('beforeend', this.columnHTML);
  }
  init() {
    this.render();
    this.registerEventListener();
    this.renderCard();
    this.renderCardTotal(this.columnId);
  }

  registerEventListener() {
    const btnAdd = document.getElementById(`add-${this.columnId}`);

    btnAdd.addEventListener("click", () => {
      this.columnPlusBtnClickHandler(btnAdd);
    });

    const list = document.getElementById(`list-${this.columnId}`);

    list.addEventListener('dragover',(e)=>{
      e.preventDefault();
      // list.parentNode.parentNode.className = 'column-hovered';
    });

    list.addEventListener('dragenter',(e)=>{
      e.preventDefault();
      // util.changeClass(list.parentNode.parentNode,'column-hovered');
      util.changeClass(dragAndDrop.draggedItem,'card-hold');
      if(dragAndDrop.draggedItem.dataset.columnid == list.dataset.columnid) util.changeClass(dragAndDrop.draggedItemAfterimage,'none');
      if(dragAndDrop.draggedItem.dataset.columnid != list.dataset.columnid) util.changeClass(dragAndDrop.draggedItemAfterimage,'card-hold');
      list.append(dragAndDrop.draggedItemAfterimage);
    });
    list.addEventListener('dragleave',(e)=>{
      e.preventDefault();
      // util.changeClass(list.parentNode.parentNode,'column');
    });
    list.addEventListener('drop',()=>{
      // util.changeClass(list.parentNode.parentNode,'column');
      dragAndDrop.draggedItemAfterimage.remove();
      if(dragAndDrop.draggedItem.dataset.columnid == list.dataset.columnid) return;
      list.append(dragAndDrop.draggedItem);  
      dragAndDrop.draggedItem.dataset.columnid = list.dataset.columnid;
      dragAndDrop.draggedItemIndex = util.getElementIndex(dragAndDrop.draggedItem);
      const columns = document.querySelectorAll('.column');
      for(const column of columns){
        this.renderCardTotal(column.id);
      }
      this.requestMovingCard();
    });
  }

  renderCardTotal(columnId){
    const listTotal = document.getElementById(`list-total-${columnId}`);
    const listUL = document.getElementById(`list-${columnId}`);
    listTotal.innerHTML = listUL.childElementCount;
  }

  renderCard(){
    const cards = this.columnData.cards;
    for (let i = 0; i < cards.length; i++) {
      new Card(this.columnId,this.columnName,cards[i].title,cards[i].id,'beforeend');
    }
  }

  columnPlusBtnClickHandler(btnAdd) {
    const addListWrapID = `add-list-wrap-${this.columnId}`;
    const addListWrap = document.getElementById(addListWrapID);

    if (btnAdd.value == 0) {
      addListWrap.innerHTML = this.cardForm.cardFormHTML;
      btnAdd.value = 1;
      this.cardForm.registerEventListener();
    } else if (btnAdd.value == 1) {
      addListWrap.innerHTML = "";
      btnAdd.value = 0;
    }
  }

  requestMovingCard(){
    const requestURL = SERVICE_URL.REQUEST_URL+`/categories/${dragAndDrop.draggedItem.dataset.columnid}/cards`;
    let preveCardId = null;
    if(dragAndDrop.draggedItem.previousSibling!=null) preveCardId = parseInt(dragAndDrop.draggedItem.previousSibling.dataset.cardid);
    const requestBody = {
<<<<<<< HEAD
      "cardId" : parseInt(dragAndDrop.draggedItem.dataset.cardid),
=======
      "cardId" : parseInt(dragAndDrop.draggedItem.id),
>>>>>>> 8e2d9984d65a39e2223b0849bb2d64fa956bdc92
      "prevCardId" : preveCardId 
    };
   
    fetchRequest(requestURL, "PUT",requestBody)
      .then((response) => {
      });
  }
}

export default Column;
