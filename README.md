-taskモデル
　　　-nameカラム　　-string
      -detailカラム  -string

herokuにデプロイ　手順
1,herokuにログイン
2,Rubyのバージョンが2.6.5なので、Gemfileでrubyのバージョンをコメントアウト
3,bundle install
4,git adds
5,git commit  
6,git push heroku step2:master
