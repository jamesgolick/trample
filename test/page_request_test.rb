require 'test_helper'

class PageRequestTest < Test::Unit::TestCase
  context "A page request" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/", :username => "joetheuser")
      @page_request = Trample::PageRequest.new(@page, :oh_joy => 'i love cookies')
    end

    should "have a request method equal to the page's request method" do
      assert_equal @page.request_method, @page_request.request_method
    end

    should "have a url equal to the page's url" do
      assert_equal @page.url, @page_request.url
    end

    should "store the cookies passed in on an accessor" do
      assert_equal({:oh_joy => 'i love cookies'}, @page_request.cookies)
    end

    should "have a parameters equal to the page's parameters (when they're not a proc)" do
      assert_equal({:username => "joetheuser"}, @page.parameters)
    end
  end

  context "A page request with block-based request parameters" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/", lambda { { :username => "joetheuser#{Kernel.rand}" } })
      @page_request = Trample::PageRequest.new(@page)
    end

    should "evaluate the block only once and store the parameters" do
      assert_equal @page_request.parameters, @page_request.parameters
    end
  end

  context "A :get page request" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/", :username => "joetheuser")
      @page_request = Trample::PageRequest.new(@page)
    end

    should "hit the url when calling #hit" do
      mock_get("http://google.com/", :times => 1)
      @page_request.hit
    end
  end

  context "A :post page request" do
    setup do
      @page = Trample::Page.new(:post, "http://google.com/", :username => "joetheuser")
      @page_request = Trample::PageRequest.new(@page)
    end

    should "hit the url when calling #hit" do
      mock_post("http://google.com/", :times => 1, :payload => {:username => 'joetheuser'})
      @page_request.hit
    end
  end
end
