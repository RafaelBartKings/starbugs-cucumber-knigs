

Given('que iniciei a compra do item {string}') do |product_name|
  @home.buy(product_name)
end

When('faço a busca do seguinte CEP: {string}') do |zipcode|
  @checkout.find_zipcode(zipcode)
end

When('informo os demais dados do endereço:') do |table|
  @checkout.fill_address(table.rows_hash)
end

When('escolho a forma de pagamento {string}') do |payment_type|
  @checkout.choice_payment(payment_type)
  # //label//div[text()="Cartão de Crédito"]
end

When('por fim finalizo a compra') do
  @checkout.submit
end

Then('sou redirecionado para a página de confirmação de Pedidos') do
  @order.assert_order
end

Then('deve ser informado o seguinte prazo de entrega : {string}') do |delivery_time|
  @order.assert_delivery_time(delivery_time)
end
