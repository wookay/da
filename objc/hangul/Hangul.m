// Hangul.m
//                           wookay.noh at gmail.com

#import "Hangul.h"
#import "../fun/String.h"

#define U(s) [NSString stringWithUTF8String:s]

@implementation NSString ( Hangul )

- (id) get_josa:(id)josa {
  if ([@"" isEqualToString:[[self separate] lastObject]]) {
    return [[self josas] objectForKey:josa];
  } else {
    return josa;
  }
}

- (id) chosungs {
  return [self separateWithCho:true Jung:false Jong:false Others:false];
}

- (id) jungsungs {
  return [self separateWithCho:false Jung:true Jong:false Others:false];
}

- (id) separate {
  return [self separateWithCho:true Jung:true Jong:true Others:true];
}

- (id) separateWithCho:(bool)cho Jung:(bool)jung Jong:(bool)jong Others:(bool)others {
  NSMutableArray* separated = [NSMutableArray array];
  int idx;
  for (idx = 0;idx < [self length]; idx++) {
    unichar c = [self characterAtIndex:idx];
    int n = c & 0xFFFF;
    if (n >= 0xAC00 && n <= 0xD7A3) {
      n -= 0xAC00;
      int n1 = n / (21*28);
      n %= 21*28;
      int n2 = n / 28;
      int n3 = n % 28;
      if (cho) {
        [separated addObject:[[self chosung_list] objectAtIndex:n1]];
      }
      if (jung) {
        [separated addObject:[[self jungsung_list] objectAtIndex:n2]];
      }
      if (jong) {
        [separated addObject:[[self jongsung_list] objectAtIndex:n3]];
      }
    } else {
      if (others) {
        [separated addObject:[NSString stringWithFormat:@"%C", c]];
      }
    }
  }
  return separated;
}

- (NSArray*) chosung_list {
  return [U("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ") split:@""];
} 

- (NSArray*) jungsung_list {
  return [U("ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ") split:@""];
} 

- (NSArray*) jongsung_list {
  return [[NSArray arrayWithObject:@""] arrayByAddingObjectsFromArray:
    [U("ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ") split:@""]];
} 

- (NSDictionary*) josas {
  return [NSDictionary dictionaryWithObjectsAndKeys:
    U("가"), U("이"), U("는"), U("은"), U("를"), U("을"), U("와"), U("과"), nil];
}

@end
