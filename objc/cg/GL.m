// GL.m
//                           wookay.noh at gmail.com

#import "GL.h"

#define USE_DEPTH_BUFFER 0

@implementation GL

- (void) loadIdentity {
  if (context) {
    glLoadIdentity();
  } else {
    [self called:@"glLoadIdentity"];
  }
}

- (void) bindFramebuffer {
  glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
}

- (void) bindRenderbuffer {
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
}

- (void) viewport {
  glViewport(0, 0, backingWidth, backingHeight);
}

- (bool) createFramebuffer:(id)layer {
  glGenFramebuffersOES(1, &viewFramebuffer);
  glGenRenderbuffersOES(1, &viewRenderbuffer);
  
  glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
  glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
  [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(CAEAGLLayer*)layer];
  glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);
  
  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
  glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);

  if (USE_DEPTH_BUFFER) {
    glGenRenderbuffersOES(1, &depthRenderbuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
    glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
  }
  
  return (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) == GL_FRAMEBUFFER_COMPLETE_OES);
}

- (void) destroyFramebuffer {
  glDeleteFramebuffersOES(1, &viewFramebuffer);
  viewFramebuffer = 0;
  glDeleteRenderbuffersOES(1, &viewRenderbuffer);
  viewRenderbuffer = 0;

  if (depthRenderbuffer) {
      glDeleteRenderbuffersOES(1, &depthRenderbuffer);
      depthRenderbuffer = 0;
  }
}

- (EAGLContext*) context {
  return context;
}

- (void) called:(id)func {
  [ok addObject:func];
}

- (id) description {
  return [NSString stringWithFormat:@"%@", ok];
}

- (int) count {
  return -1;
}

- (id) init:(EAGLContext*)ref {
  context = ref;
  ok = [NSMutableArray array];
  return self;
}

+ (id) create:(EAGLContext*)ref {
  return [[self alloc] init:ref];
}

+ (id) create {
  EAGLContext* context =
    [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
  if (context) {
    if ([EAGLContext setCurrentContext:context]) {
      return [[self alloc] init:context];
    }
  }
  return [[self alloc] init:nil];
}

@end
