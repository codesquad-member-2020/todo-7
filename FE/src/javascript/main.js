// import '../style/style.css';
// import '../style/common/lib/reset.css';
import Column from './component/column.js';
import menu from './component/menu.js';
import modal from './component/modal.js';
import { fetchRequest } from "./util/fetchRequest.js";
import {SERVICE_URL} from "./constants/serviceUrls.js"; 


window.addEventListener('DOMContentLoaded', () => {
    const requestURL = SERVICE_URL.REQUEST_URL;
    const data = {};
    fetchRequest(requestURL, "GET")
      .then((response) => response.json())
      .then((data) => {
        const columnDone = new Column(data.categories[2]);
        const columnInProgress = new Column(data.categories[1]);
        const columnToDo = new Column(data.categories[0]);
        menu.registerEventListener();
        modal.registerEventListener();
      })
});