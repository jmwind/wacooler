require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase

  def setup
    @micropost = microposts(:orange)
    @user = users(:alize)
  end

  test "should show search page when searching" do
    get :search, term: 'cats'
    assert_response :success
  end

end
