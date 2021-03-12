compiler_options _extended_conditions;
PROGRAM BARMAN;

CONST
momnt=1000;
framerate=20;
cocktailstart=45;
cocktailend=64;
noof_cusfpgs=10;
noof_hbfpgs=10;
noof_hhfpgs=10;
noof_robfpgs=1;
humprob=4;//rand(0,humprob)= probability of customer being human or robot

GLOBAL
mainfpg;
speech;
scorefnt;
stool_id[7];
drinkmix[5];
mood[9];
readymade;//0=none, 1 to 1017=cocktails, 2000=unmixed, 2001=beer, 2002=oil
cusfpg[noof_cusfpgs-1];
robfpg[noof_robfpgs-1];
humbodfpg[noof_hbfpgs-1];
humhedfpg[noof_hhfpgs-1];
rickfpg;
score;
level;
custno;
hiscoretable[129];
hiscoretabledata[129];


LOCAL
cstate;// customer state: 0=wants service, 1=waiting for drink, 2=has drink,
        // 3=happyanim 4=angryanim
place;
react;
handx;handy;hedx;hedy;
annoy;
gameend;

BEGIN
mainfpg=load_fpg("user\rick\barman.fpg");
speech=load_fnt("user\rick\speech.fnt");
scorefnt=load_fnt("user\rick\score.fnt");
set_fps(framerate,0);
SET_MODE(M800x600);
text_z=-5000;

load("user\rick\hiscore.dat",offset hiscoretabledata);
for(z=0;z<120;z++)
hiscoretable[z]=abc(hiscoretabledata[z]);
end
for(z=120;z<130;z++)
hiscoretable[z]=hiscoretabledata[z];
end

titlescreen(0);
end

process loadfpgs();
begin
rickfpg=load_fpg("user\rick\rick.fpg");
cusfpg[0]=load_fpg("user\rick\cus1.fpg");
cusfpg[1]=load_fpg("user\rick\cus2.fpg");
cusfpg[2]=load_fpg("user\rick\cus3.fpg");
cusfpg[3]=load_fpg("user\rick\cus4.fpg");
cusfpg[4]=load_fpg("user\rick\cus5.fpg");
cusfpg[5]=load_fpg("user\rick\cus6.fpg");
cusfpg[6]=load_fpg("user\rick\cus7.fpg");
cusfpg[7]=load_fpg("user\rick\cus8.fpg");
cusfpg[8]=load_fpg("user\rick\cus9.fpg");
cusfpg[9]=load_fpg("user\rick\cus10.fpg");

humbodfpg[0]=load_fpg("user\rick\humbod1.fpg");
humbodfpg[1]=load_fpg("user\rick\humbod2.fpg");
humbodfpg[2]=load_fpg("user\rick\humbod3.fpg");
humbodfpg[3]=load_fpg("user\rick\humbod4.fpg");
humbodfpg[4]=load_fpg("user\rick\humbod5.fpg");
humbodfpg[5]=load_fpg("user\rick\humbod6.fpg");
humbodfpg[6]=load_fpg("user\rick\humbod7.fpg");
humbodfpg[7]=load_fpg("user\rick\humbod8.fpg");
humbodfpg[8]=load_fpg("user\rick\humbod9.fpg");
humbodfpg[9]=load_fpg("user\rick\humbod10.fpg");

humhedfpg[0]=load_fpg("user\rick\humhed1.fpg");
humhedfpg[1]=load_fpg("user\rick\humhed2.fpg");
humhedfpg[2]=load_fpg("user\rick\humhed3.fpg");
humhedfpg[3]=load_fpg("user\rick\humhed4.fpg");
humhedfpg[4]=load_fpg("user\rick\humhed5.fpg");
humhedfpg[5]=load_fpg("user\rick\humhed6.fpg");
humhedfpg[6]=load_fpg("user\rick\humhed7.fpg");
humhedfpg[7]=load_fpg("user\rick\humhed8.fpg");
humhedfpg[8]=load_fpg("user\rick\humhed9.fpg");
humhedfpg[9]=load_fpg("user\rick\humhed10.fpg");

robfpg[0]=load_fpg("user\rick\rob1.fpg");
end

process unloadfpgs();
private z1;
begin
unload_fpg(rickfpg);
for(z1=0;z1<noof_cusfpgs;z1++)
unload_fpg(cusfpg[z1]);
end
for(z1=0;z1<noof_hbfpgs;z1++)
unload_fpg(humbodfpg[z1]);
end
for(z1=0;z1<noof_hhfpgs;z1++)
unload_fpg(humhedfpg[z1]);
end
for(z1=0;z1<noof_robfpgs;z1++)
unload_fpg(robfpg[z1]);
end
end

PROCESS rungame();
private
counter1;
counter2;
begin
dump_type=partial_dump;
restore_type=partial_restore;
loadfpgs();
score=0;
level=1;
readymade=0;
custno=0;
for(counter1=0;counter1<6;counter1++)
drinkmix[counter1]=0;end
for(counter1=0;counter1<8;counter1++)
stool_id[counter1]=0;end

put_screen(mainfpg,1);
barman1(100,400);
bar();
wall();
pumps();
door();
write(scorefnt,110,1,2,"Score:");
write_int(scorefnt,113,1,0,offset score);
write(scorefnt,600,1,1,"Drink Held");

counter1=0;
for(x=28;x<400;x+=39)
if (x>200)counter1=1;end
mood[counter2]=moodicon(x,counter1);
counter2++;
end

counter1=rand(10,60);
counter2=0;

loop
counter1--;
if (custno<2 and counter1>100)counter1=rand(10,60);end
if (counter1<1) counter1=rand(10,1400);
if (custno==8) else
if (custno==7) if (level>13) customer1();counter2++;end else
if (custno==6) if (level>10) customer1();counter2++;end else
if (custno==5) if (level>7) customer1();counter2++;end else
if (custno==4) if (level>4) customer1();counter2++;end else
if (custno==3) if (level>1) customer1();counter2++;end else
customer1();counter2++;end end end end end end
end
if (level<score/3000)level=score/3000;counter2=0;end
if (counter2>5)counter2=0;level++;end
if (key(_esc))pressescape();end
if (gameend)return;end
frame;
end
end

