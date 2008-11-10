# test_chipmunk.rb
#                           wookay.noh at gmail.com

require 'chipmunk'

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected.inspect}" :
    "Assertion failed\nExpected: #{expected.inspect}\nGot: #{got.inspect}"
end


INFINITY = 0.1/0

body = CP::Body.new INFINITY, INFINITY 
assert_equal INFINITY, body.m
assert_equal INFINITY, body.i
assert_equal [0, 0], body.p.to_a
assert_equal 0, body.p.x
assert_equal 0, body.p.y

space = CP::Space.new
space.add_body body
assert_equal 1, space.damping # 1.0 is no damping and 0.0 is full damping
assert_equal [0, 0], space.gravity.to_a
assert_equal 10, space.iterations

space.gravity = vec2 30, 0
assert_equal [30, 0], space.gravity.to_a

v = vec2 2, 5
assert_equal [2, 5], v.to_a

# Create a segment collision shape attached
#   to the given body with endpoints a and b.
shape = CP::Shape::Segment.new(body, v, v, 10.0)
assert_equal nil, shape.collision_type
assert_equal 0, shape.e # elasticity
assert_equal 0, shape.u # frictional coefficient

space.add_static_shape(shape)

steps = 1
dt = 1.0/60/steps

space.step(dt)
assert_equal [0, 0], shape.body.p.to_a

space.step(dt)
assert_equal [1.0/60/2, 0], shape.body.p.to_a

space.step(dt)
assert_equal [0.025, 0], shape.body.p.to_a

space.step(dt)
assert_equal [0.025*2, 0], shape.body.p.to_a

space.step(dt)
assert_equal [1.0/60/0.2, 0.0].inspect , shape.body.p.to_a.inspect

space.step(dt)
assert_equal [0.125, 0], shape.body.p.to_a

space.step(dt)
assert_equal [0.175, 0], shape.body.p.to_a
