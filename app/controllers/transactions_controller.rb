class TransactionsController < ApplicationController
  
  def index
    @title = "Transaksi"
    @transactions=Transaction.all
    respond_to do |format|
      format.html
      format.xlsx {
        #        send_data Transaction.to_xlsx, :filename => 'transaksi.xlsx', :type => "application/vnd.openxmlformates-officedocument.spreadsheetml.sheet"
      }
      format.csv{
        headers['Content-Disposition'] = "attachment; filename=\"transaksi.csv\""
        headers['Content-Type'] ||= 'text/csv'
      }
    end
  end

  def new
    @title = "Tambah Transaksi"
    @transaction=Transaction.new
    @category_types=CategoryType.includes(:categories).all
  end

  def edit
  end

  def create
    @transaction=Transaction.new(params_transaction)
    @transaction.save
    flash[:notice]="Berhasil ditambahkan"
    redirect_to :action => :index
  end
  
  def destroy
    @transaction=Transaction.find(params[:id])
    if @transaction.destroy
      flash[:notice] = "Berhasil menghapus transaksi"
    else
      flash[:notice] = "Gagal menghapus transaksi"
    end
    redirect_to :action => :index
  end
  
  def show
    @transaction=Transaction.find(params[:id])
  end
  
  private
  def params_transaction
    params.require(:transaction).permit(:tanggal,:category_id,:funding_source_id,:nominal,:keterangan)
  end
end
