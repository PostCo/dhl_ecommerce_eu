module DHLEcommerceEU
  class Client
    TEST_URL_BASE = 'https://api-sandbox.dhl.com/'
    PROD_URL_BASE = 'https://api.dhl.com/'

    attr_reader :url_base

    def initialize(client_id, client_secret, env = nil)
      @client_id = client_id
      @client_secret = client_secret
      @url_base = if env.nil? && defined?(Rails) && Rails.env.production?
                    PROD_URL_BASE
                  else
                    env == :production ? PROD_URL_BASE : TEST_URL_BASE
                  end
    end

    def connection
      @connection ||= HTTP.headers(content_type: 'application/json', accept: 'application/json')
                          .auth("Bearer #{bearer_token}")
                          .timeout(10)
    end

    def shipment
      ShipmentResource.new(self)
    end

    def label
      LabelResource.new(self)
    end

    def tracking
      TrackingResource.new(self)
    end

    private

    attr_reader :client_id, :client_secret

    def bearer_token
      cache_key = "DHLEcommerceEU-session-#{Digest::SHA256.hexdigest("#{client_id}#{client_secret}")}"
      cached_token = DHLEcommerceEU.cache.read(cache_key)
      return cached_token if cached_token

      client = HTTP.headers(content_type: 'application/json', accept: 'application/json')
                   .basic_auth(user: client_id, pass: client_secret)
      response = client.get("#{url_base}ccc/v1/auth/accesstoken").parse
      bearer_token = response['access_token']
      DHLEcommerceEU.cache.write(cache_key, bearer_token, expires_in: response['expires_in'] - 60)
      bearer_token
    end
  end
end
