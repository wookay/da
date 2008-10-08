//
//  PathView.m
//  Path
//
//  Created by luis on 26/09/08.
//  Copyright 2008 masshacking. All rights reserved.
//

#import "PathView.h"
#import "../../../cg/CG.h"

#import <CGContext.h>
#define _ nil


@implementation PathView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    id cg = [CG create:context];
    [cg setRGBFillColor:_ red:255 green:0 blue:0];
    [cg fillRect:_ x:10 y:10 width:10 height:10];
}


- (void)dealloc {
    [super dealloc];
}


@end