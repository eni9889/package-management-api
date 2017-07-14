ActiveAdmin.register Package::Author do

  menu parent: 'Packages'

  filter :name_cont, as: :string, label: 'Name'
  filter :email_cont, as: :string, label: 'Email'
  filter :dev_id_cont, as: :string, label: 'Dev ID'

  scope :all, default: true
  scope 'Dev ID', :with_dev_id

  index do
    selectable_column
    column 'Dev ID' do |a|
      a.dev_id
    end
    column :email do |a|
      link_to a.email, admin_package_author_path(a)
    end
    column :name
    actions
  end

  show do
    attributes_table do
      row :identifier
      row :dev_id
      row :email
      row :name
    end

    if package_author.packages.any?
      panel 'Packages' do
        table_for(package_author.packages) do |t|
          t.column('Provider ID') { |p| link_to p.provider_id, admin_package_path(p) }
          t.column('Name') { |p| p.name }
          t.column('Description') { |p| p.description }
        end
      end
    end
  end
end