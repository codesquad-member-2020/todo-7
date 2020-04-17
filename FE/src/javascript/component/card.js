import modal from "../component/modal.js";
import {SERVICE_URL} from "../constants/serviceUrls.js";
import { fetchRequest } from "../util/fetchRequest.js";
import util from "../util/util.js";
import dragAndDrop from "../dragAndDrop.js";

class Card {
  constructor(columnId,columnName, cardContent, cardID,renderDirection) {
    this.columnId = columnId;
    this.columnName = columnName;
    this.cardContent = cardContent;
    this.cardID = cardID;
    this.renderDirection = renderDirection;
    this.cardHTML = `<li class="card" id="card-${this.cardID}" draggable="true" data-columnid="${this.columnId}" data-cardid=${this.cardID}>
        <div class="list-icon" id="list-icon-${this.cardID}"><i class="far fa-newspaper"></i></div>
        <div class="card-content">
            <div class="content" id="card-${this.cardID}">${this.cardContent}</div>
            <div class="writer-message">Added by <span class="writer-id">hyewon3938</span></div>
        </div>
        <button class="btn-list-delete" id="btn-list-delete-${this.cardID}"><i class="fas fa-times"></i></button>
    </li>`;
    this.makeCard(this.renderDirection);
    this.registerEventListener();
  }
  registerEventListener() {
    const btnDelete = document.getElementById(`btn-list-delete-${this.cardID}`);
    btnDelete.addEventListener("click", () => {
      this.btnDeleteClickHandler();
    });

    const btnEdit = document.getElementById(`list-icon-${this.cardID}`);
    btnEdit.addEventListener('click',()=>{
     this.btnEditClickHandler();
    });

    const card = document.getElementById(`card-${this.cardID}`);
    const cardAfterimage = card.cloneNode(true);
    

    card.addEventListener('dragstart',(e)=>{
      dragAndDrop.draggedItem = card;
      dragAndDrop.draggedItemAfterimage = cardAfterimage;
      dragAndDrop.draggedItemColumnId = this.columnId;
      setTimeout(()=>{
        card.className = 'card-hold';
        cardAfterimage.className = 'card-hold';     
      },0);
    });
   
    card.addEventListener('dragend',()=>{ 
      setTimeout(()=>{
        card.className = 'card';
        cardAfterimage.className = 'card-hold';
      },0);
    });

  }
  makeCard(direction) {
    const listULID = `list-${this.columnId}`;
    const listUL = document.getElementById(listULID);
    listUL.insertAdjacentHTML(direction, this.cardHTML);    
  }
  btnDeleteClickHandler() {
    if (confirm("선택하신 카드를 삭제하시겠습니까?")) {
      util.closeLoadingIndicator('.loading',0);
      this.requestDeletingCard();
    } else {return;}
  }
  requestDeletingCard(){
    const requestBody = {
      "title": this.cardContent,
      "contents": "",
    };
    const requestURL = SERVICE_URL.REQUEST_URL+`/categories/${this.columnId}/cards/${this.cardID}`;
    fetchRequest(requestURL, "DELETE", requestBody)
      .then((response) => {
        if (response.status != 202) {
          response.json();}
      })
      .then((data) => {
        if (data != null && data.status == "404") {
          alert(data.status + " : " + data.error);
        }else{
          this.removeCard();
          this.renderCardTotal();
          util.closeLoadingIndicator(".loading", -1600);
        }
      });
  }
  btnEditClickHandler(){
    const btnEdit = document.getElementById(`list-icon-${this.cardID}`);
    const target = btnEdit.closest('.card');
    const cardContent = target.querySelector(".content").innerText;
    const editTextarea = document.querySelector(".edit-note-textarea");

    editTextarea.dataset.target= this.cardID;
    editTextarea.dataset.columnId= this.columnId;

    modal.setCardContent(cardContent);
    modal.openModal();
  }
  removeCard(){
    const btnDelete = document.getElementById(`btn-list-delete-${this.cardID}`);
    const targetCard = btnDelete.closest(".card");
    targetCard.remove();
  }
  renderCardTotal() {
    const listTotal = document.getElementById(`list-total-${this.columnId}`);
    const listUL = document.getElementById(`list-${this.columnId}`);
    listTotal.innerHTML = listUL.childElementCount;
  }

  
}

export default Card;
