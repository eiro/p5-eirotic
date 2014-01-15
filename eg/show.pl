#! /usr/bin/perl
use Eirotic;
use strict;
use warnings;

map say, io('/etc/passwd')->chomp->slurp

