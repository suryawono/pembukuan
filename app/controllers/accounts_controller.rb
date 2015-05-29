class AccountsController < ApplicationController
  
  def create
    @account=Account.new(params_account)
    if @account.save(validate: true)
      flash[:success]="Berhasil mendaftar"
      redirect_to :login
    else
      flash[:danger]="Username terdaftar"
      redirect_to :register
    end
  end
  
  private
  def params_account
    params.require(:account).permit(:username,:password)
  end
end
