function taxCalc (){
  const inputPrice = document.getElementById("item-price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  inputPrice.addEventListener('input', () => {
    const value = inputPrice.value
    const tax = Math.floor(value * 0.1);
    taxPrice.innerHTML = tax;
    profit.innerHTML = value - tax;
  })
} 

window.addEventListener('load', taxCalc )
