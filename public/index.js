var productTemplate = document.queryselector('#product');
var productContainer = document.queryselector('.row');


axios.get("http://localhost:3000/api/products").then(function(response) {
  var products = response.data;
  console.log(products);

  products.forEach(function(product) {
    var productClone = productTemplate.content.cloneNode(true);

    productClone.queryselector('.name').innerText = product.name;
    productClone.queryselector('.description').innerText = product.description;
    productClone.queryselector('.rarity').innerText = product.rarity;
    productClone.queryselector('.attunement').innerText = product.attunement;
    productClone.queryselector('.name').href = "/products/" + product["id"];

    productContainer.appendChild(productClone);
  });
});