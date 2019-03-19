#!/usr/bin/env perl

use v5.28.1;
use strict;
use warnings;
use List::Util 'shuffle';

my $alpha = "abcdefghijklmnopqrstuvwxyz";
my @lAlpha = split //, $alpha;
my @uAlpha = split //, uc $alpha;
my @chars = split //, '~!@#$%^&*()_+=-{[}]|\:;,.</?>';
my @num = split //, '0123456789';
my @sets = ();

push @sets, @lAlpha, @chars, @uAlpha, @num;
my $pLen = shift;
my $rep = shift;
# 0  -> no repetation
# 1  -> repetation

my $pc = 1;
my $password = "";

while ($pc <= $pLen){
	@sets = shuffle @sets;
	my $t = $sets[int rand $#sets];
	next if $rep == 0 and index ($password, $t) != -1;
	$password .= $t;  
	$pc++;
}

say "password is: '$password'";
