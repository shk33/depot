require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimium: 4
    assert_select '#main .entry',     2
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', PRICE_PRESENTATION_REGEX
  end

  test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.store .entry > img', 2
    assert_select '.entry input[type=submit]', 2
  end
end
