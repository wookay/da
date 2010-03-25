// NSLocaleTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define U(s) [NSString stringWithUTF8String:s]

@implementation TestSuite (NSLocale)

- (void) test_NSLocale {

  id countryCodes = [NSLocale ISOCountryCodes];
  assert_equal(true, 10 < [countryCodes count]);

  id locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"];

  NSString* arabic = [locale displayNameForKey:NSLocaleIdentifier value:@"ar"];
  assert_equal(U("아랍어"), arabic);

  NSString* spanish = [locale displayNameForKey:NSLocaleIdentifier value:@"es_ES"];
  assert_equal(U("스페인어 (스페인)"), spanish);

}

@end
