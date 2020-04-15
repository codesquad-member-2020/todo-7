const changeClass = (element, newClassName)=> {
    const beforeClassName = element.className;
    element.classList.remove(beforeClassName);
    element.classList.add(newClassName);
  }

const showLoadingIndicator = (elementClass,showPosition)=> {
  const loading = document.querySelector(elementClass);
  loading.style.left = `${showPosition}px`;
}

const closeLoadingIndicator = (elementClass,closePosition)=> {
  const loading = document.querySelector(elementClass);
  loading.style.left = `${closePosition}px`;
}
  export default {changeClass,showLoadingIndicator,closeLoadingIndicator};
