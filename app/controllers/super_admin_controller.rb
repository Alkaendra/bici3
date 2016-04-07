class SuperAdminController < ApplicationController
  layout 'super_admin'
  before_action :authenticate_super_admin!
end  # After typing end press 'Control + D' to save file
