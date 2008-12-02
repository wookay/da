-- test_ada.adb
--                           wookay.noh at gmail.com

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure test_ada is
  function assert_equal(expected, got: Integer) return String is begin
    case expected=got is
    when true =>
      Put("passed: ");
      Put(expected);
      Put_Line("");
    when false =>
      Put_Line("Assertion failed");
      Put("Expected: ");
      Put(expected);
      Put_Line("");
      Put("Got: ");
      Put(got);
      Put_Line("");
    end case;
    return "";
  end;
  function assert_equal(expected, got: String) return String is begin
    case expected=got is
    when true =>
      Put("passed: ");
      Put(expected);
      Put_Line("");
    when false =>
      Put_Line("Assertion failed");
      Put("Expected: ");
      Put(expected);
      Put_Line("");
      Put("Got: ");
      Put(got);
      Put_Line("");
    end case;
    return "";
  end;

begin
  Put(assert_equal( 1   , 1   ));
  Put(assert_equal( 3   , 1+2 ));
  Put(assert_equal( "a" , "a" ));
end;
