object @orders

node('xOrderID') { |o| o.number }
node('xProcDate') { |o| I18n.l(o.completed_at, format: "%Y-%m-%d %H:%M:%S") }
node('xCustName') { |o| o.name }
node('xQtyItems') { |o| selling_count(o)}
node('xOrderStatusID') { |o| Nf4web::StateList.new.state_to_index(o.payment_state) }
