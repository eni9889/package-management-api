require 'sidekiq/web'
require 'sidekiq-status/web'
require 'sidekiq-cron'

def authenticated(scope = nil)
  constraint = lambda do |request|
    request.env['warden'].authenticate!(scope: scope)
  end

  constraints(constraint) do
    yield
  end
end

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: redirect('v1/categories')

  authenticated :admin_user do
    mount Sidekiq::Web, at: '/admin/jobs', as: :admin_jobs
  end

  mount API => '/', via: [:head, :get, :put, :post, :delete]
end