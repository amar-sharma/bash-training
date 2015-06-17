BEGIN {
  maxtime = -1;
  req="";
  linenum = 0;
}
{
if((NR-1)%3 == 0)
  treq = $2 " : " $3
if((NR-2)%3 == 0)
{
 split($5,a,"ms");
 if(a[1]!="Error" && maxtime < a[1])
  {
    maxtime = a[1];  
    req = treq;
    linenum = NR-1;
  }
}
}
END {
    print "Request that took longest time: " req "\t Time taken: " maxtime " ms\t Line number: "linenum;
}
