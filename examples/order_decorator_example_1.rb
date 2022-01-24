# examples/order_decorator_example_1.rb

base.state_machine.after_transition to: :complete, do: :perform_fraud_check
base.state_machine.after_transition to: :complete, do: :send_order_to_erp
base.state_machine.after_transition to: :complete, do: :sync_customer_to_crm
base.state_machine.after_transition to: :complete, do: :track_analytics_event

def perform_fraud_check
  # ...
end

def send_order_to_erp
  # ...
end

def sync_customer_to_crm
  # ...
end

def track_analytics_event
  # ...
end