PROCESS moodicon(x,cstate)
private
z1;
begin
y=50;z=-500;
react=cstate;
loop graph=24+react; frame;
if (react==1 and id==mood[0])if(not get_id(type gameover)) gameover(0);end
end
if (react==0 and id==mood[9]) score+=5000;
while(z1=get_id(type moodgoto))signal(z1,s_kill);end
happyicons();
for (z1=0;z1<5;z1++)
mood[z1].cstate=0;mood[z1].react=0;end
for (z1=5;z1<10;z1++)
mood[z1].cstate=1;mood[z1].react=1;end
end

end
end

PROCESS moodgoto(x,y,cstate)
private
z1;
target;
speed=8;
movangle;
begin
z=-501;
graph=24+cstate;
if (cstate==0)
for (z1=0;z1<10;z1++)
if (mood[z1].cstate==1)target=mood[z1];z1=20;end
end
else
for (z1=9;z1>-1;z1--)
if (mood[z1].cstate==0)target=mood[z1];z1=-1;end
end
end
if (target==0)return;end
speed=get_dist(target)/30;
target.cstate=cstate;
while(target.react<>cstate)
movangle=get_angle(target);
angle=movangle;
advance(speed);
angle=0;
frame;
if (target.x<x+speed and target.x>x-speed and
    target.y<y+speed and target.y>y-speed) target.react=cstate;end
end
end

PROCESS barman1(x,y);

PRIVATE
speed;
speed1=6;// diagonal
speed2=8;// straight line
spotchek;
z1;z2;
addmix;
dir;
stat;
aniframe;
oldx;oldy;
anicount1=2;
anicount2;
anidir=1;
txt;

BEGIN
file=rickfpg;
GRAPH=1;
z=-1000;
loop

oldx=x;oldy=y;
stat=0;
anicount2++;

if (anicount2>anicount1)
anicount2=0;
aniframe+=anidir;
if (aniframe>1)anidir=-1;end
if (aniframe<1)anidir=1;end
end

z1=0;
if (key(_left))z1++;end
if (key(_right))z1++;end
if (key(_up))z1++;end
if (key(_down))z1++;end

if (z1<2)speed=speed2;
else speed=speed1;end

if (key(_left)) x-=speed;dir=2;end

if (key(_right)) x+=speed;dir=4;end

if (key(_up)) y-=speed;dir=3;end

if (key(_down)) y+=speed;dir=1;end

if (x>775)x=775;end
if (x<25)x=25;end
if (y>560)y=560;end
if (y<370)y=370;end

if (oldx==x and oldy==y)aniframe=1;stat=1;end

if (dir==1)graph=2+aniframe;end
if (dir==2)graph=5+aniframe;end
if (dir==3)graph=8+aniframe;end
if (dir==4)graph=11+aniframe;end

if (dir==1 and stat==1)graph=1;end

IF (key(_space))

if (dir==1)graph=3;end
if (dir==2)graph=6;end
if (dir==3)graph=9;end
if (dir==4)graph=12;end

While (key(_space))frame;end
spotchek=map_get_pixel(mainfpg,4,x,y);

IF (spotchek<>225)

IF (spotchek==5)

if (readymade==2000)
dir=1;
react=0;
shakeometer();
graph=16;
while (react==0);
flash(400,35,-5999,mainfpg,21,0);
flash(x-1+rand(0,11),y-73+rand(0,12),z-5,file,17,0);
frame;
end
pausebar(0);
if (react==1) readymade=0;

//ANIM CRAPSHAKE
for (z1=0;z1<(momnt*2)/100;z1++)
flash(x-1+rand(0,11),y-73+rand(0,12),z-5,file,17,0);
frame;
end
graph=18;
for(z1=0;z1<8;z1++)
if (stool_id[z1])if (stool_id[z1].cstate<>2) stool_id[z1].annoy+=40;end end end
for (z1=0;z1<6;z1++)
if (drinkmix[z1]>0) z2=renumb2(drinkmix[z1]);
drop(x+25,y-80,mainfpg,z2+27,200,1);end
drinkmix[z1]=0;
end

frame(momnt*2);
else
z2=0;
for (z1=0;z1<6;z1++)
z2+=drinkmix[z1];
drinkmix[z1]=0;
end
readymade=z2;

if (react==2)
//ANIM OKSHAKE
for (z1=0;z1<(momnt*2)/100;z1++)
flash(x-1+rand(0,11),y-73+rand(0,12),z-5,file,17,0);
frame;
end
end

if (react>2);
//ANIM GOODSHAKE
graph=30;
for(z1=0;z1<8;z1++)
if (stool_id[z1])stool_id[z1].annoy-=10;end end
for (z1=0;z1<(momnt*2)/100;z1++)
flash(x+32,y-82,z-5,file,31,z1*45000);frame;
end
end

if (react>3);
//ANIM PERFECTSHAKE
z2=rand(0,2);

if (z2==0)  //THROW AND CATCH ON FOOT
graph=32;
spinny(x,y,1);
cstate=0;while(cstate==0)frame;end
cstate=0;
graph=33;
frame(momnt);
end

if (z2==1)  //THROW AND CATCH ON HEAD
graph=32;
spinny(x,y,2);
cstate=0;while(cstate==0)frame;end
cstate=0;
graph=34;
frame(momnt);
end

if (z2==2)  //SHOULDER ROLL
graph=35;
spinny(x,y,3);
cstate=0;while(cstate==0)frame;end
cstate=0;
graph=1;
end

for(z1=0;z1<8;z1++)
if (stool_id[z1])stool_id[z1].annoy-=60;end end
end
end
end
unpausebar(0);
ELSE

IF (y>470)
IF (readymade==0 or readymade==2000)

