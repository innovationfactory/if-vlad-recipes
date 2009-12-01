namespace :vlad do
    namespace :if do

      desc "Perform a full deploy."
      task :deploy => %w[
        vlad:if:maintenance:off
        vlad:if:update
        vlad:if:symlink:shared
        vlad:if:touch:shared_log
        vlad:if:gems:install
        vlad:if:migrate
        vlad:if:update_crontab
        vlad:if:ts:full_reboot
        vlad:if:start
        vlad:if:cleanup
        vlad:if:maintenance:on
      ]

    namespace :local do

      desc "Perform a full local deploy."
      task :deploy => %w[
        vlad:if:maintenance:off
        vlad:if:local:update
        vlad:if:symlink:shared
        vlad:if:touch:shared_log
        vlad:if:gems:install
        vlad:if:migrate
        vlad:if:update_crontab
        vlad:if:ts:full_reboot
        vlad:if:start
        vlad:if:cleanup
        vlad:if:maintenance:on
      ]
    end
  end
end
