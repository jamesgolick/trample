require 'test_helper'

class PageTest < Test::Unit::TestCase
  context "A page" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/", :username => "joetheuser")
    end

    should "have a request_method" do
      assert_equal :get, @page.request_method
    end

    should "have a url" do
      assert_equal "http://google.com/", @page.url
    end

    should "have request parameters" do
      assert_equal({:username => "joetheuser"}, @page.parameters)
    end

    should "be equal with the same request_method and url" do
      assert_equal Trample::Page.new(:get, "http://google.com"), Trample::Page.new(:get, "http://google.com")
    end

    should "not be equal with a different request_method or url" do
      assert_not_equal Trample::Page.new(:get, "http://google.com"), Trample::Page.new(:get, "http://google.com/asdf")
    end
  end

  context "Block-based request parameters" do
    setup do
      @page = Trample::Page.new(:get, "http://google.com/", lambda { { :username => "joetheuser" } })
    end

    should "be resolved when the page is asked for its parameters" do
      assert_equal({:username => "joetheuser"}, @page.parameters)
    end
  end
end

