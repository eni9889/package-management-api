ActiveAdmin.register Featured::Collection, as: 'Collection' do
  menu parent: 'Featured'

  permit_params :name, :description, :image, items_attributes: [:id, :collection_id, :set, :set_id, :_destroy]

  index do
    selectable_column
    column :image do |collection|
      link_to admin_collection_path(collection), target: '_blank' do
        image_tag(collection.image_url, size: '150x50')
      end
    end
    column :name
    column 'Items' do |c|
      links = ''
      c.items.each do |i|
        links += link_to(i.set.name, admin_set_path(i.set))
        links += '<br>'
      end
      links.html_safe
    end
    column :settings
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description, as: :text
      f.input :image, as: :file
    end

    f.has_many :items, heading: 'Collection Items', allow_destroy: true, sortable: :position do |i|
      i.input :set
    end

    f.actions
  end

  show do
    attributes_table do
      row :image
      row :name
      row :description
    end

    if collection.items.any?
      panel 'Collection Items' do
        table_for(collection.items) do |t|
          t.column :position
          t.column :set
        end
      end
    end
  end

  controller do
    def create
      collection             = Featured::Collection.new
      uploaded_image         = params[:featured_collection][:image]
      collection.image       = uploaded_image.original_filename
      collection.name        = params[:featured_collection][:name]
      collection.description = params[:featured_collection][:description]
      ImageUploaderService.new(uploaded_image, "collections/#{uploaded_image.original_filename}")
      collection.save!
      redirect_to collection_path, notice: 'Collection has been created successfully!'
    end
  end
end
