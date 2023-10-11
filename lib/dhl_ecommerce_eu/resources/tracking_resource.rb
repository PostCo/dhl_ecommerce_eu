module DHLEcommerceEU
  class TrackingResource < BaseResource
    #
    # Retrieve tracking information for a shipment
    #
    # @param [string] shipment_id Shipment ID
    #
    # @return [Tracking] Tracking object
    #
    def retrieve(shipment_id)
      Tracking.new get_request('ccc/track-trace', params: { shipmentId: shipment_id }).parse
    end
  end
end
