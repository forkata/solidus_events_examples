# spec/models/spree/order_contents_spec.rb
require "rails_helper"

RSpec.describe Spree::OrderContents do
  describe "#update_cart" do
    subject { described_class.new(order).update_cart(params) }

    let(:order) { create(:order) }
    let(:line_item) { build(:line_item, order: order) }

    let(:params) do
      { line_items_attributes: line_item.attributes }
    end

    it "fires the 'cart_updated' event" do
      expect(Spree::Event.as_null_object)
        .to receive(:fire)
        .with("cart_updated", order: order, result: true)
      subject
    end
  end
end
