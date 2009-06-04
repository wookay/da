(* test_xml.m
                               wookay.noh at gmail.com
*)

assertEqual[expected_, got_] :=
  WriteString["stdout",
    If[expected == got,
      StringJoin["passed: ", ToString[expected], "\n"],
      StringJoin["Assertion failed\nExpected: ", ToString[expected],
        "\nGot: ", ToString[got], "\n"]]]


xml = Import["35005086.rss", "XML"];
items = Cases[xml, XMLElement["item", _, _], \[Infinity]];

assertEqual[ 20 , Length[items] ]
assertEqual[ XMLElement["item", {}, {XMLElement[
   "title", {}, {"Wolfram_Alpha: Details announced for Stephen \
Wolfram's next live Wolfram|Alpha update: http://bit.ly/qgH2N"}], 
  XMLElement[
   "description", {}, {"Wolfram_Alpha: Details announced for Stephen \
Wolfram's next live Wolfram|Alpha update: http://bit.ly/qgH2N"}], 
  XMLElement["pubDate", {}, {"Tue, 02 Jun 2009 21:57:21 +0000"}], 
  XMLElement[
   "guid", {}, \
{"http://twitter.com/Wolfram_Alpha/statuses/2008976206"}], 
  XMLElement[
   "link", {}, \
{"http://twitter.com/Wolfram_Alpha/statuses/2008976206"}]}] , items[[1]] ]

Exit[]
