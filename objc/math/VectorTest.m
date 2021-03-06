// VectorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation VectorTest

- (void) unittest {

  Vector* vector = [Vector vectorWithX:1.0f Y:2.0f Z:3.0f];
  [assert_equal a:@"[0.2672612 0.5345225 0.8017837]" b:[vector normalize]];
  [assert_equal float:3.741657f float:[vector length]];
  
  Vector* vec2 = [Vector vectorWithX:0.5f Y:0.8f Z:0.2f];
  [assert_equal a:@"[1.5 2.8 3.2]" b:[vector plus:vec2]];
  [assert_equal a:@"[0.5 1.2 2.8]" b:[vector minus:vec2]];
  [assert_equal a:@"[3 6 9]" b:[vector scale:3.0f]];

  [assert_equal float:2.7f float:[vector dot_product:vec2]];
  [assert_equal a:@"[-2 1.3 -0.2]" b:[vector cross_product:vec2]];
  [assert_equal a:@"[1.451613 2.32258 0.5806451]" b:[vec2 projection:vector]];

}

@end
