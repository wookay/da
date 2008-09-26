//
//  EAGLView.h
//  ES
//
//  Created by luis on 26/09/08.
//  Copyright masshacking 2008. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "../../GL.h"

/*
This class wraps the CAEAGLLayer from CoreAnimation into a convenient UIView subclass.
The view content is basically an EAGL surface you render your OpenGL scene into.
Note that setting the view non-opaque will only work if the EAGL surface has an alpha channel.
*/
@interface EAGLView : UIView {
    
@private
    GL* gl;
    NSTimer *animationTimer;
    NSTimeInterval animationInterval;
}

@property NSTimeInterval animationInterval;

- (void)startAnimation;
- (void)stopAnimation;
- (void)drawView;

@end
