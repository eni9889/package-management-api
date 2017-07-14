module CH
  module V1
    class Featured < Grape::API
      include Grape::Kaminari

      namespace :featured do
        resource :feeds do
          params { requires :category_name, type: String, desc: 'category' }
          route_param :category_name do
            get '/', rabl: 'featured/feeds/show' do
              category = Category.find_by(name: params[:category_name])
              @feed = category.featured_feed
            end
          end
        end
      end
    end
  end
end