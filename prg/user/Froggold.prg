program frogsquadv3;
global
view=1;
xt;
ptime=0;
score=0;
stage=0;
but=0;
filem;
timel=128;
die=0;
tpage=1;
frogshome=0;
txp=0;
ops=0;
tcam=0;
m7off;
frt=0;
//file1=load_fpg("d:\frogger\frogger.fpg");
//file3=load_fpg("d:\foggger\ftitles.fpg");
file1;
file3;
xp=0;
lleft=5;
yp=0;
gbao=0;
cheat=0;
// lleft=5;
xy=0;
sink=1;
tp=0;
cxy=0;
camy;
isa=0;
vfx=2;
vfx2=0;
hi;
opc=1;
fl[2]=2,4;
x2,y2;
fg;
smode=3;
dshadow=1;
waterf=1;
cam=1;
lt=1;
bck=1;
//import"c:\div\source\dll\hboy.dll";
begin
//setup.card=5;
//setup.rate=44100;
//setup.bits=16;
m7off=0;
die=0;
//load_fpg("d:\frogger\frogger.fpg");
file1=load_fpg("user\froggold\frogger.fpg");
file3=load_fpg("user\froggold\ftitle.fpg");
//file1=load_fpg("user\froggold\frogger.fpg");
ldm();
lds();
load_fnt("user\froggold\frog4.fnt");
load_fnt("user\froggold\frog5.fnt");
load_fnt("user\froggold\bubble.fnt");
load_fnt("user\froggold\bubble2.fnt");

load_pal("user\froggold\npl2.pal");

//set_mode(m640x480);
//set_mode(m1024x768);

set_fps(25,0);
// load_fpg("user\froggold\frogger.fpg");
lt=0;
lleft=5;
lmt(21);
// titles();

// options();
set_fps(24,0);
end;

process mainloop();
begin
stop_sound(all_sound);
stop_cd();
//setup.cd_audio=1;
//setup.sound_fx=10;
frame();
//play_cd(7,0);
tpage=1;
frogshome=0;
//lleft=5;
let_me_alone();
xt=640+320;
//write(3,220,240,3,"MONDAY");
sound(filem,140,260);
sound(filem,140,260);

if (cheat==2)
fade (100,100,100,10);
gba();
end;
frame();
frame();
if (cheat==2)
smode=20;
end;
if (smode==1) set_mode(m320x200); end;
if (smode==2) set_mode(m320x240); end;
if (smode==3) set_mode(m640x480); end;
if (smode==4) set_mode(m800x600); end;
if (smode==5) set_mode(m1024x768); end;
clear_screen();
frame();
frame();
md7();
//set_fps(23,1);
lilly();
ref();
fence();
//car();
droad();
tree(1);
tree(2);
isa=0;
for (isa==1; isa<lleft; isa++)
lives2(isa);
end;
frog();
shadows();
//if (cheat==2) gba(); end;
time();

if (bck==1)
grass(800,900,55);
grass(860,860,53);
grass(940,940,54);
// grass(800,440);
grass(840,460,54);
grass(940,500,53);
//time();

end;
set_fps(25,0);
//sound(8,200,260);
loop
delete_text(all_text);
xt=xt-16;
//if (xt>-310)
if (xt>-520)
if (stage==0) write(3,xt,220,3,"MONDAY"); end;
if (stage==1) write(3,xt,220,3,"TUESDAY"); end;
if (stage==2) write(3,xt,220,3,"WEDNESDAY"); end;
if (stage==3) write(3,xt,220,3,"THURSDAY"); end;
if (stage==4) write(3,xt,220,3,"FRIDAY"); end;

end;
if (cheat==1)
lleft=5;
end;
if (cheat==2)
fade(100,100,100,10);
end;
//snow();
//if (key(_right)) x2=x2+16; end;
//if (key(_left)) x2=x2-16; end;
//if (key(_up)) y2=y2-16; end;
//if (key(_down)) y2=y2+16; end;
// if (key(_1)) set_mode(m320x200); end;
//if (key(_2)) set_mode(m320x240); end;
//if (key(_3)) set_mode(m640x480); end;
//if (key(_4)) set_mode(m800x600); end;
//if (key(_5)) set_mode(m1024x768); end;
set_fps(20,0);
if (vfx==1)
rain(2);
rain(2);
rain(2); rain(2);
end;
if (vfx==2)
snow();
snow();
snow();
snow(); snow();
end;
if (rand(1,300)==1)
if (stage==0) vfx2=rand(0,1); end;
if (stage==1) vfx2=2; end;
if (stage>1) vfx2=(1); end;

end;
if (lleft<0) gover1(); end;
if (key(_1) or vfx2==0) vfx=0; fade(100,100,100,1); end;
if (key(_2) or vfx2==1) vfx=1; fade(92,92,92,1); end;
if (key(_3) or vfx2==2) vfx=2; fade(110,110,110,1); end;

vfx2=100;
if (rand(1,600)<2 or (key(_b))) hball(); end;
watrip();
frame();
end;
end;

process gba();
begin
// gba2();
x=320;
y=240;
z=-2000;
size=100;
gbao=1000;
graph=64;
loop
gbao=100;
frame();
end;
end;

process gba2();
begin
x=318;
y=144;
flags=4;
z=-1000;
size=146;
graph=65;
loop
frame();
end;
end;

process fog();
begin
ctype=c_m7;
loop
file=file3;
x=320;
y=100;
flags=4;
size=500;
graph=19;
frame();
end;
end;

