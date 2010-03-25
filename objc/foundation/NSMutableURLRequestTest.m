// NSMutableURLRequestTest.m
//                           wookay.noh at gmail.com

#import "test.h"

//#define HTTP 0

@implementation TestSuite (NSMutableURLRequest)

- (void) test_NSMutableURLRequest {

#ifdef HTTP
  NSString *urlString = @"http://localhost:3000/info";
  NSURL *url = [NSURL URLWithString:urlString];
  NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
  NSData *body = [@"post_id=1&body=hello" dataUsingEncoding:NSUTF8StringEncoding];
  [request setHTTPBody:body];
  [request setHTTPMethod:@"POST"];
    
  NSError *error;
  NSHTTPURLResponse *response;
  NSData *data = [NSURLConnection sendSynchronousRequest:request 
                   returningResponse:&response error:&error];
  assert_equal(200, [response statusCode]);
  assert_equal(@"{}", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);

#endif
 
}

@end
