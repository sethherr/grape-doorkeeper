desc "Start the server locally"
task :start do
  system 'touch log/development.log'
  system 'redis-server &'
  system 'bundle exec foreman start -f Procfile_development'
end