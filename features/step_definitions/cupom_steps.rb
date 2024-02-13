

Given('que iniciei a compra do item:') do |table|
  @product = table.rows_hash

  @home.open
  @home.buy(@product[:name])
end

When('aplico o seguinte cupom: {string}') do |cupom_code|
  @checkout.set_discount(cupom_code)
end

Then('o valor final da compra deve ser atualizado para {string}') do |final_price|
  @checkout.assert_total_price(final_price)
end

Then('devo ver a notificação: {string}') do |notice|
  @checkout.assert_notice(notice)
end

Then('o valor final deve permanecer o mesmo') do
  @checkout.assert_total_price(@product[:total])
end
