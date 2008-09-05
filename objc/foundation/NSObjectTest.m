// NSObjectTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSObjectTest

- (void) unittest:(id)assert_equal {

  [assert_equal a:nil b:[self valueForKeyPath:@"name"]];
  [self setValue:@"iphone" forKey:@"name"];
  [assert_equal a:@"iphone" b:[self valueForKeyPath:@"name"]];
  [assert_equal int:0 b:[self valueForKeyPath:@"age"]];
  [self setValue:[NSNumber numberWithInt:20] forKey:@"age"];
  [assert_equal int:20 b:[self valueForKeyPath:@"age"]];

}

@end
