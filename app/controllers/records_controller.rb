class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @fish_record = FishRecord.new
  end

  def create
  end

  private

  def fish_record_params
    params.require(:fish_record).permit(
      :title, :date, :prefecture_id, :area, :place,
      :timing1, :timing2, :timing3, :timing4, :timing5,
      :timing6, :timing7, :weather_id, :wind_id, :temperature,
      :water_temperature, :wave_id,  :water_quality_id,  :tide_id,  
      :content, fish_name: [], fish_count: [], images: []
    ).merge(user_id: current_user.id)
  end
end
