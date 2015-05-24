class Category < ActiveRecord::Base
  belongs_to :category_type
  
  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
  
end
