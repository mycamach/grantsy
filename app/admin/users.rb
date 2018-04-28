ActiveAdmin.register User do
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
      end_of_association_chain.includes(:organization)
    end
  end

permit_params :email, :password, :password_confirmation

  index do
    column :email
    column :organization
    column :created_at
    column :last_sign_in_at
    column :sign_in_count
    actions
  end

  form do |f|
    inputs 'Agregar un nuevo usuario' do
      input :email
      input :password
    end
    actions
  end

  show do
    attributes_table do
      row :email
      row :organization
      row :created_at
      row :last_sign_in_at
    end
    active_admin_comments
  end

  controller do
    def update
      if (params[:user][:password].blank? && params[:user][:password_confirmation].blank?)
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

  filter :email, as: :select
  filter :organization, as: :select

end
