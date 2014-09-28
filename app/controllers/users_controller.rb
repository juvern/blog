class UsersController < ApplicationController
  before_action :logged_in_user  
end
