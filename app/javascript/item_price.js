window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const tax = inputValue * 0.1 

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.textContent = Math.floor(tax)
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax
    

})});