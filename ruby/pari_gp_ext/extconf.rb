require 'mkmf'
$LDFLAGS += ' -lpari'
create_makefile 'pari_gp_ext'
