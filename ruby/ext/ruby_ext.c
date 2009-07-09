// test_ext.c
//                           wookay.noh at gmail.com

#include "ruby.h"

static VALUE assert_equal(VALUE self, VALUE expected, VALUE got) {
  if (rb_equal(expected, got)) {
    printf("passed: ");
    rb_io_puts(0, &expected, rb_stdout);
  } else {
    printf("Assertion failed\nExpected: ");
    rb_io_puts(1, &expected, rb_stdout);
    printf("Got: ");
    rb_io_puts(0, &got, rb_stdout);
  }
  return Qnil;
}

void Init_ruby_ext(void) {
  rb_define_global_function("assert_equal", assert_equal, 2);
}
