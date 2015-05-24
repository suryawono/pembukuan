class Transaction < ActiveRecord::Base
  #  acts_as_xlsx :columns => [:id,:nominal,:tanggal]
  belongs_to :funding_source
  belongs_to :category
  
  filterrific :available_filters => %w[
                with_category_id
  ]
  
  scope :with_category_id, lambda { |category_ids|
    where(:category_id => [*category_ids])
  }
end
