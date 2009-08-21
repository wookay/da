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
#define REP(i,n) for (int i=0; i<n; ++i)
#define FOR(var,pocz,koniec) for (int var=pocz; var<=koniec; ++var)
#define FORD(var,pocz,koniec) for (int var=pocz; var>=koniec; --var)
#define FOREACH(it, X) for(__typeof(X.begin()) it = X.begin(); it != X.end(); ++it)
#define PB push_back
#define PF push_front
#define MP(a,b) make_pair(a,b)
#define ST first
#define ND second
#define SIZE(x) (int)x.size()

const int N=510;
const int INF=1000000010;
int koszt[N];
int used[N];

void dijkstra(int n,int start,VPII *kraw,int *dist,LL *krotnosc){
  REP(i,n) dist[i]=INF,krotnosc[i]=0;
  krotnosc[start]=1;
  dist[start]=0;
  REP(i,n) used[i]=0;
  REP(foo,n){
    int best=-1;
    REP(i,n) if (!used[i] && dist[i]<INF && (best==-1 || dist[best]>dist[i])) best=i;
    if (best==-1) break;
    used[best]=1;
    FOREACH(it,kraw[best]){
      int v=it->ST;
      if (dist[v]>dist[best]+koszt[it->ND]){
        dist[v]=dist[best]+koszt[it->ND];
        krotnosc[v]=krotnosc[best];
      } else if (dist[v]==dist[best]+koszt[it->ND]){
        krotnosc[v]+=krotnosc[best];
      }
    }
  }
}

map<string,int> mapa;

int numer(string s){
  if (mapa.count(s)) return mapa[s];
  int res=SIZE(mapa);
  return mapa[s]=res;
}

LL krotnosc[N],krotnosc2[N][N];
int dist[N],dist2[N][N];
long double prawd[N];
VPII kraw[N],kraw_rev[N];

void dodaj(int n,int start,int cel,int moge){
  REP(i,n) FOREACH(it,kraw[i]){
    int x=it->ND;
    if (dist[i]+dist2[cel][it->ST]+koszt[x]==dist[cel]){
      LL wszystkie=krotnosc[cel];
      LL moje=krotnosc[i]*krotnosc2[cel][it->ST];
      prawd[x]+=1.0/moge*(long double)moje/(long double)wszystkie;
    }
  }
}

int main(){
  int testy,m;
  cin >> testy;
  REP(foo,testy){
    mapa.clear();
    printf("Case #%d:",foo+1);
    string s;
    cin >> m >> s;
    int start=numer(s);
    REP(i,N) kraw[i].clear(),kraw_rev[i].clear();
    REP(i,N) prawd[i]=0.0;

    REP(i,m){
      cin >> s;
      int a=numer(s);
      cin >> s;
      int b=numer(s);
      cin >> koszt[i];
      kraw[a].PB(MP(b,i));
      kraw_rev[b].PB(MP(a,i));
    }
    int n=SIZE(mapa);
    dijkstra(n,start,kraw,dist,krotnosc);

    REP(i,n){
      dijkstra(n,i,kraw_rev,dist2[i],krotnosc2[i]);
    }
    int moge=0;
    REP(i,n) if (i!=start && dist[i]<INF) moge++;
    REP(i,n) if (i!=start && dist[i]<INF) dodaj(n,start,i,moge);
    REP(i,m) printf(" %.07Lf",prawd[i]);
    puts("");
  //  LL best=0;
  //  REP(i,n) REP(j,n) best=max(best,krotnosc2[i][j]);
  //  cout << best << endl;
  }
  return 0;
}
