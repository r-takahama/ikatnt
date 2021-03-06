- Twitter認証の際に用いるカラムをDBへ追加
    ```
    rails g migration AddColumnsToUsers uid:string provider:string
    sudo rake db:migrate
    ```
    - Railsのログイン認証gemのDeviseとOmniAuth-Twitterの連携（Twitterでログインする） | Rails Webook http://ruby-rails.hatenadiary.com/entry/20140805/1407200400
    - Rails - Devise+OmniAuthでユーザ認証を実装する手順 by @kami30k on @Qiita http://qiita.com/kami30k/items/94aec2d94a2b4e9a1d0b
    - Rails 4.2 で ユーザー管理・認証 (devise) by @salinger001101 on @Qiita http://qiita.com/Salinger/items/873e3c667462746ae707

- リソース fes の DB 構成
    `rails g scaffold fes fesName:string adminName:string adminTwitterID:string description:text rule:string limitNumberOfTeam:integer startDate:datetime registrationDeadline:datetime adminCommunityName:string adminCommunityURL:string`
    - 大会名
    - 運営者名
    - 運営者TwitterアカウントID
    - 大会概要
    - 大会ルール
    - 参加人数上限
    - 大会開始日時
    - 参加登録締切日時
    - 運営ニコニコミュニティ名
    - 運営ニコニコミュニティURL
    - 大会作成日時

- モデル participation の DB 構成
`rails g scaffold participation fes:references teamName:string TwitterID:string NNID:string UserID:string`
    - 参加登録大会ID
    - 登録チーム名
    - 代表者 Twitter アカウントID
    - 代表者 NintendoNetworkID
    - 参加登録日時
    - 登録ユーザID

- モデル match の DB 構成
"fes_id" integer, (fesにネスト)
"created_at" datetime NOT NULL, 
"updated_at" datetime NOT NULL, 
"round" integer, 
"battleID" integer, 
"leftUserID" varchar, 
"leftTeamName" varchar, 
"leftTwitterID" varchar, 
"leftNNID" varchar, 
"rightUserID" varchar, 
"rightTeamName" varchar, 
"rightTwitterID" varchar, 
"rightNNID" varchar, 
"resultLeftWins" integer, 
"resultRightWins" integer, 
"leftWinsReportedByLeft" integer, 
"rightWinsReportedByLeft" integer, 
"leftWinsReportedByRight" integer, 
"rightWinsReportedByRight" integer;

- current_user.uid で view 内でユーザID取得可

- RailsのScaffoldでネストしたResourceを作る - sometimes I laugh http://sil.hatenablog.com/entry/rails-nested-resource-by-scaffold
- いつも忘れる「Railsのgenerateコマンド」の備忘録 - maeharin log http://maeharin.hatenablog.com/entry/20130212/rails_generate

- モデル match の DB 構成
`rails g scaffold match fes:references MyUserID:string MyTeamName:string MyTwitterID:string MyNNID:string EnemyUserID:string EnemyTeamName:string EnemyTwitterID:string EnemyNNID:string NumberOfWins:integer NumberOfLosses:integer`
