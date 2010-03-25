// NSObjectTest.m
//                           wookay.noh at gmail.com

#import "test.h"


@interface NSObjectTest : NSObject {
  NSString* person_name;
  int person_age;
}
@end

@implementation NSObjectTest
@end



@implementation TestSuite (NSObject)

- (void) test_NSObject {

  id obj = [[[NSObjectTest alloc] init] autorelease]; 

  assert_equal(nil, [obj valueForKeyPath:@"person_name"]);
  [obj setValue:@"iphone" forKey:@"person_name"];
  assert_equal(@"iphone", [obj valueForKeyPath:@"person_name"]);
  assert_equal(6, [obj valueForKeyPath:@"person_name.length"]);
  assert_equal(0, [obj valueForKeyPath:@"person_age"]);
  [obj setValue:[NSNumber numberWithInt:20] forKey:@"person_age"];
  assert_equal(20, [obj valueForKeyPath:@"person_age"]);

  assert_equal(true, [@"" isKindOfClass:[NSString class]]);
  assert_equal(true, [@"" isKindOfClass:[NSObject class]]);
  assert_equal(@selector(hi), @selector(hi));

  IMP upcase =  [@"" methodForSelector:@selector(uppercaseString)];
  assert_equal(@"A", upcase(@"a", NULL));

}

@end
