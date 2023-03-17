module Capistrano
  class Puma::Upstart < Capistrano::Plugin
    include PumaCommon

    def define_tasks
      eval_rakefile File.expand_path('../../tasks/upstart.rake', __FILE__)
    end
    
  end
end