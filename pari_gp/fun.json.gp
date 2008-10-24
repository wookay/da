\\ json.gp
\\                           wookay.noh at gmail.com
\\                           http://wookay.egloos.com

real_to_json(obj) = {
  local(v, k);
  v = Vec(Str(obj));
  k = #v;
  forstep(x=#v, 1, -1, if(v[x]!="0", k=x;break, 0));
  if(v[k]==".", k++, 0);
  concat(vecextract(v, concat("1..", k)))
}

str_to_json(obj) = {
  concat(["\"", obj, "\""])
}

vec_to_json(obj) = {
  local(ret);
  ret = "[";
  for(x=1, #obj,
    ret=concat(ret, to_json(obj[x]));
    if(x==#obj, 0, ret=concat(ret, ", "))
  );
  concat(ret, "]")
}

to_json(obj) = {
  if(type(obj)=="t_REAL",
    real_to_json(obj),
  if(type(obj)=="t_STR",
    str_to_json(obj),
  if(type(obj)=="t_VEC",
    vec_to_json(obj),
  Str(obj))))
}

parse_json(str) = {
  eval(str) 
}
