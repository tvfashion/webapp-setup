require 'test_helper'

class FashionsControllerTest < ActionController::TestCase
  setup do
    @fashion = fashions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fashions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fashion" do
    assert_difference('Fashion.count') do
      post :create, fashion: { charPic: @fashion.charPic, actor_id: @fashion.actor_id, episode_id: @fashion.episode_id, match: @fashion.match, name: @fashion.name, productLink: @fashion.productLink, productPic: @fashion.productPic, season_id: @fashion.season_id, series_id: @fashion.series_id }
    end

    assert_redirected_to fashion_path(assigns(:fashion))
  end

  test "should show fashion" do
    get :show, id: @fashion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fashion
    assert_response :success
  end

  test "should update fashion" do
    patch :update, id: @fashion, fashion: { charPic: @fashion.charPic, actor_id: @fashion.actor_id, episode_id: @fashion.episode_id, match: @fashion.match, name: @fashion.name, productLink: @fashion.productLink, productPic: @fashion.productPic, season_id: @fashion.season_id, series_id: @fashion.series_id }
    assert_redirected_to fashion_path(assigns(:fashion))
  end

  test "should destroy fashion" do
    assert_difference('Fashion.count', -1) do
      delete :destroy, id: @fashion
    end

    assert_redirected_to fashions_path
  end
end
