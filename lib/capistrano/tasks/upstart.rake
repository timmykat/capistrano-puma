# frozen_string_literal: true

git_plugin = self

namespace :puma do

  desc 'Enable Puma service'
  task :enable do
    on roles(fetch(:all)) do
      git_plugin.execute_cmd('chconfig', '--add', 'puma')
    end
  end

  desc 'Disable Puma service'
  task :disable do
    on roles(fetch(:all)) do
      git_plugin.execute_cmd('chconfig', '--del', 'puma')
    end
  end

  desc 'Start Puma service'
  task :start do
    on roles(fetch(:all)) do
      git_plugin.execute_cmd('service', 'puma', 'start')
    end
  end

  desc 'Stop Puma service'
  task :stop do
    on roles(fetch(:all)) do
      git_plugin.execute_cmd('service', 'puma', 'stop')
    end
  end

  desc 'Restarts Puma service'
  task :restart do
    on roles(fetch(:all)) do
      git_plugin.execute_cmd('service', 'puma', 'restart')
    end
  end

  desc 'Get Puma service status'
  task :status do
    on roles(fetch(:all)) do
      git_plugin.execute_cmd('service', 'puma', 'status')
    end
  end
end
