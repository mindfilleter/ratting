__lua__
?"hello ᶜ7there♥ら"
t(stat(band()))t()a=0n=0n=0print"this is included"
?"#[disable[[this for now/ever]]]"
local n={1,2,3}print(#n)print(#[[#include notaninclude
]])local n="preserved_key"local d={preserved_key=123}
?d[n]
local n="preserved_glob"preserved_glob=123
?_ENV[n]
local n={}n["whatever"]=123
?n.whatever
function n.subfunc()end function n:subfunc()end
?n:subfunc()
local n="a"local d={a=123}
?d[n]
local n=split"o,c,f,123"local d={o=123,c=234,f=345}
?d[n[2]]
local n="c"c=123
?_ENV[n]
local n="o:c#~~f,","!h$t+123-s\nif\nx"do local _ENV={assert=assert}assert(true)end for _ENV in all{{l=1},{l=2}}do l+=1end function some_future_pico8_api()end some_future_pico8_api(1,2,3)local n={preserved1=1,preserved2=2}n.preserved1+=1
?n["preserved1"]
n=setmetatable({preserved3=3},f)
?n["preserved3"]
l={preserved1=1,preserved2=2}l.preserved1+=1
?l["preserved1"]
l=setmetatable({preserved3=3},f)
?l["preserved3"]
do local _ENV={assert=assert,add=add}assert(add({},1)==1)end for _ENV in all{{l=1,e=5},{l=2,e=6}}do l+=e+e*l end local l={key1=1,key2=2,i=3}l.key1=l.i e,o=circfill,rectfill e(120,126,3)e(126,120,3)o(120,120,123,123)o(123,123,126,126)
while(1==0);
while(1==0)sin=cos cos=sin
if(1==2);
if(1==2)sin=cos cos=sin
local l={1},{1,2,3,4}local l=1~=2local l=1,1.2345,4660,4660.33777,-1,-1.2345,-4660.33777,32776,0xf000.f,-39322,-65535.99999local l="hi","hello",'"hi"',"'hello'",'"hi"',"'hi'","","","a\nb","\\","\0¹²³⁴⁵⁶","¹²³⁴⁵⁶⁷","\\\\\\\\\\\\","\n\n\n\n\n\n","¹²³⁴⁵⁶]]"local l=[[]],[[hi]],[['hi']],[["'hi'"]],[["""""'''''hi'''''"""""]],[[♥♥♥♥]],[[]],[[

]]local l=-256,-256*4,65280^4,-65280,~65280
?1or 1or 2and 3==4>=4|5^^6<<1>><1 ..2 ..3- -1^4^1/1&7
?((~(((((((tonum(((3or 4)and 5)~=2)|1)^^2)&3)>>1)..1)-(1+3))*3))^2)^1
local l=({})[1],(function()end)()local e,o=sin(1,2),cos((cos()))local n,c=(cos((cos())))local l={d=ord,r=pal}local f=ord"123",pal{1,2},l:d("ord"),l:r({1,2}),sin(1)local l={ord"1",[2]=3,l=4,(ord"1")}f+=1e,o=sin(1,2),cos((cos()))n,c=(cos((cos())))function i()return 1,2,ord"1",(ord"1")end if 1==2then elseif 1==2then else end while 1==2do end repeat until 1==1for l in(pairs{})do end print("test"..@16 .."str")