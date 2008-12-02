\\ formulas
\\                           wookay.noh at gmail.com

read("../unittest")
read("../fun.vector") \\ vecsum CountedSet

\\ Euclidean Distance
euclidean(v1, v2) = {
  sqrt(sum(i=1, #v1, (v1[i]-v2[i])^2))
}

\\ Pearson Correlation Coefficient
pearson(v1, v2) = { 
  local(sum1, sum2, sum1Sq, sum2Sq, pSum, num, den);
  sum1 = vecsum(v1);
  sum2 = vecsum(v2);
  sum1Sq = vecsum(apply(x-> x^2, v1));
  sum2Sq = vecsum(apply(x-> x^2, v2));
  pSum = sum(x=1, #v1, v1[x]*v2[x]);
  num = pSum - (sum1*sum2/#v1);
  den = sqrt((sum1Sq-sum1^2/#v1) * (sum2Sq-sum2^2/#v1));
  if(den==0, 0, 1.0 - num/den)
}

\\ Weighted Mean
weightedmean(x, w) = {
  local(num, den);
  num=sum(i=1, #w, x[i]*w[i]);
  den=vecsum(w);
  num/den
}

\\ Tanimoto Coefficient
tanimoto(a, b) = {
  local(c);
  c = setintersect(Set(a), Set(b));
  #c/(#a+#b-#c)
}

\\ Gini Impurity
giniimpurity(l) = {
  local(total, imp, f1, f2);
  total = #l;
  imp = .;
  for(j=1, total,
    f1 = #select(l, x-> x==l[j])/total;
    for(k=1, total,
      if(l[j]==l[k], 0, f2 = #select(l, x-> x==l[k])/total; imp += f1*f2)
    )
  );
  imp
}

\\ Entropy
entropy(rows) = {
   local(results, ent, p);
   results = CountedSet(rows);
   ent = .;
   for(r=1, #results, p = results[r][2]/#rows; ent -= p*log(p)/log(2));
   ent
}

assert_equal( 1              , euclidean([1], [2])        )
assert_equal( sqrt(2)        , euclidean([1,1], [2,2])    )
assert_equal( 0              , pearson([1,1], [2,2])      )
assert_equal( 1              , weightedmean([1,1], [2,2]) )
assert_equal( 0              , tanimoto([1,1], [2,2])     )
assert_equal( 2              , giniimpurity([1,1,2,2])    )
assert_equal( 1.125          , giniimpurity([1,1,1,5])    )
assert_equal( 2              , entropy([1,1,2,2,3,3,4,4]) )

quit
