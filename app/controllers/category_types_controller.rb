class CategoryTypesController < ApplicationController
  def index
    @title = "Jenis Kategori"
    @category_types=CategoryType.all
  end

  def new
    @title = "Tambah Jenis Kategori"
    @category_type=CategoryType.new
  end

  def edit
  end
  
  def create
    @category_type=CategoryType.new(params_category_type)
    @category_type.save
    flash[:notice]="Berhasil ditambahkan"
    redirect_to :action => :index
  end
  
  def destroy
    @category_type=CategoryType.find(params[:id])
    if @category_type.destroy
      flash[:notice] = "Berhasil menghapus #{@category_type.name}"
    else
      flash[:notice] = "Gagal menghapus #{@category_type.name}"
    end
    redirect_to :action => :index
  end
  
  def show
    @category_type=CategoryType.find(params[:id])
  end
  
  private
  def params_category_type
    params.require(:category_type).permit(:name)
  end
  
end
