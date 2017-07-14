require 'sidekiq'
require 'sidekiq-status'

schedule_file = 'config/sidekiq-schedule.yml'
if File.exists?(schedule_file) && Rails.env.production?
  hash = YAML.load_file(schedule_file)
  Sidekiq::Cron::Job.load_from_hash hash if hash
end

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Sidekiq::Status::ServerMiddleware, expiration: 2.hours
  end
  config.client_middleware do |chain|
    chain.add Sidekiq::Status::ClientMiddleware
  end
end

Sidekiq.default_worker_options = { 'backtrace' => true }