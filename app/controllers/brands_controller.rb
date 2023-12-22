class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  def index
    @brands = Brand.all
  end

  def show
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to brands_path, notice: "Brand was successfully created." }
        format.turbo_stream # Respond with Turbo Streams
      else
        format.html { render :new }
      end
    end
  end

  # def create
  #   @brand = Brand.new(brand_params)
  #
  #   if @brand.save
  #     redirect_to brands_path, notice: "Brand was successfully created."
  #   else
  #     render :new
  #   end
  # end

  def edit
  end

  def update
    if @brand.update(brand_params)
      redirect_to brands_path, notice: "Brand was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @brand.destroy
    redirect_to brands_path, notice: "Brand was successfully destroyed."
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end
end