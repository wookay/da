// NSMutableAttributedStringTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSMutableAttributedStringTest

- (void) unittest:(id)assert_equal {

  NSFont* font = [NSFont fontWithName:@"Helvetica" size:16.0f];
  NSDictionary* attributes = [NSDictionary dictionaryWithObject:font
                                           forKey:NSFontAttributeName];
  NSMutableAttributedString* str = [[NSMutableAttributedString alloc]
    initWithString:@"test" attributes:attributes];

  NSRange range = NSMakeRange(0, 1);
  NSDictionary* attr = [str attributesAtIndex:0
                            effectiveRange:&range];
  [assert_equal a:@"Helvetica"
                b:[[attr valueForKey:NSFontAttributeName] fontName]];

}

@end