process fog2();
begin
ctype=C_m7;
loop
file=file3;
x=320;
y=200;
flags=4;
size=500;
graph=19;
frame();
end;
end;

process view3d();
private timmy,ij,so,so2,gs,tpe,tox;
begin
clear_screen();
set_fps(24,0);
x=320;
so=0;
so2=480;
y=240;
start_mode7(0,file3,11,0,0,180);
m7.camera=id;
m7.color=128;
fog();
fog2();
// loop
timmy=200;
angle=90000; y=400; x=320;
set_fps(24,0);
loop;
set_fps(24,0);
timmy=timmy-1;
if (timmy<1) timmy=100; end;
if (timmy==10) fade (100,100,100,10); end;
if (timmy==14 and cheat<>2) fade (170,115,160,30); sound(11,180,280); end;
so=so-2; if (so<-240) so=480+240; end;
so2=so2-2; if (so2<-240) so2=480+240; end;
map_xput(file3,11,9,320,240,0,100,2);
map_xput(file3,11,9,320,so,0,100,4);
map_xput(file3,11,9,320,so2,0,100,6);
m7.color=0;
m7.height=128-32;;
if (cheat==2)
m7.height=64;;
end;
tox=rand(0,640);
if (tox>250 and tox<400)
tox=0;
if (key(_1)) view=1; angle=180000; y=240; x=400; end;
if (key(_2)) view=2; angle=90000; y=400; x=320; end;
if (key(_3)) view=3; angle=45000; y=300; x=300;end;
if (key(_4)) view=4; angle=135000; y=300; x=340; end;
if (key(_5)) view=5; angle=angle+25000; end;
if (key(_6)) view=6;  angle=angle-25000; end;
end;
tpe=rand(3,5);
if (tox<>0)
gs=rand(80,140);
do3(tpe,tox,580,0,gs);
do3(tpe,tox,580,1,gs);
for (ij=0; ij<2; ij++);
tox=rand(0,640);
// if (tox>300 and tox<500); tox=0; end;
if (tox<>-1)
tpe=rand(1,5);
gs=rand(20,40);
do3(tpe,tox,580,0,gs);
do3(tpe,tox,580,1,gs);
end;
end;
end;
rain(1);
rain(1);
if (m7off<>0) return; end;
frame();
end;
end;

process md7();
private wc,po,cy,cx;
begin
m7.height=64+1000;
m7.distance=64;
file=file1;
//graph=11;
bck=1;
if (stage==1) bck=2; end;
start_mode7(0,file1,bck+43,0,0,-80);
m7.camera=id;
z=0;
po=0;
x=400;
y=800;
angle=90000;
m7.height=64+1000;
m7.distance=64;
m7.color=0;
m7.camera=id;
po=1200;
x=x2;
y=y2+(y2/8)+300+gbao*16;
//xput(0,1,320,240,100,100,0,0);
if (cam==2) m7.height=2500-108+gbao*16;
y=cy+gbao*4;
//x=cx;
tcam=1;
end;
if (cam==1)
y=cy+gbao*4;
x=cx;
tcam=2;
end;
cy=(gbao*4);
x=640;
if (cam==2) y=-300; end;
//y=cy+gbao*4;
if (cheat==2 and cam==1) m7.height=64+1000+gbao*9; end;
// if (cheat==2 and cam==2) m7.height=
loop
if (key(_a) and cheat==1) frogshome=5; end;
//rain(2);
//rain(2);
if (cy<y-(gbao*4)) y=y-12; end;
if (cy>y-(gbao*4)) y=y+12; end;
if (cx<x) x=x-12; end;
if (cx>x) x=x+12; end;
if (po>64) po=po-64; end;
m7.distance=po;
cx=x2;
cy=y2+364+40;
cy=y2+(y2/8)+300;
cxy=(900-cy)/12;
if (cy>1120) cy=1140; end;
if (cx<540) cx=520; end;
if (cy<600-cxy) cy=600-cxy; end;
if (cx>1100+cxy) cx=1100+cxy; end;
if (m7.height>2000) x=800; y=(1700-240)+gbao*7; end;
frame();
if (key(_x) and wc<1) m7.height=64+1000+gbao*9;
y=cy+gbao*4;
x=cx;
tcam=2;
sound (5,255,320);
if (gbao==0) fade(255,255,255,10); end;
wc=10;
end;
camy=y-300;
if (key(_z) and wc<1) m7.height=(2500-108)+gbao*16;
sound (5,255,320);
tcam=1;
wc=10;
y=cy+gbao*4;
if (gbao==0) fade(255,255,255,10); end;
x=cx;
end;
if (wc>0) wc=wc-1; end;
if (wc==6) fade(100,100,100,10); end;
//frame();
end;
end;


process time();
begin
graph=282;
x=320;
y=20;
if (cheat==2) y=316; size=200; flags=4; end;
if (smode<3) x=x-70; y=220; flags=4;
end;

repeat
map_block_copy(0, 282, timel,0 ,284 , timel,0, 2,16);

if (timel>128);
map_block_copy(0, 282, 0,0 ,283 , 0,0, 128,16);
end;

height=height+1;
if (height>7) height=0; timel=timel-1;
end;
//size=200-timel;
frame();
until (timel<0)
death(x2,y2);
frame();
timel=130;
time();
return;
end;

