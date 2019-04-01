require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# part of Sinatra middleware, allows PATCH, PUT, and DELETE requests
use Rack::MethodOverride
use UsersController
use EntriesController
run ApplicationController
