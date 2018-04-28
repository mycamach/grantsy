class OrdersController < ApplicationController

  def create
    s = Subscription.find(params[:subscription_id])
    o = Order.find_or_create_by(user: current_user, subscription: s, paid: false, price: s.price)
    o.quantity += 1

    if o.save
      redirect_to orders_path, notice: "El plan fue agregado al carro."
    else
      redirect_to subscriptions_index_path, alert: "El plan NO fue agregado al carro."
    end
  end

  def clean
    @orders = Order.where(user: current_user, paid: false)
    @orders.destroy_all
    redirect_to orders_path, notice: 'El carro se ha vaciado.'
  end

  def index
    @orders = current_user.orders.cart
    @total = @orders.get_total
  end
end