IF (spotchek==204) //ingredient 1
addmix=1;
END
IF (spotchek==83) //ingredient 2
addmix=2;
END
IF (spotchek==18) //ingredient 4
addmix=4;
END
IF (spotchek==194) //ingredient 8
addmix=8;
END
IF (spotchek==235) //ingredient 16
addmix=16;
END
IF (spotchek==74) //ingredient 32
addmix=32;
END
IF (spotchek==72) //ingredient 64
addmix=64;
END
IF (spotchek==217) //ingredient 128
addmix=128;
END
IF (spotchek==120) //ingredient 256
addmix=256;
END
IF (spotchek==2) //ingredient 512
addmix=512;
END

IF (addmix<>0)
readymade=2000;
z1=0;
for (z1=0;z1<6;z1++)
if (drinkmix[z1]==addmix)break;
else
if (drinkmix[z1]==0) drinkmix[z1]=addmix;z1=6;

// ANIM add mix to shaker
z2=renumb2(addmix);
y=546;x=(62*z2)-32;z=-1100;
drop(x+29,y-91,mainfpg,z2+27,200,0);
graph=14;frame(momnt);
z=-1000;
end
end
end
END

addmix=0;

END

IF (readymade==0)

IF (spotchek==151)

//ANIM get beer
y=546;x=650;z=-1100;
drop(x+29,y-91,mainfpg,38,200,0);
graph=14;frame(momnt);z=-1000;

readymade=2001;
END
IF (spotchek==92)

//ANIM get oil
y=546;x=712;z=-1100;
drop(x+29,y-91,mainfpg,39,200,0);
graph=14;frame(momnt);z=-1000;

readymade=2002;
END

ELSE //readymade check switched

IF (spotchek==86 and readymade>0)

//ANIM bin stuff
score-=200;

graph=15;
if (readymade==2000)
for(z1=0;z1<6;z1++)
if (drinkmix[z1]>0) z2=renumb2(drinkmix[z1]);
drop(x-3,y-61,mainfpg,z2+27,200,0);end
drinkmix[z1]=0;
end
end
if (readymade==2001)
drop(x-3,y-61,mainfpg,38,200,0);
end
if (readymade==2002)
drop(x-3,y-61,mainfpg,39,200,0);
end
if (readymade<2000)
drop(x-3,y-61,mainfpg,rand(28,39),200,0);
end
frame(momnt);
readymade=0;
END

END //end readymade check

ELSE

IF (spotchek==204 and stool_id[0]) stool_id[0].react=1; //customer 1
END
IF (spotchek==83 and stool_id[1]) stool_id[1].react=1; //customer 2
END
IF (spotchek==18 and stool_id[2]) stool_id[2].react=1; //customer 3
END
IF (spotchek==194 and stool_id[3]) stool_id[3].react=1; //customer 4
END
IF (spotchek==235 and stool_id[4]) stool_id[4].react=1; //customer 5
END
IF (spotchek==74 and stool_id[5]) stool_id[5].react=1; //customer 6
END
IF (spotchek==72 and stool_id[6]) stool_id[6].react=1; //customer 7
END
IF (spotchek==217 and stool_id[7]) stool_id[7].react=1; //customer 8
END

END
END
END
END

//shaker contents at top right
 while(z1=get_id(type flash2))
  signal(z1,s_kill);
 end
 if(txt>0)delete_text(txt);end
 txt=0;
 if (readymade>0 and readymade<2000)
  txt=write(scorefnt,650,50,5,"Cocktail:");
  rand_seed(readymade);
  z2=rand(cocktailstart,cocktailend);
  rand_seed(timer);
  flash2(670,50,-5000,mainfpg,z2,0);
 else
  if (readymade==2000)
   txt=write(scorefnt,540,50,5,"Mix:");
   z2=renumb2(drinkmix[0]);
   flash2(560,50,-5000,mainfpg,z2+7,0);
   for(z1=1;z1<6;z1++)
    if (drinkmix[z1]>0)
     z2=renumb2(drinkmix[z1]);
     flash2(560+(40*z1),50,-5000,mainfpg,z2+7,0);
     flash2(540+(40*z1),50,-5000,mainfpg,20,0);
    end
   end
  else
   if (readymade==2001)
    txt=write(scorefnt,600,50,4,"Beer");
   else
    if (readymade==2002)
     txt=write(scorefnt,600,50,4,"Oil");
    else
     if (readymade==0)
     txt=write(scorefnt,600,50,4,"None");
     end
    end
   end
  end
 end
//end of shaker contents bit

frame;

end
end

PROCESS shakeometer();
private
indic;
speed;

begin
resolution=10;
x=180;y=350;z=-6000;file=mainfpg;graph=22;speed=475;indic=1;
loop
if (key(_space)) father.react=indic;break;end
x+=speed;
if (x>4579)indic=2;end
if (x>6339)indic=3;end
if (x>7509)indic=4;end
if (x>7839)x=180;indic=1;
end
frame;
end
end

PROCESS spinny(relx,rely,animno);
private
yspeed;

begin
graph=31;file=rickfpg;

if (animno==1) //throw in air catch on foot
 z=father.z-5;y=rely-120;x=relx;yspeed=20;
 loop
 y-=yspeed;
 if (yspeed<10 and yspeed>-10)x-=2;end
 yspeed--;
 angle+=45000;
 if ((x==relx-38) and (y==rely-77))father.cstate=1;frame;return;end
 frame;
 end
end
if (animno==2) //throw, catch on head
 z=father.z-5;y=rely-120;x=relx;yspeed=15;
 loop
 y-=yspeed;
 yspeed--;
 angle+=45000;
 if (yspeed==-10)father.graph=35;end
 if (y==rely-120)father.cstate=1;frame;return;end
 frame;
 end
end
if (animno==3) //shoulderroll
 z=father.z+5;x=relx+32;y=rely-106;
 frame;
 for(yspeed=0;yspeed<10;yspeed++)
  angle-=45000;
  x-=7;y+=3;
  frame;
 end
 father.flags=1;x=relx-38;y=rely-106;
 for(yspeed=0;yspeed<10;yspeed++);
  angle+=45000;
  x+=7;y+=3;
  frame;
 end
 father.graph=30;father.flags=0;x=relx+32;y=rely-82;z=father.z-5;
 for(yspeed=0;yspeed<10;yspeed++);
  angle+=45000;frame;
 end
 father.cstate=1;return;
 end
