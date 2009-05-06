require 'test_helper'

class PageRequestTest < Test::Unit::TestCase
  context "A page request" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/", :username => "joetheuser")
      @page_request = Trample::PageRequest.new(@page)
    end

    should "have a request method equal to the page's request method" do
      assert_equal @page.request_method, @page_request.request_method
    end
  end
end
