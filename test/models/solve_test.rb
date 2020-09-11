require 'test_helper'

class SolveTest < ActiveSupport::TestCase
  
  def setup 
    @solve = Solve.new(seconds: "20.00", scramble: "R U R' U'")
  end
  
  test "should be valid" do
    assert @solve.valid?
  end
  
  test "seconds should be present" do
    @solve.seconds = ""
    assert_not @solve.valid?
  end
  
  test "scramble should be present" do
    @solve.scramble = ""
    assert_not @solve.valid?
  end
  
  test "scramble should not be too long" do
    @solve.scramble = "a" * 101
    assert_not @solve.valid?
  end
  
  test "seconds validation should accept valid solve times" do
    valid_solve_times = %w[123.12 12.12 1.12 123.1 12.1 1.1 123 12 1 .1 .12 .123]
    valid_solve_times.each do |valid_solve_time|
      @solve.seconds = valid_solve_time
      assert @solve.valid?, "#{valid_solve_time.inspect} should be valid"
    end
  end
  
  test "seconds validation should reject invalid solve times" do
    invalid_solve_times = %w[A1 3..5 4/5]
    invalid_solve_times.each do |invalid_solve_time|
      @solve.seconds = invalid_solve_time
      assert_not @solve.valid?, "#{invalid_solve_time.inspect} should be invalid"
    end
  end
  
end
