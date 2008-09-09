// NSBundleTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSBundleTest

- (void) unittest:(id)assert_equal {

  NSString* path = [[NSBundle mainBundle] pathForResource:@"NSBundleTest" ofType:@"m"];
  [assert_equal _true:[path hasSuffix:@"objc/foundation/NSBundleTest.m"]];

  NSData* data = [NSData dataWithContentsOfFile:path];
  NSString* contents = [[NSString alloc] initWithData:data
                                         encoding:NSUTF8StringEncoding];

  NSString* contentsOfFile = [NSString stringWithContentsOfFile:path
                                       encoding:NSUTF8StringEncoding error:nil];
  [assert_equal a:contents b:contentsOfFile];

}

@end
