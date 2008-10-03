// NSApplicationTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation NSApplicationTest

- (void) unittest {

  NSApplication* app = [NSApplication sharedApplication];
  [assert_equal _false:[app isRunning]];

  NSThread* current = [NSThread currentThread];
  [assert_equal _true:[current isMainThread]];

  NSThread* new = [[NSThread alloc] initWithTarget:app
                                    selector:@selector(run)
                                    object:nil];
  [assert_equal _false:[new isMainThread]];
  [assert_equal _false:[new isFinished]];
  [assert_equal _false:[new isExecuting]];
  [assert_equal a:nil b:[new name]];
 
}

@end
