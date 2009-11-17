require 'vlad'

#require custom IF recipes
require 'if-vlad-recipes/update'
require 'if-vlad-recipes/maintenance'
require 'if-vlad-recipes/gems'
require 'if-vlad-recipes/thinking_sphinx'
require 'if-vlad-recipes/migrate'
require 'if-vlad-recipes/cleanup'
require 'if-vlad-recipes/start_stop'
require 'if-vlad-recipes/symlink'
require 'if-vlad-recipes/touch'
require 'if-vlad-recipes/current_branch_file'
require 'if-vlad-recipes/update_crontab'
require 'if-vlad-recipes/git_with_submodule_support'


#require deploy script
begin
  Kernel.load 'config/deploy.rb'
rescue LoadError
  puts "Couldn't find config/deploy.rb, perhaps you might consider making one?"
end

Kernel.load "config/deploy_#{ENV['to']}.rb" if ENV['to']
