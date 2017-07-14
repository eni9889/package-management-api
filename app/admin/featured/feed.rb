ActiveAdmin.register Featured::Feed, as: 'Feed' do
  menu parent: 'Featured'

  permit_params :category_id, sections_attributes: [:id, :feed_id, :target, :position, :section_type, :_destroy]

  index do
    selectable_column
    column :category
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :category
    end

    f.has_many :sections, heading: 'Sections', allow_destroy: true, sortable: :position do |s|
      s.input :name
      s.input :target, as: :select, collection: Featured::Set.all
      s.input :section_type, as: :select, collection: %w[banner collection set]
    end

    f.actions
  end

  show do
    attributes_table do
      row :category
    end

    if feed.sections.any?
      panel 'Sections' do
        table_for(feed.sections) do |t|
          t.column :position
          t.column :section_type
          t.column :target
        end
      end
    end
  end
end
