  ENV['RACK_ENV'] = 'test'
  require 'minitest/autorun'
  require 'rack/test'

  require 'sinatra/base'
  require 'sinatra/praat'

  class MyApp < Sinatra::Base
    register Sinatra::Praat
  end

  class TestPraat < Minitest::Test
    include Rack::Test::Methods

    def app
      MyApp
    end

    def test_extract_formant1_error
      post '/extract_formant1', { 'data' => '' }
      assert_equal last_response.status, 400
    end

    def test_extract_formant1
      app.send(:define_method, :`) do |actual_command|
        expected_command = /praat .+praat\/extractFormant1.praat \/var[^ ]+ 5 5500 0.025 5/
        unless expected_command =~ actual_command
          return "Incorrect Praat command: Expected: #{expected_command}, got: #{actual_command}"
        end
        "1234 Hertz"
      end
      post '/extract_formant1', { 'data' => Rack::Test::UploadedFile.new(__FILE__) }
      assert_equal last_response.body, "1234 Hertz"
    end
  end
