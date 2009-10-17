#!/usr/bin/perl -w

use Justlogging

$jl = new Justlogging('8a7cd47a0aed66367342c4054ddb9fe9', 'supersize');

open(INFILE,"tail -f $ARGV[0] |") || die "Failed!\n";
while(my $line = <INFILE>)
{
  if (length ($line) > 1) {
    if($jl->log($line) == 1){
      print "[OK] $line";
    } else {
      print "[FAIL] $line";
    }
  }
};
close(INFILE)