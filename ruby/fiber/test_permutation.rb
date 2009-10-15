# test_permutation.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end


assert_equal [[1, 3], [1, 4], [2, 3], [2, 4]], [1,2].product([3,4])
assert_equal [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]], [1,2,3,4].combination(2).to_a
assert_equal [[1, 2], [1, 3], [1, 4], [2, 1], [2, 3], [2, 4], [3, 1], [3, 2], [3, 4], [4, 1], [4, 2], [4, 3]], [1,2,3,4].permutation(2).to_a

cy = [1,2,3].cycle
assert_equal 1 , cy.next
assert_equal 2 , cy.next
assert_equal 3 , cy.next
assert_equal 1 , cy.next
assert_equal 2 , cy.next
assert_equal 3 , cy.next
assert_equal 1 , cy.next
assert_equal 2 , cy.next
assert_equal 3 , cy.next
