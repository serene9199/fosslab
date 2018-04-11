#!/usr/bib/perl

#basics of perl
#Basic datatypes: Scalars, Arrays, Hashes

#1.Scalars
$x=10;
$str="The valus of x is $x";
print "str: $str \n";

#2.Arrays
@array=(h,e,l,l,o);
print "array[2]= $array[2] \n";

#3.Hashes
%hash=('Physics'=>83,'Chemistry'=>94,'Maths'=>85); # This is how we create a hash.
print %hash;
print "\n Physics: $hash{'Physics'}";
