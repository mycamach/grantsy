class Order < ApplicationRecord
  belongs_to :user
  belongs_to :subscription
  belongs_to :billing, optional: true

  scope :cart, -> {where(paid:false)}

  def self.get_total
    pluck("price * quantity").sum()
  end

  def self.created_by_day
   group_by_day(:created_at).count
  end
end
