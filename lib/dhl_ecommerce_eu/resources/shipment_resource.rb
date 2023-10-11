module DHLEcommerceEU
  class ShipmentResource < BaseResource
    #
    # Create a shipment
    #
    # @param [Hash] params params
    #   default: { generateLabel: true, labelFormat: 'pdf', labelSize: '10x15' }
    # @param [Hash] **attributes attributes
    # Example for return connect
    # {
    #     "dataElement": {
    #       "parcelOriginOrganization": 'IT',
    #       "parcelDestinationOrganization": 'NL',
    #       "general": {
    #         "timestamp": '2022-07-01T13:05:05Z',
    #         "product": 'ParcelEurope.return.network'
    #       },
    #       "cPAN": {
    #         "addresses": {
    #           "sender": [
    #             {
    #               "type": 'default',
    #               "name": 'Tiziana Test',
    #               "additionalName": 'Buying Tests',
    #               "email": 'test@test.it',
    #               "street1": 'Teststrada 10',
    #               "postcode": '20123',
    #               "city": 'Milan',
    #               "country": 'IT',
    #               "customerIdentification": '5012345678', # The owner DHL account number
    #               "customerAccountNr1": '1234567890' # The owner DHL account number
    #             }
    #           ],
    #           "recipient": [
    #             {
    #               "type": 'doorstep',
    #               "name": 'Thijs Testbedrijf',
    #               "email": 'test@test.nl',
    #               "street1": 'Teststraat 10',
    #               "postcode": '9737 PE',
    #               "city": 'Groningen',
    #               "country": 'NL'
    #             }
    #           ]
    #         },
    #         "features": {
    #           "physical": {
    #             "grossWeight": '1.0',
    #             "length": '0.2',
    #             "height": '0.2',
    #             "width": '0.3'
    #           }
    #         }
    #       }
    #     }
    #   }
    #
    # @return [Shipment] Shipment object
    #
    def create(params: { generateLabel: true, labelFormat: 'pdf', labelSize: '10x15' }, **attributes)
      Shipment.new post_request('ccc/send-cpan', params: params, body: attributes).parse
    end
  end
end
