class UsersController < ApplicationController
  
  def dashboard
    @j = ActiveSupport::JSON
    @title="Dashboard"
    @tujuh_hari_pemasukan=Transaction.joins(:category).where('tanggal >= ?', Time.zone.now - 7.days).where("categories.category_type_id = 10").group(:tanggal).sum(:nominal)
    @tujuh_hari_pengeluaran=Transaction.joins(:category).where('tanggal >= ?', Time.zone.now - 7.days).where("categories.category_type_id = 11").group(:tanggal).sum(:nominal)
  end
  
  def login
    @title="Login"
    render :layout => "login"
  end
  
  def register
    @title="Register"
    @account=Account.new
    render :layout => "login"
  end
  
end
