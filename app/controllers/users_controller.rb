class UsersController < ApplicationController
  def dashboard
    @title="Dashboard"
    @tujuh_hari=Transaction.all
  end
end
