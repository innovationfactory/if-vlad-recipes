namespace :vlad do
  namespace :if do
    namespace :ts do
      def run_ts_task(name)
        run "cd #{current_path} && #{rake_cmd} ts:#{name} RAILS_ENV=#{environment}"
      end

      desc "Reconfigure, reindex and restart Sphinx"
      remote_task :full_reboot, :roles => :web do
        [:conf, :in, :run].each{|ts_task| run_ts_task(ts_task)}
      end

      desc "Generate Sphinx configuration file."
      remote_task :conf, :roles => :web do
        run_ts_task :conf
      end

      desc "Rebuild Sphinx' index."
      remote_task :in, :roles => :web do
        run_ts_task :in
      end

      desc "Stop Sphinx."
      remote_task :stop, :roles => :web do
        run_ts_task :stop
      end

      desc "Start Sphinx."
      remote_task :start, :roles => :web do
        run_ts_task :start
      end

      desc "Stop Sphinx if running and then start it."
      remote_task :run, :roles => :web do
        run_ts_task :run
      end
    end
  end
end
