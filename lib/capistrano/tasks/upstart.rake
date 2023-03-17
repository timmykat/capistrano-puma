# frozen_string_literal: true

require 'sshkit/sudo'

namespace :puma do

  desc 'Enable Puma service'
  task :enable do
    on roles(fetch(:all)) do
      backend.capture(sudo :chconfig, '--add', 'puma')
    end
  end

  desc 'Disable Puma service'
  task :disable do
    on roles(fetch(:all)) do
      backend.capture(sudo :chconfig, '--del', 'puma')
    end
  end

  desc 'Start Puma service'
  task :start do
    on roles(fetch(:all)) do
      backend.capture(sudo :service, 'puma', 'start')
    end
  end

  desc 'Stop Puma service'
  task :stop do
    on roles(fetch(:all)) do
      backend.capture(sudo :service, 'puma', 'stop')
    end
  end

  desc 'Restarts Puma service'
  task :restart do
    on roles(fetch(:all)) do
      backend.capture(sudo :service, 'puma', 'restart')
    end
  end

  desc 'Get Puma service status'
  task :status do
    on roles(fetch(:all)) do
      backend.capture(sudo :service, 'puma', 'status')
    end
  end
end
