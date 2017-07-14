class API < Grape::API
  helpers do
    def logger
      Rails.logger
    end
  end

  format :json
  formatter :json, Grape::Formatter::Rabl
  default_format :json
  default_error_status 400

  rescue_from :all do |e|
    error_response(status: 400, message: e.message)
  end

  mount ::CH::AppV1

  route :any, '*path' do
    error! 'Not Found', 404
  end
end