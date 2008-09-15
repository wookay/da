// Numeric.m
//                           wookay.noh at gmail.com

#import "Numeric.h"

@implementation NSNumber ( Numeric )

- (int) to_i {
  return [self intValue];
}

- (float) to_f {
  return [self floatValue];
}

- (id) to_s {
  return [self stringValue];
}

- (id) to_decimal {
  return [[self to_s] to_decimal];
}

@end



@implementation NSString ( Numeric )

- (id) to_decimal {
  id num = [self hasPrefix:@"-"] ? self : [@"+" stringByAppendingString:self];
  return [NSDecimalNumber decimalNumberWithString:num];
}

@end



@implementation NSDecimalNumber ( Numeric )

- (NSDecimalNumber*) decimalNumberByModuloBy:(NSDecimalNumber*)num {
  id <NSDecimalNumberBehaviors> behavior =
    [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                            scale:0
                            raiseOnExactness:false
                            raiseOnOverflow:true
                            raiseOnUnderflow:true
                            raiseOnDivideByZero:true];
  return [self decimalNumberBySubtracting:[self decimalNumberByDividingBy:num]
               withBehavior:behavior];
}

@end
