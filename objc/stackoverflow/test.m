// test.m
//                           wookay.noh at gmail.com

#import "NSNumberThousandComma.h"
#import "NSArraySortByMostFrequent.h"
#import "NSStringHexToBytes.h"

void assert_equal(id expected, id got) {
  if ([expected isEqual:got]) {
    NSLog(@"passed: %@", expected);
  }
}

int main (int argc, const char * argv[]) {
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

  //
  NSNumber* number = [NSNumber numberWithDouble:10000000];
  assert_equal(@"10,000,000", [number thousandComma]);

  //
  NSArray* ary = [NSArray arrayWithObjects:@"3", @"2", @"1", @"3", @"3", @"7", nil];
  NSArray* expected = [NSArray arrayWithObjects:@"3", @"3", @"3", @"2", @"1", @"7", nil];
  assert_equal(expected, [ary sortByMostFrequent]);


  //
  unsigned char bytes[] = { 0x11, 0x56, 0xFF, 0xCD, 0x34, 0x30, 0xAA, 0x22 };
  NSData* expectedData = [NSData dataWithBytes:bytes length:sizeof(bytes)];
  assert_equal(expectedData, [@"1156FFCD3430AA22" hexToBytes]);

  [pool release];
  return 0;
}
