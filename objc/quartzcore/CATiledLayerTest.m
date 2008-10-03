// CATiledLayerTest.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation CATiledLayerTest

- (void) unittest {

  #if TARGET_CPU_X86
  CATiledLayer* myLayer = [CATiledLayer layer];
  [assert_equal a:@"{256, 256}" CGSize:[myLayer tileSize]];
  [assert_equal double:0.25 double:[CATiledLayer fadeDuration]];
  #endif

}

@end