process grass(x,y,graph);
begin
size=420;
//graph=53;
ctype=c_m7;
loop;
frame();
end;
end;

process tree(ta);
private ta;
begin
graph=150;
x=270-30;
ctype=c_m7;
y=565;
size=550;
if (ta==2)
y=565;
x=1360;
flags=1;
end;
loop;
frame();
end;
end;


process snow();
private sz,xs,ys;
begin
ctype=c_m7;
graph=42;
height=1200;
x=rand(1,1200);
y=rand(1,960);
size=100;
repeat
frame();
x=x+rand(-8,8);
height=height-30;
until(height<1);
map_put(0,45,46,x,y);
end;

process car(x,y,z,gfx,ct);
private sor,fr,d,rf,gfx,ow,ct;
begin;
rf=z;
sor=0;
// gfx=height;
//x=100;
if (y>480) y=y+20;end;
//if (y<480) y=y-10; end;
//y=800;
size=160;
// graph=2;
fr=1;
if (x<000) d=12; flags=1; end;
if (x>900) d=-12; flags=0; end;
//if (x<000 and y>300 and y<400) d=18; flags=1; end;
//if (x>900 and y>300 and y<400) d=-18; flags=0; end;
//if (x<000 and y>200 and y<300) d=8; flags=1; end;
//if (x>900 and y>200 and y<300) d=-8; flags=0; end;
//if (x<000 and y>600 and y<700) d=10; flags=1; end;
//if (x>900 and y>600 and y<700) d=-10; flags=0; end;
//if (x<000 and y>800 and y<900) d=24; flags=1; end;
//if (x>900 and y>800 and y<900) d=-24; flags=0; end;
//if (x<000) d=12; flags=1; end;
//if (x>900) d=-12; flags=0; end;
if (rf==1)
if (x<00) d=12; flags=7; end;
if (x>900) d=-12; flags=6; end;
end;
ctype=c_m7;
// xput(0,1,320,240,100,100,0,0);
//height=height+10;
if (rf==3)
graph=61;
// flags=4;
size=300;
end;
repeat
ow=60;
if (rf<>3)
if (y<440) graph=78+fr; end;
if (y>440 and ct==0) graph=87+fr; size=150; end;
if (y>440 and ct==1) graph=231+fr; ow=90; size=250; end;
if (y>440 and ct==2) graph=242+fr; ow=90; size=250; end;
if (y>440 and ct==3) graph=291+fr; ow=60; size=150; end;
if (y>440 and ct==4) graph=301+fr; ow=70; size=180; end;
if (y>440 and ct==5) graph=312+fr; ow=78; size=210; end;
if (y>440 and ct==6) graph=323+fr; ow=78; size=210; end;
if (y>440 and ct==7) graph=334; ow=78; size=210; end;
if (y>440 and ct==8) graph=345; ow=78; size=210; end;


if (y<440 and gfx==2) graph=96+fr; size=200; end;
//if (graph>121 and graph<136) ow=0; end;
end;

if (y<440 and gfx==3) graph=260+fr; size=340; ow=100; end;
//if (graph>121 and graph<136) ow=0; end;

if (y<440 and gfx==99) graph=270+fr; size=340; ow=100; end;


if (rand(0,800)==200)
if (y>440) play(3,x,y); end;
if (y<440) play(4,x,y); end;
end;

if (rf==3)
graph=61;
size=300;
if (y>440) size=200; end;
flags=4;
end;
// frame();
// angle=angle+rand(-1000,1000);
x=x+d;
//if (x<0 or x>1200) flags=4; end;
//if (x>20 or x<1180) flags=0; end;
// graph=3+fr;
if (y<430)
ow=80;
if (graph>123 and graph<131) ow=0; end;
if (gfx==1) graph=78+fr; ow=120; end;
end;

if (graph>123 and graph<131) ow=0; end;
if (x2>x-ow and x2<x+ow and y2>y-35 and y2<y+35)

if (graph>123 and graph<131) ow=0; end;


if (y>440) death(x2,y2);
end;
//if (y<440) x2=x2+d/2; sink=0; end;

if (gfx==3 and y<440)
if (d>0 and x2>x+32) death(x2,y2);
gfx=99;
fr=0;
graph=270+fr;
//fade (200,200,200,10);
end;
if (d<0 and x2<x-32) death(x2,y2);
//fade (200,200,200,10);
gfx=99;
graph=270+fr;
fr=0;
end;
end;

if (graph>123 and graph<131) ow=0; end;
if (y<440) x2=x2+d/2; sink=0; end;

end;
fr=fr+1;
if (gfx==99 and fr>8); fr=0; gfx=3; end;
if (y<440 and gfx<>2 and fr>8) fr=0; end;
if (y>440 and fr>8) fr=0; end;
if (gfx==2 and y<440 and rf<>3) graph=96+fr;
if (fr>70) fr=0; graph=97; end;
if (fr>45) graph=97; end;
end;
//if (rf==3)
//graph=61;
//flags=4;
frame();
until (x<-220 or x>1890);
end;

process watrip();
private fr;
begin
fr=0;
size=rand(200,700);
flags=rand(1,7);
ctype=c_m7;
x=rand(0,1800);
y=rand(200,400);
flags=4;
repeat
x=x+rand(-2,2);
y=y+rand(-2,2);
size=rand(200,400);
graph=rand(146,149);
fr=fr+1;
frame();
until (fr>8)
end;

