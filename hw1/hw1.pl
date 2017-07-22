#!/usr/bin/perl

FILE: foreach (@ARGV){
   open(FILE, $_);
   while(<FILE>){
      print;
   }
   close(FILE)
}
