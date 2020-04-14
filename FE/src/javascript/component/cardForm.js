import Card from "../component/card.js";
import util from "../util/util.js";

class CardForm {
  constructor(columnName) {
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
    const btnAdd = document.getElementById(`btn-list-add-${this.columnName}`);
    if (textarea.value.length <= 0) return;
    new Card(this.columnName, textarea.value);
    textarea.value = "";
    util.changeClass(btnAdd, "btn-list-add");
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
