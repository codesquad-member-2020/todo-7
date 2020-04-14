// import '../style/style.css';
// import '../style/common/lib/reset.css';
import Column from './component/column.js'
import menu from './component/menu.js'
import { fetchRequest } from "./util/fetchRequest.js";


window.addEventListener('DOMContentLoaded', () => {
    const requestURL =
      "http://ec2-34-236-160-204.compute-1.amazonaws.com:8080/projects/1";
    const data = {};
    fetchRequest(requestURL, "GET")
      .then((response) => response.json())
      .then((data) => {
        const columnDone = new Column(2,data.categories[2]);
        const columnInProgress = new Column(1,data.categories[1]);
        const columnToDo = new Column(0,data.categories[0]);
        menu.onMenuBtnClick();
      })
});