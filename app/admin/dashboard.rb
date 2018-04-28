ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Últimas órdenes' do
          ul do
            Order.last(5).map do |order|
              li link_to(order.user.email, admin_orders_path)
            end
          end
        end
      end

      column do
        panel 'Usuarios'do
          ul do
            li "Usuarios registrados: #{User.count}"
          end
        end
      end
    end

    columns do
      column do
        panel 'Últimas organizaciones registradas'do
          ul do
            Organization.last(5).map do |organization|
              li link_to(organization.name, admin_organizations_path)
            end
          end
        end
      end

      column do
        panel 'Suscripciones'do
          ul do
            li "Suscripciones: #{Subscription.count}"
          end
        end
      end
    end

    panel "Gráfico" do
      render 'shared/chart'
    end
  end
end
