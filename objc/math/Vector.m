// Vector.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation Vector

// 길이
- (float) length { 
  return sqrt([self X]*[self X] + [self Y]*[self Y] + [self Z]*[self Z]);
}

// 단위벡터
- (id) normalize {
  float length = [self length];
  return [[self class] vectorWithX:[self X]/length Y:[self Y]/length Z:[self Z]/length];
}

- (id) plus:(id)vector {
  return [[self class] vectorWithX:[self X]+[vector X]
                                 Y:[self Y]+[vector Y]
                                 Z:[self Z]+[vector Z]];
}

- (id) minus:(id)vector {
  return [[self class] vectorWithX:[self X]-[vector X]
                                 Y:[self Y]-[vector Y]
                                 Z:[self Z]-[vector Z]];
}

- (id) scale:(float)k {
  return [[self class] vectorWithX:[self X]*k
                                 Y:[self Y]*k
                                 Z:[self Z]*k];
}

// 내적
- (float) dot:(id)vector {
  return ([self X]*[vector X] + [self Y]*[vector Y] + [self Z]*[vector Z]);
}

// 투영
- (id) scale_dot:(Vector*)vector {
  return [self scale:[vector dot:self] / ([self length] * [self length])];
}

+ (id) vectorWithX:(CGFloat)x Y:(CGFloat)y Z:(CGFloat)z {
  return [super vectorWithX:x Y:y Z:z];
}

@end
