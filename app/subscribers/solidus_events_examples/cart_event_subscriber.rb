# app/subscribers/solidus_events_examples/cart_event_subscriber.rb
module SolidusEventsExamples
  # Test subscriber used to subscribe to a custom event.
  module CartEventSubscriber
    include Spree::Event::Subscriber

    # Subscribes to the "cart_updated" custom event and calls a
    # method with the same name as the event.
    event_action :cart_updated

    def cart_updated(event)
      if event.payload[:result]
        puts "Cart for #{event.payload[:order].number} updated"
      end
    end
  end
end
