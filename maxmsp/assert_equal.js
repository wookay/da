// assert_equal.js
//                           wookay.noh at gmail.com

inlets = 3;
outlets = 2;

var inlet1, inlet2;

function list(value) {
  if (inlet == 0) {
    inlet1 = value;
  }
  if (inlet == 1) {
    inlet2 = value;
  }
}

function assert_equal(expected, got) {
  if (expected==got) {
    post("passed: " + expected + "\n");
    outlet(0, "bang");
  } else {
    post("Assertion failed\nExpected: " + expected + "\nGot: " + got + "\n");
    outlet(1, "bang");
  }
}

function bang() {
  if (inlet1 != undefined && inlet2 != undefined) {
    assert_equal(inlet1, inlet2);
  }
}
