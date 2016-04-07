require 'test_helper'

class PaginasEstaticasControllerTest < ActionController::TestCase
  test "should get contacto" do
    get :contacto
    assert_response :success
  end

  test "should get sobreNosotros" do
    get :sobreNosotros
    assert_response :success
  end

end
