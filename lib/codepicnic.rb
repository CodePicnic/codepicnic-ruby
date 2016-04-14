require 'rest-client'
require 'codepicnic/api_request'
require 'codepicnic/request'
require 'codepicnic/console'
require 'codepicnic/version'

module CodePicnic

  @api_url = "https://codepicnic.com/oauth/token"

  class << self
    attr_accessor :api_url, :client_id, :client_secret, :token

    def token
      @token ||= get_token
    end

    def get_token
      response = RestClient.post @api_url, {
        grant_type: "client_credentials",
        client_id: @client_id,
        client_secret: @client_secret
      }
      JSON.parse(response)["access_token"]
    end

  end

end