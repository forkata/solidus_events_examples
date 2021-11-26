require "rails_helper"

RSpec.describe SolidusEventsExamples::TestSubscriber do
  describe "#custom_action" do
    subject { Spree::Event.fire("order_recalculated", order: order) }

    let(:order) { instance_double(Spree::Order, number: "R123456789") }

    it "prints to STDOUT" do
      expect { subject }.to output("Order R123456789 recalculated\n").to_stdout
    end
  end
end
