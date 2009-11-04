namespace :vlad do
  namespace :if do
    desc "Update the crontab for the app's whenever schedule (stored in ./configs/schedule.rb)"
    remote_task :update_crontab, :roles => :web do
      run "cd #{current_path} && whenever --update-crontab #{application} --set 'environment=#{environment}&cron_log=#{shared_path}/log/cron.log'"
    end
  end
end


