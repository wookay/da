// Ord.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

#define ORD_KEYS @"ordKeys"
#define ORD_DICTIONARY @"ordDictionary"

@interface OrderedDictionary : NSDictionary {
  NSArray* ordKeys;
  NSDictionary* ordDictionary;
}

+ (id) dictionaryWithObjectsAndKeysFromArray:(id)array ;

@end
