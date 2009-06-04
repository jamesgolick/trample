require 'test_helper'

class ConfigurationTest < Test::Unit::TestCase
  context "Configuring trample" do
    setup do
      @params_proc = lambda { { :q => "the meaning of life" } }
      @config = Trample::Configuration.new do
        concurrency 2
        iterations  1
        get "http://google.com/" do
          {:a => 'b'}
        end
        post "http://google.com/", {:q => "something"}
        post "http://google.com/", &@params_proc
        login do
          post "http://google.com/login" do
            { :q => "whatever" }
          end
        end
      end
    end

    should "set concurrency" do
      assert_equal 2, @config.concurrency
    end

    should "set iterations" do
      assert_equal 1, @config.iterations
    end

    should "add get requests to an array of pages" do
      assert_equal Trample::Page.new(:get, "http://google.com/"), @config.pages.first
    end

    should "add get params to the array of pages" do
      assert_equal({:a => "b"}, @config.pages.first.parameters)
    end

    should "add post requests to the array of pages, including their params" do
      expected = Trample::Page.new(:post, "http://google.com/", {:q => "something"})
      assert_equal expected, @config.pages[1]
    end

    should "add post requests to the array of pages, including their block-based params" do
      expected = Trample::Page.new(:post, "http://google.com/", @params_proc)
      assert_equal expected, @config.pages[2]
    end

    should "support a login parameter which contains a page to hit with params" do
      assert_equal "http://google.com/login", @config.login.url
      assert_equal({:q => "whatever"}, @config.login.parameters)
    end

    should "be equal if all the objects are the same" do
      identical_config = Trample::Configuration.new do
        concurrency 2
        iterations  1
        get "http://google.com/"
        post "http://google.com/", {:q => "something"}
        post "http://google.com/", &@params_proc
      end
      assert_equal identical_config, @config
    end

    should "not be equal if any of the objects are different" do
      non_identical_config = Trample::Configuration.new do
        concurrency 3
        iterations  1
        get "http://google.com/"
      end
      assert_not_equal non_identical_config, @config
    end
  end
end

