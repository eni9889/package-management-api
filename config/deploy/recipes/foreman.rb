namespace :foreman do
  [{ service: :api, roles: [:app] }].each do |service|
    namespace service_name = service[:service] do
      procfile = "Procfile.#{service[:service]}"
      desc "Export the #{procfile} to Ubuntu's upstart scripts"
      task :export do
        on roles(*service[:roles]) do
          execute ["cd #{release_path} &&",
                   "sudo bundle exec foreman export -a #{service_name} -u deploy upstart /etc/init -e .env -f #{procfile}"
                  ].join(' ')
        end
      end

      desc "Start the #{service_name} service"
      task :start do
        on roles(*service[:roles]) do
          execute "sudo start #{service_name}"
        end
      end

      desc "Stop the #{service_name} service"
      task :stop do
        on roles(*service[:roles]) do
          execute "sudo stop #{service_name}"
        end
      end

      desc "Restart the #{service_name} service"
      task :restart do
        on roles(*service[:roles]) do
          execute "sudo start #{service_name} || sudo restart #{service_name} "
        end
      end
    end
  end
end