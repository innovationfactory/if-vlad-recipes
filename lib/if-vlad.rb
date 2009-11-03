begin
  require 'hoe'
rescue LoadError
  puts 'IF-Vlad could not load hoe. Try gem install hoe'
end

begin
  require 'vlad'
rescue LoadError
  puts 'IF-Vlad could not load Vlad itself. Try gem install vlad'
end

#require custom IF recipes
require 'if-vlad/update'
require 'if-vlad/maintenance'
require 'if-vlad/gems'
require 'if-vlad/thinking_sphinx'
require 'if-vlad/migrate'
require 'if-vlad/cleanup'
require 'if-vlad/start_stop'
require 'if-vlad/symlink'
require 'if-vlad/touch'
require 'if-vlad/update_crontab'
require 'if-vlad/git_with_submodule_support'


#require deploy script
Kernel.load 'config/deploy.rb'
Kernel.load "config/deploy_#{ENV['to']}.rb" if ENV['to']
