// NSXMLParserTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSXMLParserTest

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
  [assert_equal oneOf:@"topic degree people percent" b:elementName];
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
  [assert_equal oneOf:@"topic degree people percent" b:elementName];
}

- (void) unittest {

  id xml = @"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\
<topic name=\"SmallTalk\" normalized-name=\"smalltalk\" usual-name=\"Smalltalk\">\
    <degree plus=\"40\" minus=\"0\" total=\"40\" />\
    <people plus=\"4\" minus=\"0\" total=\"4\" />\
    <percent plus=\"100\" minus=\"0\" total=\"100\" />\
</topic>";
  NSData* data = [xml dataUsingEncoding:NSUTF8StringEncoding];
  NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
  [parser setDelegate:self];
  [parser parse];
  [parser release];

}

@end
