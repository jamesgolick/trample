require 'test_helper'

class TrampleASingleUrlTest < Test::Unit::TestCase
  def test_trampling_a_single_url
    mock_get("http://google.com", :times => 2)
    trample "test/fixtures/basic_config.rb"
  end
end

