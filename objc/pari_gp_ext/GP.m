// GP.m
//                           wookay.noh at gmail.com

#import "GP.h"

@implementation GP

- (id) init {
  self = [super init];
  pari_gp_init();
  return self;
}

- (NSString*) eval:(NSString*)str {
  return [NSString stringWithCString:pari_gp_eval([str UTF8String])];
}

- (NSString*) polinterpolate:(NSString*)sxa {
  return [NSString stringWithCString:pari_gp_polinterpolate([sxa UTF8String])];
}

@end
