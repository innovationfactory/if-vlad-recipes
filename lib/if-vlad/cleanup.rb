namespace :vlad do
  namespace :if do
    desc "Clean up old releases. By default, the last 5 releases are kept on
    each server (though you can change this with the keep_releases variable).
    All other deployed revisions are removed from the servers.".cleanup

    remote_task :cleanup do
      max = keep_releases
      if releases.length <= max then
        puts "no old releases to clean up #{releases.length} <= #{max}"
      else
        puts "keeping #{max} of #{releases.length} deployed releases"

        directories = (releases - releases.last(max)).map { |release|
          File.join(releases_path, release)
        }.join(" ")

        run "rm -rf #{directories}"
      end
    end
  end
end
