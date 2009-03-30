// KVCTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@interface A : NSObject
@end

@implementation A
@end

@implementation KVCTest

- (void) unittest {

  id obj = [NSArray arrayWithObjects:
     [NSArray array],
     [NSArray array], nil];
  //id obj = [NSDictionary dictionary];//\'Array arrayWithObjects:@"1", nil];
  id b = [obj valueForKey:@"@sum.@count"];
  NSLog(@"%@", [b class]);

  //[obj setValue:@"value" forKey:@"key"];
  //[assert_equal a:@"value" b:[obj valueForKey:@"key"]];
  //[assert_equal a:@"value" b:b];

}

@end
