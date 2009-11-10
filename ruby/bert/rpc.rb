require 'bertrpc'

svc = BERTRPC::Service.new('localhost', 9999)
puts svc.call.calc.add(1, 2)
# => 3
