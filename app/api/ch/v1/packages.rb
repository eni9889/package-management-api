module CH
  module V1
    class Packages < Grape::API
      include Grape::Kaminari

      namespace :packages do

        get '/', rabl: 'packages/index' do
          @packages = paginate(Package.with_assoc)
        end

        get :top_downloads, rabl: 'packages/index' do
          @packages = paginate(Package.top_downloads.with_assoc)
        end

        get :changes, rabl: 'packages/index' do
          @packages = paginate(Package.recent_changes)
        end

        params { optional :provider_id, type: String }
        get :find_by_provider_id, rabl: 'packages/show'  do
          @package = Package.find_by_provider_id(params[:provider_id])
        end

        get :recent, rabl: 'packages/index' do
          package_ids = paginate(Package.joins(:executables))
          @packages = Package.with_assoc.where(id: package_ids)
        end

        get :for_app, rabl: 'packages/index' do
          executable_name = params['executable']
          bundle_name = params['bundle_name']

          @packages = []

          if executable_name
            executable = Executable.where(name: executable_name).first
            @packages += executable.packages if executable
          end

          if bundle_name
            bundle = Bundle.where(name: bundle_name).first
            @packages += bundle.packages if bundle
          end

          @packages.uniq!
        end

        get :apps_with_tweaks do
          bundle_names = params['bundles']
          exe_names    = params['executables']

          bundles = Bundle.where(name: bundle_names).pluck(:name)
          executables = Executable.where(name: exe_names).pluck(:name)

          results = {
                      bundles: bundles,
                      executables: executables
                    }
        end

        get :installed_apps, rabl: 'packages/index' do
          bundle_names = params['bundles'] || Bundle.limit(20).pluck(:name)
          exe_names    = params['executables'] || Executable.limit(20).pluck(:name)

          package_ids_from_bundle = Package.joins(:bundles).where(bundles: { name: bundle_names })
          package_ids_from_exec = Package.joins(:executables).where(executables: { name: exe_names })
          package_ids = (package_ids_from_bundle + package_ids_from_exec).uniq!
          @packages = paginate(Package.with_assoc.where(id: package_ids))
        end

        route_param :id do
          get '/', rabl: 'packages/show' do
            @package = Package.find(params[:id])
          end

          mount Rates
        end
      end
    end
  end
end