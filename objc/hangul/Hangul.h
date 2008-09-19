// Hangul.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface NSString ( Hangul )

- (id) get_josa:(id)josa ;
- (id) chosungs ;
- (id) jungsungs ;
- (id) separate ;
- (id) separateWithCho:(bool)cho Jung:(bool)jung Jong:(bool)jong Others:(bool)others ;

@property(readonly) NSArray* chosung_list ;
@property(readonly) NSArray* jungsung_list ;
@property(readonly) NSArray* jongsung_list ;
@property(readonly) NSDictionary* josas ;

@end
