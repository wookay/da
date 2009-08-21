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

int t[100][100];

const int INF = 1000*1000;

int nwp(vector<int> &v){
  int n = SIZE(v);
  REP(i, n+1) REP(j, n+1) t[i][j] = INF;
  t[0][0] = -1;
  REP(i, n)
    REP(j, n){
      if (v[i] > t[i][j])
        t[i+1][j+1] = min(t[i+1][j+1], v[i]);
      t[i+1][j] = min(t[i+1][j], t[i][j]);
    }
  FORD(i, n, 0)
    if (t[n][i] < INF)
      return i;
  return 0;
}

vector<string> naz;
vector<int> ceny;

int s2i(string &s){
  int x;
  sscanf(s.c_str(), "%d", &x);
  return x;
}

void wczytaj(){
  naz.clear();
  ceny.clear();

  string s;
  while(1){
    cin >> s;
    if ((s[0] < 'a' || s[0] > 'z') && s[0] != '_') break;
    naz.PB(s);
  }
  ceny.PB(s2i(s));
  REP(i, SIZE(naz)-1){
    int x; cin >> x;
    ceny.PB(x);
  }
}



int main(){
  int te;
  cin >> te;
  FOR(nr, 1, te){
    printf("Case #%d:", nr);

    wczytaj();

    int wyn = nwp(ceny);
    vector<pair<string, int> > v;
    int n = SIZE(ceny);
    REP(i, n) v.PB(MP(naz[i], ceny[i]));
    sort(ALL(v));
    vector<string> wypis;
    FOREACH(it, v){
      VI w;
      REP(i, n) if (it->ST != naz[i])
        w.PB(ceny[i]);
      if (wyn == nwp(w)){
        wypis.PB(it->ST);
        int id = 0;
        REP(i, n) if (it->ST == naz[i]){ id = i; break; }
        while (id < n-1){
          swap(naz[id], naz[id+1]);
          swap(ceny[id], ceny[id+1]);
          id++;
        }
        naz.pop_back();
        ceny.pop_back();
        n--;
      }
    }
    sort(ALL(wypis));
    FOREACH(it, wypis) printf(" %s", it->c_str());
    printf("\n");
  }
	return 0;
}
