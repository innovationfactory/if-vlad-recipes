namespace :vlad do
  namespace :if do

    desc "Create a tgz version of this source in tmp/app.tgz"
    task :zip do
      tmp_name = "to_deploy"
      tmp_dir  = "/tmp/#{tmp_name}"
      src_name = "#{RAILS_ROOT}/tmp/to_deploy.tgz"

      sh [
          "rm -rf #{tmp_dir}",
          "mkdir #{tmp_dir}",
          "cp -R #{RAILS_ROOT}/* #{tmp_dir}",
          "rm -rf #{tmp_dir}/.git",
          "cd #{tmp_dir}",
          "tar cf - . | gzip > #{src_name}",
          "rm -rf #{tmp_dir}",
          "mkdir #{tmp_dir}",
          "cp -R #{RAILS_ROOT}/* #{tmp_dir}",
          "rm -rf #{tmp_dir}/.git",
          "cd /tmp",
          "tar cf - #{tmp_name} | gzip > #{src_name}",
          "rm -rf #{tmp_dir}"
         ].join(';')
      puts "Created #{src_name}"
    end
  end
end
