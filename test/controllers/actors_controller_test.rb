require 'test_helper'

class ActorsControllerTest < ActionController::TestCase
  setup do
    @actor = actors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:actors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create actor" do
    assert_difference('Actor.count') do
      post :create, actor: { episode_id: @actor.episode_id, image: @actor.image, name: @actor.name, role: @actor.role, series_id: @actor.series_id }
    end

    assert_redirected_to actor_path(assigns(:actor))
  end

  test "should show actor" do
    get :show, id: @actor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @actor
    assert_response :success
  end

  test "should update actor" do
    patch :update, id: @actor, actor: { episode_id: @actor.episode_id, image: @actor.image, name: @actor.name, role: @actor.role, series_id: @actor.series_id }
    assert_redirected_to actor_path(assigns(:actor))
  end

  test "should destroy actor" do
    assert_difference('actor.count', -1) do
      delete :destroy, id: @actor
    end

    assert_redirected_to actors_path
  end
end
