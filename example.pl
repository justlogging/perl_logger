#!/usr/bin/perl -w

# Tails a log file and logs everything to Justlogging

use Justlogging

$jl = new Justlogging('<api_key>', '<log_key>');

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