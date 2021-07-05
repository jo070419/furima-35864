window.addEventListener('load', function(){
  // console.log("OK");
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
      // inputValue = 3000
    const tax = inputValue * 0.1 
    //const profit = inputValue - tax
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.textContent = Math.floor(tax)
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax
    
    // console.log(addTaxDom);
    
    
    // console.log(addTaxDom.innerHTML);
})});