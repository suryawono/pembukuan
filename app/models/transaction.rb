class Transaction < ActiveRecord::Base
  belongs_to :funding_source
  belongs_to :category
end
