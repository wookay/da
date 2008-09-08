// Matrix.m
//                           wookay.noh at gmail.com

#import "test.h"

@implementation Matrix

- (id) plus:(id)matrix {
  return [self operator:kCFNumberFormatterPlusSign with:matrix];
}

- (id) minus:(id)matrix {
  return [self operator:kCFNumberFormatterMinusSign with:matrix];
}

- (id) operator:(CFStringRef)op with:(id)matrix {
  NSMutableArray* new_rows = [NSMutableArray array];
  int i, j;
  for (i = 0; i < [self row_size]; i++) {
    NSMutableArray* new_row = [NSMutableArray array];
    for (j = 0; j < [self column_size]; j++) {
      float value; 
      float x = [[self getElement:i j:j] floatValue];
      float y = [[matrix getElement:i j:j] floatValue];
      if (op == kCFNumberFormatterMinusSign) {
        value = x - y;
      } else {
        value = x + y;
      }
      [new_row addObject:[NSNumber numberWithFloat:value]];
    }
    [new_rows addObject:new_row];
  }
  return [[self class] matrixWithRows:new_rows];
}

- (id) multiply:(id)matrix {
  int i, j, k;
  Matrix* mat = [[self class] zero:[self row_size] by:[matrix column_size]];
  for (i = 0; i < [self row_size]; i++) {
    for (j = 0; j < [matrix column_size]; j++) {
      for (k = 0; k < [matrix row_size]; k++) {
        float x = [[self getElement:i j:k] floatValue];
        float y = [[matrix getElement:k j:j] floatValue];
        float value = [[mat getElement:i j:j] floatValue];
        [mat setElement:i j:j with:[NSNumber numberWithFloat:value + (x * y)]];
      }
    }
  }
  return mat;
}

- (id) transpose {
  return [[self class] matrixWithColumns:rows];
}

- (id) getElement:(int)i j:(int)j {
  return [[rows objectAtIndex:i] objectAtIndex:j];
}

- (void) setElement:(int)i j:(int)j with:(id)obj {
  NSMutableArray* row = [NSMutableArray arrayWithArray:[rows objectAtIndex:i]];
  [row replaceObjectAtIndex:j withObject:obj];
  [rows replaceObjectAtIndex:i withObject:row];
}

- (int) row_size {
  return [rows count];
}

- (int) column_size { 
  return [[rows objectAtIndex:0] count];
}

- (NSString*) description {
  NSMutableArray* ary = [NSMutableArray array];
  for (id cols in rows) {
    [ary addObject:[cols componentsJoinedByString:@" "]];
  }
  return [ary componentsJoinedByString:@"\n"];
}

+ (id) zero:(int)size {
  return [self zero:size by:size];
}

+ (id) zero:(int)m by:(int)n {
  int idx;
  NSMutableArray* zeros = [NSMutableArray array];
  for (idx = 0; idx < n ; idx++) {
    [zeros addObject:[NSNumber numberWithInt:0]];
  }
  NSMutableArray* rows = [NSMutableArray array];
  for (idx = 0; idx < m ; idx++) {
    NSMutableArray* row = [NSMutableArray arrayWithArray:zeros];
    [rows addObject:row];
  }
  return [self matrixWithRows:rows];
}

+ (id) identity:(int)size {
  return [self scalar:size float:1];
}

+ (id) scalar:(int)size int:(int)value {
  return [self scalar:size float:value];
}

+ (id) scalar:(int)size float:(float)value {
  NSMutableArray* values = [NSMutableArray array];
  int idx;
  for (idx = 0; idx < size; idx++) {
    [values addObject:[NSNumber numberWithFloat:value]];
  }
  return [self diagonal:values];
}

+ (id) diagonal:(NSArray*)values {
  int size = [values count]; 
  NSMutableArray* zeros = [NSMutableArray array];
  int idx;
  for (idx = 0; idx < size ; idx++) {
    [zeros addObject:[NSNumber numberWithInt:0]];
  }
  NSMutableArray* rows = [NSMutableArray array];
  for (idx = 0; idx < size ; idx++) {
    NSMutableArray* row = [NSMutableArray arrayWithArray:zeros];
    [row replaceObjectAtIndex:idx withObject:[values objectAtIndex:idx]];
    [rows addObject:row];
  }
  return [self matrixWithRows:rows];
}

+ (id) matrixWithRows:(NSArray*)rows {
  Matrix* matrix = [self alloc];
  [matrix setValue:rows forKey:@"rows"];
  return matrix;
}

+ (id) matrixWithColumns:(NSArray*)columns {
  int first_column_size = [[columns objectAtIndex:0] count];
  int i, j;
  NSMutableArray* rows = [NSMutableArray array];
  for (i = 0; i < first_column_size; i++) {
    NSMutableArray* row = [NSMutableArray array];
    for (j = 0; j < [columns count]; j++) {
      [row addObject:[[columns objectAtIndex:j] objectAtIndex:i]];
    }
    [rows addObject:row];
  }
  Matrix* matrix = [self alloc];
  [matrix setValue:rows forKey:@"rows"];
  return matrix;
}

+ (NSArray*) numbersFromString:(NSString*)string {
  NSMutableArray* ary = [NSMutableArray array]; 
  for (id obj in [string componentsSeparatedByString:@" "]) {
    [ary addObject:[NSNumber numberWithFloat:[obj floatValue]]];
  }
  return ary; 
}

+ (NSArray*) rowsFromString:(NSString*)string {
  NSMutableArray* ary = [NSMutableArray array]; 
  for (id row in [string componentsSeparatedByString:@"\n"]) {
    [ary addObject:[[self class] numbersFromString:row]];
  }
  return ary;
}

@end
