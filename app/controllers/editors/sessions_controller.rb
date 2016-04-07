class Editors::SessionsController < Devise::SessionsController
layout "editors"

private
def after_sign_in_path_for(resource)
  session[:editor_return_to].blank? ? editors_dashboard_index_path : session[:editor_return_to]
end

def after_sign_out_path_for(resource_or_scope)
  new_editor_session_path
end
end
