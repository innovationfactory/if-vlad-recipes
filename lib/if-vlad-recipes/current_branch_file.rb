namespace :vlad do
  namespace :if do
    desc "Create a secret .current_branch file"
    remote_task :make_current_branch_file, :roles => :app do
      run "echo \"#{revision}\" > #{current_path}/.current_branch"
    end
  end
end