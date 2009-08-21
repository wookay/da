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
#define inf 1000000000
#define maxn 1100
#define maxp 1100000

//ifstream fin("data.in");
//#define cin fin

int di[]={1,0,-1,0};
int dj[]={0,1,0,-1};
map<pair<int,int>,int> M;
string s,t;
int m,nmax,nmin;

char convert(int x) {
  if(x<10) return x+'0';
  return x-10+'a';
}

void get(int i,int j,int d) {
  if(M.count(make_pair(i,j))==0)
    M[make_pair(i,j)]=0;
  int dd;
  if(d==0) dd=1;
  else if(d==1) dd=3;
  else if(d==2) dd=0;
  else dd=2;
  M[make_pair(i,j)]|=1<<dd;
  m>?=i;
  nmin<?=j;
  nmax>?=j;
}

void doit() {
  int i=-1,j=0,d=0;
  vector<pair<int,int> > u;
  vector<int> v;
  REP(k,s.length()) {
    if(s[k]=='W') {
      u.push_back(make_pair(i,j));
      v.push_back(d);
      i+=di[d], j+=dj[d];
    }
    else if(s[k]=='L') d=(d+1)%4;
    else d=(d+3)%4;
  }
  //cout << i<<' '<<j<<endl;
  d = (d+2)%4;
  int si=-1,sj=0,ti=i,tj=j;
  
  REP(k,t.length()) {
    if(t[k]=='W') {
      u.push_back(make_pair(i,j));
      v.push_back(d);
      i+=di[d], j+=dj[d];
    }
    else if(t[k]=='L') d=(d+1)%4;
    else d=(d+3)%4;
  }
  
  m=0, nmin=inf, nmax=-inf;
  M.clear();
  REP(k,u.size()) {
    i=u[k].first,j=u[k].second,d=v[k];
    int ii=i+di[d], jj=j+dj[d];
    if((i!=si||j!=sj)&&(i!=ti||j!=tj)) {
      get(i,j,d);
    }
    if((ii!=ti||jj!=tj)&&(i!=si||j!=sj)) {
      get(ii,jj,(d+2)%4);
    }
  }
  m++;
  REP(i,m) {
    FOR(j,nmin,nmax) cout << convert(M[make_pair(i,j)]);
    cout << endl;
  }
}

int main(){
  int T;
  cin>>T;
  for(int C=1; C<=T; C++) {
    M.clear();
    cin>>s>>t;
    cout << "Case #"<<C<<":"<<endl;
    doit();
  }
}
