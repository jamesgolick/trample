require 'test_helper'

class TrampleASingleUrlTest < Test::Unit::TestCase
  def test_trampling_a_single_url
    run_trample "http://google.com/ 2"
  end
end

