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
#define inf 1e17
#define maxn 100
#define maxp 1100000

//ifstream fin("data.in");
//#define cin fin

typedef complex<double> point;
#define x real()
#define y imag()

int n,m;
double price;
string name[maxn];
bool bad[maxn];
point P[maxn];
int M[maxn][maxn];

double F[1<<15][51][2];

double f(int mask,int cur,int b) {
  double& ret = F[mask][cur][b];
  if(ret==-1) {
    ret = inf;
    if(mask==0) {
      if(cur==m-1) ret=0;
      return ret;
    }
    REP(i,n) if((mask&1<<i) && M[cur][i]!=-1) REP(j,m) {
	int tmp = mask^(1<<i);
	double val;
	if(j==cur) {
	  ret<?=f(tmp,j,b||bad[i])+M[cur][i];
	}
	else if(bad[i] || b) {
	  ret<?=f(tmp,j,0)+M[cur][i]+(abs(P[cur])+abs(P[j]))*price;
	}
	else {
	  ret<?=f(tmp,j,0)+M[cur][i]+abs(P[j]-P[cur])*price;
	}
      }
    //cout << mask<<' '<<cur<<' '<<b<<' '<<ret<<endl;
  }
  return ret;
}

int main(){
  int T;
  cin>>T;
  for(int C=1; C<=T; C++) {
    cin>>n>>m>>price;
    REP(i,n) {
      cin>>name[i];
      bad[i]=0;
      if(name[i][name[i].length()-1]=='!') {
	bad[i]=1;
	name[i]=name[i].substr(0,name[i].length()-1);
      }
    }
    string s;
    getline(cin,s);
    memset(M,-1,sizeof(M));
    REP(i,m) {
      getline(cin,s);
      istringstream ss(s);
      ss>>P[i].x>>P[i].y;
      string t;
      while(ss>>t) {
	int k = t.find(':');
	int p = atoi(t.substr(k+1).c_str());
	t = t.substr(0,k);
	REP(j,n) if(t==name[j]) {
	  M[i][j] = p;
	  break;
	}
      }
    }
    P[m++]=point(0,0);
    /*
    REP(i,m) {
      REP(j,n) cout << M[i][j]<<' ';
      cout << endl;
    }
    */
    REP(i,1<<n) REP(j,m) REP(k,2) F[i][j][k]=-1;
    double sol = inf;
    int ii;
    REP(i,m) {
      sol<?=f((1<<n)-1,i,0)+abs(P[i])*price;
    }
    printf("Case #%d: %.7f\n",C,sol);
  }
}
