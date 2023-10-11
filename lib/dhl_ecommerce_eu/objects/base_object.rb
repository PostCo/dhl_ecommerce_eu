module DHLEcommerceEU
  class BaseObject < OpenStruct
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
      ostruct = to_ostruct(attributes)
      ostruct = ostruct.empty? ? nil : ostruct
      super ostruct
    end

    private

    def to_ostruct(obj)
      if obj.is_a?(Hash)
        OpenStruct.new(obj.map { |key, val| [key.to_s.underscore, to_ostruct(val)] }.to_h)
      elsif obj.is_a?(Array)
        obj.map { |o| to_ostruct(o) }
      else # Assumed to be a primitive value
        obj
      end
    end
  end
end
