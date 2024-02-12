
Feature: Uso de Cupons no Checkout

  Como um usuário do Starbugs, eu quero poder aplicar cupons de desconto na página de checkout,
  Para que eu possa obter reduções no preço de produtos específicos, aumentando a satisfação com a minha experiência de compra.

  Scenario: Aplicar Desconto de 20%
    O usuário deve ser capaz de aplicar um cupom de 20% de desconto válido no checkout.
    desconto deve ser aplicado apenas ao valor do produto e o valor final deve ser recalculado corretamente.

    Given que estou na página de Checkout
    And o item que está no meu carrinho é o Café com Leite no valor de R$19,99
    And que taxa de entrega é de R$ 10,00
    And o valor total é de R$ 29,99
    And tenho um cupom com 20% de desconto "MEUCAFE"
    When aplico esse cupom de desconto
    Then o desconto de 20% deve ser aplicado apenas no valor do Café com Leite
    And o valor final da compra deve ser atualizado para R$ 25,99

  Scenario: Cupom Expirado

    Given que estou na página de Checkout
    And o item que está no meu carrinho é o Café com Leite no valor de R$19,99
    And que taxa de entrega é de R$ 10,00
    And o valor total é de R$ 29,99
    And tenho um cupom que está expirado "PROMO20"
    When aplico esse cupom de desconto
    Then devo ver a seguinte notificação "Cupom expirado!"
    And valor final deve permanecer o mesmo

  Scenario: Cupom Inválido

    Given que estou na página de Checkout
    And o item que está no meu carrinho é o Café com Leite no valor de R$19,99
    And que taxa de entrega é de R$ 10,00
    And o valor total é de R$ 29,99
    And tenho um cupom com o código inválido "PROMO100"
    When aplico esse cupom de desconto
    Then devo ver a seguinte notificação "Cupom inválido!"
    And valor final deve permanecer o mesmo