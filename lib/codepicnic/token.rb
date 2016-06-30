module CodePicnic
  class Token

    @api_url = "https://codepicnic.com/oauth/token"

    class << self
      attr_accessor :api_url
    end

    attr_accessor :created_at, :expires_in, :access_token

    def initialize(client_id, client_secret)
      puts client_id
      puts client_secret
      response = RestClient.post Token.api_url, {
          grant_type: "client_credentials",
          client_id: client_id,
          client_secret: client_secret
      }

      parsed_response = JSON.parse(response)
      @access_token   = parsed_response["access_token"]
      @created_at     = parsed_response["created_at"].to_i
      @expires_in     = parsed_response["expires_in"].to_i
    end

    def expired?
      Time.now.to_i > (@created_at + @expires_in)
    end
  end
end