process fence();
begin
ctype=c_m7;
x=1140;
y=948;
graph=67;
size=340;
loop
frame();
end
end;

process ref();
private mu,mu2,rpl,cref,ripple[230];
begin
file=file1;
mu=1;
mu2=2;
if (waterf<>1) return; end;
ctype=c_m7;
graph=63;
x=880+50;
y=-90;
size=450+50;
loop;
for (cref=70; cref<200; cref=cref+1);
if (rand(0,200-cref)<100)
ripple[cref+1]=ripple[cref+1]+rand(-4,4);
cref=cref+rand(0,2);
end;
if (ripple[cref+rand(1,3)]<-120)
ripple[cref+1]=-120;
end;
if (ripple[cref+1]>120)
ripple[cref+1]=120;
end;
mu2=mu2+1;
if (mu2>8) mu2=0; mu=mu+1; end;
if (mu>3) mu=3; end;
if (stage==1) map_block_copy(0,63,ripple[cref+1],cref,285,0,rand(0,10)+((cref*mu)-154),1600,2);
//graph=0;
flags=6;
end;
if (stage<>1)
map_block_copy(0,63,ripple[cref+1],cref,62,0,rand(0,10)+((cref*mu)-154),1600,2);
flags=2;

end;
end;
//flags=2
;
frame();
end;
end;

process lilly();
begin
ctype=c_m7;
graph=62;
if (stage==1)
graph=285;
end;
x=760+30;
y=-0;
height=0;
size=430+50;
loop
flags=0;
frame();
end;
end;

process home(x,y,z);
private fr;
begin
ctype=c_m7;
graph=209;
size=130;
loop
y=100;
if (z==2) flags=6; end;
height=90;
fr=fr+1;
if (fr>80) fr=0; end;
graph=209+fr;
if (fr>20) graph=209; end;

frame();
end;
end;

process pad(x,y,z,pn);
private pn,fr=0;
begin
ctype=c_m7;
//x=200;
//y=140;
//frogshome=frogshome+1;
//if (frogshome>3)
//allhome();
//end;
graph=68;
if (z==2) y=y-45; end;
size=250;
loop
if (frogshome>4)
allhome();
end;
if (z==2) flags=6; end;
graph=68+fr;
fr=fr+1;
if (fr>9) fr=0; end;
if (pn==1 and z==1 and x2>x-50 and x2<x+50 and y2<151)
frogshome=frogshome+1;
home(x,y,1);
home(x,y,2);
sound(6,200,310);
timel=130;
pn=0;
y2=884;
x2=668;
die=6;
frame();
end;
frame();
end;
end;

process rain(z);
private frain;
begin
file=file1;
frain=0;
size=500;
graph=14;
x=rand(1,1200);
y=rand(1,900);
angle=450000;
ctype=c_m7;
angle=830000;
//flags=4;
repeat
frame();
y=y+2;
if (z==1) y=y-20; size=200; flags=4; end;
frain=frain+3;
if (graph<38)
graph=graph+2;
end;
if (graph>37) flags=4; end;
graph=graph+1;
// graph=graph+3;
until (graph>41);

end;

process angel(x,y);
private fr=0;
begin
lleft=lleft-1;
ctype=c_m7;
flags=4;
repeat
x=x+1;
height=height+20;
fr=fr+1;
if (fr>9) fr=0; end;
graph=175+fr;
frame();
until (height>3000)
end;

process death2(x,y);
begin
play(2,x,y);
drown(x,y,1);
drown(x,y,6);
angel(x,y);
end;

process bubble(x,y);
private dir;
begin
dir=rand(-2,2);
ctype=c_m7;
size=100;
graph=230;
repeat
x=x+dir;
height=height+8;
x=x+rand(-2,2);
size=size+1;
frame();
until (height>500);
end;

process drown(x,y,z);
private fr;
begin
timel=130;
die=6;
x2=630;
y2=884;
// tims=0;
// tims2=0;
flags=z;
frame();
ctype=c_m7;
fr=0;
repeat
bubble(x+rand(-2,2),y);
graph=192+fr;
frame();
fr=fr+1;
until (fr>15)
end;



process death(x,y);
begin
timel=130;
play(1,x,y);
die=6;
angel(x,y);
x2=630;
y2=884;
blood(x,y); blood(x,y);
blood(x,y); blood(x,y);
frame();
blood(x,y); blood(x,y);
blood(x,y); blood(x,y);
blood(x,y); blood(x,y);
blood(x,y); blood(x,y);
map_xput(0,44,208,x,y,0,0,4);
map_put(0,44,207,x+rand(-32,32),y+rand(-32,32));
map_put(0,44,207,x+rand(-32,32),y+rand(-32,32));
map_put(0,44,207,x+rand(-32,32),y+rand(-32,32));
frame();
blood(x,y); blood(x,y);
blood(x,y); blood(x,y);
//blood(x,y); blood(x,y);
end;

process blood(x,y);
private dx,dy,dh=20;
begin
size=rand(160,400);
// flags=rand(1,8);
dx=rand(-20,20);
dy=rand(-20,20);
height=1;
ctype=c_m7;
if (y<440)
height=rand(0,300);
end;
graph=rand(186,191);
angle=rand(1,32000);
repeat
angle=angle+4000;
x=x+dx;
y=y+dy;
height=height+dh;
dh=dh-6;
frame();
until (dh<-20)
map_xput(0,44,207,x,y,0,0,4);
end;


