#!/usr/bin/perl

$LOG = "log4";
open(LOG) or die("COULD NOT OPEN LOG FILE:(");
my $tknown = 0;
my $tunknown = 0;
#my $oldtime = "0";
my %from;
my %to;
my $all = 0;
my $rejects = 0;
my %uips;
foreach $line (<LOG>){
   if(index($line, "reject") != -1 && index($line, "dnsbl.sorbs.net") != -1){
      ++$rejects;
   
      if($line =~ /\[(\d+).(\d+).(\d+).(\d+)\]/){
         my $ip = $1 . "." . $2 . "." . $3 . "." . $4;
         ++$uips{$ip};
      }

   
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

print "$rejects messages rejected\n";
print scalar (keys %uips);
print " unique ips\n";
print scalar (keys %from);
print " unique from adresses\n";
print scalar (keys %to);
print " unique to addresses\n";

my $count = 0;
foreach my $name(sort{$from{$b}<=>$from{$a}} keys %from ){
   if($count > 4){
      last;
   }
   #print "From $name $from{$name}\n";
   ++$count;
}
$count = 0;
foreach my $name(sort{$to{$b}<=>$to{$a}} keys %to ){
   if($count > 4){
      last;
   }
   #print "To $name $to{$name}\n";
   ++$count;
}
