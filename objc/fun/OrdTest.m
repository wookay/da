// OrdTest.m
//                           wookay.noh at gmail.com

#import "test.h"

#define A(fst,snd) [NSArray arrayWithObjects:fst, snd, nil]

@implementation OrdTest

- (void) unittest {

  id dic = [OrderedDictionary dictionaryWithObjectsAndKeys:
    @"C", @"c",
    @"A", @"a",
    @"B", @"b",
    nil];                
  [assert_equal a:@"(c, a, b)" b:[dic allKeys]];
return;
  [assert_equal a:@"(C, A, B)" b:[dic allValues]];

  id dicFromArray = [OrderedDictionary dictionaryWithObjectsAndKeysFromArray:
    [NSArray arrayWithObjects:
      A(@"C", @"c"),
      A(@"A", @"a"),
      A(@"B", @"b"),
      nil]];
  [assert_equal a:@"(c, a, b)" b:[dicFromArray allKeys]];
  [assert_equal a:@"(C, A, B)" b:[dicFromArray allValues]];

}

@end
