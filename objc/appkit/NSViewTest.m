// NSViewTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSViewTest

- (void) unittest:(id)assert_equal {

  NSRect rect = NSMakeRect(1,2,100,200);
  NSView* view = [[NSView alloc] initWithFrame:rect];
  [assert_equal _false:[view isHidden]];
  [assert_equal _true:[view needsDisplay]];

  CALayer* layer = [view layer];
  [assert_equal a:nil b:layer];

}

@end
