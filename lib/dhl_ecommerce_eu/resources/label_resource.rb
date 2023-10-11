module DHLEcommerceEU
  class LabelResource < BaseResource
    #
    # Retrieve label for a shipment
    #
    # @param [string] piece_id The shipment id
    # @param [string] customer_id The customer id
    #
    # @return [Label] Label object
    #
    def retrieve(piece_id, customer_id)
      Label.new get_request('ccc/label-reprint', params: { pieceId: piece_id, customerId: customer_id }).parse
    end
  end
end
