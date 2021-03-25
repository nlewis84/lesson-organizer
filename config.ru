require './config/environment'



use Rack::MethodOverride
run ApplicationController
use AdminsController
use LessonsController
use StudentsController
use TeachersController
