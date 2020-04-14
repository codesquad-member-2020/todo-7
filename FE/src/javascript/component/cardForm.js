class CardForm {
    constructor(columnName){
        this.columnName = columnName;
        this.cardFormHTML = `
        <div class="add-list-text">
            <textarea placeholder="Enter a note"></textarea>
        </div>
        <div class="add-list-btn">
        <button class="btn-list-add" id="btn-list-add-${this.columnName}">Add</button>
        <button class="btn-list-cancel" id="btn-list-cancel-${this.columnName}">Cancel</button>
        </div>
      `;
    }
    addBtnCancelEvent(btnAdd,addListWrap){
        const btnCancelID = `btn-list-cancel-${this.columnName}`;
        const btnCancel = document.getElementById(btnCancelID);
        btnCancel.addEventListener("click", () => {
            addListWrap.innerHTML = "";
            btnAdd.value = 0;
          });
    }

}

export default CardForm;
