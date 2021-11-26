module SolidusEventsExamples
  module OrderContentsDecorator
    def update_cart(params)
      super.tap do |result|
        Spree::Event.fire("cart_updated", order: order, params: params, result: result)
      end
    end

    Spree::OrderContents.prepend(self)
  end
end
