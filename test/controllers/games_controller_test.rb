require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  test "new not signed in" do
    get :new
    assert_redirected_to new_player_session_path
  end

  test "new signed in" do
    player = FactoryGirl.create(:player)
    sign_in player
    get :new
    assert_response :success
  end

  test "create not signed in" do
    assert_no_difference 'Game.count' do
      post :create, {:game => {
        :player_white_id => 1, 
        :player_black_id => nil, 
        :player_turn => 1, 
        :winner => nil, 
        :moves => 0
        }
      }
    end
    assert_redirected_to new_player_session_path
  end

  test "create signed in" do
    player = FactoryGirl.create(:player)
    sign_in player
    assert_difference 'Game.count' do
      post :create, {:game => {
        :player_white_id => player.id, 
        :player_black_id => nil, 
        :player_turn => player.id, 
        :winner => nil, 
        :moves => 0
        }
      }
    end
    assert_redirected_to game_path(assigns(:game))
  end

  test "show non-existing game" do
    assert_raises(ActiveRecord::RecordNotFound) do
      get :show, :id => 'abc'
    end
  end

  test "show an existing game" do
    game = FactoryGirl.create(:game)
    get :show, :id => game.id
    assert_response :success
  end
end
