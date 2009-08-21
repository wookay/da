#include <cstdio>
#include <iostream>
#include <algorithm>
#include <set>
#include <map>
#include <stack>
#include <list>
#include <queue>
#include <deque>
#include <cctype>
#include <string>
#include <vector>
#include <sstream>
#include <iterator>
#include <numeric>
#include <cmath>
using namespace std;

typedef vector <int > VI;
typedef vector < VI > VVI;
typedef long long LL;
typedef vector < LL > VLL;
typedef vector < double > VD;
typedef vector < string > VS;
typedef pair<int,int> PII;
typedef vector <PII> VPII;
typedef istringstream ISS;

#define ALL(x) x.begin(),x.end()
#define REP(i,n) for (int i=0; i<(n); ++i)
#define FOR(var,pocz,koniec) for (int var=(pocz); var<=(koniec); ++var)
#define FORD(var,pocz,koniec) for (int var=(pocz); var>=(koniec); --var)
#define FOREACH(it, X) for(__typeof((X).begin()) it = (X).begin(); it != (X).end(); ++it)
#define PB push_back
#define PF push_front
#define MP(a,b) make_pair(a,b)
#define ST first
#define ND second
#define SIZE(x) (int)x.size()

struct POINT{
  int x, y;
  void wczyt(void){
    scanf("%d%d", &x, &y);
  }
};


inline int det(POINT a, POINT b, POINT c){
  return (b.x-a.x) * (c.y-a.y) - (c.x-a.x) * (b.y-a.y);
}

inline int skal(POINT a, POINT b, POINT c){
  return (b.x-a.x) * (c.x-a.x) + (c.y-a.y) * (b.y-a.y);
}

POINT A, B, C;

int main(){
  int te;
  scanf("%d", &te);
  FOR(nr, 1, te){
     A.wczyt();
     B.wczyt();
     C.wczyt();
     printf("Case #%d: ", nr);
     char *s1, *s2;
     if (det(A, B, C) == 0){
       s1 = "not"; s2 = "a";
     }else{
       s1 = "scalene";
       if (skal(A, B, B) == skal(A, C, C)) s1 = "isosceles";
       if (skal(C, B, B) == skal(A, C, C)) s1 = "isosceles";
       if (skal(A, B, B) == skal(B, C, C)) s1 = "isosceles";

       s2 = "acute";
       {
         int c = skal(A, B, C);
         if (c == 0) s2 = "right";
         else if (c < 0) s2 = "obtuse";
       }
       {
         int c = skal(C, A, B);
         if (c == 0) s2 = "right";
         else if (c < 0) s2 = "obtuse";
       }
       {
         int c = skal(B, A, C);
         if (c == 0) s2 = "right";
         else if (c < 0) s2 = "obtuse";
       }
     }
     printf("%s %s triangle\n", s1, s2);
  }
	return 0;
}
