# test_tokyocabinet.rb
#                           wookay.noh at gmail.com

def assert_equal expected, got
  puts expected == got ?
    "passed: #{expected}" :
    "Assertion failed\nExpected: #{expected}\nGot: #{got}"
end

require 'tokyocabinet'
include TokyoCabinet

database = 'casket.hdb'

# create the object
hdb = HDB::new

# open the database
if !hdb.open(database, HDB::OWRITER | HDB::OCREAT)
  ecode = hdb.ecode
  STDERR.printf("open error: %s\n", hdb.errmsg(ecode))
end

# store records
if !hdb.put("foo", "hop") ||
    !hdb.put("bar", "step") ||
    !hdb.put("baz", "jump")
  ecode = hdb.ecode
  STDERR.printf("put error: %s\n", hdb.errmsg(ecode))
end

# retrieve records
value = hdb.get("foo")
if value
  assert_equal 'hop', value
else
  ecode = hdb.ecode
  STDERR.printf("get error: %s\n", hdb.errmsg(ecode))
end

# hash-like usage
hdb["quux"] = "touchdown"
assert_equal 'touchdown', hdb['quux']
assert_equal ["foo", "bar", "baz", "quux"], hdb.keys

# close the database
if !hdb.close
  ecode = hdb.ecode
  STDERR.printf("close error: %s\n", hdb.errmsg(ecode))
end