end

PROCESS customer1();
private
speed=5;
z1;
z2;
ani;
dir;//2 3
    // 1
anicount=3;
hum;
hedfile;myhed;

begin
if (rand(0,humprob)==0)if (rand(0,1)==1)hum=1;else hum=2;end end
custno++;
x=400;
if (hum) file=humbodfpg[rand(0,noof_hbfpgs-1)];
hedfile=humhedfpg[rand(0,noof_hhfpgs-1)];
else
if (hum==2)file=robfpg[rand(0,noof_robfpgs-1)];
else
file=cusfpg[rand(0,noof_cusfpgs-1)];end end
graph=9;
loop
place=rand(0,7);
if (not stool_id[place])break;end
z1++;
if (z1>10) return;end
end
stool_id[place]=id;
dir=1;
z1=0;
loop
z=800-y;
z1++;
if (gameend) customer3(x,y,file,place,hum,hedfile,dir);return;end
if (z1==speed)
ani++;
if (ani==anicount) ani=0; graph++; end
if (graph==11) graph=9; end
if (hum)
 signal(myhed,s_kill);
 get_real_point(2,offset hedx,offset hedy);
 myhed=head(hedfile);
end
frame;z1=0;
end

if (dir==1)y+=1;end
if (dir==2)x-=1;end
if (dir==3)x+=1;end
z2=map_get_pixel(mainfpg,4,x,y);
if(place==0)
if (z2==3)dir=2;end
if (z2==4)dir=1;end
end
if(place==1)
if (z2==1)dir=2;end
if (z2==2)dir=1;end
end
if(place==2)
if (z2==4)dir=2;end
if (z2==5)dir=1;end
end
if(place==3)
if (z2==6)dir=2;end
if (z2==7)dir=1;end
end
if(place==4)
if (z2==7)dir=3;end
if (z2==8)dir=1;end
end
if(place==5)
if (z2==2)dir=3;end
if (z2==3)dir=1;end
end
if(place==6)
if (z2==1)dir=3;end
if (z2==2)dir=1;end
end
if(place==7)
if (z2==5)dir=3;end
if (z2==6)dir=1;end
end
if (z2==9) customer2(x,y,place,file,hum,hedfile);
return;end
end
end


PROCESS customer2(x,y,place,file,hum,hedfile);
private;
z1;
ing1;ing2;ing3;ing4;ing5;ing6;
drinkwanted;
myarm;
hum;
hedfile;myhed;
askshake;
ingno;
anidivide;
anicount=100;
aniframe;
drcount;
waittime;
waittime2;
annoylo=0;    //originally 0
annoyhi=200;  //originally 250

waittolerance=20; //wait how long (* custno) before getting annoy+=10
                       //tolerance is 2 times less if waiting to order
complexlow; //least ingredients
complexhigh; //most ingredients
drinkspeed=15* 50 ;//number of seconds(ish)
noofdrinks;

begin
complexlow=(level/5)+2;
complexhigh=(level/2)+2;
if (complexhigh>6)complexhigh=6;end
drinkspeed=60-(level*4);
drinkspeed+=rand(1,10);
if (drinkspeed<20) drinkspeed=20;end
drinkspeed*=15;
annoy=annoyhi/2;
noofdrinks=rand(3,6);
graph=1;
cstate=0;
stool_id[place]=id;
loop
aniframe++;
drcount++;
if (gameend)
cstate=1;graph=3;
if(hum)get_real_point(2,offset hedx,offset hedy);end
frame(momnt*3);
customer3(x,y,file,place,hum,hedfile,1);return;
end
if (cstate==2)
waittime=0;
waittime2=0;
if (aniframe<anidivide)graph=5;else graph=6;
end
if (aniframe>anicount) aniframe=0;anicount=rand(60,120);
    anidivide=rand(anicount-40,anicount);
end
if (drcount>drinkspeed)cstate=0;noofdrinks--;
 drinkspeed=60-(level*4);
 drinkspeed+=rand(1,10);
 if (drinkspeed<20) drinkspeed=20;end
 drinkspeed*=15;
 if (noofdrinks<1)customer3(x,y,file,place,hum,hedfile,1);return;end
end
else
if (annoy>annoyhi)graph=3;moodgoto(x,y-150,1);
for(z1=0;z1<8;z1++)
if (stool_id[z1] and stool_id[z1]<>id)stool_id[z1].annoy+=25;end end
if(hum)get_real_point(2,offset hedx,offset hedy);end
frame(momnt*3);react=0;
if (rand(0,3)==0) customer3(x,y,file,place,hum,hedfile,1);return;end
annoy=annoyhi/2;
end
if (annoy<annoylo)graph=4;moodgoto(x,y-150,0);score+=200;
for(z1=0;z1<8;z1++)
if (stool_id[z1] and stool_id[z1]<>id)stool_id[z1].annoy-=25;end end
if(hum)get_real_point(2,offset hedx,offset hedy);end
frame(momnt*3);react=0;
annoy=annoyhi/2;
end
end

if (cstate==0) graph=1;waittime+=2;waittime2+=2;end
if (cstate==1) graph=2;waittime+=1;waittime2+=2;end
if (waittime>waittolerance*custno)waittime=0;annoy+=10;end
if (waittime2>(waittolerance*(annoyhi/10))*custno)waittime2=0;waittime=0;annoy+=annoyhi;end

if (react==1)react=0;

if (cstate==0)
cstate=1;
waittime=0;waittime2=0;
if(hum==0)
ingno=rand(complexlow,complexhigh);
ing1=rand(1,10);

if (ingno>1) loop ing2=rand(1,10); if (ing2<>ing1) break;end end end
if (ingno>2) loop ing3=rand(1,10); if (ing3<>ing1)if (ing3<>ing2) break;end end end end
if (ingno>3) loop ing4=rand(1,10); if (ing4<>ing1)if (ing4<>ing2)if (ing4<>ing3) break;end end end end end
if (ingno>4) loop ing5=rand(1,10); if (ing5<>ing1)if (ing5<>ing2)if (ing5<>ing3)if (ing5<>ing4) break;end end end end end end
if (ingno>5) loop ing6=rand(1,10); if (ing6<>ing1)if (ing6<>ing2)if (ing6<>ing3)if (ing6<>ing4)if (ing6<>ing5) break;end end end end end end end

