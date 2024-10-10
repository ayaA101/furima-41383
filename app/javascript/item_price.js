const price = () => {
  window.addEventListener('turbo:load', () => {
    const priceInput = document.getElementById("item-price");
    if (!priceInput){ return false;}
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;

      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML =  Math.floor(inputValue / 10);

      const addProfitDom = document.getElementById("profit");
      addProfitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue / 10));

    })
  });
}

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);