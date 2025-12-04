# frozen_string_literal: true

require_relative 'dhl_ecommerce_eu/version'
require 'active_support'
require 'digest'
require 'http'
# require 'httplog' # Uncomment this line to enable HTTP logging

module DHLEcommerceEU
  require 'dhl_ecommerce_eu/cache'
  autoload :Client, 'dhl_ecommerce_eu/client'

  autoload :BaseResource, 'dhl_ecommerce_eu/resources/base_resource'
  autoload :ShipmentResource, 'dhl_ecommerce_eu/resources/shipment_resource'
  autoload :LabelResource, 'dhl_ecommerce_eu/resources/label_resource'
  autoload :TrackingResource, 'dhl_ecommerce_eu/resources/tracking_resource'

  autoload :BaseObject, 'dhl_ecommerce_eu/objects/base_object'
  autoload :Shipment, 'dhl_ecommerce_eu/objects/shipment'
  autoload :Label, 'dhl_ecommerce_eu/objects/label'
  autoload :Tracking, 'dhl_ecommerce_eu/objects/tracking'

  class Error < StandardError; end
  class AuthenticationError < Error; end
  class AuthorizationError < Error; end
  class NotFoundError < Error; end
  class RateLimitError < Error; end
  class InternalServerError < Error; end
  class ServiceUnavailableError < Error; end
end
