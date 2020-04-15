import Card from "../component/card.js";
import util from "../util/util.js";
import {SERVICE_URL} from "../constants/serviceUrls.js";
import { fetchRequest } from "../util/fetchRequest.js";


class CardForm {
  constructor(columnId,columnName) {
    this.columnId = columnId;
    this.columnName = columnName;
    this.cardFormHTML = `
        <div class="add-list-text">
            <textarea id="textarea-${this.columnName}" placeholder="Enter a note" maxlength=50></textarea>
        </div>
        <div class="add-list-btn">
        <button class="btn-list-add" id="btn-list-add-${this.columnName}">Add</button>
        <button class="btn-list-cancel" id="btn-list-cancel-${this.columnName}">Cancel</button>
        </div>
      `;
  }
  registerEventListener() {
    const btnCancel = document.getElementById(
      `btn-list-cancel-${this.columnName}`
    );
    const btnAdd = document.getElementById(`btn-list-add-${this.columnName}`);
    const textarea = document.getElementById(`textarea-${this.columnName}`);

    btnCancel.addEventListener("click", () => {
      this.cancelBtnClickHandler();
    });

    btnAdd.addEventListener("click", () => {
      this.addBtnClickHandler();
      this.renderCardTotal();
    });

    textarea.addEventListener("keyup", () => {
      this.activateAddBtn();
    });
  }

  cancelBtnClickHandler() {
    const textarea = document.getElementById(`textarea-${this.columnName}`);
    const btnAdd = document.getElementById(`btn-list-add-${this.columnName}`);
    textarea.value = "";
    util.changeClass(btnAdd, "btn-list-add");
  }
  addBtnClickHandler() {
    const textarea = document.getElementById(`textarea-${this.columnName}`);
    if (textarea.value.length <= 0) return;
    this.requestAddingCard(textarea.value);
   
  }
  requestAddingCard(cardContent){
    const requestURL = SERVICE_URL.REQUEST_URL+`/categories/${this.columnId}/cards`;
    const requestBody = {
      "title": cardContent,
      "contents": "",
    };
    fetchRequest(requestURL, "POST", requestBody)
      .then((response) => response.json())
      .then((data) => {
        if(data.status == "404"){alert(data.status+' : '+data.error)}
        else{this.addCard(data);};
      });
  }
  addCard(data){
    const textarea = document.getElementById(`textarea-${this.columnName}`);
    const btnAdd = document.getElementById(`btn-list-add-${this.columnName}`);
    new Card(this.columnId, this.columnName, data.title, data.id);
    textarea.value = "";
    util.changeClass(btnAdd, "btn-list-add");
    this.renderCardTotal();
  }
  activateAddBtn() {
    const textarea = document.getElementById(`textarea-${this.columnName}`);
    const btnAdd = document.getElementById(`btn-list-add-${this.columnName}`);
    textarea.value.length > 0 ? util.changeClass(btnAdd, "btn-list-add-active") : util.changeClass(btnAdd, "btn-list-add");
  }
  renderCardTotal() {
    const listTotal = document.getElementById(`list-total-${this.columnName}`);
    const listUL = document.getElementById(`list-${this.columnName}`);
    listTotal.innerHTML = listUL.childElementCount;
  }
}

export default CardForm;
