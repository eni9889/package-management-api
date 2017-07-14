ActiveAdmin.register Featured::Set, as: 'Set' do
  menu parent: 'Featured'

  permit_params :name, items_attributes: [:id, :set_id, :package, :package_id, :_destroy]

  index do
    selectable_column
    column :name
    actions
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name
    end

    f.has_many :items, heading: 'Set Items', allow_destroy: true, sortable: :position do |i|
      i.input :package_id, as: :string
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
    end

    if set.items.any?
      panel 'Set Items' do
        table_for(set.items) do |t|
          t.column :position
          t.column :package
        end
      end
    end
  end
end
