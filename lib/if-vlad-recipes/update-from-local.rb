namespace :vlad do                                                                                                    namespace :if do
    namespace :local do

      desc "Updates your application server to the latest revision stored
      in a folder on the local filesystem".cleanup

      remote_task :update, :roles => :app do
        symlink = false
        begin
          run [
               "mkdir -p #{release_path}",
               "cp #{RAILS_ROOT}/tmp/to_deploy.tgz #{release_path}/",
               "cd #{release_path}",
               "tar -xvzf to_deploy.tgz",
               "rm to_deploy.tgz",
               "chmod -R g+w #{latest_release}",
              ].join(" && ")

          symlink = true
          run "rm -f #{current_path} && ln -s #{latest_release} #{current_path}"
          run "echo #{Time.now} $USER #{revision} #{File.basename release_path} >> #{deploy_to}/revisions.log"
        rescue => e
          run "rm -f #{current_path} && ln -s #{previous_release} #{current_path}" if symlink
          run "rm -rf #{release_path}"
          raise
        end
      end
    end
  end
end
