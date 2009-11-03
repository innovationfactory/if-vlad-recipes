namespace :vlad do
  namespace :if do
    namespace :touch do
      desc "Touch the shared log to create a log file for this environment if one doesn't already exist"
      remote_task :shared_log, :roles => :web do
        run "cd #{current_path} && touch shared/log/#{environment}.log"
        run "cd #{current_path} && touch shared/log/cron.log"
      end
    end
  end
end
