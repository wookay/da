// CIFilterTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CIFilterTest

- (void) unittest:(id)assert_equal {

  CIFilter* filter = [CIFilter filterWithName:@"CIPointillize"];
  NSDictionary* attributes = [filter attributes];
  [assert_equal a:@"CIPointillize"
                b:[attributes valueForKey:kCIAttributeFilterName]];

}

@end
