// NSXMLDocumentTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSXMLDocumentTest

- (void) unittest {

  id xml = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\
<topic name=\"SmallTalk\" normalized-name=\"smalltalk\" usual-name=\"Smalltalk\">\
    <degree plus=\"40\" minus=\"0\" total=\"40\" />\
    <people plus=\"4\" minus=\"0\" total=\"4\" />\
    <percent plus=\"100\" minus=\"0\" total=\"100\" />\
</topic>";
  NSError* err;
  NSXMLDocument* doc = [[NSXMLDocument alloc]
    initWithXMLString:xml options:NSXMLDocumentTidyXML error:&err];
  NSArray *nodes = [doc nodesForXPath:@"//degree" error:&err];
  id attr = [[[nodes objectAtIndex:0] attributes] objectAtIndex:0];
  [assert_equal a:@"plus" b:[attr name]];
  [assert_equal a:@"40" b:[attr stringValue]];

  nodes = [doc nodesForXPath:@"//@normalized-name" error:&err];
  [assert_equal a:@"smalltalk" b:[[nodes objectAtIndex:0] stringValue]];
  [doc release];

}

@end
