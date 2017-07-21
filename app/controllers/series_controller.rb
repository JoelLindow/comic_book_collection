class SeriesController < ApplicationController
  before_action :logged_in, only: [:new, :create]
  before_action :authorize_admin, only: [:edit, :update, :destroy]

  #make edit, update and destroy
  def index
    @series = Series.all
  end

  def new
    @series = Series.new
  end

  def create
    @series = Series.create(series_params)
    if @series.save
      flash[:success] = "You created the series: #{@series.name}"
      redirect_to series_index_path
    else
      render :new
    end
  end

  private

  def series_params
    params.require(:series).permit(:name)
  end
end
