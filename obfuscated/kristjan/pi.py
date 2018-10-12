#! /usr/bin/env python

import sys, random

def b(st):
 dp=p=0;pl=[0]*3000;s=[];st=list(st)
 while p<len(st):
  if p==0:s.append(-1)
  if st[p]=='2':pl[dp]+=1;pl[dp]&=0xFF
  elif st[p]=='3':pl[dp]-=1;pl[dp]&=0xFF
  elif st[p]=='0':dp+=1
  elif st[p]=='1':
   dp-=1;
   if dp<0:dp=0
  elif st[p]=='7':p=s.pop()
  elif st[p]=='6':
   if pl[dp]:
    s.append(p-1)
   else:
    while st[p]!='7':p+=1
  elif st[p]=='4':sys.stdout.write(chr(pl[dp]));sys.stdout.flush()
  elif st[p]=='5':pl[dp]=ord(sys.stdin.readline()[0]);sys.stdin.flush()
  p+=1

def p(st):
 out = ""
 k,a,b,a1,b1,r=2,4,1,12,4,True
 while r:
  p,q,k=k*k,2*k+1,k+1
  a,b,a1,b1=a1,b1,p*a+q*a1,p*b+q*b1
  d=int(a/b)
  d1=int(a1/b1)
  while d==d1:
   if len(st):
    c=st[0]
    st=st[1:]
   else:c=""
   if len(c)==0:
    r=False
    break
   try:c=int(c)
   except:continue
   if c!=d:out+=str(c-(c>d))
   a,a1=10*(a%b),10*(a1%b1)
   d,d1=int(a/b),int(a1/b1)
 return out

if __name__ == '__main__':
 if len(sys.argv)==1:b(p(sys.stdin.read()))
 else:
  f=open(sys.argv[1])
  b(p(f.read()))
