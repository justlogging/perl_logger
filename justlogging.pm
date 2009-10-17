#!/usr/bin/perl

use strict;
use LWP::UserAgent;

package Justlogging;
  
  sub new {
    my $class = shift;
    my $self = {
        _api_key => shift,
        _log_key  => shift,
    };
    bless $self, $class;
    return $self;
  }

  sub log {
    my( $self, $entry ) = @_;
    
    my $url = "http://logs.justlogging.com/log";
    
    # set up a UserAgent object to handle our request
    my $ua = new LWP::UserAgent(timeout => 300);

    $ua->agent('justlogging_perl/1.0');
    
    my %param = ( 'access_key' => $self->{_api_key}, 'log_key' => $self->{_log_key}, 'entry' => $entry );
    
    my $response = $ua->post($url, \%param );

    return $response->is_success;
  }
1;
