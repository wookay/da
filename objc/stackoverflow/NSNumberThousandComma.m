#import "NSNumberThousandComma.h"

@implementation NSNumber (NSNumberThousandComma)

-(NSString*) thousandComma {
  NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
  [numberFormatter setNumberStyle:kCFNumberFormatterDecimalStyle];
  [numberFormatter setGroupingSeparator:@","];
  NSString* commaString = [numberFormatter stringForObjectValue:self];
  [numberFormatter release];
  return commaString;
}

@end
