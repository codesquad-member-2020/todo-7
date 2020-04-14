const changeClass = (element, newClassName)=> {
    const beforeClassName = element.className;
    element.classList.remove(beforeClassName);
    element.classList.add(newClassName);
  }

  export default {changeClass};