process shadows();
begin
ctype=c_m7;
loop;
flags=4;
size=110-(hi*4);
x=x2;
y=y2-2;
graph=60;
if (y<440)
graph=fg;
flags=6;
end;
height=0;
frame();
end;
end;

process frog();
private dr,tims,tims2,ffx,fr,cnt;
begin
ctype=c_m7;
x2=630;
y2=880;
size=110;
graph=56;
cnt=0;
tims=0;
loop;
sink=1;
x=x2;
y=y2;
fg=graph;
height=hi*10;
fr=0;

if (die>0) fr=0; tims2=0; tims=0; end;
if (die>0) die=die-1; end;
if (tims==0) hi=0; fr=5; cnt=1; end;
if (tims==1) hi=10; fr=4; end;
if (tims==2) hi=17; fr=3; end;
if (tims==3) hi=15; fr=2; end;
if (tims==4) hi=10; fr=1; cnt=0; end;
if (tims==5) hi=-40; fr=0; end;
if (tims==6) hi=0; end;
if (tims==7) hi=0; end;
if (tims>-1) tims=tims-1; end;
if (tims==-1 and tims2==0)
if (die==0)
if (key(_left)) dr=1; tims=4; tims2=3; ffx=169; play(0,x,y-120); end;
if (key(_right)) dr=2; tims=4; tims2=3; ffx=157; play(0,x,y-120); end;
if (key(_down)) dr=3; tims=4;tims2=3; ffx=163;play(0,x,y-129);  end;
if (key(_up)) dr=4; tims=4;tims2=3; ffx=151; play(0,x,y-120); end;
end;
//if (key(_alt)) death(x,y); end;
if (key(_h)) home(x2,y2,z); end;

end;
if (y<440) height=height+rand(-2,2); end;
if (tims2>0) tims2=tims2-1; end;

if (tims>0)
xy=(900-y)/7;
if (x2>1220+xy) x2=1220+xy; end;
if (x2<400-xy) x2=400-xy; end;
if (dr==1 and x2>400-xy) x2=x2-16; end;
if (dr==2 and x2<1220+xy) x2=x2+16; end;
if (dr==3 and y2<940) y2=y2+15; end;
if (dr==4 and y2>0) y2=y2-15; end ;
end;
if (x2>1220+xy) x2=1220+xy; end;
if (x2<400-xy) x2=400-xy; end;
graph=ffx+fr;
if (cnt>0) cnt=cnt+1; end;
if (cnt==30) fr=5; ffx=163; end;
frame();
if (sink==1 and y<410)
death2(x2,y2);
end;
frt=fr;
fg=ffx+fr;
end;
end;

process lives2(z);
private life;
begin
ctype=c_screen;
size=20;
graph=209;
x=30+z*30;
y=26;
if (smode<3)
y=210;
end;
life=z;
z=0;
z=-1000;
repeat
graph=rand(163,168);
frame(200);
until (lleft-1<life)
end;

process droad();
begin
pad(400,100,1,1);
pad(400,100,2,1);

pad(600,100,1,1);
pad(600,100,2,1);

pad(800,100,1,1);
pad(800,100,2,1);

pad(1000,100,1,1);
pad(1000,100,2,1);

pad(1200,100,1,1);
pad(1200,100,2,1);


road(-140,440-45);
road(1880,380-45);
road(-140,320-45);
road(1880,260-45);
road(-140,200-45);

road(-140,600-30);
road(-140,660-30);

//road(1880,660-30);
road(-140,720-30);
road(1880,780-30);
//road(-140,840-30);
road(1880,840-30);
//road(0,920-30);
end;

process road(x,y);
private
tim=10;
rni=1;
cty=1;
begin
loop;
tim=tim-1;
if (y>440 and stage==0) rni=70; end;
if (y>440 and stage==1) rni=58; end;
if (y>440 and stage>1) rni=45; end;

if (y<440) rni=30; end;
if (rand(1,rni)==1)
if (tim<1)
tim=16;
cty=rand(0,0);
if (y>400)
cty=rand(0,8);
end;
if (stage>4) stage=0; end;
if (stage==0) tp=rand(0,1); end;
if (stage==1) tp=rand(0,2); end;
if (stage==2) tp=rand(0,3); end;
if (stage==3) tp=3; end;
if (stage==4) tp=2; end;


car(x,y,0,tp,cty);
if (y<400 or (y<800 and vfx==1)) car(x,y-16,1,tp,cty); end;
if (y>400 and dshadow==1) car(x,y,3,0,0); end;
end;
end;
frame();
end;
end;

process hball();
begin
ctype=c_m7;
x=rand(1200,1880);
y=40;
size=300;
height=1400+200;
graph=253;
repeat
y=y+8;
height=height-9;
x=x-rand(6,10);
frame();
z=z+1;
if (z>3) graph=graph+1; z=0; end;
//end;
if (graph>259) graph=253; end;
until (y>1200);
end;

process optsquare();
begin
file=file3;
x=320;
y=240;
x=0;
graph=4;
angle=62000;
flags=4;
loop
if (size<1200) size=size+100; end;
if (angle>0) angle=angle-5000; end;
if (angle<4000) angle=0; end;
if (x<320) x=x+32; end;
if (ops<>1) return; end;
frame();
end;
end;

process options();
private so2,dkey=0,so,ang;
begin
xt=xt+16;
ops=1;
txp=640;
file=file3;
so=1280;
so2=640;
// put(file3,3,320,240);
//if (key(_space)) set_mode(m320x240);
//else
// set_mode(m640x480);
// end;
//frame();
// optsquare();

