class RecordsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit]

  def index
    @records = Record.all.order("created_at DESC")
  end

  def show
    @record = Record.find(params[:id])

    # add 20210206 コメント機能 ログイン済みの時はコメント入力欄表示
    @comments = @record.comments

    if user_signed_in?
      @comment = Comment.new
    end
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

  def edit
    @fish_record = FishRecord.new
    select_fish_record(@fish_record, params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @fish_record.user_id
  end

  def update
    @fish_record = FishRecord.new(fish_record_params)
    if @fish_record.valid?
      @fish_record.update(fish_record_params, params[:id])
      redirect_to root_path
    else
      #戻った時ひとつの欄にまとめて記述されてしまうため、一旦クリアしておく
      @fish_record.fish_name = ""
      @fish_record.fish_count = ""
      render :edit
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

  def select_fish_record(fishrecord, id)
    getdata = Record.find(params[:id])

    fishrecord.title = getdata.title
    fishrecord.date = getdata.date
    fishrecord.prefecture_id = getdata.prefecture_id
    fishrecord.area = getdata.area
    fishrecord.place = getdata.place
    fishrecord.timing1 = getdata.timing1
    fishrecord.timing2 = getdata.timing2
    fishrecord.timing3 = getdata.timing3
    fishrecord.timing4 = getdata.timing4
    fishrecord.timing5 = getdata.timing5
    fishrecord.timing6 = getdata.timing6
    fishrecord.timing7 = getdata.timing7
    fishrecord.weather_id = getdata.weather_id
    fishrecord.wind_id = getdata.wind_id
    fishrecord.temperature = getdata.temperature
    fishrecord.water_temperature = getdata.water_temperature
    fishrecord.wave_id = getdata.wave_id
    fishrecord.water_quality_id = getdata.water_quality_id
    fishrecord.tide_id = getdata.tide_id
    fishrecord.content = getdata.content
    fishrecord.user_id = getdata.user.id
    fishrecord.fish_name = []
    fishrecord.fish_count = []

    #魚種情報の取得
    if getdata.fish_kinds.count > 0
      getdata.fish_kinds.each do | fish_kind |
        fishrecord.fish_name << fish_kind.fish_name
        fishrecord.fish_count << fish_kind.fish_count
      end
    end
  end

end
