require_relative './pages/home.rb'
require_relative './pages/checkout.rb'
require_relative './pages/components.rb'
require_relative './pages/order.rb'

Before do
  @home = HomePage.new
  @checkout = CheckoutPage.new
  @order = OrderPage.new
  @popup = PopupPage.new
end