#!/usr/bin/perl

$LOG = $ARGV[0];
open(LOG) or die("COULD NOT OPEN LOG FILE:(");
my $rejects = 0;
my $quarantines = 0;
my $oldtime = "0";
foreach $line (<LOG>){
   if($line =~ m/^(.*?):(\d+):/){
      my $h = $1;
      my $m = $2;
      my $time = $h . ":" . $m;
      if($time eq $oldtime){
         if(index($line, "reject") != -1){
            ++$rejects;
         }
         if(index($line, "quarantine") != -1){
            ++$quarantines;
         }
      }
      else{
         print "$time [postfix rejects:$rejects] [amavis quarantines:$quarantines]\n";
         $rejects = 0;
         $quarantines = 0;
      }
      $oldtime = $time;
   }
}

