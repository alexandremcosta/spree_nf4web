# encoding: UTF-8
object @order

node('CPF') { |o| o.cpf }
node('xName') { |o| o.name }
node('xLgr') { |o| o.address1 }
node('nro') { |o| o.address_number }
node('xCpl') { |o| o.address2 }
node('xBairro') { |o| o.neighborhood }
node('cMun') { |o| o.ibge_code }
node('xMun') { |o| o.city }
node('UF') { |o| o.state.abbr }
node('CEP') { |o| o.zipcode }
node('fone') { |o| o.phone }
node('email') { |o| o.email }

child :nf4web_line_items => :'Item_Object' do |li|
  node('cProd') { |li| li.product.nfe4web_name }
  node('xProd') { |li| li.product.nfe4web_description }
  node('cfop') { |li| li.cfop }
  node('NCM') { |li| li.product.ncm }
  node('uCom') { |li| li.product.unit }
  node('qCom') { |li| li.quantity }
  node('subst') { |li| li.product.subst }
  node('vUnCom') { |li| li.price + @order.item_tax }
  node('vFrete') { @order.ship_per_item }
  node('vDesc') { @order.adjustment_total_per_item }
end