ing1=renumb1(ing1); ing2=renumb1(ing2); ing3=renumb1(ing3);
ing4=renumb1(ing4); ing5=renumb1(ing5); ing6=renumb1(ing6);

iwant(x,ingno,ing1,ing2,ing3,ing4,ing5,ing6,0);
drinkwanted=ing1+ing2+ing3+ing4+ing5+ing6;
//ALIEN ORDERS

else
if (hum==1) talk(x,"I want a beer",momnt);drinkwanted=2001;
else talk(x,"I want oil",momnt);drinkwanted=2002;
end end

else if (cstate==1)

if (readymade==drinkwanted) cstate=2; readymade=0;
myarm=cus_arm(x,y,file,drinkwanted);
drinkwanted=0; ing1=0; ing2=0; ing4=0; ing5=0; ing6=0; drcount=0;
//ALIEN GETS DRINK
if (hum==0)
score+=ingno*50;
if (ingno==1)annoy-=20;else
if (ingno==2)annoy-=40;else
if (ingno==3)annoy-=60;else
if (ingno==4)annoy-=90;else
if (ingno==5)annoy-=150;else
if (ingno==6)annoy-=250;end end end end end end
else
score+=100;annoy-=50;end

else if (readymade==0 or readymade==2000)
if (hum==1) talk(x,"Gimme a beer!",momnt);
else
if (hum==2) talk(x,"I need oil",momnt);
else
if (askshake and readymade==2000) talk(x,"You need to shake it!",momnt*2);else
iwant(x,ingno,ing1,ing2,ing3,ing4,ing5,ing6,0); end
if (readymade==2000)askshake++;end
end end
//ALIEN RE-ORDERS

else
if (hum==0)iwant(x,ingno,ing1,ing2,ing3,ing4,ing5,ing6,1);
//WRONG ORDER GIVEN TO ALIEN
annoy=annoy+50;
else
//HUMAN OR ROBOT EXPLODES
cstate=2;myarm=cus_arm(x,y,file,readymade);readymade=0;
graph=6;frame(momnt);
if (hum)talk(x,"Wait! This isn't beer!",momnt*2);
else talk(x,"MALFUNCTION!",momnt*2);end
frame;
moodgoto(x,y-150,1);
while(z1=get_id(type helddrink))pop(z1.x,z1.y,z1.z-1);end
if (hum)explode(x,y-50,z,hedfile,hum);
else explode(x,y-50,z,file,hum); end
custno--;stool_id[place]=0;
for (z1=0;z1<8;z1++)
if (stool_id[z1])
 if (stool_id[z1].cstate==2)
  stool_id[z1].cstate=0;stool_id[z1].annoy+=100;
 end
end
end
return;
end
end end

else if (cstate==2) //RANDOM CHAT
end

end
end
end
if (hum)
 signal(myhed,s_kill);
 get_real_point(2,offset hedx,offset hedy);
 myhed=head(hedfile);
end

frame;
end
end

PROCESS cus_arm(x,y,file,drink);
begin
z=-502;
graph=7;
loop
if (father.graph==5)graph=7;end
if (father.graph==6)graph=8;end
if (father.cstate<>2)break;end
get_real_point(1,offset handx,offset handy);
helddrink(drink);
frame;
end
end

PROCESS helddrink(z1);
begin
z=-501;file=mainfpg;
if (z1>2000) graph=z1-1995;
else
rand_seed(z1);
graph=rand(cocktailstart,cocktailend);rand_seed(timer);end
x=father.handx;y=father.handy;
frame;
end

PROCESS customer3(x,y,file,place,hum,hedfile,dir);
private
hum;hedfile;myhed;
speed=5;
z1;
z2;
ani;
dir;// 1
    //3 2
anicount=3;

begin
stool_id[place]=0;
custno--;
graph=9;
if(hum)graph=11;end
loop
z=800-y;
z1++;

if (z1==speed)
ani++;
if (ani==anicount) ani=0; graph++; end
if (hum)
 if (graph==13) graph=11; end
 signal(myhed,s_kill);
 get_real_point(2,offset hedx,offset hedy);
 myhed=head(hedfile);
else
 if (graph==11) graph=9; end
end
frame;z1=0;
end

if (dir==1)y-=1;end
if (dir==2)x+=1;end
if (dir==3)x-=1;end
z2=map_get_pixel(mainfpg,4,x,y);
if(place==0)
if (z2==3)dir=1;end
if (z2==4)dir=2;end
end
if(place==1)
if (z2==1)dir=1;end
if (z2==2)dir=2;end
end
if(place==2)
if (z2==4)dir=1;end
if (z2==5)dir=2;end
end
if(place==3)
if (z2==6)dir=1;end
if (z2==7)dir=2;end
end
if(place==4)
if (z2==7)dir=1;end
if (z2==8)dir=3;end
end
if(place==5)
if (z2==2)dir=1;end
if (z2==3)dir=3;end
end
if(place==6)
if (z2==1)dir=1;end
if (z2==2)dir=3;end
end
if(place==7)
if (z2==5)dir=1;end
if (z2==6)dir=3;end
end
if (y<-10)return;end
end
end

PROCESS iwant(x,ingno,ing1,ing2,ing3,ing4,ing5,ing6,talkid);
private
z1;z2;
begin
signal(father,s_freeze);
z=-4999;
y=190;
graph=19;
if (x==77)graph=18;x=125;end
if (x==734)graph=18;x=675;flags=1;end

if (talkid==1) z2=write(speech,x,y-30,4,"NO! I wanted"); else
z2=write(speech,x,y-30,4,"I want");
end
ing1=renumb2(ing1); ing2=renumb2(ing2); ing3=renumb2(ing3);
ing4=renumb2(ing4); ing5=renumb2(ing5); ing6=renumb2(ing6);

