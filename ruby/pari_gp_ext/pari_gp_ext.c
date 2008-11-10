// pari_gp_ext.c
//                           wookay.noh at gmail.com

#include <ruby.h>
#include <pari/pari.h>

static VALUE gp_eval(VALUE self, VALUE str) {
  GEN v = geval(strtoGENstr(StringValueCStr(str)));
  char* pol = GENtostr(v);
  return rb_str_new2(pol);
}

static VALUE gp_polinterpolate(VALUE self, VALUE sxa, VALUE sya, VALUE sx) {
  rb_io_puts(1, &sxa, rb_stdout); 
  rb_io_puts(1, &sya, rb_stdout); 
  rb_io_puts(1, &sx, rb_stdout); 
  GEN xa = geval(strtoGENstr(StringValueCStr(sxa)));
  GEN ya = geval(strtoGENstr(StringValueCStr(sya)));
  GEN x = geval(strtoGENstr(StringValueCStr(sx)));
  char* pol = GENtostr(polint(xa, ya, x, NULL));
  return rb_str_new2(pol);
}

void Init_pari_gp_ext(void) {
  pari_init(1000000, 0);
  rb_define_global_function("gp_eval", gp_eval, 1);
  rb_define_global_function("gp_polinterpolate", gp_polinterpolate, 3);
}
