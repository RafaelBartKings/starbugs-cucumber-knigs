

Feature: Catálogo de cafés
  Como um usuário do site, eu quero ver o catálogo de cafés na página principal
  Para que eu possa escolher e saber mais sobre os produtos disponíveis

  Scenario: Acessar o catálogo de café na página principal
    When acesso a página principal da Starbugs
    Then eu devo ver uma lista de cafés disponíveis

  Scenario: Iniciar a compra de um café
    Given Eu estou na página principal da Starbugs
    And que desejo comprar o seguinte produto:
      | name     | Expresso Gelado |
      | price    | R$ 9,99         |
      | delivery | R$ 10,00        |
    When inicio a compra desse item
    Then devo ver a página de Checkout com os detalhes do produto
    And o valor total da compra deve ser de "R$ 19,99"

  Scenario: Café indisponivel
    Given Eu estou na página principal da Starbugs
    And que desejo comprar o seguinte produto:
      | name | Expresso Cremoso |
    When inicio a compra desse item
    Then devo ver o popup informando que o produto está indisponível





