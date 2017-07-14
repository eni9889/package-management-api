ActiveAdmin.register Developer do

  filter :name_cont

  index do
    selectable_column
    column 'Name' do |d|
      link_to d.name, admin_developer_path(d)
    end
    column :contact_info
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :contact_info
    end

    if developer.identifiers.any?
      panel 'Identifiers' do
        table_for(developer.identifiers) do |t|
          t.column('Identifier') { |i| link_to i.identifier, admin_developer_identifier_path(i) }
          t.column('Type')       { |i| i.identifier_type }
        end
      end
    end
  end
end
