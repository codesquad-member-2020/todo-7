import { fetchRequest } from "./util/fetchRequest.js";

class Column {
  constructor(columnName) {
    this.columnName = columnName;
    this.render();
  }
  render() {
    const columnWrap = document.querySelector(".column-wrap");
    const columnHTML = `<div class="column">
         <div class="column-header">
             <div class="list-total"></div>
             <div class="column-title">${this.columnName}</div>
             <button class="btn-add" id="add-${this.columnName}" value="0"><i class="fas fa-plus"></i></button>
             <button class="btn-close"><i class="fas fa-times"></i></button>
         </div>
         <div class="column-content">
             <div class="add-list-wrap" id="add-list-wrap-${this.columnName}">
             </div>
         </div>
     </div>`;
    columnWrap.innerHTML += columnHTML;
  }
  init() {
    const requestURL = "";
    const data = {};
    fetchRequest(requestURL, "POST", data).then((response) => {});
  }

  registerEventListener() {
    const btnID = `add-${this.columnName}`;
    const btnAdd = document.getElementById(btnID);

    btnAdd.addEventListener("click", () => {
      this.columnPlusBtnClickHandler();
    });
  }

  columnPlusBtnClickHandler() {
    const btnID = `add-${this.columnName}`;
    const btnAdd = document.getElementById(btnID);
    const addListWrapID = `add-list-wrap-${this.columnName}`;
    const addListWrap = document.getElementById(addListWrapID);

    if (btnAdd.value == 0) {
      this.addCardForm();

      const btnCancelID = `btn-list-cancel-${this.columnName}`;
      const btnCancel = document.getElementById(btnCancelID);

      btnCancel.addEventListener("click", () => {
        addListWrap.innerHTML = "";
        btnAdd.value = 0;
      });
    } else if (btnAdd.value == 1) {
      addListWrap.innerHTML = "";
      btnAdd.value = 0;
    }
  }

  addCardForm() {
    const btnID = `add-${this.columnName}`;
    const btnAdd = document.getElementById(btnID);
    const addListWrapID = `add-list-wrap-${this.columnName}`;
    const addListWrap = document.getElementById(addListWrapID);
    const cardForm = `
    <div class="add-list-text">
        <textarea placeholder="Enter a note"></textarea>
    </div>
    <div class="add-list-btn">
    <button class="btn-list-add" id="btn-list-add-${this.columnName}">Add</button>
    <button class="btn-list-cancel" id="btn-list-cancel-${this.columnName}">Cancel</button>
    </div>
  `;
    addListWrap.innerHTML = cardForm;
    btnAdd.value = 1;
  }
}

export default Column;
