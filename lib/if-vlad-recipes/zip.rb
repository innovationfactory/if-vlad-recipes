namespace :vlad do
  namespace :if do

    desc "Create a compressed app bundle from the source in tmp/app.if_app"
    task :zip do
      tmp_name    = "to_deploy"
      tmp_dir     = "/tmp/#{tmp_name}"
      app_name    = RAILS_ROOT.split('/').last
      src_name    = "#{RAILS_ROOT}/_internal_to_deploy.tgz"
      if_app_name = "#{RAILS_ROOT}/to_deploy_#{app_name}.if_app"
      puts "Creating deployable app".color(:yellow)
      puts "(Please note, I'm not including .git, doc, shared or designs)".color(:red)
      puts "Please wait, this might take a moment...".color(:yellow)
      sh [
          "rm -rf #{tmp_dir}",
          "mkdir #{tmp_dir}",
          "cp -R #{RAILS_ROOT}/* #{tmp_dir}",
          "rm -rf #{tmp_dir}/.git",
          "rm -rf #{tmp_dir}/shared",
          "rm -rf #{tmp_dir}/designs",
          "rm -rf #{tmp_dir}/doc",
          "rm -rf #{tmp_dir}/to_deploy*",
          "cd #{tmp_dir}",
          "tar cf - . | gzip > #{src_name}",
          "rm -rf #{tmp_dir}",
          "mkdir #{tmp_dir}",
          "cp -R #{RAILS_ROOT}/* #{tmp_dir}",
          "rm -rf #{tmp_dir}/.git",
          "rm -rf #{tmp_dir}/shared",
          "rm -rf #{tmp_dir}/public",
          "rm -rf #{tmp_dir}/test",
          "rm -rf #{tmp_dir}/designs",
          "rm -rf #{tmp_dir}/doc",
          "rm -rf #{tmp_dir}/to_deploy*",
          "cd /tmp",
          "tar cf - #{tmp_name} | gzip > #{if_app_name}",
          "rm -rf #{tmp_dir}",
          "rm -rf #{src_name}"
         ].join(';')
      puts "Created #{if_app_name}".color(:green)
    end
  end
end
