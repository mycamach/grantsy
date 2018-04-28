ActiveAdmin.register Fund do
  config.per_page = 5
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params :institution, :name, :description, :amount, :start, :end, :url
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

index do
    column :institution
    column :name
    column :description
    column :amount
    column :start
    column :end
    column :url
    column :tag do |fund|
      fund.tags.pluck(:name)
    end
    actions
  end

show do
    attributes_table do
      row :institution
      row :name
      row :description
      row :amount
      row :start
      row :end
      row :url
    end
    active_admin_comments
  end

form do |f|
    f.inputs do
      f.input :institution
      f.input :name
      f.input :description
      f.input :amount
      f.input :start, as: :date_picker
      f.input :end, as: :date_picker
      f.input :url
    end
    f.actions
  end

filter :institution, as: :select
filter :name, as: :select
filter :description, as: :string
filter :amount, as: :numeric
filter :start, as: :date_range
filter :end, as: :date_range
filter :url, as: :select
filter :tags, as: :select

end
