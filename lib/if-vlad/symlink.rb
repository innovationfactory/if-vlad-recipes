namespace :vlad do
  namespace :if do
    desc "Create symlinks from local app dir to system shared dir"
    namespace :symlink do
      desc "Symlinks shared directory."
      remote_task :shared, :roles => :app do
        run "rm -rf #{current_path}/shared && ln -s #{shared_path} #{current_path}/shared"
      end
    end
  end
end
