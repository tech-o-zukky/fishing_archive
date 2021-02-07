# README: 当ポートフォリオについて

## アプリケーション概要

| 項目                      | 内容         |
| ------------------------ | ----------- |
| アプリケーション名          | Fishing Archive (フィッシングアーカイブ) |
| アプリケーション概要        | 釣りに行った記録を投稿・閲覧する目的のアプリケーションです。 |
| 目指した課題解決            | 釣りに行った記録をWebアプリを使ってデータ化し、一元管理することを目指しました。 |

## 本番環境の利用方法

1. 下記、本番URLにアクセスしてください
2. Basic認証のID/パスワードを入力してアプリケーションにログインしてください。<br>
   なお投稿一覧の閲覧 および 詳細画面の閲覧だけであれば、ユーザーログインは不要です
3. 新規投稿 および 投稿記事の編集機能を利用する際は、<br>
   下記のテスト用アカウント1・2どちらかを使ってユーザーログインを行ってください。

| 項目               | 内容                                          |
| ----------------- | --------------------------------------------- |
| (本番)URL          | [こちらのリンクからどうぞ](http://54.168.176.61/) |
| (本番)Basic認証     | ID: FishUser_1<br>PASS: Fish_1234            |
| (本番)テスト用アカウント1 | ID: test1@test.jp  <br>  PASS: 123456a    |
| (本番)テスト用アカウント2 | ID: test2@test.jp <br> PASS: 123456b      |

## 実装済みの要件

| 機能一覧            | 内容         | ログイン要否 | 参考動画 |
| ----------------- | ----------- | ----------- | - |
| ユーザー管理機能     | ユーザー管理を行う(新規登録、ログイン、ログアウト) | |  |
| 一覧表示機能        | トップページ<br>投稿された釣果情報を一覧表示する | | [動画](https://gyazo.com/3121e773db65d835526170feaed1d1d7) |
| 詳細表示機能        | 投稿された釣果情報について詳細を表示する |  | [動画](https://gyazo.com/97f64c2e6af239aae448803850f49518) |
| 新規投稿機能        | 投稿機能で入力された記事を登録する | 要 | [動画](https://gyazo.com/8734df8c227ece63c31675f6494a9615) |
| 投稿編集／更新機能   | 投稿済みの詳細記事を表示し、編集を行う | 要 |  |
| コメント機能        | 詳細記事上でコメント閲覧・投稿を行う。<br>
                      コメント投稿はログイン済みの時のみ可能。<br>
                      ActionCableを使用(実装期間：2日)                 |  | [動画](https://gyazo.com/061ee65d1fbe3fe760fc912383e59371) |

### 今後実装予定の機能

| 機能一覧        | 内容         |
| -------------- | ----------- |
| コメント機能    | 該当の釣果情報にコメント投稿することで、利用者同士でコミュニケーションをとれるようにする<br>(2021年2月実装済み) |
| 検索機能        | 釣果を知りたい魚の名前を入力し、該当する過去の釣果情報を検索できるようにする |
| 投稿削除機能    | 投稿された記事を削除する |

## データベース設計

### usersテーブル（ユーザー管理テーブル）

| Column              | Type   | Options     | 論理名      |
| ------------------- | ------ | ----------- | ---------- |
| nickname            | string | null: false | ニックネーム |
| email               | string | null: false | Email      |
| encrypted_password  | string | null: false | パスワード   |

#### Association

- has_many :records
- has_many :comments

### recordsテーブル（投稿管理テーブル）

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

#### Association

- belongs_to :user
- has_many_attached :images
- has_many   :fish_kinds
- has_many   :comments

#### Memo

- image(商品画像)はGem:Active Strageで実装するため、上記のカラムに含めていない。

### fish_kindsテーブル(釣果管理テーブル)

| Column       | Type        | Options                         | 論理名      | Memo       |
| ------------ | ----------- | ------------------------------- | ---------- | ---------- |
| record       | references  | null: false, foreign_key: true  | 投稿ID      |            |
| fish_name    | string      | null: false                     | 魚種        |            |
| fish_count   | integer     | null: false                     | 釣れた数     |            |

#### Association

- belongs_to :record

### commentsテーブル(コメント管理テーブル)

| Column       | Type        | Options                         | 論理名            | Memo       |
| ------------ | ----------- | ------------------------------- | ---------------- | ---------- |
| record       | references  | null: false, foreign_key: true  | 投稿ID            |            |
| user         | references  | null: false, foreign_key: true  | コメント投稿ユーザー |           |
| comment     | text         | null: false                     | コメント          |            |

#### Association

- belongs_to :record
- belongs_to :user

## 開発環境

- Ruby 2.6.5
- Ruby on Rails 6.0.3
- MySQL 5.6
- Bootstrap 4.5.3 (jQuery 3.5.1, popper.js 1.16.1) 
