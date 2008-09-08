// VectorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation VectorTest

- (void) unittest:(id)assert_equal {

  Vector* vector = [Vector vectorWithX:1.0f Y:2.0f Z:3.0f];
  [assert_equal a:@"[0.267261 0.534522 0.801784]" b:[vector normalize]];
  [assert_equal float:3.741657f float:[vector length]];
  
  Vector* vec2 = [Vector vectorWithX:0.5f Y:0.8f Z:0.2f];
  [assert_equal a:@"[1.5 2.8 3.2]" b:[vector plus:vec2]];
  [assert_equal a:@"[0.5 1.2 2.8]" b:[vector minus:vec2]];
  [assert_equal a:@"[3 6 9]" b:[vector scale:3.0f]];

  [assert_equal float:2.7f float:[vector dot:vec2]];
  [assert_equal a:@"[1.45161 2.32258 0.580645]" b:[vec2 projection:vector]];

}

@end
