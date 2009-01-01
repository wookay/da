// base.m
//                           wookay.noh at gmail.com

#import "base.h"

#define VLAAH_CLIENT   @"VLAAH-Objective-C/0.1"
#define VLAAH_PROTOCOL @"VLAAH/0.9"

@implementation Base

@synthesize raw_data;
@synthesize resource;

- (id) raw_data:(id)_resource {
  if (LOCAL_TEST) {
    return nil;
  }
  if ([@"" isEqualToString:APPKEY]) {
    [NSException raise:@"ApplicationKeyError" format:@"Missing APPKEY"];
    return nil;
  }
  id path = [_resource stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  id urlString = [NSString stringWithFormat:@"http://vlaah.com/%@", path];
  NSURL *url = [NSURL URLWithString:urlString];
  NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
  [request setHTTPMethod:@"POST"];

  id accept = @"text/xml";
  id x_accept_protocol = VLAAH_PROTOCOL;
  id user_agent =
    [NSString stringWithFormat:@"%@ (appkey/%@)", VLAAH_CLIENT, APPKEY];
  [request addValue:accept forHTTPHeaderField:@"Accept"];
  [request addValue:user_agent forHTTPHeaderField:@"User-Agent"];
  [request addValue:x_accept_protocol forHTTPHeaderField:@"X-Accept-Protocol"];

  id ret;
  NSError *error;
  NSHTTPURLResponse *response;
  NSData *data = [NSURLConnection sendSynchronousRequest:request
                   returningResponse:&response error:&error];
  ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
  if ([ret isEqualToString:@"<?xml version=\"1.0\" encoding=\"UTF-8\" ?><error type=\"invalid-application-key\" />"]) {
    [NSException raise:@"ApplicationKeyError" format:@"invalid-application-key"];
    ret = @"";
  }
  self.raw_data = ret;
  //NSLog(@"%@", ret);
  return ret;
}

- (id) nodes:(id)xpath xml:(id)xml {
  NSError* err;
  if (nil == xml) {
    xml = @"";
  }
  NSXMLDocument* doc = [[NSXMLDocument alloc]
    initWithXMLString:xml options:NSXMLDocumentTidyXML error:&err];
  NSArray *nodes = [doc nodesForXPath:xpath error:&err];
  [doc release];
  return nodes;
}

- (id) items:(id)xpath {
  if ([@"" isEqualToString:self.raw_data]) {
    self.raw_data = [self raw_data:self.resource];
  }
  return [self nodes:xpath xml:self.raw_data];
}

- (id) item:(id)xpath {
  return [[self element:xpath] stringValue];
}

- (id) element:(id)xpath {
  NSArray *nodes = [self items:xpath];
  if ([nodes count] > 0) {
    return [nodes objectAtIndex:0];
  } else {
    return nil;
  }
}

@end
