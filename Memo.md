- Twitter認証の際に用いるカラムをDBへ追加
    ```
    rails g migration AddColumnsToUsers uid:string provider:string
    sudo rake db:migrate
    ```
    - Railsのログイン認証gemのDeviseとOmniAuth-Twitterの連携（Twitterでログインする） | Rails Webook http://ruby-rails.hatenadiary.com/entry/20140805/1407200400
    - Rails - Devise+OmniAuthでユーザ認証を実装する手順 by @kami30k on @Qiita http://qiita.com/kami30k/items/94aec2d94a2b4e9a1d0b