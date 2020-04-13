// import '../style/style.css';
// import '../style/common/lib/reset.css';
import Column from '../javascript/columnComponent.js'

window.addEventListener('DOMContentLoaded', () => {
    const columnToDo = new Column("To do");
    const columnInProgress = new Column("In Progress");
    const columnDone = new Column("Done");

    columnToDo.registerEventListener();
    columnInProgress.registerEventListener();
    columnDone.registerEventListener();
});