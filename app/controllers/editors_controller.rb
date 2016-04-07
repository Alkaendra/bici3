class EditorsController < ApplicationController
  layout 'editors'
  before_action :authenticate_editor!
end
