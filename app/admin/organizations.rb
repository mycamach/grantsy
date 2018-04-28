ActiveAdmin.register Organization do
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

controller do
    def scoped_collection
      end_of_association_chain.includes(:user)
    end
  end

permit_params :name, :user, :address, :phone, :website, :country, :dni, :created_at

index do
    column :name
    column :user
    column :address
    column :phone
    column :website
    column :country
    column :dni
    column :created_at
    actions
  end

  filter :name, as: :select
  filter :address, as: :string
  filter :phone, as: :string
  filter :website, as: :string
  filter :dni, as: :string
end
