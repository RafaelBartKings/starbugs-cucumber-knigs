
Feature: Pedidos
  Como usuário do site Starbugs, eu quero selecionar e comprar cafés
  Para que eu possa receber os produtos em meu endereço e efetuar a pagamento na entrega de

  Scenario: Compra bem sucedida
    Given Eu estou na página principal da Starbugs
    And que iniciei a compra do item "Expresso Tradicional"
    When faço a busca do seguinte CEP: "02111000"
    And informo os demais dados do endereço:
      | number  | 1000    |
      | details | Apto 20 |
    And escolho a forma de pagamento "Cartão de Débito"
    And por fim finalizo a compra
    Then sou redirecionado para a página de confirmação de Pedidos
    And deve ser informado o seguinte prazo de entrega : "20 min - 30 min"
