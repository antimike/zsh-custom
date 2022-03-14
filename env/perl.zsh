#!/bin/zsh
# Eval Perl-generated env commands
# Suggested by Clerk README

eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib=~/perl5)
