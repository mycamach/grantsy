class FundTag < ApplicationRecord
  belongs_to :fund
  belongs_to :tag
end
