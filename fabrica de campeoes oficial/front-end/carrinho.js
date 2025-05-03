document.addEventListener("DOMContentLoaded", () => {
  const carrinho = JSON.parse(localStorage.getItem("carrinho")) || [];
  const tabela = document.getElementById("carrinho-tabela");
  const valorTotal = document.getElementById("valor-total");
  let total = 0;

  function atualizarCarrinho() {
    tabela.innerHTML = "";
    total = 0;

    carrinho.forEach((item, index) => {
      const subtotal = item.quantidade * item.preco;
      total += subtotal;

      const linha = document.createElement("tr");
      linha.innerHTML = `
        <td style="padding: 10px;">${item.nome}</td>
        <td>R$ ${item.preco.toFixed(2)}</td>
        <td>${item.quantidade}</td>
        <td>R$ ${subtotal.toFixed(2)}</td>
        <td><button onclick="removerItem(${index})">Remover</button></td>
      `;
      tabela.appendChild(linha);
    });

    valorTotal.textContent = `Valor total: R$ ${total.toFixed(2)}`;
    localStorage.setItem("carrinho", JSON.stringify(carrinho));
  }

  window.removerItem = function(index) {
    carrinho.splice(index, 1);
    atualizarCarrinho();
  }

  atualizarCarrinho();
});

