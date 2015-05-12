class CategoriesController < ApplicationController
  def index
    @title = "Kategori"
    @categories=Category.all
  end

  def new
    @title = "Tambah Kategori"
    @category=Category.new
  end

  def edit
  end

  def create
    @category=Category.new(params_category)
    @category.save
    flash[:notice]="Berhasil ditambahkan"
    redirect_to :action => :index
  end
  
  def destroy
    @category=Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Berhasil menghapus #{@category.name}"
    else
      flash[:notice] = "Gagal menghapus #{@category.name}"
    end
    redirect_to :action => :index
  end
  
  def show
    @categories=Category.find(params[:id])
  end
  
  private
  def params_category
    params.require(:category).permit(:name,:category_type_id)
  end
end
