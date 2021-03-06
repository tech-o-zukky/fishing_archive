class FishRecord
  include ActiveModel::Model
  
  attr_accessor :title, :date, :prefecture_id, :area, :place,
                :timing1, :timing2, :timing3, :timing4, :timing5,
                :timing6, :timing7, :weather_id, :wind_id, :temperature,
                :water_temperature, :wave_id, :water_quality_id, :tide_id, :content,
                :fish_name, :fish_count,
                :images, :user_id
  
  # ActiveHash利用カラムのバリデーション
  validates :prefecture_id,    presence: true, numericality: { other_than: 0, message: "を選択してください。" }

  # バリデーション
  validates :title,            presence: true
  validates :date,             presence: true
  validates :content,          presence: true

  validates :fish_name, length: { maximum: 40 }
  validates :fish_count, format: { with: /\d{1,3}/ }

  # 投稿時の保存処理
  def save
    record = Record.create(
      title: title, date: date, prefecture_id: prefecture_id, area: area, place: place,
      timing1: timing1, timing2: timing2, timing3: timing3, timing4: timing4, timing5: timing5,
      timing6: timing6, timing7: timing7, weather_id: weather_id, wind_id: wind_id, temperature: temperature,
      water_temperature: water_temperature, wave_id: wave_id,  water_quality_id: water_quality_id, tide_id: tide_id, content: content,
      images: images, user_id: user_id
    )
    
    #魚種の数だけfish_kindsに登録
    fish_name.length.times do |i|
      if fish_name[i] != "" && fish_count[i] != ""
        FishKind.create(fish_name: fish_name[i], fish_count: fish_count[i].to_i, record_id: record.id)
      end
    end
  end

  def update(item, id)
    #Recordのアップデート
    record = Record.find(id)

    record.update(
      title: item[:title], date: item[:date], prefecture_id: item[:prefecture_id], area: item[:area], place: item[:place],
      timing1: item[:timing1], timing2: item[:timing2], timing3: item[:timing3], timing4: item[:timing4], timing5: item[:timing5],
      timing6: item[:timing6], timing7: item[:timing7], weather_id: item[:weather_id], wind_id: item[:wind_id], temperature: item[:temperature],
      water_temperature: item[:water_temperature], wave_id: item[:wave_id],  water_quality_id: item[:water_quality_id], tide_id: item[:tide_id], content: item[:content],
      images: item[:images], user_id: item[:user_id]
    )
    
    #魚種の数だけfish_kindsに登録。一度、古いレコードを削除してcreateすることにした
    FishKind.destroy_by(record_id: record.id)

    item[:fish_name].length.times do |i|
      if item[:fish_name][i] != "" && item[:fish_count][i] != ""
        FishKind.create(fish_name: item[:fish_name][i], fish_count: item[:fish_count][i].to_i, record_id: record.id)
      end
    end
  end

end