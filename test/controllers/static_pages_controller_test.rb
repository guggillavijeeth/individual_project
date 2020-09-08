require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Rubik's Cube Timer"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | Rubik's Cube Timer"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | Rubik's Cube Timer"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | Rubik's Cube Timer"
  end
  
  test "should get random" do
    get random_path
    assert_response :success
    assert_select "title", "Random | Rubik's Cube Timer"
  end

end
