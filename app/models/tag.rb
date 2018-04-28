class Tag < ApplicationRecord
  has_many :fund_tags
  has_many :funds, through: :fund_tags
end
