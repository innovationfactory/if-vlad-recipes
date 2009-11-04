namespace :vlad do
  namespace :if do
    namespace :maintenance do
      desc "Put up a 503 page for maintenance."
      remote_task :on, :roles => :app do
        run "touch #{current_path}/tmp/stop.txt"
      end

      desc "Remove 503 page (after maintenance)."
      remote_task :off, :roles => :app do
        run "rm -f #{current_path}/tmp/stop.txt"
      end
    end
  end
end
