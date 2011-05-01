class Admin::BaseController < ApplicationController
  before_filter :authorize_admin!
end