// OrdTest.m
//                           wookay.noh at gmail.com

#import "test.h"
#import "Ord.h"

#define A(fst,snd) [NSArray arrayWithObjects:fst, snd, nil]

@implementation TestSuite (Ord)

- (void) test_Ord {

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
  assert_equal(@"(c, a, b)", [ord allKeys]);
  assert_equal(@"(C, A, B)", [ord allValues]);
  assert_equal(true, [dic isEqualToDictionary:ord]);
  NSMutableArray* keys = [NSMutableArray array];
  for (id obj in ord) {
    [keys addObject:obj];
  }
  assert_equal(@"(c, a, b)", keys);

  NSMutableArray* values = [NSMutableArray array];
  for (id obj in [ord objectEnumerator]) {
    [values addObject:obj];
  }
  assert_equal(@"(C, A, B)", values);

  ord = [OrderedDictionary dictionary];
  assert_equal(@"{}", ord);
  assert_equal(0, [ord count]);

  ord = [OrderedDictionary dictionaryWithDictionary:dic];
  assert_equal(true, [dic isEqualToDictionary:ord]);

  ord = [OrderedDictionary dictionaryWithDictionary:dic];
  assert_equal(true, [dic isEqualToDictionary:ord]);

  ord = [OrderedDictionary dictionaryWithObjects:values forKeys:keys];
  assert_equal(true, [dic isEqualToDictionary:ord]);
  assert_equal(@"(c, a, b)", [ord allKeys]);
  assert_equal(@"(C, A, B)", [ord allValues]);

  id ordFromArray = [OrderedDictionary dictionaryWithObjectsAndKeysFromArray:
    [NSArray arrayWithObjects:
      A(@"C", @"c"),
      A(@"A", @"a"),
      A(@"B", @"b"),
      nil]];
  assert_equal(@"(c, a, b)", [ordFromArray allKeys]);
  assert_equal(@"((C), (A), (B))", [ordFromArray allValues]);

}

@end
