module DHLEcommerceEU
  class BaseResource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(url, params: {}, headers: {})
      handle_response client.connection.headers(headers).get(client.url_base + url, params: params)
    end

    def post_request(url, body:, params: {}, headers: {})
      handle_response client.connection.headers(headers).post(client.url_base + url, params: params, json: body)
    end

    def patch_request(url, body:, headers: {})
      handle_response client.connection.headers(headers).patch(client.url_base + url, json: body)
    end

    def put_request(url, body:, headers: {})
      handle_response client.connection.headers(headers).put(client.url_base + url, json: body)
    end

    def delete_request(url, params: {}, headers: {})
      handle_response client.connection.headers(headers).delete(client.url_base + url, params: params)
    end

    def handle_response(response)
      case response.status
      when 400
        raise Error, "Your request was malformed. #{response.parse['error']}"
      when 401
        raise Error, "You did not supply valid authentication credentials. #{response.parse['error']}"
      when 403
        raise Error, "You are not allowed to perform that action. #{response.parse['error']}"
      when 404
        raise Error, "No results were found for your request. #{response.parse['error']}"
      when 429
        raise Error, "Your request exceeded the API rate limit. #{response.parse['error']}"
      when 500
        raise Error, "We were unable to perform the request due to server-side problems. #{response.parse['error']}"
      when 503
        raise Error,
              "You have been rate limited for sending more than 20 requests per second. #{response.parse['error']}"
      end
      response
    rescue JSON::ParserError
      raise Error, "We were unable to parse the response from the API. #{response}"
    end
  end
end
