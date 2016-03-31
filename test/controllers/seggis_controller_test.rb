require 'test_helper'

class SeggisControllerTest < ActionController::TestCase
  setup do
    @seggi = seggis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seggis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create seggi" do
    assert_difference('Seggi.count') do
      post :create, seggi: { descrizione: @seggi.descrizione, femmine: @seggi.femmine, maschi: @seggi.maschi, numero: @seggi.numero }
    end

    assert_redirected_to seggi_path(assigns(:seggi))
  end

  test "should show seggi" do
    get :show, id: @seggi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @seggi
    assert_response :success
  end

  test "should update seggi" do
    patch :update, id: @seggi, seggi: { descrizione: @seggi.descrizione, femmine: @seggi.femmine, maschi: @seggi.maschi, numero: @seggi.numero }
    assert_redirected_to seggi_path(assigns(:seggi))
  end

  test "should destroy seggi" do
    assert_difference('Seggi.count', -1) do
      delete :destroy, id: @seggi
    end

    assert_redirected_to seggis_path
  end
end
