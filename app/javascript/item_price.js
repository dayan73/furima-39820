const item_price = () => {
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = parseFloat(priceInput.value);

    // 販売手数料の計算
    const fee = Math.floor(inputValue * 0.1);  // 手数料は10%で計算し、小数点以下を切り捨てる

    // 販売利益の計算
    const profit = inputValue - fee;

    // 計算結果の表示
    addTaxDom.innerHTML = `${fee}円`;
    profitDom.innerHTML = `${profit}円`;
  });

  console.log(priceInput);
  
  console.log("OK");
};



window.addEventListener('turbo:load',item_price);
window.addEventListener('turbo:render',item_price);