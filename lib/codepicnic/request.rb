require 'json'

module CodePicnic
  class Request
    class << self
      def get(url)
        JSON.parse(RestClient.get "#{url}.json", {'Authorization' => "Bearer #{CodePicnic.token}", "Content-Type" => "application/json; charset=utf-8"})
      end

      def post(url, params = {})
        JSON.parse(RestClient.post "#{url}.json", params.to_json, {'Authorization' => "Bearer #{CodePicnic.token}", "Content-Type" => "application/json; charset=utf-8"})
      end
    end
  end
end