require 'test_helper'

class GenresControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:genres)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create genre" do
    assert_difference('Genre.count') do
      post :create, :genre => { }
    end

    assert_redirected_to genre_path(assigns(:genre))
  end

  test "should show genre" do
    get :show, :id => genres(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => genres(:one).to_param
    assert_response :success
  end

  test "should update genre" do
    put :update, :id => genres(:one).to_param, :genre => { }
    assert_redirected_to genre_path(assigns(:genre))
  end

  test "should destroy genre" do
    assert_difference('Genre.count', -1) do
      delete :destroy, :id => genres(:one).to_param
    end

    assert_redirected_to genres_path
  end
end
