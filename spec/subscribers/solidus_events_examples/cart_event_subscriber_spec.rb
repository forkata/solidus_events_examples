# spec/subscribers/solidus_events_examples/cart_event_subscriber_spec.rb
require "rails_helper"

RSpec.describe SolidusEventsExamples::CartEventSubscriber do
  describe "#cart_updated" do
    subject { Spree::Event.fire(:cart_updated, result: result, order: order) }

    let(:order) { instance_double(Spree::Order, number: "R123456789") }

    context "with a result" do
      let(:result) { double("result") }

      it "prints to STDOUT" do
        expect { subject }
          .to output("Cart for R123456789 updated\n")
          .to_stdout
      end
    end

    context "without a result" do
      let(:result) { nil }

      it "does not print to STDOUT" do
        expect { subject }.to_not output.to_stdout
      end
    end
  end
end
