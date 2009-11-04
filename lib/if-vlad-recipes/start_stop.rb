namespace :vlad do
  namespace :if do
    set :web_command, "apachectl"

    desc "(Re)Start the web servers"
    remote_task :start_apache, :roles => :web  do
      run "#{web_command} restart"
    end

    desc "Stop the web servers"
    remote_task :stop_apache, :roles => :web  do
      run "#{web_command} stop"
    end

    desc "(Re)Start the web and app servers"
    remote_task :start do
      Rake::Task['vlad:if:start_apache'].invoke
    end

    desc "Stop the web and app servers"
    remote_task :stop do
      Rake::Task['vlad:if:stop_apache'].invoke
    end
  end
end
