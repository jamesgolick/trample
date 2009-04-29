require 'test_helper'

class PageTest < Test::Unit::TestCase
  context "A page" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/")
    end

    should "have a request_method" do
      assert_equal :get, @page.request_method
    end

    should "have a url" do
      assert_equal "http://google.com/", @page.url
    end
  end
end

