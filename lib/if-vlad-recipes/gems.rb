namespace :vlad do
  namespace :if do
    namespace :gems do
      desc "Install required gems."
      remote_task :install, :roles => :app do
        run "cd #{current_path} && sudo rake gems:install RAILS_ENV=#{environment}"
      end
    end
  end
end
