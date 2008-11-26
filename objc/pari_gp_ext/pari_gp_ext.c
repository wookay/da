// pari_gp_ext.c
//                           wookay.noh at gmail.com

#include <pari/pari.h>

void pari_gp_init() {
  pari_init(1000000, 0);
}

const char* pari_gp_eval(const char* str) {
  GEN v = geval(strtoGENstr(str));
  return GENtostr(v);
}

const char* pari_gp_polinterpolate(const char* sxa) {
  GEN xa = geval(strtoGENstr(sxa));
  return GENtostr(polint(xa, NULL, NULL, NULL));
}
