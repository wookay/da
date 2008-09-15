// NSObjectTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSObjectTest

- (void) unittest {

  [assert_equal a:nil b:[self valueForKeyPath:@"person_name"]];
  [self setValue:@"iphone" forKey:@"person_name"];
  [assert_equal a:@"iphone" b:[self valueForKeyPath:@"person_name"]];
  [assert_equal int:6 b:[self valueForKeyPath:@"person_name.length"]];
  [assert_equal int:0 b:[self valueForKeyPath:@"person_age"]];
  [self setValue:[NSNumber numberWithInt:20] forKey:@"person_age"];
  [assert_equal int:20 b:[self valueForKeyPath:@"person_age"]];

}

@end
