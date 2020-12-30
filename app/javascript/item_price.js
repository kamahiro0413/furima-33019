window.addEventListener('load', function() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () =>{
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = priceInput.value * 0.1;
    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - addTaxDom.innerHTML;
  })
});