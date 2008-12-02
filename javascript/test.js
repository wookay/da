// test.js
//                           wookay.noh at gmail.com

function assert_equal(expected, got) {
  if (expected==got) {
    print("passed: " + expected + "\n");
  } else {
    print("Assertion failed\nExpected: " + expected + "\nGot: " + got + "\n");
  }
}

function print(message) {
  document.writeln(message.replace(/\n/mg, '<br/>'));
}

function print_result() {
  if (! document.body) {
    return;
  }
  var passed = (document.body.innerHTML.match(/^passed/mg) || []).length;
  var failed = (document.body.innerHTML.match(/^Assertion failed/mg) || []).length;
  print("<div style='color:green;'>");
  if (passed==1) {
    print("OK, passed 1 test.\n");
  } else if (passed>1) {
    print("OK, passed " + passed + " tests.\n");
  }
  print("</div>");
  print("<div style='color:red;'>");
  if (failed==1) {
    print("Oops, failed 1 test.\n");
  } else if (failed>1) {
    print("Oops, failed " + failed + " tests.\n");
  }
  print("</div>");
}

function safari() {
  return "function" == typeof / /
}
