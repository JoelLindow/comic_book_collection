class BrandsController < ApplicationController
  before_action :logged_in, only: [:new, :create]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def create
    @brand = Brand.create(brand_params)
    if @brand.save
      flash[:success] = "You created the brand: #{@brand.name}"
      redirect_to brands_path
    else
      render :new
    end
  end

  private

  def brand_params
    params.require(:brand).permit(:name)
  end
end
