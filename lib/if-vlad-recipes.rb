require 'vlad'

#require all custom IF recipes
Dir[File.dirname(__FILE__) + '/if-vlad-recipes/*.rb'].each {|file| require file}

#require deploy script
begin
  Kernel.load 'config/deploy.rb'
rescue LoadError
  puts "Couldn't find config/deploy.rb, perhaps you might consider making one?"
end

Kernel.load "config/deploy_#{ENV['to']}.rb" if ENV['to']
