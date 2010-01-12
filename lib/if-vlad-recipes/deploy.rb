namespace :vlad do
    namespace :if do

      desc "Perform a full deploy."
      task :default_deploy => %w[
        vlad:if:maintenance:on
        vlad:if:update
        vlad:if:symlink:shared
        vlad:if:make_current_branch_file
        vlad:if:touch:shared_log
        vlad:if:gems:install
        vlad:if:migrate
        vlad:if:update_crontab
        vlad:if:ts:full_reboot
        vlad:if:start
        vlad:if:cleanup
        vlad:if:maintenance:off
      ]

    namespace :local do

      desc "Perform a full local deploy."
      task :default_deploy => %w[
        vlad:if:maintenance:on
        vlad:if:local:update
        vlad:if:symlink:shared
        vlad:if:make_current_branch_file
        vlad:if:touch:shared_log
        vlad:if:gems:install
        vlad:if:migrate
        vlad:if:update_crontab
        vlad:if:ts:full_reboot
        vlad:if:start
        vlad:if:cleanup
        vlad:if:maintenance:off
      ]
    end
  end
end
