// GL.h
//                           wookay.noh at gmail.com

#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

@interface GL : NSObject {
  EAGLContext* context;
  GLint backingWidth, backingHeight;
  GLuint viewRenderbuffer, viewFramebuffer;
  GLuint depthRenderbuffer;

  NSMutableArray* ok;
}

- (void) loadIdentity ;
- (void) bindFramebuffer ;
- (void) bindRenderbuffer ;
- (void) viewport ;
- (bool) createFramebuffer:(id)layer ;
- (void) destroyFramebuffer ;
- (EAGLContext*) context ;
- (void) called:(id)func ;
- (id) init:(EAGLContext*)ref ;
+ (id) create:(EAGLContext*)ref ;
+ (id) create ;

@end
