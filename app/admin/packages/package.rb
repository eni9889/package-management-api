ActiveAdmin.register Package do

  menu priority: 1

  config.sort_order = 'total_downloads'

  filter :provider_id_cont, as: :string, label: 'Provider ID'
  filter :description_cont, as: :string, label: 'Description'

  scope :all, default: true
  scope :free
  scope :commercial
  scope :commercial_not_purchased
  scope :purchased

  index do
    selectable_column
    column 'Provider ID' do |p|
      link_to p.provider_id, admin_package_path(p)
    end
    column :author
    column :downloads
    actions
  end

  controller do
    def scoped_collection

    end
  end

  show do
    attributes_table do
      row(:depiction) { |p| link_to p.depiction }
      row :name
      row :downloads
      row :author
      row :description
      row :extra_info
    end

    if package.versions.any?
      panel 'Versions' do
        table_for(package.versions) do |t|
          t.column('Version') { |v| link_to v.version, admin_package_version_path(v) }
          t.column('Date Uploaded') { |v| v.date_uploaded }
          t.column('Downloads') { |v| v.downloads }
        end
      end
    end
  end
end