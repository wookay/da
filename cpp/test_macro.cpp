// test_macro.cpp
//                           wookay.noh at gmail.coma

#include <iostream>
#include <vector>
using namespace std;

#define REP(i,n) for (int i=0; i<(n); ++i)
#define sz size()
#define itype(c) __typeof((c).begin())
#define FORE(e,c) for(itype(c) e=(c).begin();e!=(c).end();e++)
#define pb push_back
#define mp(a,b) make_pair(a,b)
#define X first
#define Y second

typedef vector<int> VI;
typedef vector<string> VS;

void assert_equal(int expected, int got) {
  if (expected==got) {
    printf("passed: %d\n", expected);
  } else {
    printf("Assertion failed\nExpected: %d\nGot: %d\n", expected, got);
  }
}

int main(){
  vector<pair<string, int> > v;
  int n = 3;
  assert_equal(0, v.sz);
  REP(i, n) v.pb(mp("abcde", 50));
  assert_equal(3, v.sz);
  assert_equal(5, v[0].X.sz);
  FORE(it, v){
    assert_equal(50, it->Y);
  }
}
