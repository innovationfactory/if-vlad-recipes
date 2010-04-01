namespace :vlad do
  namespace :if do
    desc "Make all remote style tasks and commands run locally"
    task :make_local do |t|
      set :domain, "deploy@localhost"
      def remote_task(*args, &block) ; task(*args, &block) ; end
      def run(*args, &block) ; sh(*args, &block) ; end
      def releases ; `ls -x #{releases_path}`.split.sort ; end
    end
  end
end
