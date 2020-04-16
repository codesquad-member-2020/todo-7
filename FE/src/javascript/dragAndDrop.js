import util from './util/util.js';
import { fetchRequest } from "./util/fetchRequest.js";
import {SERVICE_URL} from "./constants/serviceUrls.js"; 


const dragAndDrop= (categoriesLength)=>{
  const list_items = document.querySelectorAll('.card');
  const lists = document.querySelectorAll('.list');

  let draggedItem = null;
  let draggedItemAfterimage = null;
  let draggedItemIndex = null;
  let draggedItemColumnId = null;
  let startColumnId = null;

  for (const item of list_items){
    
    item.addEventListener('dragstart',(e)=>{
      draggedItem = item;
      draggedItemAfterimage = item.cloneNode(true);
      startColumnId = item.dataset.columnid;

      setTimeout(()=>{
        item.className = 'card-hold';
        draggedItemAfterimage.className = 'card-hold';
        
      },0);
    });
   
    item.addEventListener('dragend',()=>{ 
      setTimeout(()=>{
        item.className = 'card';
        draggedItemAfterimage.className = 'card-hold';
        draggedItem =null
      },0);
    });
  }

  for(const list of lists){
    list.addEventListener('dragover',(e)=>{
      e.preventDefault();
      list.parentNode.parentNode.className = 'column-hovered';
      
    });
    list.addEventListener('dragenter',(e)=>{
      e.preventDefault();
      list.parentNode.parentNode.className = 'column-hovered';
      draggedItem.className = 'card-hold';
      list.append(draggedItemAfterimage);
      if(startColumnId == list.dataset.columnid) draggedItemAfterimage.className = 'none';
      if(startColumnId != list.dataset.columnid) draggedItemAfterimage.className = 'card-hold';
    });
    list.addEventListener('dragleave',(e)=>{
      e.preventDefault();
      list.parentNode.parentNode.className = 'column';
    });
    list.addEventListener('drop',()=>{
      list.parentNode.parentNode.className = 'column';
      draggedItemAfterimage.remove();
      if(startColumnId == list.dataset.columnid) return;
      list.append(draggedItem);  
      renderCardTotal(categoriesLength);
      draggedItem.dataset.columnid = list.dataset.columnid;
      draggedItemColumnId = list.dataset.columnid;
      draggedItemIndex = util.getElementIndex(draggedItem);
      requestMovingCard();
    });
  }

  function renderCardTotal(columnsLength) {
    for(let i=1; i<=columnsLength ; i++){
      const listTotal = document.getElementById(`list-total-${i}`);
      const listUL = document.getElementById(`list-${i}`);
      listTotal.innerHTML = listUL.childElementCount;
    }
  }
  function requestMovingCard(){
    const requestURL = SERVICE_URL.REQUEST_URL+`/categories/${draggedItemColumnId}/cards`;
    const requestBody = {
      "cardId" : parseInt(draggedItem.id),
      "preveCardId" : draggedItemIndex 
    };
    console.log(draggedItemColumnId);
    console.log(requestBody);
    // fetchRequest(requestURL, "PUT",requestBody)
    //   .then((response) => response.json())
    //   .then((data) => {
    //     if(data.status == "404"){alert(data.status+' : '+data.error + ' 새로고침 버튼을 눌러주세요.')}     
    //   })
  }
};

export default dragAndDrop;