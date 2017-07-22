#!/usr/bin/perl

$LOG = $ARGV[0];
open(LOG) or die("COULD NOT OPEN LOG FILE:(");
my $tknown = 0;
my $tunknown = 0;
#my $oldtime = "0";
my %from;
my %to;
my $all = 0;
foreach $line (<LOG>){
   if(index($line, "reject") == -1){#=~ m/^(.*?):(\d+):/){
      #++$all;
      if($line =~ /to=<([^\s]+)>/){
         #++$all;
         my $addy = $1;
         #print "$addy\n";
         $to{$addy}++;
      }
      if($line =~ /from=<([^\s]+)>/){
         ++$all;
         my $addy = $1;
         #print "$addy\n";
         $from{$addy}++;
      }
   }
}

my $count = 0;
foreach my $name(sort{$from{$b}<=>$from{$a}} keys %from ){
   if($count > 4){
      last;
   }
   print "From $name $from{$name}\n";
   ++$count;
}
$count = 0;
foreach my $name(sort{$to{$b}<=>$to{$a}} keys %to ){
   if($count > 4){
      last;
   }
   print "To $name $to{$name}\n";
   ++$count;
}
