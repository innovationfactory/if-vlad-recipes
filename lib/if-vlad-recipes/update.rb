namespace :vlad do
  namespace :if do
    desc "Updates your application server to the latest revision.  Syncs
    a copy of the repository, exports it as the latest release, fixes
    up your symlinks, symlinks the latest revision to current and logs
    the update.".cleanup

    remote_task :update, :roles => :app do
      symlink = false
      begin
        run [ "cd #{scm_path}",
              "#{source.checkout revision, scm_path}",
              "#{source.export revision, release_path}",
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
