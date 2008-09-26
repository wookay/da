// CGTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "CG.h"

#define _ nil

@implementation CGTest

- (void) unittest {

  id cg = [CG create:nil];
  id p = [cg path];
  [p moveToPoint:_ x:10 y:20];
  [p addLineToPoint:_ x:10 y:20];
  [assert_equal a:[NSArray arrayWithObjects:
                  @"CGContextMoveToPoint", @"CGContextAddLineToPoint", nil]
                b:p];

  id p2 = [cg path];
  [p2 moveToPoint:_ x:20 y:30];
  [p2 addLineToPoint:_ x:40 y:50];
  [assert_equal a:[NSArray arrayWithObjects:
                  @"CGContextMoveToPoint", @"CGContextAddLineToPoint", nil]
                b:p2];
  [assert_equal a:[NSArray arrayWithObjects:
                  @"CGContextMoveToPoint", @"CGContextAddLineToPoint",
                  @"CGContextMoveToPoint", @"CGContextAddLineToPoint", nil]
                b:cg];

}

@end