set_fps(24,0);
doptions();
//put(file3,3,320,240);
dkey=3;
repeat
xt=xt+16;

//xput(file3,3,so2,240,ang,100+rand(1,2),0+4,0);
//xput(file3,3,so,240,ang,100+rand(1,2),1+4,0);
so=so-32;
if (but>0 ) but=but-1; end;

so2=so2-32;
// ang=ang+1000;
if (ang>18000) ang=0; end;
if (so2<-320) so2=640+320; end;
if (so<-320) so=640+320; end;
if (txp>180) txp=txp-50; end;
if (opc<0) opc=0; end;
if (opc>5) opc=5; end;
frame();
doptions();
if (key(_down) and dkey==0) opc=opc+1; dkey=2; end;
if (key(_up) and dkey==0) opc=opc-1; dkey=2; end;
if (dkey==0)
if (key(_right) and opc==1) smode=smode+1; dkey=2; end;
if (key(_left) and opc==1) smode=smode-1; dkey=2; end;
if (smode<1) smode=1; end;
if (smode>5) smode=5; end;
if (key(_right) and opc==2) dshadow=1; dkey=3; end;
if (key(_left) and opc==2) dshadow=0; dkey=3; end;
if (key(_left) and opc==3) waterf=0; dkey=3; end;
if (key(_right) and opc==3) waterf=1; dkey=3; end;
if (key(_left) and opc==4) cam=1; dkey=3; end;
if (key(_right) and opc==4) cam=2; dkey=3; end;
if (key(_left) and opc==5) bck=1; dkey=3; end;
if (key(_right) and opc==5) bck=2; dkey=3; end;
end;
if (dkey>0) dkey=dkey-1; end;
until (key(_space) and but==0) ;
but=8;
delete_text(all_text);
//frame();
// set_mode(m320x200);
//frame();
clear_screen();
// let_me_alone();
delete_text(all_text);
// titles();
ops=0;
end;

process doptions();
private o2;
begin
// set_fps(12,0);
delete_text(all_text);
if (opc==0) o2=2; end;
if (opc<>0) o2=1; end;
write(o2,txp,170,0,"DISPLAY: PRIMARY");
if (opc==1) o2=2; end;
if (opc<>1) o2=1; end;
write (1,txp,120,0,"GAME OPTIONS.");
if (smode==1)
smode=2;
//write (o2,txp,200,0,"SCREEN MODE: 320 x 200");

end;
if (smode==2)
write (o2,txp,200,0,"SCREEN MODE: 320 x 240");
end;
if (smode==3)
write (o2,txp,200,0,"SCREEN MODE: 640 x 480");
end;
if (smode==4)
write (o2,txp,200,0,"SCREEN MODE: 800 x 600");
end;
if (smode==5)
write (o2,txp,200,0,"SCREEN MODE: 1024x768");
end;
if(opc==2) o2=2; end;
if(opc<>2); o2=1; end;

if (dshadow==1)
write (o2,txp,230,0,"SHADOWS:  ON");
end;
if (dshadow==0)
write (o2,txp,230,0,"SHADOWS:  OFF");
end;

o2=1;
if (opc==3) o2=2; end;

if (waterf==1);
write(o2,txp,260,0,"WATER RIPPLES: ON");
end;
if (waterf==0);
write(o2,txp,260,0,"WATER RIPPLE: OFF");
end;

o2=1;
if(opc==4) o2=2; end;

if (cam==1) write (o2,txp,290,0,"CAMERA: CLOSE"); end;
if (cam==2) write (o2,txp,290,0,"CAMERA: FULL SCREEN"); end;

o2=1;
if (opc==5) o2=2; end;
if (bck==1) write(o2,txp,320,0,"BACKGROUND: GRASS"); end;
if (bck==2) write(o2,txp,320,0,"BACKGROUND: SNOW "); end;

frame();
end;

process ldm();
begin
graph=1;
x=320;
y=240;
repeat
frame();
until (lt==0);
end;

process lds();
begin
load_pcm("user\froggold\press.pcm",0);
load_pcm("user\froggold\squish.pcm",0);
load_pcm("user\froggold\splash.pcm",0);
load_pcm("user\froggold\carbrake.pcm",0);
load_pcm("user\froggold\fountain.pcm",0);
load_pcm("user\froggold\camera.pcm",0);
load_pcm("user\froggold\cheers2.pcm",0);
load_pcm("user\froggold\fstitle1.pcm",1);
filem=load_pcm("user\froggold\fsingame.pcm",1);
load_pcm("user\froggold\cuts.pcm",1);
load_pcm("user\froggold\gover.pcm",1);
load_pcm("user\froggold\thunder.pcm",0);


end;

process play(z,x,y);
begin
if (tcam==1) y=y/4; end;
if (tcam==2)
if (y<camy) y=128+40-((camy-y)/5); end;
//if (y>camy) y=camy+y/5; end;
// y=128;
end;
//y=255;
if (y<1) y=1; end;
if (y>254 and y<500) y=254; end;
if (y>500) y=700-y; end;
if (y<0) y=0; end;
// if (cheat==2) y=200; end;
sound(z,y,310);
frame();
//change_sound(height,
end;

