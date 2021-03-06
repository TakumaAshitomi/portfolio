# Coaching
## https://coaching-web-app.ml

ユーザー同士で得意な物のコーチングを共有するサイトです。

- 大まかな機能
    - ログイン・ゲストログイン機能
        - 管理ユーザー機能
        - 権限管理
        - メールアドレス認証
    - wysiwygエディタを用いてのコーチング投稿/編集/削除機能
    - 投稿へのタグ付け機能
    - 投稿タイトル・タグ・ユーザーでの検索機能
    - 投稿・ユーザー一覧(ページネーション)
    - ユーザーの購読(フォロー)機能
        - ajaxを用いての非同期通信
    - フォローしたユーザーの投稿一覧機能
    - モデルテスト・自動テスト
    - rubocopにてコード整形
    
- 使用技術
    - 言語
        - Ruby (2.5.3)
        - Ruby on Rails 5.2.3
    - 環境
        - 開発環境
            - Docker
            - Docker-compose
            - Capistranoで自動デプロイ
            - circleCIで自動テスト
        - 本番環境
            - AWS
                - EC2
                - VPC
                - SES
                - S3
                - Route53
                - ALB
                - ACM
    - DB
        - postgreSQL
