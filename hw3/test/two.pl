#!/usr/bin/perl

$LOG = "log2";
open(LOG) or die("COULD NOT OPEN LOG FILE:(");
my $tknown = 0;
my $tunknown = 0;
#my $oldtime = "0";
my %uips;
my %kips;
foreach $line (<LOG>){
   if(index($line," connect from ") != -1){#=~ m/^(.*?):(\d+):/){
      
      if($line =~ /unknown\[(\d+).(\d+).(\d+).(\d+)\]/){
         ++$tunknown;
         $ip = $1 . "." . $2 . "." . $3 . "." . $4;
         #print "$ip\n";
         if(exists $uips{$ip}){
            ++$uips{$ip};
         }
         else{
            $uips{$ip}= 1;
            
         }
      }
      elsif($line =~ /\[(\d+).(\d+).(\d+).(\d+)\]/){
         ++$tknown;
         $ip = $1 . "." . $2 . "." . $3 . "." . $4;
         if(exists $kips{$ip}){
            ++$kips{$ip};
         }
         else{
            $kips{$ip}= 1;
            
         }
      }
   }
}
my ($max)= sort {$kips{$b}<=>$kips{$a}} keys %kips;

print "Total Known connection: $tknown - [$max] with $kips{$max} connections\n";
my ($max)= sort {$uips{$b}<=>$uips{$a}} keys %uips;
print "Total Unknown connections: $tunknown - [$max] with $uips{$max} connections\n";


