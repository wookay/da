#import "test.h"

@implementation UnitTest (Chipmunk)

- (void) cpVect:(cpVect)expected cpVect:(cpVect)got {
  [self a:[NSString stringWithCString:cpvstr(expected)
                    encoding:NSUTF8StringEncoding]
        cpVect:got];
}

- (void) a:(id)expected cpVect:(cpVect)got {
  [self a:expected b:[NSString stringWithCString:cpvstr(got) 
                               encoding:NSUTF8StringEncoding]];
}

- (void) a:(id)expected joints:(cpArray*)got {
  NSMutableArray* ary = [NSMutableArray array];
  for (int i=0; i<got->num; i++) {
    cpJoint* joint = got->arr[i];
    NSArray* jointTypes =
      [@"pin pivot slide groove custom" componentsSeparatedByString:@" "];
    [ary addObject:[jointTypes objectAtIndex:joint->klass->type]];
  }
  [self a:expected b:ary];
}

- (void) a:(id)expected bodies:(cpArray*)got {
  NSMutableArray* ary = [NSMutableArray array];
  for (int i=0; i<got->num; i++) {
    cpBody* body = got->arr[i];
    [ary addObject:[NSNumber numberWithFloat:body->m]];
  }
  [self a:expected b:ary];
}

- (void) a:(id)expected arbiters:(cpArray*)got {
  NSMutableArray* ary = [NSMutableArray array];
  for (int i=0; i<got->num; i++) {
    cpArbiter* arb = got->arr[i];
    [ary addObject:[NSNumber numberWithInt:arb->numContacts]];
  }
  [self a:expected b:ary];
}

- (void) a:(id)expected shapes:(cpSpaceHash*)got {
  NSMutableArray* ary = [NSMutableArray array];
  cpHashSet* set = got->handleSet;
  for (int i=0; i<set->size; i++) {
    cpHashSetBin *bin;
    for(bin = set->table[i]; bin; bin = bin->next) {
      [ary addObject:[NSNumber numberWithUnsignedInt:bin->hash]];
    }
  }
  [self a:expected b:ary];
}

- (void) a:(id)expected contactSet:(cpHashSet*)got {
  [self a:expected cpHashSet:got];
}

- (void) a:(id)expected collFuncSet:(cpHashSet*)got {
  [self a:expected cpHashSet:got];
}

- (void) a:(id)expected cpHashSet:(cpHashSet*)got {
  NSMutableArray* ary = [NSMutableArray array];
  for(int i=0; i<got->size; i++){
    cpHashSetBin *bin;
    for(bin = got->table[i]; bin; bin = bin->next) {
      [ary addObject:[NSNumber numberWithUnsignedInt:bin->hash]];
    }
  }
  [self a:expected b:ary];
}

@end
