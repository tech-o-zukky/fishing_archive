# README

# テーブル設計

## users テーブル（ユーザー管理テーブル）

| Column              | Type   | Options     | 論理名      |
| ------------------- | ------ | ----------- | ---------- |
| nickname            | string | null: false | ニックネーム |
| email               | string | null: false | Email      |
| encrypted_password  | string | null: false | パスワード   |

### Association

- has_many :records

## records テーブル（投稿管理テーブル）

| Column            | Type        | Options                         | 論理名      | Memo       |
| ----------------- | ----------- | ------------------------------- | ---------- | ---------- |
| title             | string      | null: false                     | 投稿タイトル |            |
| date              | date        | null: false                     | 釣行日      |            |
| prefecture_id     | integer     | null: false                     | 都道府県     | ActiveHash |
| area              | string      |                                 | 場所(ポイント) |            |
| place             | string      |                                 | 場所(施設・船) |          |
| timing1           | boolean     | null: false, default: false     | 時間帯1     |            |
| timing2           | boolean     | null: false, default: false     | 時間帯2     |            |
| timing3           | boolean     | null: false, default: false     | 時間帯3     |            |
| timing4           | boolean     | null: false, default: false     | 時間帯4     |            |
| timing5           | boolean     | null: false, default: false     | 時間帯5     |            |
| timing6           | boolean     | null: false, default: false     | 時間帯6     |            |
| timing7           | boolean     | null: false, default: false     | 時間帯7     |            |
| weather_id        | integer     |                                 | 天気       | ActiveHash |
| wind_id           | integer     |                                 | 風         | ActiveHash |
| temperature       | float       |                                 | 気温       |            |
| water_temperature | float       |                                 | 水温       |            |
| wave_id           | integer     |                                 | 波高       | ActiveHash |
| water_quality_id  | integer     |                                 | 水質       | ActiveHash |
| tide_id           | integer     |                                 | 潮汐       | ActiveHash |
| content           | text        | null: false                     | 詳細内容    |            |
| user              | references  | null: false, foreign_key: true  | 投稿ユーザー |            |

### Association
- has_many   :fish_kinds
- belongs_to :user

### Memo

- image(商品画像)はGem:Active Strageで実装するため、上記のカラムに含めていない。

## fish_kinds(釣果管理テーブル)

| Column       | Type        | Options                         | 論理名      | Memo       |
| ------------ | ----------- | ------------------------------- | ---------- | ---------- |
| record       | references  | null: false, foreign_key: true  | 投稿ID      |            |
| fish_name    | string      | null: false                     | 魚種        |            |
| fish_count   | integer     | null: false                     | 釣れた数     |            |

### Association

- belongs_to :record
