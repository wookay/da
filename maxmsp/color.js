// color.js
//                           wookay.noh at gmail.com

outlets = 4;
var RED   = 0;
var GREEN = 1;
var BLUE  = 2;
var HEX   = 3;

function colorWithRGB1(r1, g1, b1) {
  var r = r1 * 255; 
  var g = g1 * 255; 
  var b = b1 * 255; 
  outlet(RED, r);
  outlet(GREEN, g);
  outlet(BLUE, b);
  outlet(HEX, '#'+parseInt(r+256*g+65536*b).toString(16));
}

function colorWithName(name) {
  var r, g, b;
  if (name=="red") {
    r = 255; g = 0; b = 0;
  } else if (name=="green") {
    r = 0;   g = 255;   b = 0;
  } else if (name=="blue") {
    r = 0;   g = 0;   b = 255;
  } else if (name=="yellow") {
    r = 255; g = 255; b = 0;
  } else if (name=="black") {
    r = 0;   g = 0;   b = 0;
  } else if (name=="white") {
    r = 255; g = 255; b = 255;
  } else {
    r = 0;   g = 0;   b = 0;
  }
  outlet(RED, r);
  outlet(GREEN, g);
  outlet(BLUE, b);
  outlet(HEX, '#'+parseInt(r+256*g+65536*b).toString(16));
}
