// Ord.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

#define ORD_KEYS @"ordKeys"
#define ORD_DICTIONARY @"ordDictionary"

@interface OrderedDictionary : NSObject {
  NSArray* ordKeys;
  NSDictionary* ordDictionary;
}

+ (id) dictionaryWithObjectsAndKeys:(id)value, ... ;
+ (id) dictionaryWithObjectsAndKeysFromArray:(id)array ;
- (id) allKeys ;
- (id) allValues ;
- (id) objectForKey:(id)key ;
- (id) valueForKey:(id)key ;

@end
