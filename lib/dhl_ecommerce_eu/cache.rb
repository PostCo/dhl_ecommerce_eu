module DHLEcommerceEU
  def self.cache
    @cache ||= defined?(Rails) ? Rails.cache : ActiveSupport::Cache::MemoryStore.new
  end
end
