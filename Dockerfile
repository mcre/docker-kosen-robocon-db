FROM heroku/heroku:18

WORKDIR /root
RUN git clone https://github.com/kosen-robocon-db/kosen-robocon-db.git \
 && cd kosen-robocon-db \
 && apt-get update \
 && apt-get install -y build-essential ruby-dev zlib1g-dev libpq-dev libsqlite3-dev nodejs \
 && gem install bundle \
 && bundle install \
 && rails db:migrate \
 && rails db:seed
WORKDIR /root/kosen-robocon-db
ENV TZ='Asia/Tokyo'
