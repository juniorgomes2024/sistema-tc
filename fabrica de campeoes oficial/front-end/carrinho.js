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

// Finalizar compra
const finalizarCompraButton = document.querySelector('button');

finalizarCompraButton.addEventListener('click', () => {
  const carrinhoTabela = document.getElementById('carrinho-tabela');
  const linhas = carrinhoTabela.rows;
  const itens = [];

  for (let i = 0; i < linhas.length; i++) {
    const linha = linhas[i];
    const item = {
      nome: linha.cells[0].textContent,
      preco: linha.cells[1].textContent,
      quantidade: linha.cells[2].textContent,
      total: linha.cells[3].textContent
    }; 
    itens.push(item);
  }

  // Envia os itens para o arquivo carrinho.php para cadastrar no banco
  fetch('../back-end/carrinho.php', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(itens)
  })
  .then(response => {
    if (!response.ok) {
      throw new Error('Erro ao encaminhar os itens para o carrinho.');
    }
    return response.text();
  })
  .then((data) => {
    console.log(data);
    localStorage.removeItem('carrinho');
    //Redirecionamento
    // location.href = 'loja.html';
  })
  .catch(error => {
    console.error('There was a problem with the fetch operation:', error);
  });
});
