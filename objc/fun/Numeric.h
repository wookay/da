// Numeric.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface NSNumber ( Numeric )

- (int) to_i ;
- (float) to_f ;
- (id) to_s ;
- (id) to_decimal ;

@end



@interface NSString ( Numeric )

- (id) to_decimal ;

@end



@interface NSDecimalNumber ( Numeric )

- (NSDecimalNumber*) decimalNumberByModuloBy:(NSDecimalNumber*)num;

@end