for(z1=0;z1<10+ingno*5;z1++)
flash(x+3,y,-5000,mainfpg,ing1+7,0);
if (ing2>0) flash(x-31,y,-5000,mainfpg,ing2+7,0); flash(x-14,y,-5000,mainfpg,20,0);end
if (ing3>0) flash(x+37,y,-5000,mainfpg,ing3+7,0); flash(x+20,y,-5000,mainfpg,20,0);end
if (ing4>0) flash(x-65,y,-5000,mainfpg,ing4+7,0); flash(x-48,y,-5000,mainfpg,20,0);end
if (ing5>0) flash(x+71,y,-5000,mainfpg,ing5+7,0); flash(x+54,y,-5000,mainfpg,20,0);end
if (ing6>0) flash(x-99,y,-5000,mainfpg,ing6+7,0); flash(x-82,y,-5000,mainfpg,20,0);end
frame;
end
delete_text(z2);
father.react=0;
signal(father,s_wakeup);
end

PROCESS talk(x,talkdata,time);
private
z1;z2;
begin
signal(father,s_freeze);
z=-4999;
y=190;
graph=19;
if (x==77)graph=18;x=125;end
if (x==734)graph=18;x=675;flags=1;end
if (x==400)y=150;end
z2=write(speech,x,y-15,4,talkdata);
for(z1=0;z1<time/100;z1++)
frame;
end
delete_text(z2);
father.react=0;
signal(father,s_wakeup);
end

PROCESS bar(); begin file=mainfpg;graph=5;x=400;y=338;z=-500;loop;frame;end end
PROCESS wall(); begin file=mainfpg;graph=2;z=615;loop;frame;end end
PROCESS pumps(); begin file=mainfpg;graph=27;z=-1050;y=599;loop;frame;end end

PROCESS door();
private z1;z2;z3;
begin
file=mainfpg;graph=40;x=400;y=130;z=615;
loop
z2=0;
while (z1=get_id(type customer1))if (z1.y>150 and z1.y<200)z2=1;end end
while (z1=get_id(type gameover))if (z1.y>150 and z1.y<200)z2=1;end end
while (z1=get_id(type customer3))if (z1.y>150 and z1.y<200)z2=1;end end
if (z2==1) if (graph==40)graph=41;frame;end graph=0;
else if (graph==0)graph=41;frame;end graph=40;end
frame;
end
end

PROCESS head(file)
begin
loop
x=father.hedx;y=father.hedy;z=father.z-1;
if (father.graph>10)graph=2;else
if (father.graph==3)graph=3;else
if (father.graph==4)graph=4;else
graph=1;end end end
frame;
if (father.x==0 and father.y==0)return;end
end
end

process pop(x,y,z)
begin
graph=42;size=30;frame(500);
end

PROCESS explode(ex,ey,ez,file,hum)
private
yspeed;xspeed;sizespeed;z1;sfact=10;
begin
graph=11;z=-10000;
if (hum)x=father.hedx;y=father.hedy;
else x=father.x;y=father.y-90;end
xspeed=rand(-20,20);yspeed=rand(10,20);sizespeed=yspeed*sfact;
while(y<650);
 if (z1<20) flash(ex,ey,ez,mainfpg,42,angle*2);end z1++;
 frame;angle+=45000;x+=xspeed;y-=yspeed;yspeed--;
 size+=sizespeed;sizespeed-=sfact;if(size<100)size=100;end
end
end

process flash(x,y,z,file,graph,angle)begin frame; end

process flash2(x,y,z,file,graph,angle)begin loop frame; end end
//flash2 processes are killed (nearly) every frame by rick

PROCESS happyicons();
private
z1;z2;z3;z4;
begin
for(z2=0;z2<30;z2++)
z3=0;
for(z1=0;z1<10;z1++)
flash(mood[z1].x,mood[z1].y,mood[z1].z-1,mainfpg,24,(z2+z3)*45000);z3++;
end
frame;
end
end

process renumb1(x);
begin
if (x==3) x=4;else if (x==4) x=8;else if (x==5) x=16;else if (x==6) x=32;
else if (x==7) x=64;else if (x==8) x=128;else if (x==9) x=256;
else if (x==10) x=512;end end end end end end end end
return(x);
end

process renumb2(x);
begin
if (x==4) x=3;else if (x==8) x=4;else if (x==16) x=5; else if (x==32) x=6;
else if (x==64) x=7; else if (x==128) x=8; else if (x==256) x=9;
else if (x==512) x=10;end end end end end end end end
return(x);
end

process abc(x);
begin
if (x==1) x="a";else if (x==2) x="b";else if (x==3) x="c";else if (x==4) x="d";else if (x==5) x="e";else if (x==6) x="f";else if (x==7) x="g";else if (x==8) x="h";else if (x==9) x="i";else if (x==10) x="j";else if (x==11) x="k";else if (x==12) x="l";else if (x==13) x="m";else if (x==14) x="n";else if (x==15) x="o";else if (x==16) x="p";else if (x==17) x="q";else if (x==18) x="r";else if (x==19) x="s";else if (x==20) x="t";else if (x==21) x="u";else if (x==22) x="v";else if (x==23) x="w";else if (x==24) x="x";else if (x==25) x="y";else if (x==26) x="z";else
if (x==27) x="A";else if (x==28) x="B";else if (x==29) x="C";else if (x==30) x="D";else if (x==31) x="E";else if (x==32) x="F";else if (x==33) x="G";else if (x==34) x="H";else if (x==35) x="I";else if (x==36) x="J";else if (x==37) x="K";else if (x==38) x="L";else if (x==39) x="M";else if (x==40) x="N";else if (x==41) x="O";else if (x==42) x="P";else if (x==43) x="Q";else if (x==44) x="R";else if (x==45) x="S";else if (x==46) x="T";else if (x==47) x="U";else if (x==48) x="V";else if (x==49) x="W";else if (x==50) x="X";else if (x==51) x="Y";else if (x==52) x="Z";else
if (x==53) x=" ";else if (x==54) x="1";else if (x==55) x="2";else if (x==56) x="3";else if (x==57) x="4";else if (x==58) x="5";else if (x==59) x="6";else if (x==60) x="7";else if (x==61) x="8";else if (x==62) x="9";else if (x==63) x="0";else end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end end
return(x);
end



