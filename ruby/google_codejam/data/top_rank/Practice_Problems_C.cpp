#include <iostream>
#include <sstream>
#include <fstream>
#include <algorithm>
#include <vector>
#include <list>
#include <string>
#include <map>
#include <set>
#include <queue>
#include <stack>
#include <complex>
#include <cstdio>
#include <cassert>
#include <cmath>

#if defined (__GNUC__) && (__GNUC__ <= 2)
#include <hash_map>
#include <hash_set>
#else
#include <ext/hash_map>
#include <ext/hash_set>
using namespace __gnu_cxx;
#endif
using namespace std;

#define FOR(i,a,b) for(int i=(a),_b=(b);i<=_b;i++)
#define REP(i,n) FOR(i,0,(n)-1)
#define FORD(i,a,b) for(int i=(a),_b=(b);i>=_b;i--)
#define sz size()
template<class T> inline int size(const T& c) { return c.sz; }
#define FORA(i,c) REP(i,size(c))

#define itype(c) __typeof((c).begin())
#define FORE(e,c) for(itype(c) e=(c).begin();e!=(c).end();e++)
#define pb push_back
#define X first
#define Y second
#define mp make_pair
#define all(x) (x).begin(),(x).end()
#define SORT(x) sort(all(x))
#define REVERSE(x) reverse(all(x))
#define CLEAR(x,c) memset(x,c,sizeof(x)) 

typedef long long LL;
typedef vector<int> VI;
typedef vector<VI> VVI;
typedef vector<string> VS;
LL s2i(string s) { istringstream i(s); LL x; i>>x; return x; }
template<class T> string i2s(T x) { ostringstream o; o << x; return o.str(); }

#define pi acos(-1.)
#define eps 1e-7
#define inf 1LL<<32
#define maxn 1100
#define maxp 1100000

//ifstream fin("data.in");
//#define cin fin

LL F[maxn][maxn];
/*
  f(d,b) = f(d-1,b)+f(d-1,b-1)+1
  f(d,0) = 0
  d(1,x) = 1
  
  f(d,1) = d
  f(d,2) = (d+1)*d/2
  f(d,3) = (d^2+5)*d/6
 */

LL g(LL d,LL b) {
  b<?=d;
  if(d<maxn && b<maxn) return F[d][b];
  if(b==0) return 0;
  if(b==1) return d;
  if(b==2) {
    LL x = (d+1)*d/2;
    x<?=inf;
    return x;
  }
  if(b==3) {
    LL x = d*d+5;
    x<?=inf;
    x*=d/6;
    x<?=inf;
    return x;
  }
  return inf;
}

LL getd(LL f,LL d,LL b) {
  LL low=0,high=d;
  while(high-low>1) {
    LL m = (low+high)/2;
    if(g(m,b)<f) low=m;
    else high=m;
  }
  return high;
}
LL getb(LL f,LL d,LL b) {
  b<?=d;
  LL low=0,high=b;
  while(high-low>1) {
    LL m = (low+high)/2;
    if(g(d,m)<f) low=m;
    else high=m;
  }
  return high;
}

int main(){
  FOR(j,1,maxn-1) F[1][j]=1;
  FOR(i,1,maxn-1) FOR(j,1,maxn-1) {
    LL x=F[i-1][j-1], y=F[i-1][j];
    if(x==inf||y==inf||x+y+1>=inf) F[i][j]=inf;
    else F[i][j]=x+y+1;
  }
  int T;
  cin>>T;
  for(int C=1; C<=T; C++) {
    LL f,d,b,fmax,dmin,bmin;
    cin>>f>>d>>b;
    fmax=g(d,b),dmin=getd(f,d,b),bmin=getb(f,d,b);
    if(fmax==inf) fmax=-1;
    cout << "Case #"<<C<<": "<<fmax<<' '<<dmin<<' '<<bmin<<endl;
  }
}
