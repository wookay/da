// MatrixTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define _ ;

@implementation MatrixTest

- (void) unittest {

  [assert_equal a:@"0 0\n0 0" b:[Matrix zero:2]];
  [assert_equal a:@"5 0\n0 5" b:[Matrix scalar:2 int:5]];
  [assert_equal a:@"1.1 0\n0 1.1" b:[Matrix scalar:2 float:1.1]];
  [assert_equal a:@"1 0\n0 1" b:[Matrix identity:2]];

  NSArray* values = [Matrix numbersFromString:@"1 2 3"];
  [assert_equal a:@"1 0 0\n0 2 0\n0 0 3" b:[Matrix diagonal:values]];

  NSArray* rows = [Matrix rowsFromString:@"0 1 2\n3 4 5"];
  Matrix* matrix = [Matrix matrixWithRows:rows];
  [assert_equal a:@"0 1 2\n3 4 5" b:matrix];
  [assert_equal a:@"0 3\n1 4\n2 5" b:[matrix transpose]];

  NSArray* rowsA = [Matrix rowsFromString:@"2 1 3\n1 2 -1\n2 -1 3"];
  NSArray* rowsB = [Matrix rowsFromString:@"1 0 -2\n3 1 -1\n0 4 -2"];
  Matrix* A = [Matrix matrixWithRows:rowsA];
  Matrix* B = [Matrix matrixWithRows:rowsB];
  [assert_equal a:@"2 1 3\n1 2 -1\n2 -1 3" b:A];
  [assert_equal a:@"1 0 -2\n3 1 -1\n0 4 -2" b:B];
  [assert_equal a:@"1 0 0\n0 1 0\n0 0 1" b:[A identity]];
  [assert_equal a:@"2 1 2\n1 2 -1\n3 -1 3" b:[A transpose]];
  [assert_equal a:@"3 1 1\n4 3 -2\n2 3 1" b:[A plus:B]];
  [assert_equal a:@"1 1 5\n-2 1 0\n2 -5 5" b:[A minus:B]];
  [assert_equal a:@"5 13 -11\n7 -2 -2\n-1 11 -9" b:[A multiply:B]];
  [assert_equal a:@"6 3 9\n3 6 -3\n6 -3 9" b:[A scalar:3.0f]];
  [assert_equal float:-10 float:[A determinant]];
  [assert_equal a:@"2 6 12\n-8 -2 -4\n2 -5 1" b:[B adjoint]];
  [assert_equal a:@"-0.09090909 0.3636364 -0.09090909\n-0.2727273 0.09090909 0.2272727\n-0.5454546 0.1818182 -0.04545455" b:[B inverse]];

  rowsA = [Matrix rowsFromString:@"2 1 -1\n0 7 3"];
  rowsB = [Matrix rowsFromString:@"-11 2 0 1\n-3 5 1 -2\n2 2 -6 1"];
  A = [Matrix matrixWithRows:rowsA];
  B = [Matrix matrixWithRows:rowsB];
  [assert_equal a:@"-27 7 7 -1\n-15 41 -11 -11" b:[A multiply:B]];

}

@end
