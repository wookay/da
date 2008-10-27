def assert_equal(expected, got):
  if expected==got:
    print("passed: %s" % expected)
  else:
    print("Assertion failed\nExpected: %s\nGot: %s" % (expected, got))

import math
from math import sqrt

# PCI_Code/chapter10/clusters.py
def euclidean(v1,v2):
  sqsum=sum([math.pow(v1[i]-v2[i],2) for i in range(len(v1))])
  return math.sqrt(sqsum)

# PCI_Code/chapter10/clusters.py
def pearson(v1,v2):
  # Simple sums
  sum1=sum(v1)
  sum2=sum(v2)

  # Sums of the squares
  sum1Sq=sum([pow(v,2) for v in v1])
  sum2Sq=sum([pow(v,2) for v in v2])

  # Sum of the products
  pSum=sum([v1[i]*v2[i] for i in range(len(v1))])

  # Calculate r (Pearson score)
  num=pSum-(sum1*sum2/len(v1))
  den=sqrt((sum1Sq-pow(sum1,2)/len(v1))*(sum2Sq-pow(sum2,2)/len(v1)))
  if den==0: return 0

  return 1.0-(num/den)

# Weighted Mean
def weightedmean(x,w):
  num=sum([x[i]*w[i] for i in range(len(w))])
  den=sum([w[i] for i in range(len(w))])
  return num/den

# Tanimoto Coefficient
def tanimoto(a,b):
  c=[v for v in a if v in b]
  return float(len(c))/(len(a)+len(b)-len(c))

# PCI_Code/chapter7/treepredict.py
# Probability that a randomly placed item will be in the wrong category
def giniimpurity(l):
  total=len(l)
  counts={}
  for item in l:
    counts.setdefault(item,0)
    counts[item]+=1
  imp=0
  for j in l:
    f1=float(counts[j])/total
    for k in l:
      if j==k: continue
      f2=float(counts[k])/total
      imp+=f1*f2
  return imp



# if __name__ == '__main__':
assert_equal( 1              , euclidean([1], [2])        )   
assert_equal( sqrt(2)        , euclidean([1,1], [2,2])    )   
assert_equal( 0              , pearson([1,1], [2,2])      )
assert_equal( 1              , weightedmean([1,1], [2,2]) )
assert_equal( 0              , tanimoto([1,1], [2,2])     )
assert_equal( 2              , giniimpurity([1,1,2,2])    )
assert_equal( 1.125          , giniimpurity([1,1,1,5])    )
