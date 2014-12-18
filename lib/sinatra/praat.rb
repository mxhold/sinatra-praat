require "sinatra/praat/version"

module Sinatra
  module Praat
    module Helpers
      def extract_formant1(file:, formant_count: 5, max_formant_hz: 5500, window_size: 0.025, pre_emphasis: 50)
        `praat #{extract_formant1_script} #{file.path} #{formant_count} #{max_formant_hz} #{window_size} #{pre_emphasis}`
      end

      def extract_formant1_script
        File.join(__dir__, 'praat', 'extractFormant1.praat')
      end
    end
    def self.registered(app)
      app.helpers Praat::Helpers

      app.post '/extract_formant1' do
        begin
          file = params["data"][:tempfile]
          extract_formant1(file: file)
        rescue
          status 400
        end
      end
    end
  end
end
