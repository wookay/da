// Hangul.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface NSString ( Hangul )

@property(readonly) NSArray* chosungs ;
@property(readonly) NSArray* jungsungs ;
@property(readonly) NSArray* jongsungs ;
@property(readonly) NSDictionary* josas ;

- (id) separate ;
- (id) get_josa:(id)josa ;

@end
