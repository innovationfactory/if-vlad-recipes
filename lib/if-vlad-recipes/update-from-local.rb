namespace :vlad do
  namespace :if do
    namespace :local do

      desc "Updates your application server to the latest revision stored
      in a folder on the local filesystem".cleanup

      task :update do
        symlink = false
        begin
          sh [
               "mkdir -p #{release_path}",
               "cp #{RAILS_ROOT}/_internal_to_deploy.tgz #{release_path}/",
               "cd #{release_path}",
               "tar -xvzf _internal_to_deploy.tgz",
               "rm _internal_to_deploy.tgz",
               "chmod -R g+w #{latest_release}",
              ].join(" && ")

          symlink = true
          sh "rm -f #{current_path} && ln -s #{latest_release} #{current_path}"
          sh "echo #{Time.now} $USER #{revision} #{File.basename release_path} >> #{deploy_to}/revisions.log"
        rescue => e
          sh "rm -f #{current_path} && ln -s #{previous_release} #{current_path}" if symlink
          sh "rm -rf #{release_path}"
          raise
        end
      end
    end
  end
end