process titles();
private fp,cp=1;
begin
//let_me_alone();
frame();
frame();
frame();
fade(100,100,100,2);
frop(315,300,1,22);
frop(315,290,2,22);
frop(325,400,1,22);
frop(325,390,2,22);
frop2(2);
frop2(1);

//frop(332,400,1,31);
//frop(334,384,2,31);

//let_me_alone();
// set_mode(m640x480);
frame();
//frop();
stage=0;
view3d();
cheats();
//put(file3,3,320,240);
file=file3;
if (cheat==2) size=50; y=400; end;
frame();
graph=1;
if (cheat==1) flags=1; end;

x=320;
y=100;
flags=4;
size=100;
// let_me_alone();
//sound(7,255,300);
frame();
//sound(7,,310);
frame();
fp=70;
//sound(7,20,310);
// size=400;
xt=900;
repeat
xt=xt-16;
if (xt<-4600) xt=900; end;
write(4,xt,440,3," CREATED BY JEREMY WOOD       MUSIC BY TIM WOOD      GUIDE YOUR FROGS HOME BY USING THE CURSOR KEYS AND Z. X. TO CHANGE CAMERA             GOOD LUCK!!     ");
graph=1;
if (ops==1) graph=0; end;
if (cp<>1) write(1,320,220+fp,1,"START"); end;
if (cp==1) write(2,320,220+fp,1,"START"); end;
if (cp<>2) write(1,320,245+fp,1,"OPTIONS"); end;
if (cp==2) write(2,320,245+fp,1,"OPTIONS"); end;
if (cp<>3) write(1,320,270+fp,1,"EXIT"); end;
if (cp==3) write(2,320,270+fp,1,"EXIT"); end;
frame();
if (cheat<>2)
flags=4;
if (size==120) flags=0; end;
if (size>100) size=size-20;
end;
end;
delete_text(all_text);
if (cheat==2)
if (fp>0) fp=fp-10;; end;
if (size>44); size=size-4; end;
if (y<170) y=y+8; end;
end;
// frame();
if (ops==0)
if (but>0) but=but-1; end;

if (key(_down) and cp<3 and but==0) cp=cp+1; but=3; end;
if (key(_up) and cp>1 and but==0) cp=cp-1;but=3; end;
if (key(_space) and cp==2 and but==0) but=6; options(); end;
end;
//if (key(_c)) cheat=1; end;
//if (key(_b)) cheat=2; end;
if (key(_g) and key(_b) and key(_a) ) cheat=2; end;
if (key(_a) and key(_b) and key(_c) ) cheat=1; end;


if (cheat==1) flags=1; end;
// if (cheat==2) file=file1; graph=64; size=50; end;

//x=rand(0,320);
// y=rand(0,320);
until (key(_space) and cp==1)
if (cheat==2) clear_screen(); end;
//fade(0,0,0,10);
//frame();
file=file1;
//frame();
//let_me_alone();
// if (cheat<>2) options(); end;
delete_text(all_text);
stop_sound(all_sound);
if (cheat<>2)
frame():
fade(0,0,0,10);
frame(); frame(); frame();
frame(); frame(); frame();
frame(); frame(); frame();
//frame(); frame(); frame();
end;
let_me_alone();
//mainloop();
//intro2();
intro4();
end;

process intro4();
private ph1,ph2;
begin
stop_sound(all_sound);
frame();
if (cheat==2)
gba();
end;
stop_sound(all_sound);
sound(9,190,260);
//sound(9,190,260);

fade(100,100,100,5);
ph1=-240;
ph2=480+240;
clear_screen();
stop_mode7(0);
ptime=0;
repeat
delete_text(all_text);
if (ptime<40 and ptime>10)
write(3,110,36,3,"HELLO!");
end;

if (ptime<70 and ptime>40)
write(3,220,440,3,"DINNERS READY!");
end;

if (ptime>70 and ptime<200)
write(3,20,36,3,"ON OUR WAY!");
end;


if (ph1<240) ph1=ph1+32; end;
if (ptime>20 and ph2>240) ph2=ph2-32; end;

clear_screen();
if (ptime<40 or ptime>70)
if (cheat<>2)
xput(0,286,160,ph1,0,100,0,0);
xput(0,287,160+320,ph2,0,100,5,0);
end;
if (cheat==2)
xput(0,286,320-68,ph1-16,0,42,0,0);
xput(0,287,320+68,ph2-16,0,42,5,0);
end;

end;

if (ptime>39 and ptime<71)
if (cheat<>2)
xput(0,286,160,ph1,0,100,4,0);
xput(0,287,160+320,ph2,0,100,1,0);
end;
if (cheat==2)
xput(0,286,320-68,ph1-16,0,42,4,0);
xput(0,287,320+68,ph2-16,0,42,1,0);
end;


end;

frame();

ptime=ptime+1;
if (ptime==110 and cheat<>2) fade(200,200,200,10);
end;
until (ptime>120);
delete_text(all_text);
intro2();
end;


process cheats();
begin
z=-1000;
graph=0;
size=220;
x=320;
y=240;
loop;
if (cheat==2) graph=64;
if (size>100) size=size-10; end;
end;
frame();
end;
end;

process frop(x,y,height,z);
private fr=1;
begin
//x=320;
//y=240;
size=50;
graph=22;
if (height==2) flags=6; end;
file=file3;
ctype=c_m7;
loop
if (view==1) graph=49+fr; end;
graph=z+fr;
if (view==3) graph=40+fr; end;

