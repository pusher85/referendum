require 'test_helper'

class RilevazionisControllerTest < ActionController::TestCase
  setup do
    @rilevazioni = rilevazionis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rilevazionis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rilevazioni" do
    assert_difference('Rilevazioni.count') do
      post :create, rilevazioni: { due_f: @rilevazioni.due_f, due_m: @rilevazioni.due_m, seggi_id: @rilevazioni.seggi_id, tre_f: @rilevazioni.tre_f, tre_m: @rilevazioni.tre_m, uno_f: @rilevazioni.uno_f, uno_m: @rilevazioni.uno_m }
    end

    assert_redirected_to rilevazioni_path(assigns(:rilevazioni))
  end

  test "should show rilevazioni" do
    get :show, id: @rilevazioni
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rilevazioni
    assert_response :success
  end

  test "should update rilevazioni" do
    patch :update, id: @rilevazioni, rilevazioni: { due_f: @rilevazioni.due_f, due_m: @rilevazioni.due_m, seggi_id: @rilevazioni.seggi_id, tre_f: @rilevazioni.tre_f, tre_m: @rilevazioni.tre_m, uno_f: @rilevazioni.uno_f, uno_m: @rilevazioni.uno_m }
    assert_redirected_to rilevazioni_path(assigns(:rilevazioni))
  end

  test "should destroy rilevazioni" do
    assert_difference('Rilevazioni.count', -1) do
      delete :destroy, id: @rilevazioni
    end

    assert_redirected_to rilevazionis_path
  end
end
