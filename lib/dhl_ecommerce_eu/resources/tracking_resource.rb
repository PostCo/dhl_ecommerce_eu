module DHLEcommerceEU
  class TrackingResource < BaseResource
    #
    # Retrieve tracking information for a shipment
    #
    # @param [string] shipment_id Shipment ID
    #
    # @return [Tracking[]] An array of Tracking object
    #
    def retrieve(shipment_id)
      payload = get_request('ccc/track-trace', params: { shipmentId: shipment_id }).parse
      payload.map(&Tracking.method(:new))
    end
  end
end
