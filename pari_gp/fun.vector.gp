\\ fun.vector
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

map(f, v) = {
  local(ret);
  ret = [];
  for(x=1, #v,
    ret = concat(ret, apply(f, v[x])) 
  );
  ret
}

vecjoin(v, sp="") = {
  local(ret);
  ret = "";
  for(x=1, #v,
    ret = concat(ret, v[x]);
    if(x==#v, 0, ret = concat(ret, sp))
  );
  ret
}
