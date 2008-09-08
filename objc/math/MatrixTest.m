// MatrixTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation MatrixTest

- (void) unittest:(id)assert_equal {

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
  [assert_equal a:@"2 1 3\n1 2 -1\n2 -1 3" b:A];
  [assert_equal a:@"2 1 2\n1 2 -1\n3 -1 3" b:[A transpose]];
  Matrix* B = [Matrix matrixWithRows:rowsB];
  [assert_equal a:@"3 1 1\n4 3 -2\n2 3 1" b:[A plus:B]];
  [assert_equal a:@"1 1 5\n-2 1 0\n2 -5 5" b:[A minus:B]];
  [assert_equal a:@"5 13 -11\n7 -2 -2\n-1 11 -9" b:[A multiply:B]];

  rowsA = [Matrix rowsFromString:@"2 1 -1\n0 7 3"];
  rowsB = [Matrix rowsFromString:@"-11 2 0 1\n-3 5 1 -2\n2 2 -6 1"];
  A = [Matrix matrixWithRows:rowsA];
  B = [Matrix matrixWithRows:rowsB];
  [assert_equal a:@"-27 7 7 -1\n-15 41 -11 -11" b:[A multiply:B]];

}

@end
