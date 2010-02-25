namespace :vlad do
  namespace :if do

    desc "Create a tgz version of this source in tmp/app.tgz"
    task :zip do
      tmp_name = "to_deploy"
      tmp_dir  = "/tmp/#{tmp_name}"
      src_name = "#{RAILS_ROOT}/tmp/to_deploy.if_app"
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
          "cd /tmp",
          "tar cf - #{tmp_name} | gzip > #{src_name}",
          "rm -rf #{tmp_dir}"
         ].join(';')
      puts "Created #{src_name}".color(:green)
    end
  end
end