PROCESS drop(x,y,fpg,graph,size,goright);

BEGIN
    z=-1200;
    REPEAT
        y=y+rand(1,4);
        angle=rand(-20,20)*1000;
        IF (size>50 AND rand(0,100)<size/8)
            CLONE
                if(goright)
                x+=rand(0,10);
                else
                x+=rand(-10,10);
                end
                y+=rand(0,10);
            END
        END
        size-=8;
        if (height>0) height--;end
        FRAME;
    UNTIL (size<25)
END

PROCESS pausebar(includerick);
private
z1;
begin
while (z1=get_id(type rungame))
signal(z1,s_freeze);end
while (z1=get_id(type moodgoto))
signal(z1,s_freeze);end
frame;
while (z1=get_id(type customer1))
signal(z1,s_freeze);end
while (z1=get_id(type customer2))
signal(z1,s_freeze);end
while (z1=get_id(type customer3))
signal(z1,s_freeze);end
if (includerick)
 while (z1=get_id(type barman1))
 signal(z1,s_freeze);end
 while (z1=get_id(type shakeometer))
 signal(z1,s_freeze);end
  while (z1=get_id(type spinny))
 signal(z1,s_freeze);end

 end
end

PROCESS unpausebar(includerick);
private
z1;
begin
while (z1=get_id(type rungame))
signal(z1,s_wakeup);end
while (z1=get_id(type moodgoto))
signal(z1,s_wakeup);end
frame;
while (z1=get_id(type customer1))
signal(z1,s_wakeup);end
while (z1=get_id(type customer2))
signal(z1,s_wakeup);end
while (z1=get_id(type customer3))
signal(z1,s_wakeup);end
if (includerick)
 while (z1=get_id(type barman1))
 signal(z1,s_wakeup);end
 while (z1=get_id(type shakeometer))
 signal(z1,s_wakeup);end
 while (z1=get_id(type spinny))
 signal(z1,s_wakeup);end
end
end

PROCESS pressescape();
private
z1;z2;
begin
pausebar(1);
z1=write(scorefnt,400,300,1,"DO YOU REALLY WANT TO QUIT?");
z2=write(scorefnt,400,305,7,"Press Y to confirm");
frame;
while (scan_code<>0)frame;end
loop
if (scan_code<>0)
if (key(_y))gameover(1);else break;end
end
frame;
end
delete_text(z1);
delete_text(z2);
unpausebar(1);
end


PROCESS gameover(instant);
private
z1;
begin
if(not instant)
 get_id(type rungame).gameend=1;
 for(z1=0;z1<8;z1++)
  if (stool_id[z1])stool_id[z1].gameend=1;end
 end
 file=mainfpg;
 graph=43;x=400;y=0;
 while(y<300)
  y+=4;z=780-y;
  frame;
 end
 graph=44;talk(x,"YOU'RE FIRED!",momnt*3);frame(momnt*3);
 frame;
end
fade_off();
frame;
dump_type=complete_dump;
restore_type=complete_restore;
let_me_alone();
delete_text(all_text);
clear_screen();
unloadfpgs();
enterhighscore();
fade_on();
end

PROCESS enterhighscore();
private
chars[11];
curchar;
scrchar[11];
z1;z2;
pos;
begin
put_screen(mainfpg,26);
for(z1=129;z1>119;z1--)
if(score>hiscoretabledata[z1])pos=z1;end
end
if (pos==0)titlescreen(2);return;end
y=312;
loop
file=mainfpg;
x=(curchar*30)+220;
graph=3;
z2++;
if(z2>5)graph=0;if(z2>10)z2=0;end end
z1=0;
if (key(_l_shift))z1=1;end
if (key(_r_shift))z1=1;end
if (key(_caps_lock))z1=1;end
if (curchar<12)
if(key(_a))chars[curchar]=1+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"a");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"A");end
  curchar++;while(key(_a))frame;end end
if(key(_b))chars[curchar]=2+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"b");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"B");end
  curchar++;while(key(_b))frame;end end
if(key(_c))chars[curchar]=3+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"c");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"C");end
  curchar++;while(key(_c))frame;end end
if(key(_d))chars[curchar]=4+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"d");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"D");end
  curchar++;while(key(_d))frame;end end
if(key(_e))chars[curchar]=5+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"e");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"E");end
  curchar++;while(key(_e))frame;end end
if(key(_f))chars[curchar]=6+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"f");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"F");end
  curchar++;while(key(_f))frame;end end
if(key(_g))chars[curchar]=7+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"g");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"G");end
  curchar++;while(key(_g))frame;end end
if(key(_h))chars[curchar]=8+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"h");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"H");end
  curchar++;while(key(_h))frame;end end
if(key(_i))chars[curchar]=9+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"i");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"I");end
  curchar++;while(key(_i))frame;end end
if(key(_j))chars[curchar]=10+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"j");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"J");end
  curchar++;while(key(_j))frame;end end
if(key(_k))chars[curchar]=11+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"k");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"K");end
  curchar++;while(key(_k))frame;end end
if(key(_l))chars[curchar]=12+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"l");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"L");end
  curchar++;while(key(_l))frame;end end
if(key(_m))chars[curchar]=13+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"m");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"M");end
  curchar++;while(key(_m))frame;end end
if(key(_n))chars[curchar]=14+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"n");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"N");end
  curchar++;while(key(_n))frame;end end
if(key(_o))chars[curchar]=15+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"o");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"O");end
  curchar++;while(key(_o))frame;end end
if(key(_p))chars[curchar]=16+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"p");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"P");end
  curchar++;while(key(_p))frame;end end
if(key(_q))chars[curchar]=17+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"q");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"Q");end
  curchar++;while(key(_q))frame;end end
if(key(_r))chars[curchar]=18+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"r");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"R");end
  curchar++;while(key(_r))frame;end end
