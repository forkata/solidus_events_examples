# app/overrides/solidus_events_examples/order_contents_decorator.rb
module SolidusEventsExamples
  module OrderContentsDecorator
    def update_cart(params)
      super.tap do |result|
        Spree::Event.fire("cart_updated", order: order, result: result)
      end
    end

    Spree::OrderContents.prepend(self)
  end
end
