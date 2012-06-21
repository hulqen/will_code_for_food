require 'test_helper'

class RecipeCollectionsControllerTest < ActionController::TestCase
  setup do
    @recipe_collection = recipe_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipe_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe_collection" do
    assert_difference('RecipeCollection.count') do
      post :create, recipe_collection: { name: @recipe_collection.name, user_id: @recipe_collection.user_id }
    end

    assert_redirected_to recipe_collection_path(assigns(:recipe_collection))
  end

  test "should show recipe_collection" do
    get :show, id: @recipe_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe_collection
    assert_response :success
  end

  test "should update recipe_collection" do
    put :update, id: @recipe_collection, recipe_collection: { name: @recipe_collection.name, user_id: @recipe_collection.user_id }
    assert_redirected_to recipe_collection_path(assigns(:recipe_collection))
  end

  test "should destroy recipe_collection" do
    assert_difference('RecipeCollection.count', -1) do
      delete :destroy, id: @recipe_collection
    end

    assert_redirected_to recipe_collections_path
  end
end
