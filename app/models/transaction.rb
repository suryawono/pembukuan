class Transaction < ActiveRecord::Base
  #  acts_as_xlsx :columns => [:id,:nominal,:tanggal]
  belongs_to :funding_source
  belongs_to :category
  
  filterrific :available_filters => %w[
                with_category_id
                minimal_nominal
                maximal_nominal
                awal_tanggal
                akhir_tanggal
  ]
  
  scope :with_category_id, lambda { |category_ids|
    where(:category_id => [*category_ids])
  }
  
  scope :minimal_nominal, lambda{ |minimal_nonimal|
    where("nominal >= ?",minimal_nonimal)
  }
  
  scope :maximal_nominal, lambda{ |maximal_nominal|
    where("nominal <= ?",maximal_nominal)
  }
  
   scope :awal_tanggal, lambda{ |awal_tanggal|
    where("tanggal >= ?",awal_tanggal)
  }
  
  scope :akhir_tanggal, lambda{ |akhir_tanggal|
    where("tanggal <= ?",akhir_tanggal)
  }
end
