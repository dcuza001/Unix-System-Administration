#!/usr/bin/perl

open(my $FILE, '<', $ARGV[0]) or die("COULD NOT OPEN LOG FILE:(");
@filearray = <$FILE>;
close($FILE);

open($FILE, '>', $ARGV[0]) or die("COULD NOT OPEN FOR WRITE:(");

foreach $line (@filearray){
   
   foreach $myindex(1 .. $#ARGV){
      if($line=~ m/$ARGV[$myindex]/){
         ++$match;
      }
   }
   if($match < 1){
      print $FILE $line
   }
   else{
      $match = 0;
   }
}
close($FILE);

