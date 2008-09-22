// OrdTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define A(fst,snd) [NSArray arrayWithObjects:fst, snd, nil]

@implementation OrdTest

- (void) unittest {

  id dic = [NSDictionary dictionaryWithObjectsAndKeys:
    @"C", @"c",
    @"A", @"a",
    @"B", @"b",
    nil];

  id ord = [OrderedDictionary dictionaryWithObjectsAndKeys:
    @"C", @"c",
    @"A", @"a",
    @"B", @"b",
    nil];
  [assert_equal a:@"(c, a, b)" b:[ord allKeys]];
  [assert_equal a:@"(C, A, B)" b:[ord allValues]];
  [assert_equal _true:[dic isEqualToDictionary:ord]];
  NSMutableArray* keys = [NSMutableArray array];
  for (id obj in ord) {
    [keys addObject:obj];
  }
  [assert_equal a:@"(c, a, b)" b:keys];

  NSMutableArray* values = [NSMutableArray array];
  for (id obj in [ord objectEnumerator]) {
    [values addObject:obj];
  }
  [assert_equal a:@"(C, A, B)" b:values];

  ord = [OrderedDictionary dictionary];
  [assert_equal a:@"{}" b:ord];
  [assert_equal int:0 int:[ord count]];

  ord = [OrderedDictionary dictionaryWithDictionary:dic];
  [assert_equal _true:[dic isEqualToDictionary:ord]];

  ord = [OrderedDictionary dictionaryWithDictionary:dic];
  [assert_equal _true:[dic isEqualToDictionary:ord]];

  ord = [OrderedDictionary dictionaryWithObjects:values forKeys:keys];
  [assert_equal _true:[dic isEqualToDictionary:ord]];
  [assert_equal a:@"(c, a, b)" b:[ord allKeys]];
  [assert_equal a:@"(C, A, B)" b:[ord allValues]];

  id ordFromArray = [OrderedDictionary dictionaryWithObjectsAndKeysFromArray:
    [NSArray arrayWithObjects:
      A(@"C", @"c"),
      A(@"A", @"a"),
      A(@"B", @"b"),
      nil]];
  [assert_equal a:@"(c, a, b)" b:[ordFromArray allKeys]];
  [assert_equal a:@"((C), (A), (B))" b:[ordFromArray allValues]];

}

@end
