ActiveAdmin.register Package::Version do

  menu parent: 'Packages'

  config.sort_order = 'updated_at'

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  filter :package_id_cont, as: :string, label: 'Package ID'
  filter :raw_text_cont, as: :string, label: 'Raw text'

  scope :processed, default: true
  scope :pending
  scope :failed
  scope :all

  index do
    selectable_column
    id_column
    column :package
    column :version
    column 'State' do |v|
      v.download_state
    end
    column :date_uploaded
    actions
  end

  controller do
    def scoped_collection
      end_of_association_chain.includes(:package)
    end
  end
end
