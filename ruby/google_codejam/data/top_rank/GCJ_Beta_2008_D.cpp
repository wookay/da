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

const int INF = 10*1000*1001;
/* maksymalne najdrozsze skojarzenie w pelnym grafie dwudzielnym o            */
/* rownolicznych zbiorach wierzcholkow, argumenty to macierz z wagami         */
/* i liczba wierzcholkow, zwracany wynik to wektor ktory mowi co jest z czym  */
/* skojarzone.                                                                */
/* Jak chcemy najtansze to bierzemy wszystko z minusem, jak gdzies nie ma     */
/* krawedzi to dajemy -INF, przy zalozeniu, ze: n * |waga| < INF              */

VI Hungarian(int **w,int n){
  int lx[n],ly[n],skojx[n],skojy[n];
  int markx[n],marky[n],slack[n],par[n],q[n];
  REP(i,n){ skojx[i]=skojy[i]=-1; ly[i]=0; lx[i]=*max_element(w[i], w[i]+n); }
  REP(k,n){
    int v=-1,qb=0,qe=0;
    REP(i,n){ marky[i]=markx[i]=0; slack[i]=-1; if (skojx[i]==-1) q[qe++]=i;}
    while (v==-1){
      while (qb<qe){
        int i=q[qb++]; markx[i]=1;
        REP(j,n)
          if (!marky[j] && (slack[j]==-1 || slack[j]>lx[i]+ly[j]-w[i][j])){
            if ((slack[j] = lx[ par[j]=i ]+ly[j]-w[i][j]) == 0){
              marky[j]=1;
              if (skojy[j]!=-1) q[qe++]=skojy[j]; else {v=j; goto koniec;}
            }
          }
      }
      int x=-1; REP(i,n) if (!marky[i] && (x==-1 || slack[i] < x)) x=slack[i];
      REP(i,n){
        if (markx[i]) lx[i]-=x; 
        if (marky[i]) ly[i]+=x; else
          if ((slack[i] -= x) == 0){
            marky[i]=1; if (skojy[i] != -1) q[qe++]=skojy[i]; else v=i;
          }
      }
    }
koniec:
    while (v!=-1){int y=skojx[par[v]]; skojx[par[v]]=v; skojy[v]=par[v]; v=y;}
  }
  return VI(skojx,skojx+n);
}

VPII vp;
int n;
char txt[1000*1000];

void wczyt(void){
  fgets(txt, 999999, stdin);
  istringstream iss(txt);
  int c;
  vp.clear();
  while((iss>>c)){
    --c;
    vp.PB(MP(c, 0));
  }
  n = SIZE(vp);
  fgets(txt, 999999, stdin);
  istringstream iss2(txt);
  REP(i, n){
    iss2 >> c;
    vp[i].ND = c;
  }
}

int **hunt;
const int N = 100;

inline PII wsp(int a){
  int r = 0;
  FOR(l, (n+1)/2, n){
    if (a < l)
      return MP(r, a);
    a -= l;
    r++;
  }
  int c = 1;
  FORD(l, n-1, (n+1)/2){
    if (a < l)
      return MP(r, c + a);
    r++;
    c++;
    a -= l;
  }
  return MP(0, 0);
}

inline int odl(int a, int b){
  PII pa = wsp(a);
  PII pb = wsp(b);
  if (pa.ST > pb.ST) swap(pa, pb);
  if (pa.ND >= pb.ND) return pb.ST-pa.ST + pa.ND-pb.ND;
  return max(pb.ST - pa.ST, pb.ND - pa.ND);
}

void rob1(vector<int> &v){
  v.clear();
  int m = 0;
  FOR(l, (n+1)/2, n-1) m += l;
  REP(i, n) v.PB(m++);
}

void rob2(VI &v){
  v.clear();
  int m = 0;
  v.PB(m);
  FOR(l, (n+1)/2, n-1){
    m += l+1;
    v.PB(m);
  }
  FORD(l, n-1, (n+1)/2){
    m += l+1;
    v.PB(m);
  }
}

void rob3(VI &v){
  v.clear();
  int m = (n+1)/2 - 1;
  v.PB(m);
  FOR(l, (n+1)/2, n-1){
    m += l;
    v.PB(m);
  }
  FORD(l, n-1, (n+1)/2){
    m += l;
    v.PB(m);
  }
}
int besciak;

void spr(VI &v){
  REP(i, n)
    REP(j, n)
      hunt[i][j] = 5000-odl(vp[i].ST, v[j]) * vp[i].ND;
  VI w = Hungarian(hunt, n);
  int c = 0;
  REP(i, n)
    c += hunt[i][w[i]];
  c = 5000*n - c;
  besciak = min(besciak, c);
}

int licz(void){
  VI v;
  besciak = INF;
  rob1(v);
  spr(v);
  rob2(v);
  spr(v);
  rob3(v);
  spr(v);
  return besciak;
}

int main(){
  int te;
  fgets(txt, 999999, stdin);
  sscanf(txt, "%d", &te);
  hunt = new int*[N];
  REP(i, N) hunt[i] = new int[N];
  FOR(nr, 1, te){
    wczyt();
    int wynik = licz();
    printf("Case #%d: %d\n", nr, wynik);
  }
	return 0;
}
