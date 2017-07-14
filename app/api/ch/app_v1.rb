module CH
  class AppV1 < Grape::API
    version 'v1', using: :path

    use Rack::Config do |env|
      env['api.tilt.root'] = File.join(Dir.pwd, 'app/api/ch/v1/views')
    end

    desc 'Returns server health status'
    get(:health) { { role: "api_#{Rails.env}", response: 'healthy' } }

    mount V1::Packages
    mount V1::Featured
  end
end
