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
                sorted_by
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
  
  scope :sorted_by, lambda { |sort_option|
    # extract the sort direction from the param value.
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^tanggal_/
      order("transactions.tanggal #{ direction }")
    when /^nominal_/
      order("transactions.nominal #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }
  
  def self.options_for_sorted_by
    [
      ['Tanggal (Paling baru)', 'tanggal_desc'],
      ['Tanggal (Paling lama)', 'tanggal_asd'],
      ['Nominal (Paling besar)', 'nominal_desc'],
      ['Nominal (Paling kecil)', 'nominal_asc'],
    ]
  end
end
