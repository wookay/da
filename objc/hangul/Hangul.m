// Hangul.m
//                           wookay.noh at gmail.com

#import "Hangul.h"
#import "../fun/String.h"

#define U(s) [NSString stringWithUTF8String:s]

@implementation NSString ( Hangul )

- (NSArray*) chosungs {
  return [U("ㄱㄲㄴㄷㄸㄹㅁㅂㅃㅅㅆㅇㅈㅉㅊㅋㅌㅍㅎ") split:@""];
} 

- (NSArray*) jungsungs {
  return [U("ㅏㅐㅑㅒㅓㅔㅕㅖㅗㅘㅙㅚㅛㅜㅝㅞㅟㅠㅡㅢㅣ") split:@""];
} 

- (NSArray*) jongsungs {
  return [[NSArray arrayWithObject:@""] arrayByAddingObjectsFromArray:
    [U("ㄱㄲㄳㄴㄵㄶㄷㄹㄺㄻㄼㄽㄾㄿㅀㅁㅂㅄㅅㅆㅇㅈㅊㅋㅌㅍㅎ") split:@""]];
} 

- (NSDictionary*) josas {
  return [NSDictionary dictionaryWithObjectsAndKeys:
    U("가"), U("이"), U("는"), U("은"), U("를"), U("을"), U("와"), U("과"), nil];
}

- (id) get_josa:(id)josa {
  if ([@"" isEqualToString:[[self separate] lastObject]]) {
    return [[self josas] objectForKey:josa];
  } else {
    return josa;
  }
}

- (id) separate {
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
      [separated addObject:[[self chosungs] objectAtIndex:n1]];
      [separated addObject:[[self jungsungs] objectAtIndex:n2]];
      [separated addObject:[[self jongsungs] objectAtIndex:n3]];
    } else {
      [separated addObject:[NSString stringWithFormat:@"%C", c]];
    }
  }
  return separated;
}

@end
