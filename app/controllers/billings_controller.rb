class BillingsController < ApplicationController

  def index
    @billings = current_user.billings
  end

  def pre_payment
    orders = current_user.orders.cart
    total = orders.get_total
    items = get_items_hash(orders)
    payment = PayPal::SDK::REST::Payment.new({
      intent: "sale",
      payer: {
        payment_method: "paypal" },
        redirect_urls: {
          # return_url: "http://localhost:3000/billings/execute",
          # cancel_url: "http://localhost:3000/" },
            return_url: "http://www.grantsy.org/billings/execute",
            cancel_url: "http://www.grantsy.org/funds/" },

transactions: [{
  item_list: {
    items: items
    },
    amount: {
      total: total.to_s,
      currency: "USD" },
      description: "Carro de compras plataforma de voluntariado." }]
      })
    if payment.create
      redirect_url = payment.links.find{|v| v.method == "REDIRECT" }.href
      redirect_to redirect_url
    else
      render json:  payment.error
    end
  end

  def execute
    paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])
    if paypal_payment.execute(payer_id: params[:PayerID])
      amount = paypal_payment.transactions.first.amount.total
      billing = Billing.create(
        user: current_user,
        code: paypal_payment.id,
        payment_method: 'paypal',
        amount: amount,
        currency: 'USD'
        )
      order = current_user.orders.last
      order.paid = true
      order.billing_id = billing.id
      order.save
      redirect_to root_path, notice: "El plan fue comprado con éxito."
    else
      render plain: "No se pudo realizar el pago con Paypal."
    end
  end
end

private
def get_items_hash(orders)
  items = orders.map do |order|
    item = {}
    item[:name] = order.subscription.plan_name
    item[:sku] = order.id.to_s
    item[:price] = order.price.to_s
    item[:currency] = 'USD'
    item[:quantity] = order.quantity
    item
  end
end
