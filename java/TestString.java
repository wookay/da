// TestString.java
//                           wookay.noh at gmail.com

class TestString {
  public static final String QUOTE = "\"";

  public static String inspect(String obj) {
    return QUOTE + obj + QUOTE;
  }

  public static String ljust(String str, int padding) {
    StringBuffer buffer = new StringBuffer(str);
    int idx;
    for (idx = str.length() ; idx < padding; idx++) {
      buffer.append(" ");
    }
    return buffer.toString();
  }

  static void assert_equal(String expected, String got) {
    if (expected.equals(got)) {
      System.out.println("passed: " + inspect(expected));
    } else {
      System.out.println("Assertion failed\nExpected: " + inspect(expected) + "\nGot: " + inspect(got));
    }
  }



  public static void main(String[] args) {
   
    assert_equal( "a    " ,  ljust("a", 5)   );
    assert_equal( "     " ,  ljust("", 5)    );
    assert_equal( ""      ,  ljust("", 0)    );
    assert_equal( "abc"   ,  ljust("abc", 2) );

  }
}
