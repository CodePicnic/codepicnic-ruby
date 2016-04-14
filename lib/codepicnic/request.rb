module CodePicnic
  class Request
    class << self
      def get(url)
        JSON.parse(RestClient.get "#{url}.json", {'Authorization' => "Bearer #{CodePicnic.token}"})
      end

      def post(url, params = {})
        puts url
        JSON.parse(RestClient.post "#{url}.json", params, {'Authorization' => "Bearer #{CodePicnic.token}"})
      end
    end
  end
end