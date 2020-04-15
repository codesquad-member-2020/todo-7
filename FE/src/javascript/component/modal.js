import {SERVICE_URL} from "../constants/serviceUrls.js";
import {fetchRequest} from "../util/fetchRequest.js";

const registerEventListener = () => {
  const btnDelete = document.querySelector(".edit-note-close-btn");
  btnDelete.addEventListener("click", () => {
    closeModal();
  });

  const btnSave = document.querySelector(".edit-note-save-btn");
  btnSave.addEventListener("click", () => {
      saveEditedContent();
  });
};

const saveEditedContent = () => {
    const editTextarea = document.querySelector(".edit-note-textarea");
    const targetCardID = editTextarea.dataset.target;
    const targetColumnID = editTextarea.dataset.columnId;
    const targetCard = document.getElementById(`card-${targetCardID}`);
    const editedContent = editTextarea.value;
    
    const requestBody = {
      "title": editedContent,
      "contents": "",
    };
    const requestURL = SERVICE_URL.REQUEST_URL+`/categories/${targetColumnID}/cards/${targetCardID}`;
    fetchRequest(requestURL, "PUT", requestBody)
      .then((response) => response.json())
      .then((data) => {
        if(data.status == "404"){alert(data.status+' : '+data.error)}
        else{
        targetCard.innerText = editedContent;
        closeModal();
        }
      });
};

const closeModal = () => {
  const editForm = document.querySelector(".edit-note-background");
  editForm.style.left = "-1600px";
};

const openModal = () => {
    const editModal = document.querySelector('.edit-note-background');
    editModal.style.left = "0px";
};

const setCardContent = (cardContent) => {
  const editTextarea = document.querySelector(".edit-note-textarea");
  editTextarea.value = cardContent;
};



export default {registerEventListener,openModal,setCardContent};
