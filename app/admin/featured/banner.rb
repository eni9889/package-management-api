ActiveAdmin.register Featured::Banner, as: 'Banner' do

  menu parent: 'Featured'

  index do
    selectable_column
    column :image do |banner|
      link_to admin_banner_path(banner), target: '_blank' do
        image_tag(banner.image_url, size: '150x50')
      end
    end
    column :target
  end

  form partial: 'form'

  controller do

    def scoped_collection
      end_of_association_chain.includes(:target)
    end

    def create
      banner = Featured::Banner.new
      uploaded_image = params[:image]
      ImageUploaderService.new(uploaded_image, "banners/#{uploaded_image.original_filename}")
      target = if params[:package_id]
        Package.find_by(id: params[:package_id])
      end
      banner.target = target
      banner.image  = uploaded_image.original_filename
      banner.save!
      redirect_to collection_path, notice: 'Banner has been created successfully!'
    end
  end
end
