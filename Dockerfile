FROM ruby:2.6.3

# 必要なパッケージのインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs           

# 作業ディレクトリの作成、設定
RUN mkdir /chat-app

#作業ディレクトリを指定している
WORKDIR /chat-app

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは別途事前に作成しておく）
COPY ./Gemfile /chat-app/Gemfile
COPY ./Gemfile.lock /chat-app/Gemfile.lock

# Gemfileのbundle install
RUN bundle install
COPY . /chat-app