workers_count = Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

if workers_count > 1
  preload_app!
  workers workers_count
end

rackup      Puma::Configuration::DEFAULTS[:rackup]
port        ENV['PORT']     || 5000
environment ENV['RACK_ENV'] || 'development'
