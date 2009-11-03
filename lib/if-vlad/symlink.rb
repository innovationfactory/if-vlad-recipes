namespace :vlad do
  namespace :if do
    desc "Create symlinks from local app dir to system shared dir"
    namespace :symlink do
      desc "Symlinks shared directory."
      remote_task :shared, :roles => :app do
        run "rm -f #{current_path}/config/database.yml && ln -s #{shared_path}/config/database.yml #{current_path}/config/database.yml"
      end
    end
  end
end
