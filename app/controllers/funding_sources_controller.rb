class FundingSourcesController < ApplicationController
   def index
    @title = "Sumber Dana"
    @funding_sources=FundingSource.all
  end

  def new
    @title = "Tambah Sumber Dana"
    @funding_source=FundingSource.new
  end

  def edit
  end
  
  def create
    @funding_source=FundingSource.new(params_funding_source)
    @funding_source.save
    flash[:notice]="Berhasil ditambahkan"
    redirect_to :action => :index
  end
  
  def destroy
    @funding_source=FundingSource.find(params[:id])
    if @funding_source.destroy
      flash[:notice] = "Berhasil menghapus #{@funding_source.name}"
    else
      flash[:notice] = "Gagal menghapus #{@funding_source.name}"
    end
    redirect_to :action => :index
  end
  
  def show
    @funding_source=FundingSource.find(params[:id])
  end
  
  private
  def params_funding_source
    params.require(:funding_source).permit(:name)
  end
end
