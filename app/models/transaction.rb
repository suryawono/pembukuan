class Transaction < ActiveRecord::Base
#  acts_as_xlsx :columns => [:id,:nominal,:tanggal]
  belongs_to :funding_source
  belongs_to :category
end
