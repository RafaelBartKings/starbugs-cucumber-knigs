
Feature: Uso de Cupons no Checkout

  Como um usuário do Starbugs, eu quero poder aplicar cupons de desconto na página de checkout,
  Para que eu possa obter reduções no preço de produtos específicos, aumentando a satisfação com a minha experiência de compra.

  Scenario: Aplicar Desconto de 20%

    Given que iniciei a compra do item:
      | name     | Café com Leite |
      | price    | R$ 19,99       |
      | delivery | R$ 10,00       |
      | total    | R$ 29,99       |

    When aplico o seguinte cupom: "MEUCAFE"
    Then o valor final da compra deve ser atualizado para "R$ 25,99"

  Scenario: Cupom Expirado
    Given que iniciei a compra do item:
      | name     | Café com Leite |
      | price    | R$ 19,99       |
      | delivery | R$ 10,00       |
      | total    | R$ 29,99       |

    When aplico o seguinte cupom: "PROMO20"
    Then devo ver a notificação: "Cupom expirado!"
    And o valor final deve permanecer o mesmo

  Scenario: Cupom Inválido

    Given que iniciei a compra do item:
      | name     | Café com Leite |
      | price    | R$ 19,99       |
      | delivery | R$ 10,00       |
      | total    | R$ 29,99       |

    When aplico o seguinte cupom: "PROMO100"
    Then devo ver a notificação: "Cupom inválido!"
    And o valor final deve permanecer o mesmo


# Feature: Uso de Cupons no Checkout

#   Como um usuário do Starbugs, eu quero poder aplicar cupons de desconto na página de checkout,
#   Para que eu possa obter reduções no preço de produtos específicos, aumentando a satisfação com a minha experiência de compra.

#   Scenario: Aplicar Desconto de 20%

#     Given que iniciei a compra do item:
#       | name     | Café com Leite |
#       | price    | R$ 19,99       |
#       | delivery | R$ 10,00       |
#       | total    | R$ 29,99       |


#     When aplico o seguinte cupom: "MEUCAFE"
#     Then o valor final da compra deve ser atualizado para "R$ 25,99"

#   @ddt
#   Scenario Outline: Tentativa de aplicar ao desconto

#     When aplico o seguinte cupom: "<cupom>"
#     Then devo ver a notificação: "<saida>"
#     And o valor final deve permanecer o mesmo

#     Examples:
#       | cupom    | saida           |
#       | PROMO20  | Cupom expirado! |
#       | PROMO100 | Cupom inválido! |