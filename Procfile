web: bundle exec puma -p $PORT -e production
redis: redis-server
worker: bundle exec sidekiq -C config/sidekiq.yml -r ./app.rb -e production