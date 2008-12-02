// test_photoshop.jsx
//                           wookay.noh at gmail.com

{
  #target photoshop    
  if (app.documents.length != 0) {  
    app.activeDocument.close(SaveOptions.DONOTSAVECHANGES);
  }
  var doc = app.documents.add(320, 620, 72, "test");
  var LineToPrint = 0;
  var textColor = new SolidColor;
  textColor.rgb.red = 0;
  textColor.rgb.green = 0;
  textColor.rgb.blue = 0;
  var passed = 0;
  var failed = 0;
}

function assert_equal(expected, got) {
  if (expected==got) {
    print("passed: " + expected);
    passed++;
  } else {
    print("Assertion failed");
    print("Expected: " + expected);
    print("Got: " + got);
    failed++;
  }
}

function print(message) {
  var layer = doc.artLayers.add();
  layer.kind = LayerKind.TEXT;
  layer.textItem.contents = message;
  layer.textItem.size = 18;
  layer.textItem.position = Array(5, LineToPrint+=layer.textItem.size);
  layer.textItem.color = textColor;
}

function print_result() {
  textColor.rgb.red = 0;
  textColor.rgb.green = 255;
  textColor.rgb.blue = 0;
  if (passed==1) {
    print("OK, passed 1 test.");
  } else if (passed>1) {
    print("OK, passed " + passed + " tests.");
  }
  textColor.rgb.red = 255;
  textColor.rgb.green = 0;
  textColor.rgb.blue = 0;
  if (failed==1) {
    print("Oops, failed 1 test.");
  } else if (failed>1) {
    print("Oops, failed " + failed + " tests.");
  }
}

assert_equal( 1          , 1                              );
assert_equal( 3          , 1+2                            );
assert_equal( "a"        , 'a'                            );
assert_equal( "a2"       , "a"+2                          );
assert_equal( 3          , "123".length                   );
assert_equal( "1"        , [1]                            );
assert_equal( "1,2"      , [1,2]                          );
assert_equal( 1          , [1,2][0]                       );
assert_equal( 2          , [1,2].length                   );
assert_equal( 0          , (null || []).length            );
assert_equal( 0          , ([] || []).length              );
assert_equal( 1          , ([1] || []).length             );
assert_equal( "value"    , {key: "value"}.key             );
assert_equal( "value"    , {key: "value"}['key']          );
assert_equal( "ja"       , "javascript".match("ja")       );
assert_equal( "java"     , "javascript".match(/j.?.?a/)   );
assert_equal( "java"     , "javascript".match(/j.*a/)     );
assert_equal( false      , [1]==[1]                       );
assert_equal( "function" , typeof / /                     );
assert_equal( "boolean"  , typeof true                    );
assert_equal( "boolean"  , typeof false                   );
assert_equal( "number"   , typeof 1                       );
assert_equal( "string"   , typeof ""                      );
assert_equal( "object"   , typeof []                      );
assert_equal( "object"   , typeof {}                      );
assert_equal( "object"   , typeof null                    );
assert_equal( "function" , typeof Function                );
assert_equal( "function" , typeof Array                   );
assert_equal( "function" , typeof assert_equal            );
assert_equal( "function" , typeof function(){}            );

print_result();
