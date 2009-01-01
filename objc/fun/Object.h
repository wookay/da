// Object.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject ( Object )

- (NSArray*) instance_variables ;
- (NSArray*) methods ;
- (id) send:(NSString*)method ;
- (id) send:(NSString*)method withObject:(id)anObject ;
- (id) send:(NSString*)method withObject:(id)anObject withObject:(id)anotherObject ;
- (id) send:(NSString*)method int:(int)value ;
- (NSString*) inspect ;
- (void) def:(NSString*)method id:(IMP)block ;
- (void) def:(NSString*)method int:(IMP)block ;
- (void) def:(NSString*)method void:(IMP)block ;
- (void) def:(NSString*)method Method:(Method)block ;
- (Class) class:(id)className superclass:(id)superclassName ;
  

@end