fr=fr+1; if (fr>8) fr=1; end;
if (cheat==2)
if (size>40) size=size-8; end;
//if (y>270) y=y-8; end;
end;
frame();
end;
end;

process frop2(height);
private fr=1;
begin
//x=320;
//y=240;
y=126;
x=0;
size=50;
graph=22;
if (height==2) flags=6; end;
file=file3;
ctype=c_m7;
loop
graph=49+fr;

if (y<440) y=y+2; graph=40+fr; end;
if (y<430) graph=31+fr; end;
fr=fr+1; if (fr>8) fr=1; end;
if (cheat==2)
if (size>40) size=size-8; end;
//if (y>270) y=y-8; end;
end;
x=x+2;
if (x>640) x=0; y=126; end;

frame();
end;
end;


process do3(graph,x,y,z,size);
begin
file=file3;
// size=100;
ctype=c_m7;
if (z==1) flags=6; end;
if (z==0 and y<80) flags=4; end;
graph=graph+12;
repeat
if (z==0 and y<20) flags=4; end;
frame();
y=y-8;
until (y<0);
end;

process intro2();
private mi,fr;
begin
fade(100,100,100,10);
let_me_alone();
if (cheat==2) gba(); end;
m7off=1;
stop_mode7(0);
clear_screen();
//frame();
put(file3,10,320,240);
//frame();
//play_cd(1,0);
fr=0;
size=40;
mi=1;
y=280;
repeat
size=size+10;
file=file1;
graph=163+fr;
fr=fr+1;
if (fr>5) fr=0; end;
mi=mi+1;
x=300;
if (cheat<>2) y=y+2; end;
if (mi>15 and cheat<>2) fade (0,0,0,5); end;
frame();
until (mi>20)
mainloop();
end;

process gover1();
private mi,yo2;
begin
stop_sound(all_sound);
sound(10,190,260);
sound(10,190,260);
//xput(0,288,320,240,0,100,0,0);
let_me_alone();

if (cheat<>2)
set_mode(m640x480);
xput(0,288,320,240,0,100,0,0);
end;
if (cheat==2) gba(); end;
//let_me_alone();
mi=0;
x=320;
y=250;
file=file1;
graph=289;
stop_mode7(0);
size=0;
if (cheat==2)
yo2=100;
end;
repeat
frame();
mi=mi+1;
if (cheat<>2 and size<100) size=size+10; end;
if (cheat==2 and size<50) size=size+10; end;
if (cheat==2)
xput(0,288,320,yo2,0,100,0,0);
if (yo2<320) yo2=yo2+2; end;
end;

until (mi>300 or key(_space));
lt=0;
lleft=5;
m7off=0;
// life=5;
tpage=1;
lmt(21);
end;

process allhome();
private xtc,delay;
begin
xtc=640;
delete_text(all_text);
delay=0;
vfx=0;
if (cheat<>2)
set_mode(m640x480);
end;
stop_sound(all_sound);
stage=stage+1;
stop_mode7(0);
let_me_alone();
frogshome=0;
if (cheat==2)
gba();
end;
if (cheat<>2)
xput(0,290,320,240,0,100,rand(0,1),0);
end;
if (cheat==2)
xput(0,290,320,216,0,44,rand(0,1),0);
end;

repeat
delete_text(all_text);
write(3,xtc,190,3,"CONGRATULATIONS!");
write(3,xtc,240,3," LEVEL  COMPLETE!");

frame();
xtc=xtc-16;
delay=delay+1;

if (delay==85 and cheat==2)
clear_screen();
end;

if (delay==85 and cheat<>2)
fade(0,0,0,6);
end;
until (delay>115)
//mainloop();
timel=130;
intro4();
end;


process lmt(graph);
private timmy=0;
begin
let_me_alone();
//play_cd(1,0);
if (cheat==2) gba();
//clear_screen();
end;
clear_screen();

stop_sound(all_sound);
if (cheat<>2)
set_mode(m640x480);
end;
//if (cheat==2) gba(); end;
sound(7,255,260);
sound(7,255,260);

set_fps(24,0);
//frame();
//frame();
//frame();
//frame();
if (cheat<>2)
frame();
frame();
end;
x=320;
y=240;
x=-320;
//y=480;
y=240;
size=100;
if (cheat==2) size=38; y=210; end;
file=file3;
// graph=21;
if (cheat<>2) fade(0,0,0,10); end;

repeat
xput(file3,graph,640-x,y,0,size,4,0);
if (x<320) x=x+16; end;
if (y>240) y=y-16; end;
if (cheat<>2)
if (timmy==10) fade(150,0,0,10); end;
if (timmy==15) fade(500,150,0,10); end;
if (timmy==20) fade(0,150,0,10); end;
if (timmy==25) fade(0,0,150,10); end;
// if (timmy==35) fade(150,0,150,10); end;
if (timmy==30) fade(200,200,200,10); end;
if (timmy==40) fade(100,100,100,10); end;
if (timmy>110) y=y+32; x=x+32; fade (200,200,200,6) ; end;
end;
//frame();
flags=4;
timmy=timmy+1;
frame();
if (tpage==2 and y>100) y=y-4; end;
if (tpage==2 and timmy>40) fade(80,80,80,10); end;
if (tpage==2 and timmy>43) timmy=300; end;
until (timmy>120)
frame();
frame();
frame();
frame();

//if (tpage==1) tpage=2; lmt(2); return; end;
if (tpage==1) titles(); end;
end;
