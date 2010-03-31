namespace :vlad do
  namespace :if do
    desc "Make all remote style tasks and commands run locally"
    task :make_local do |t|
      set :domain, "deploy@localhost"
      set :if_vlad_local_deploy?, true
      def remote_task(*args, &block) ; task(*args, &block) ; end
      def run(*args, &block) ; sh(*args, &block) ; end

      puts if_vlad_local_deploy?

    end
  end
end
