ActiveAdmin.register Developer::Identifier do

  menu parent: 'Developers'

  filter :identifier_cont, label: 'Identifier'

  scope :all, default: true
  scope :by_dev
  scope :by_email
  scope :by_name

  index do
    selectable_column
    column 'Identifier' do |i|
      link_to i.identifier, admin_developer_identifier_path(i)
    end
    column :identifier_type
    column :download_stats
    actions
  end

  show do
    attributes_table do
      row :developer
      row :identifier
      row :identifier_type
    end

    if developer_identifier.package_authors.any?
      panel 'Package Authors' do
        table_for(developer_identifier.package_authors) do |t|
          t.column('Dev ID') { |p| link_to p.dev_id, admin_package_author_path(p) }
          t.column('Email') { |p| link_to p.email, admin_package_author_path(p) }
          t.column('Name') { |p| link_to p.name, admin_package_author_path(p) }
        end
      end
    end

    if developer_identifier.packages.any?
      panel 'Packages' do
        table_for(developer_identifier.packages) do |t|
          t.column('Provider ID') { |p| link_to p.provider_id, admin_package_path(p) }
          t.column('Name') { |p| p.name }
          t.column('Description') { |p| p.description }
        end
      end
    end

  end
end