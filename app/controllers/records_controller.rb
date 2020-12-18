class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
  end

  def show
    @record = Record.find(params[:id])
  end

  def new
    @fish_record = FishRecord.new
  end

  def create
    @fish_record = FishRecord.new(fish_record_params)
    if @fish_record.valid?
      @fish_record.save
      redirect_to root_path
    else
      #戻った時ひとつの欄にまとめて記述されてしまうため、一旦クリアしておく
      @fish_record.fish_name = ""
      @fish_record.fish_count = ""
      render :new
    end
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
