// Vector.m
//                           wookay.noh at gmail.com

#import "Vector.h"

@implementation Vector

- (float) length { 
  return sqrt([self X]*[self X] + [self Y]*[self Y] + [self Z]*[self Z]);
}

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

- (float) dot_product:(id)vector {
  return ([self X]*[vector X] + [self Y]*[vector Y] + [self Z]*[vector Z]);
}

- (id) cross_product:(Vector*)vector {
  return [[self class] vectorWithX:[self Y]*[vector Z] - [self Z]*[vector Y]
                                 Y:[self Z]*[vector X] - [self X]*[vector Z]
                                 Z:[self X]*[vector Y] - [self Y]*[vector X]];
}

- (id) projection:(Vector*)vector {
  return [self scale:
           [vector dot_product:self] / ([self length] * [self length])];
}

- (float) X {
  return [X floatValue];
}

- (float) Y {
  return [Y floatValue];
}

- (float) Z {
  return [Z floatValue];
}

#define F(v) [NSNumber numberWithFloat:(v)]

+ (id) vectorWithX:(float)x Y:(float)y Z:(float)z {
  Vector* vector = [[self alloc] init];
  [vector setValue:F(x) forKey:@"X"];
  [vector setValue:F(y) forKey:@"Y"];
  [vector setValue:F(z) forKey:@"Z"];
  return vector; 
}


- (NSString*) description {
  return [NSString stringWithFormat:@"[%@ %@ %@]", X, Y, Z];
}

@end
