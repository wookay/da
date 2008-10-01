// NSLocaleTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define U(s) [NSString stringWithUTF8String:s]

@implementation NSLocaleTest

- (void) unittest {

  id countryCodes = [NSLocale ISOCountryCodes];
  [assert_equal _true:10 < [countryCodes count]];

  id locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ko_KR"];

  NSString* arabic = [locale displayNameForKey:NSLocaleIdentifier value:@"ar"];
  [assert_equal a:U("아랍어") b:arabic];

  NSString* spanish = [locale displayNameForKey:NSLocaleIdentifier value:@"es_ES"];
  [assert_equal a:U("스페인어 (스페인)") b:spanish];

}

@end
