class Account < ActiveRecord::Base
   validates :username, presence: true
end
