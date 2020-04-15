import modal from "../component/modal.js";

class Card {
  constructor(columnName, cardContent,cardID) {
    this.columnName = columnName;
    this.cardContent = cardContent;
    this.cardID = cardID;
    this.cardHTML = `<li class="card">
        <div class="list-icon" id="list-icon-${this.cardContent}"><i class="far fa-newspaper"></i></div>
        <div class="card-content">
            <div class="content" id="card-${this.cardID}">${this.cardContent}</div>
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

    const btnEdit = document.getElementById(`list-icon-${this.cardContent}`);
    btnEdit.addEventListener('click',()=>{
     this.btnEditClickHandler();
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

  btnEditClickHandler(){
    const btnEdit = document.getElementById(`list-icon-${this.cardContent}`);
    const target = btnEdit.closest('.card');
    const cardContent = target.querySelector(".content").innerText;
    const editTextarea = document.querySelector(".edit-note-textarea");

    editTextarea.dataset.target= this.cardID;
    modal.setCardContent(cardContent);
    modal.openModal();
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
