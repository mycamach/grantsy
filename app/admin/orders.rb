ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

permit_params :user, :subscription

index do
    column :paid
    column :user do |order|
      order.user.email
    end
    column :subscription do |order|
      order.subscription.plan_name
    end
    column :created_at
    column :billing_id
    column :price
    actions
  end

   form do |f|
    inputs 'Ingresar nueva orden' do
      f.input :user_id,
        label: 'User',
        as: :select,
        collection: User.pluck(:email, :id)
      f.input :subscription_id,
        label: 'Subscription',
        as: :select,
        collection: Subscription.pluck(:plan_name)
      f.input :paid
    end
    actions
  end
end
