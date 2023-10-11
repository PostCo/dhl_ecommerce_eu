require 'zeitwerk'

loader = Zeitwerk::Loader.for_gem
loader.inflector.inflect(
  'dhl_ecommerce_eu' => 'DHLEcommerceEU'
)
loader.push_dir('./lib')
loader.collapse('./lib/dhl_ecommerce_eu/objects')
loader.ignore("#{__dir__}/../dhl_ecommerce_eu/cache.rb")
loader.enable_reloading
loader.log!
loader.setup

$__dhl_ecommerce_eu_loader__ = loader

def reload!
  $__dhl_ecommerce_eu_loader__.reload
  true
end
