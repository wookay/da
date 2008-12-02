// test.h
//                           wookay.noh at gmail.com

#import "../unittest/UnitTest.h"
#import "Enumerable.h"
#import "Numeric.h"
#import "String.h"
#import "Array.h"
#import "Hash.h"
#import "Ord.h"
@interface EnumerableTest : UnitTestable {} @end
@interface NumericTest : UnitTestable {} @end
@interface StringTest : UnitTestable {} @end
@interface ArrayTest : UnitTestable {} @end
@interface HashTest : UnitTestable {} @end
@interface OrdTest : UnitTestable {} @end
@interface AssertTest : UnitTestable {} @end

typedef int( *funcPtr )( int );
@interface FunctionTest : UnitTestable {} 
- (int) call:(funcPtr)func number:(int)number ;
@end
