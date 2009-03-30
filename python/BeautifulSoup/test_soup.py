def assert_equal(expected, got):
  if expected==got:
    print("passed: %s" % expected)
  else:
    print("Assertion failed\nExpected: %s\nGot: %s" % (expected, got))

from BeautifulSoup import BeautifulSoup

doc = """
<body>
  <div class="greetings">hello</div>
</body>
"""

soup = BeautifulSoup(doc)

assert_equal( 'hello' , soup.find('div', {'class':'greetings'}).string )
