module Capistrano
  class Puma::Upstart < Capistrano::Plugin

    include PumaCommon

    def register_hooks
      after 'deploy:finished', 'puma:restart'
    end

    def define_tasks
      eval_rakefile File.expand_path('../../tasks/upstart.rake', __FILE__)
    end

    def sudo(*command)
      puts backend.capture(backend.sudo command.map(&:to_s).join(" "))
    end

    def execute_cmd(*args)
      sudo(*args)
    end

  end
end