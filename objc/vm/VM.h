// VM.h
//                           wookay.noh at gmail.com

#import <Foundation/Foundation.h>

@interface VM : NSObject {
  double wired;
  double active;
  double inactive;
  double free;
}

@property (nonatomic) double wired;
@property (nonatomic) double active;
@property (nonatomic) double inactive;
@property (nonatomic) double free;

+ (VM*) vm ;
- (double) total ;

@end