if(key(_s))chars[curchar]=19+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"s");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"S");end
  curchar++;while(key(_s))frame;end end
if(key(_t))chars[curchar]=20+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"t");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"T");end
  curchar++;while(key(_t))frame;end end
if(key(_u))chars[curchar]=21+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"u");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"U");end
  curchar++;while(key(_u))frame;end end
if(key(_v))chars[curchar]=22+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"v");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"V");end
  curchar++;while(key(_v))frame;end end
if(key(_w))chars[curchar]=23+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"w");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"W");end
  curchar++;while(key(_w))frame;end end
if(key(_x))chars[curchar]=24+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"x");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"X");end
  curchar++;while(key(_x))frame;end end
if(key(_y))chars[curchar]=25+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"y");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"Y");end
  curchar++;while(key(_y))frame;end end
if(key(_z))chars[curchar]=26+(z1*26);
  if(z1==0)scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"z");else
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"Z");end
  curchar++;while(key(_z))frame;end end
if(key(_space))chars[curchar]=53;
  curchar++;while(key(_space))frame;end end
if(key(_1))chars[curchar]=54;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"1");
  curchar++;while(key(_1))frame;end end
if(key(_2))chars[curchar]=55;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"2");
  curchar++;while(key(_2))frame;end end
if(key(_3))chars[curchar]=56;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"3");
  curchar++;while(key(_3))frame;end end
if(key(_4))chars[curchar]=57;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"4");
  curchar++;while(key(_4))frame;end end
if(key(_5))chars[curchar]=58;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"5");
  curchar++;while(key(_5))frame;end end
if(key(_6))chars[curchar]=59;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"6");
  curchar++;while(key(_6))frame;end end
if(key(_7))chars[curchar]=60;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"7");
  curchar++;while(key(_7))frame;end end
if(key(_8))chars[curchar]=61;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"8");
  curchar++;while(key(_8))frame;end end
if(key(_9))chars[curchar]=62;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"9");
  curchar++;while(key(_9))frame;end end
if(key(_0))chars[curchar]=63;
  scrchar[curchar]=write(scorefnt,(curchar*30)+220,300,4,"0");
  curchar++;while(key(_0))frame;end end
end //end of 12 chars only clause

if(key(_backspace))if(curchar>0)chars[curchar-1]=0;
  delete_text(scrchar[curchar-1]);
  curchar--;while(key(_backspace))frame;end end end

if(key(_enter))
 for(z1=128;z1=>pos;z1--);
  hiscoretabledata[z1+1]=hiscoretabledata[z1];
  for(z2=0;z2<12;z2++)
   hiscoretabledata[((z1-120)*12)+z2+12] =
   hiscoretabledata[((z1-120)*12)+z2];
  end
 end
 hiscoretabledata[pos]=score;
 for(z2=0;z2<12;z2++)
  if (chars[z2]==0)chars[z2]=53;end
  hiscoretabledata[((pos-120)*12)+z2]=chars[z2];
 end
 for(z=0;z<120;z++)
  hiscoretable[z]=abc(hiscoretabledata[z]);
 end
 for(z=120;z<130;z++)
  hiscoretable[z]=hiscoretabledata[z];
 end
 delete_text(all_text);clear_screen();frame;
 save("user\rick\hiscore.dat",offset hiscoretabledata,sizeof(hiscoretabledata));
 frame;
 titlescreen(2);return;
end

frame;
end
end

PROCESS titlescreen(cstate)
private
z1;z2;q1;
begin
z1=load_fpg("user\rick\title.fpg");
put_screen(z1,1);
z2=menuarrow(z1);
loop
if (cstate==1)  //new game
signal(z2,s_kill);clear_screen();frame;
unload_fpg(z1);frame;
rungame();return;
end
if (cstate==2)  //high score table
showhiscores(z1);
end
if (cstate==3)  //instructions
showinstruct(z1);
end
if (cstate==4)  //quit
save("user\rick\hiscore.dat",offset hiscoretabledata,sizeof(hiscoretabledata));
exit("Thanks for playing Rick Meteor",0);
end
cstate=0;
frame;
end
end

PROCESS showhiscores(file);
private
z1;z2;z3;
begin
z3=get_id(type menuarrow);
signal (z3,s_sleep);
graph=3;x=400;y=300;
for(z2=0;z2<10;z2++)
for(z1=0;z1<12;z1++)
write(scorefnt,200+(z1*20),120+(z2*40),4,hiscoretable[(z2*12)+(z1)]);
end
end
for(z1=0;z1<10;z1++)
write_int(scorefnt,600,120+(z1*40),5,offset hiscoretable[120+z1]);
end
while (key(_space))frame;end
while (not key(_space))frame;end
while (key(_space))frame;end
delete_text(all_text);
signal (z3,s_wakeup);
end

PROCESS showinstruct(file);
private
z1;z2;z3;
begin
z3=get_id(type menuarrow);
signal (z3,s_sleep);
graph=4;x=400;y=300;
while (key(_space))frame;end
loop
if(key(_left)and z2==0) z1=-1;z2=1;end
if(key(_right)and z2==0) z1=1;z2=1;end
if(not key(_left) and not key(_right))z2=0;end
graph+=z1;
z1=0;
if(graph<4)graph=4;end
if(graph>8)graph=8;end
frame;
if(key(_space) or key(_esc))
while (key(_space) or key(_esc))frame;end
delete_text(all_text);
signal (z3,s_wakeup);
return;
end
end
end

PROCESS menuarrow(file)
begin
graph=2;x=80;y=213;
while(key(_space))frame;end
loop
if (key(_down)) y+=70;if(y>423)y=423;end while(key(_down))frame;end end
if (key(_up)) y-=70;if(y<213)y=213;end while(key(_up))frame;end end
if (cstate)
if (y==213)father.cstate=1;end
if (y==283)father.cstate=2;end
if (y==353)father.cstate=3;end
if (y==423)father.cstate=4;end
end
cstate=0;
frame;
while(key(_space))cstate=1;frame;end
end
end

