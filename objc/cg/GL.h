// GL.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>

@interface GL : NSObject {
  EAGLContext* context;
  NSMutableArray* ok;
}

- (void) loadIdentity ;
- (void) called:(id)func ;
+ (id) create ;

@end
