\\ formulas
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com
\\

read("../unittest")

EuclideanDistance(V1, V2) = {
  sqrt(sum(i=1, #V1, (V1[i]-V2[i])^2))
}

vecsum(v) = sum(x=1, #v, v[x])

PearsonCorrelationCoefficient(V1, V2) = {
  local(sum1, sum2, sum1Sq, sum2Sq, pSum, num, den);
  sum1 = vecsum(V1);
  sum2 = vecsum(V2);
  sum1Sq = vecsum(apply(x-> x^2, V1));
  sum2Sq = vecsum(apply(x-> x^2, V2));
  pSum = sum(x=1, #V1, V1[x]*V2[x]);
  num = pSum - (sum1*sum2/#V1);
  den = sqrt((sum1Sq-sum1^2/#V1) * (sum2Sq-sum2^2/#V1));
  if(den==0, 0, 1.0 - num/den)
}

assert_equal( 1              , EuclideanDistance([1], [2])         )
assert_equal( sqrt(2)        , EuclideanDistance([1,1], [2,2])     )

assert_equal( 0              , PearsonCorrelationCoefficient([1], [2]) )

quit
