namespace :vlad do
  namespace :if do
    namespace :local do

      desc "Updates your application server to the latest revision stored
      in a folder on th".cleanup

      remote_task :update, :roles => :app do
        symlink = false
        begin
          #we need to have local_source_path set
          unless local_source_path then
            raise "Error, local_source_path not set. Please set local_source_path
            to point to the directory you're trying to local deploy from".cleanup
          end

          run [
               "mkdir -p #{release_path}",
               "cp -R #{local_source_path}/* #{release_path}",
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
