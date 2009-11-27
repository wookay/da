\\ fun.string
\\                           wookay.noh at gmail.com

split(str, sp=" ") = {
  local(ret, v, s);
  v = Vec(str); ret = []; s = "";
  if(sp=="", return(v), 0);
  for(x=1, #v,
    if(v[x]==sp, ret = concat(ret, [s]); s = "", s = concat(s, v[x]));
  );
  concat(ret, [s])
}
