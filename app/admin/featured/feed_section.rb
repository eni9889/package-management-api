ActiveAdmin.register Featured::Feed::Section, as: 'Section' do
  menu parent: 'Featured'

  permit_params :feed_id, :section_type, :position, :name, :target, :target_id, :target_type,
                items_attributes: [:id, :section_id, :target, :target_id, :target_type, :position, :_destroy]

  index do
    selectable_column
    column :position
    column :feed
    column :name
    column :section_type
    column :target
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :feed
      f.input :name
      f.input :target_type, as: :select, collection: ['Featured::Set'], include_blank: false
      f.input :target, as: :select, collection: Featured::Set.all
      f.input :section_type, as: :select, collection: %w[Featured::Banner Featured::Collection Featured::Set]
    end

    f.has_many :items, heading: 'Items', allow_destroy: true, sortable: :position do |i|
      i.input :target_type, as: :select, collection: %w[Featured::Banner Featured::Collection], include_blank: false
      i.input :target, as: :select, collection: Featured::Set.all + Featured::Banner.all + Featured::Collection.all
    end

    f.actions
  end

  show do
    attributes_table do
      row :position
      row :feed
      row :name
      row :section_type
      row :target
    end

    if resource.items.any?
      panel 'Items' do
        table_for(resource.items) do |t|
          t.column :position
          t.column :target
        end
      end
    end
  end
end
