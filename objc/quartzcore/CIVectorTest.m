// CIVectorTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CIVectorTest

- (void) unittest:(id)assert_equal {

  CIVector* vector = [CIVector vectorWithX:1 Y:2 Z:3];
  [assert_equal a:@"[1 2 3]" b:vector];
  [assert_equal a:vector b:[CIVector vectorWithString:@"[1 2 3]"]];
 
}

@end
