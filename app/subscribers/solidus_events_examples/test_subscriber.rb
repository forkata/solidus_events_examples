# app/subscribers/solidus_events_examples/test_subscriber.rb
module SolidusEventsExamples
  # Test subscriber used to demonstrate how to define custom
  # actions based on stock Solidus events.
  module TestSubscriber
    include Spree::Event::Subscriber

    # Subscribes to the "order_recalculated" Solidus event and
    # calls the `custom_action` method every time that is fired.
    event_action :custom_action, event_name: :order_recalculated

    def custom_action(event)
      puts "Order #{event.payload[:order].number} recalculated"
    end
  end
end
