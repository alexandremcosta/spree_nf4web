object @orders

node('xOrderID') { |o| o.number[1..-1] }
node('xProcDate') { |o| o.completed_at.strftime("%Y-%m-%d %H:%M:%S") }
node('xCustName') { |o| o.name }
node('xQtyItems') { |o| o.item_count }
node('xOrderStatusID') { |o| Nf4web::StateList.new.state_to_index(o.payment_state) }
