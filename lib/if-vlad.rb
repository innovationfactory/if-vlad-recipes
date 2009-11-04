require 'hoe'
require 'vlad'

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
begin
  Kernel.load 'config/deploy.rb'
rescue LoadError
  puts "Couldn't find config/deploy.rb, perhaps you might consider making one?"
end

Kernel.load "config/deploy_#{ENV['to']}.rb" if ENV['to']
