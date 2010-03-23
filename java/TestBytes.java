// TestBytes.java
//                           wookay.noh at gmail.com

import java.util.Arrays;

class TestBytes {

  static String bytesToHex(byte[] bytes) {
     StringBuffer ary = new StringBuffer();
     ary.append( "{ " );
     int idx;
     for (idx = 0; idx < bytes.length; idx++) {
       byte b = bytes[idx];
       ary.append(byteToHex(b));
       if (idx < bytes.length-1) {
         ary.append( ", " );
       }
     }
     ary.append( " }" );
     return ary.toString(); 
  }

  static public String byteToHex(byte b) {
      char digit[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
      char[] array = { '0', 'x', digit[(b >> 4) & 0x0f], digit[b & 0x0f] };
      return new String(array);
   }

  static String dump_bytes(byte[] bytes) {
    return new String(bytes);
  }

  static void assert_equal(String expected, String got) {
    if (expected.equals(got)) {
      System.out.println("passed: " + expected);
    } else {
      System.out.println("Assertion failed\nExpected: " + expected + "\nGot: " + got);
    }
  }

  static void assert_equal(byte[] expected, byte[] got) {
    if (Arrays.equals( expected , got )) {
      System.out.println("passed: " + expected);
    } else {
      System.out.println("Assertion failed\nExpected: " + expected + "\nGot: " + got);
    }
  }

  public static void main(String[] args) {
   
    byte[] bytes_expected = { 0x61, 0x62, 0x63 };
    byte[] bytes = "abc".getBytes();
    assert_equal( "{ 0x61, 0x62, 0x63 }", bytesToHex(bytes_expected) );
    assert_equal( "{ 0x61, 0x62, 0x63 }", bytesToHex(bytes) );
    assert_equal( bytes_expected , bytes );
    
  }
}
