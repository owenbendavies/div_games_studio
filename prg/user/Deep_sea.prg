 //////////////////////deep sea dive//////////////////////////////////////
 ///////chris shead/////////////////////////////////2001//////////////////
 //////////////////////////////////// /////////////////////////////////////






program deep_sea_dive;
import "user\dsd\graphic1.dll";
global
savegame[30];
file1,
file2,
file3,
file4,
file5,
file6,
AIR=1000;




sound0;
sound1, channel0;
sound3, channel3;
sound4, channel4;
sound5, channel5;
sound6, channel6;
sound7, channel7;
sound8,
sound9,
sound10,
sound11;
sound12;
sound13;
sound14;
sound15;
sound16;
sound17;
sound18;
sound19;
SOUND20;
sound21;
sound22;
sound23;
sound24;
sound25;
sound26;
sound27;
sound28;
sound29;
sound30; sound40;sound60;sound70;sound75;sound80;

coun1;
coun2;
coun3;
spin;
zero;
manx,many;
for1=800;
for2=800;
ener=150;
alien=500;
energy=80;
AIRRESERVE=80;
bonus=1;
gun=1;
ec=1;
kill=1;
hurting=1;
amo;
fe;
zo;
no=0;
corx;
cory;
fasx;
chestx;
chesty;
clock[20];
lg=0;
ch=0;
rep=0;
rep1=0;
coll=0;

 diver[]=13,13,13,14,14,14,15,15,15,16,16,16,17,17,17,18,18,18,19,19,19,
 20,20,20;
 lights[]=24,24,24,25,25,25;
 fish1[]=6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,8,8,8,9,9,9,10,10,10;
 afup[]=42,42,42,43,43,43,44,44,44,45,45,45,46,46,46,47,47,47,48,48,48,
 49,49,49,50,50,50;

 ali[]=76,76,77,77,78,78,79,79,80,80,81,81,82,82,83,83,84,84;


   water[]=110,110,110,111,111,111,112,112,112,113,113,113;
   bossw[]=206,206,206,206,207,207,207,207,208,208,208,208,209,209,209,209,210,
           210,210,210,211,211,211,211,212,212,212,212;

 striplight=0;
 bubbles1=0;
 life=3;
 seal=0;
 dis=1;

 count=0;
 option=1;
 podd=0;



begin





file1=load_fpg("user\dsd\dsd.fpg");
file3=load_fpg("user\dsd\dsd2.fpg");
file4=load_fpg("user\dsd\dsdstart.fpg");
file5=load_fpg("user\dsd\dsdlevel2.fpg");
file6=load_fpg("user\dsd\lifebar.fpg");



      load_fnt("user\dsd\sea.fnt");
 file2=load_fnt("user\dsd\aim.fnt");

sound4=load_pcm("user\dsd\sea_thunder.pcm",0);
sound5=load_pcm("user\dsd\sea_wind.pcm",1);
sound6=load_pcm("user\dsd\sea_rain.pcm",1);
sound7=load_pcm("user\dsd\sharkbit.pcm",0);



    credits();
    end








 process credits();

 begin
 file=file4;
 clock[1]=0;
 set_mode(m800x600);

    load_pal("user\dsd\dsdstart.pal");

    channel5=sound(sound5,100,250);
    channel6=sound(sound6,100,250);
    channel4=sound(sound4,100,250);


        start_scroll(0, 2, 3, 1, 0, 7);



        start_ripple(10,6,3);

        put_screen(2,1);




        scan_code=23;
        REPEAT


        clock[1]+=1;

        if(clock[1]>50);

        end
        if(clock[1]>100)
        channel4= sound(sound4,250,250);

         clock[1]=0;


         end



        IF (key(_P))
            scroll.y0-=2;
            scroll.y1-=1;
        END

        scroll.y0+=2;
        scroll.y1+=1;


        FRAME;

        IF (key (_esc)) BREAK; END
        until(scan_code==28)
        fade_off();
        delete_text(all_text);
         change_sound(all_sound,0,250);
         stop_sound(all_sound);
         stop_scroll(0);
        clear_screen();


        frame;

        FADE_ON();
           load_pal("user\dsd\dsdstart.pal");
        loop

          SWITCH (option);
            CASE 1:
            option2();
            END
            CASE 2:
            start();
            END
            CASE 3:
            practice();
            END
             CASE 4:
             exit("CHICKEN!", 0);


            END

               DEFAULT:


          end
             end
           frame;
           end
           end


 process option2();

 begin
    x=400;
    y=300;


     loop

     LET_ME_ALONE();
     delete_text(all_text);
     fade_on();
     option=-1;

     Put_screen(2,2);



        IF (key(_q))
        load_pal("user\dsd\dsdmain.pal");
        option2();
        END
        IF (key(_2))
        fade_off();
        load_pal("user\dsd\dsdmain.pal");
        start();
        END
        IF (key(_1))
        fade_off();
        practice();
        load_pal("user\dsd\dsdmain.pal");
        END
         IF (key(_3))
        fade_off();
         exit("Thanks for playing my game!", 0);

      end



        FRAME;

         end
            end

///////////////////////////////////////////////////////////////////////////////


process practice();

begin


AIR=1000;

 signal(type option2 , s_kill);
fade_on();


put_screen(0,3);

 set_fps(24,0);



sound28=load_pcm("user\dsd\prac.pcm",1);

sound3=load_pcm("user\dsd\pod_explo.pcm",0);



 write_int(1,80,566,6,offset  AIR );
 write(1,55,566,6, "AIR          %");
 write(1,600,566,6, "PRESS O FOR OPTIONS");


 sound(sound28,150,250);

 pod2(750,20);
 bd2();
 afu(179,92);
 afu_pod(179,88);
 diver1();
 words();
 end






///////////////////////////////////////////////////////////////////////////////


process start();

begin



  energy=80;
  airreserve=80;
 signal(type option2 , s_kill);
fade_on();


put_screen(0,3);

 set_fps(24,0);


sound0=load_pcm("user\dsd\dsd.pcm",1);


sound3=load_pcm("user\dsd\pod_explo.pcm",0);
sound10=load_pcm("user\dsd\save.pcm",0);
sound11=load_pcm("user\dsd\load.pcm",0);
sound22=load_pcm("user\dsd\diver.pcm",0);
sound23=load_pcm("user\dsd\dock.pcm",0);

sound(sound0,100,250);

words();
pod(750,20);
fishes1(850);
shark(31,451);
bd();

afu(179,92);
afu(494,297);
afu(92,490);

afu_pod(179,88);
afu_pod(494,293);
afu_pod(92,486);
seals();
diver1();
identifyer();

 end




///////////////////////////////////////////////////////////////////////////////




process bd();

begin

loop
file=file6;

graph=6;

x=400;
y=300;
z=2;
frame;
end
 end


///////////////////////////////////////////////////////////////////////////////



process bd2();

begin
graph=21;

x=400;
y=300;

loop
frame;
end
 end


///////////////////////////////////////////////////////////////////////////////






process pod(x,y);

private

    speed_x=0;

    speed_y=0;


begin
      screen();
      lifebarr();
     lifebarr2();
     clock[10]=0;
    graph=2;
    z=2;
      repeat;

      clock[10]+=1;

      if(key(_l));

      load_game();
      x=savegame[1];
      y=savegame[2];
      seal=savegame[3];
      energy=savegame[4];
      rep=savegame[5];
      rep1=savegame[6];
      clock[15]=savegame[7];
      clock[16]=savegame[8];
      airreserve=savegame[9];

      signal(type diver1 , s_kill);
       signal(type diver2 , s_kill);
        signal(type diver3 , s_kill);
         signal(type diver4 , s_kill);
           signal(type diver5 , s_kill);
             signal(type diver6 , s_kill);
      if(seal==0) diver1(); end
      if(seal==1) diver2(); end
      if(seal==2) diver3(); end
      if(seal==3) diver4(); end
      if(seal==4) diver5(); end
      if(seal==5) diver6(); end
      end

      if(key(_s));

      save_game();
      savegame[1]=x;
      savegame[2]=y;
      savegame[3]=seal;
      savegame[4]=energy;
      savegame[5]=rep;
      savegame[6]=rep1;
      savegame[7]=clock[15];
      savegame[8]=clock[16];
      savegame[9]=airreserve;
      end


     graph=lights[podd];
       podd++;
       if(podd>5) podd=0;
       end
     IF (x>780)
      speed_x=-3;
     END
     IF (Y<20)
      speed_y=+3;
     END

      IF (x<20)
      speed_x=+3;
     END
     IF (Y>580)
      speed_y=-3;
     END

        if( collision(type ship_enter));

        speed_y+=4;
        speed_x=+0;
        speed_x=-0;
        end


        if(collision(type afu));
         speed_y=-2;
          end

        if(collision(type afu_pod));
          speed_x=-2;
           end


        IF (key(_right))
            speed_x+=2;
            end

        IF (key(_left))
            speed_x-=2;
            end

         IF (key(_down))
            speed_y+=2;
            end

         IF (key(_up))
            speed_y-=2;
            end

          if(key(_z) and (key(_q) and(key(_g))));
          seal=6;
          x=118;
          y=80;
          end

       IF(AIRRESERVE=<0);
       GRAPH=4;
       frame;
       starter();
       end
       if(airreserve=>80);
       airreserve=80;
       end

       if(collision(type bd));
        channel4= sound(sound4,30,250);

       energy=energy-=10;
       speed_x=speed_x/2;
       speed_y=speed_y/2;
       speed_x=-speed_x;
       speed_y=-speed_y;
       x=x+speed_x;
       y=y+speed_y;
              end


       if(clock[10]>10);
       airreserve=airreserve-1;
       end
       if(clock[10]>10);
       clock[10]=0;
       end

       x+=speed_x/4;
       y+=speed_y/4;

       frame;


       until(energy=<0);
       graph=4;

             frame;

                 starter();

                             end

///////////////////////////////////////////////////////////////////////////////

process lifebarr();

begin
 file=file6;
graph=1;
x=575;
y=54;
z=1;
ANGLE=90000;
FLAGS=4;
loop
 map_put(4,1,2,energy,12);

frame;
end

end

process lifebarr2();

begin
 file=file6;
graph=4;
x=535;
y=54;
z=1;
ANGLE=90000;
FLAGS=4;
loop
 map_put(4,4,5,AIRRESERVE,12);

frame;
end

end

///////////////////////////////////////////////////////////////////////////////

process screen();


begin
CLOCK[15]=0;
clock[16]=0;
file=file6;
graph=3;
X=556;
Y=54;
Z=1;
LOOP

clock[15]+=1;
clock[16]+=1;

if(clock[15]>1600 and clock[15]<1610);
repair(225,180,-20,250);
rep=1;

end
if(clock[15]>1660 and rep==1);
clock[15]=1660;
coll=1;
end

if(clock[16]>3400 and clock[16]<3410);
repair(479,207,-20,250);
rep1=1;

end
if(clock[16]>3460 and rep1==1);
clock[16]=3460;
coll=1;
end

FRAME;
END
 END
//////////////////////////////////////////////////////////////////////////////

PROCESS REPAIR(x,y,z,size);


BEGIN

FILE=FILE6;
GRAPH=7;
 coll=0;
LOOP



 size=size-4;
 if(size=<10);
 size=10;
 end


 if(size=<10 and collision( type pod));
 energy=energy=80;
 signal(type repair ,s_kill);

  end




FRAME;
END
END



//////////////////////////////////////////////////////////////////////////////
      PROCESS STARTER();

      BEGIN

      channel3=sound(sound3,150,250);
      fade(50,50,50,1);
      while(fading);



      seal=seal=0;
      energy=energy=0;
      airreserve=airreserve=0;
            frame;
         end
          change_sound(all_sound,0,250);
      stop_sound(all_sound);
      let_me_alone();


      start();
       end


///////////////////////////////////////////////////////////////////////////////
process pod2(x,y);

private

    speed_x=0;

    speed_y=0;
begin

graph=2;



        repeat;


       graph=lights[podd];
       podd++;
       if(podd>5) podd=0;
       end

     IF (x>780)
      speed_x=-3;
     END
     IF (Y<20)
      speed_y=+3;
     END

      IF (x<20)
      speed_x=+3;
     END
     IF (Y>580)
      speed_y=-3;
     END


        if( collision(type ship_enter));
        y+= speed_y=0;
        y-= speed_y=0;
        x+= speed_x=0;
        x-= speed_x=0;
        end

        if(collision(type afu));
         speed_y=-2;
          end

        if(collision(type afu_pod));
          speed_x=-2;
           end


        IF (key(_right))
            speed_x+=2;
            end

        IF (key(_left))
            speed_x-=2;
            end

         IF (key(_down))
            speed_y+=2;
            end

         IF (key(_up))
            speed_y-=2;
            end

         IF (air>1000)
         air=air=998;
         end



     IF(KEY(_O));
     fade_off();
     option2();
     load_pal("user\dsd\dsdstart.pal");
     change_sound(all_sound,0,250);
     stop_sound(all_sound);

     end


        air=air-1;
        x+=speed_x/4;
        y+=speed_y/4;

        frame;

            until(collision(type bd2)or (air==0))
            graph=4;

             frame;

                 starter2();

                             end

///////////////////////////////////////////////////////////////////////////////

      PROCESS STARTER2();

      BEGIN

      channel3=sound(sound3,150,250);
      fade(50,50,50,1);
      while(fading);
      stop_sound(channel);
      air=air=0;
      frame;
      end
      let_me_alone();
      change_sound(all_sound,0,250);
      stop_sound(all_sound);
      practice();
       end

///////////////////////////////////////////////////////////////////////////////


      process afu(x,y);

      private
      speed_y=0;
      begin
      graph=11;
      loop
      if(collision(type pod2));
      air=air+4;
      end
      if(collision(type pod));
      airreserve=airreserve+1;
      end
      frame;
        end
         end


///////////////////////////////////////////////////////////////////////////////

   process afu_pod (x,y);

   begin


   loop
   graph=afup[striplight];
       striplight++;
       if(striplight>26) striplight=0;
       end



   if(collision(type pod));

      end
      frame;
       end
        end


///////////////////////////////////////////////////////////////////////////////

  process diver1();

  begin

  x=307;
  y=224;


  repeat;

    graph=diver[count];
     count++;
     if(count>23) count=0;
       end

     if(collision(type pod2));
     signal(type diver1 , s_kill);
        diver2();
        end
        frame;

  until(collision(type pod));

  frame;
  sound(sound22,250,240);
      seal=seal+1;
      diver2();
      end


///////////////////////////////////////////////////////////////////////////////


 process diver2();

  begin

  x=660;
  y=470;


  repeat;
     graph=diver[count];
     count++;
     if(count>23) count=0;
       end
     if(collision(type pod2));
     signal(type diver2 , s_kill);
        diver3();
       end
  frame;


  until(collision(type pod));
  frame;
   sound(sound22,250,240);

      seal=seal+1;
      diver3();
      end

///////////////////////////////////////////////////////////////////////////////



 process diver3();

  begin

  x=111;
  y=428;
  graph=13;

  repeat;

   graph=diver[count];
     count++;
     if(count>23) count=0;
       end
      if(collision(type pod2));
     signal(type diver3 , s_kill);
        diver1();
       end


  frame;


  until(collision(type pod));
  frame;
   sound(sound22,250,240);

      seal=seal+1;
      diver4();
      end


///////////////////////////////////////////////////////////////////////////////



 process diver4();

  begin

  x=629;
  y=217;


  repeat;

   graph=diver[count];
     count++;
     if(count>23) count=0;
       end


  frame;


  until(collision(type pod));
  frame;
   sound(sound22,250,240);

      seal=seal+1;
      diver5();
      end


///////////////////////////////////////////////////////////////////////////////



 process diver5();

  begin

  x=272;
  y=343;


  repeat;

   graph=diver[count];
     count++;
     if(count>23) count=0;
       end


  frame;


  until(collision(type pod));
  frame;
   sound(sound22,250,240);

       seal=seal+1;
       diver6();
      end


///////////////////////////////////////////////////////////////////////////////



 process diver6();

  begin

  x=473;
  y=453;


  repeat;

   graph=diver[count];
     count++;
     if(count>23) count=0;
       end


  frame;


  until(collision(type pod));
  frame;

        sound(sound23,250,240);

       seal=seal+1;

      end




 ///////////////////////////////////////////////////////////////////////////////

process fishes1(x);

begin

z=3;
y=rand(50,400);
loop

 graph=fish1[bubbles1];
       bubbles1++;
       if(bubbles1>23) bubbles1=0;
       end

advance(-1);

if(x<-10)
  x=850;
  y=rand(50,400);
  end
  frame;
  end
  end

///////////////////////////////////////////////////////////////////////////////


 process shark(x,y);

 begin
 clock[2]=0;
 graph=2;
 z=3;
  loop
  clock[2]+=1;

 if(clock[2]>0)
 flags=0;
 advance(2);
 end

 if(clock[2]>200)
 flags=1;
 advance(-4);
 end


 if(clock[2]>400)
 channel7=sound(sound7,150,250);
 clock[2]=0;
 end
 IF(COLLISION(type pod));

 starter();
 end

frame;
end

end

///////////////////////////////////////////////////////////////////////////////

 process seals();


 begin
 X=673;
 Y=586;


 LOOP

 if(seal==1);
 graph=29;
 end

 if(seal==2);
 graph=30;
 end

 if(seal==3);
 graph=31;
 end

 if(seal==4);
 graph=32;
 end

 if(seal==5);
 graph=33;
 end

 if(seal==6);
 graph=37;
 end
   frame;

       end
            end

///////////////////////////////////////////////////////////////////////////////

  process identifyer();

  begin
  loop

  if(seal==6);
  ship_enter();
  end
  frame;
  end
  end



  process ship_enter();

  begin
  x=118;
  y=20;
  graph=41;
      repeat;
   signal(type identifyer,s_kill);
  frame;
  until(collision(type pod));

    signal(type pod , s_kill );
    new_level();
  end


///////////////////////////////////////////////////////////////////////////////

  process words();

  begin

  loop

  graph=5;

   if(airreserve<20)
  x=510;
  y=359;
  graph=35;
  end

  if(air<200)
  x=510;
  y=359;
  graph=35;
  end

  if(airreserve=<0);
  x=510;
  y=359;
  graph=36;
  end


  if(air=<0);
  x=510;
  y=359;
  graph=36;
  end


  frame;

  end


end

 ///////////////////////////////////////////////////////


 process save_game();


 begin
 save("dsdsave.dat", offset savegame,sizeof(savegame));
  sound(sound10,250,250);
 frame;
 end


 //////////////////////////////////////////////////////


 process load_game();


 begin
 load("dsdsave.dat", offset savegame);
 sound(sound11,250,250);

 frame;
 end




///////////////////////////////////////////////////////////////////////////////

  process new_level();

  begin


     change_sound(all_sound,0,250);
     stop_sound(all_sound);
      delete_text(all_text);
      clear_screen();

      fade(0,0,0,1);
      while(fading);


          frame;


            end

      eog();
       end


//////////////////////////////////////////////////////////////////


  process eog();

  begin
stop_ripple();

     load_pal("user\dsd\dsdLEVEL2.pal");

     let_me_alone();

     fade_on();
   scan_code=23;
        REPEAT
          put_screen(3,1);

         frame;
        until(scan_code==28)
        fade_off();
        delete_text(all_text);
        change_sound(all_sound,0,250);
        stop_sound(all_sound);

        clear_screen();
        frame;



          level2();

           end



 //////////////////////////////////////////////////////////

                        //////
      //               //   //
      //              //    //   ////////////////
      //                    //   //////////////
      //                  //     ///////////
      //                //       // //////
      /////////       //         // /////
      /////////       ////////


 //////////////////////////////////////////////////////////


process level2();


begin
   let_me_alone();
   load_pal("user\dsd\dsdmain.pal");
   let_me_alone();
   fade_on();

   unload_pcm(sound0);
   unload_pcm(sound28);
   unload_pcm(sound4);
   unload_pcm(sound5);
   unload_pcm(sound6);
   unload_pcm(sound7);




   sound20=load_pcm("user\dsd\l2.pcm",1);
   sound30=load_pcm("user\dsd\aim.pcm",1);
   sound60=load_pcm("user\dsd\dynomite.pcm",0);
   sound70=load_pcm("user\dsd\skull.pcm",0);
   sound75=load_pcm("user\dsd\skull2.pcm",0);
   sound18=load_pcm("user\dsd\energy.pcm",0);
   sound19=load_pcm("user\dsd\amo.pcm",0);
   sound24=load_pcm("user\dsd\hurt.pcm",0);
   sound25=load_pcm("user\dsd\glasses.pcm",0);
   sound26=load_pcm("user\dsd\faser.pcm",0);

    write_int(2,255,25,7,offset for1  );
 write_int(2,753,26,7,offset for2  );
 write_int(2,460,25,7,offset ener  );

  put_screen(0,101);
   timer[1]=0;

     level2start();

     end


     process level2start();

     begin

 zo=man();
  blank();
  blank2();
  blank3();
  forcefield();
  forcefield2();
  snake();
  water1();
  water2();
  water3();
 stopper1();
 hurt();
     frame;

     end




//////////////////////////////////////////////////////////////////////

process man();


private
 jump_height,jump;

begin
  sound(sound20,100,250);
  sound(sound30,40,280);
  sound(sound25,250,250);


corx=400;

z=100;
y=328;
graph=54;

repeat

    if(key(_l));

      load_game2();
      for1=savegame[4];
      for2=savegame[5];
      ener=savegame[6];
      end



       if(key(_s));

      save_game2();
      savegame[4]=for1;
      savegame[5]=for2;
      savegame[6]=ener;
       end

    if(key(_left))corx=corx-=4;

    graph=graph+1;
    if (graph>58) graph=54;
    flags=0;
    fasx=0;
     end
        end

    if (key(_right))corx=corx+=4;

       graph=graph+1;
    if (graph>58) graph=54;
    flags=1;
    fasx=1;
     end
        end

  if(key(_f) and amo==1);
 fazer(x,y,10);
 end

if(amo==0 and not key(_f)); amo=1;

   end




     if(collision(type forcefield2));

     ener=ener-=1;
     corx=corx-6;
     hurting=0;
     end

     if(collision(type forcefield));
     ener=ener-=1;
     corx=corx+6;
     hurting=0;
     end




     if(for1==0);
     signal(type forcefield,s_kill);
     end

     if(for2==0);
     signal(type forcefield2,s_kill);
     end


      if(corx>=790);
      fade_off();
      goodieroom();
      corx=30;
      y=328;

      end

      if(collision(type transport));
      fade_off();
      corx=780;
      croom();
      y=328;

        end

      if(corx<=0);
      fade_off();
      bossroom();
      corx=730;
      y=328;

      end

     if(collision(type transport2));
     fade_off();
     corx=30;
     croom();
     y=328;
     end

     if(key(_up) and jump==0)
     jump_height=11;
     jump=11;
     end


     if (jump>5 and jump<11) jump_height=jump_height-1; y=y-jump_height;
     end
     if (jump>0) jump=jump-1;
     end


     if(jump==0 and not(collision(type stopper1)or(collision(type walkpipe)
     or (collision(type stopper2)or (collision (type chest)or
     (collision (type extrachest)or(collision(type walkchest))))))));
     y=y+=4;
     jump=1;
     end

     if(y>355);
     y=y+=4;
     end


     manx=x;
     many=y;
     x=corx;

     if(ener<0);
     change_sound(all_sound,0,250);
     stop_sound(all_sound);
     deathskull();
     end

     if(collision(type bonus1));
     signal(type bonus1,s_kill);
     sound(sound18,256,250);
     ener=ener+=50;
     bonus=0;
     end

     if(collision(type bonus2));
     signal(type bonus2,s_kill);
     sound(sound19,256,250);
     gun=0;
     end

     if(collision(type extrabonus));
     signal(type extrabonus,s_kill);
     sound(sound18,256,250);
     ener=ener+50;
     end

     if(collision(type lightning));
     hurting=0;
     ener=ener-=1;
     end


     if(collision(type blank8));
     corx+=-4;
     end

     if(collision(type blank9));
     corx+=4;
     end

     if(gun==0 and amo==1 and (key(_space)));
     shooter(x,y,angle);
     end

     if(amo==0 and not key(_space)); amo=1;
     end

     if(key(_e) and(key(_x) and (key(_p))));
     alien=0;
     end
     if(key(_p) and(key(_o) and (key(_c))));
     ener=ener=+500;
     end

     if(key(_r) and(key(_i)and(key(_1))));
     start_ripple(10,6,3);
     end
     if(key(_r) and(key(_i)and(key(_2))));
     stop_ripple();
     end

     if(key(_y) and (key(_u)and(key(_k))));
     for1=0;
     for2=0;
     end


     if(alien=<100);
     start_ripple(10,6,3);
     end

     if(alien=<0);
     signal(type bossweapon ,s_kill);
     screenexplo();
     end

     if(collision(type snake));
     ener=ener-=2;
     hurting=0;
     end


     frame;

     until( collision(type tubefire) or (out_region(id,0)));
      change_sound(all_sound,0,250);
        stop_sound(all_sound);
        deathskull();
     end


///////////////////////////////////////////////////
   process fazer(x,y,z);

   private


   begin
   graph=85;
   z=10;

repeat
amo+=1;
sound(sound26,40,250);

graph=graph+1;
if(graph>90) graph=85;
end

if(fasx==0);
flags=0;
x=manx-12;
y=many-7;
end

if(fasx==1);
 flags=1;
x=manx+12;
y=many-7;
end

frame;


 y=y=many;
until(not(key(_F)));


amo=0;



    end

///////////////////////////////////////////////////
 process hurt();

 begin
  timer[6]=0;
 loop
 if(timer[6]=>0 and hurting==0)
   sound(sound24,250,250);
    timer[6]=-100;
    hurting=1;

  end
  if(timer[6]=>-10);
  timer[6]=0;
  hurting=1;
  end

 frame;
   end
    end


///////////////////////////////////////////////////

 process deathskull();


 begin
  file=file3;
 x=400;
 y=300;
 size=1;
 graph=1;

 ener=ener=0;

 stop_sound(all_sound);
 sound(sound70,200,250);
 loop



 signal(type bossweapon ,s_kill);
 signal(type lightning ,s_kill_tree);
 signal(type man,s_kill);
 size=size+2;

 frame;

 if(size=>100);
 size=100;
 end

 if(size=>100);
 sound(sound75,200,250);

 from graph=1 to 73;
 frame;

 end

   death2();
 end
    end
      frame;
      end

///////////////////////////////////////////////////


 process death2();

 begin


  fade_off();
         let_me_alone();
        delete_text(all_text);
        change_sound(all_sound,0,250);
        stop_sound(all_sound);

        clear_screen();
          ener=ener=100;
          bonus=1;
          gun=1;
          ec=1;
          for1=200;
          for2=200;
          alien=500;
         frame;

    level2();
    end

 ///////////////////////////
     process stopper1();

     begin

     graph=52;
     x=400;
     y=359;
     z=550;
     loop

     frame;
     end
     end


     process blank();

    begin

    graph=106;
    x=22;
    y=328;

    loop
    frame;
    end
     end

    process blank2();

    begin

    graph=100;

    x=760;
    y=323;


    loop

    frame;
    end
     end

    process blank3();

    begin

    graph=117;
    x=399;
    y=520;

    loop
    frame;
    end
    end

 //////////////////////////////////////////////////////////////////////

    process forcefield();

    begin


    x=93;
    y=304;
    flags=4;

    loop
      graph=104;
     if(collision(type fazer));
     for1=for1-=1;
     graph=107;

     end

    frame;
    end
    end

//////////////////////////////////////////////////////////////////////

    process forcefield2();

    begin

        x=677;
    y=303;
    flags=4;

    loop
    graph=108;

     if(collision(type fazer));
     for2=for2-=1;
     graph=109;

      end
    frame;
    end
    end



 /////////////////////////////////////////////////////////////////////
  process water1();


  begin


  x=400;
  y=491;
  flags=4;

  loop
   graph=water[coun2];
    coun2++;
    if(coun2>11) coun2=0;

    end

       frame;
           end
            end


/////////////////////////////////////////////////////////////////////

process water2();

begin

x=403;
y=329;
z=510;
flags=4;
graph=114;
loop

if(timer[1]=>50)
     bubble(rand(379,422),475);
     end
     if(timer[1]=>50)
     timer[1]=0;
     end


frame;
end
end


/////////////////////////////////////////////////////////////////////

process water3();

begin

x=404;
y=305;
z=510;
flags=4;
graph=115;
loop
frame;
end
end

/////////////////////////////////////////////////////////////////////


process snake();


private
 xspeed,lunge,direct;


begin

x=400;
y=487;
z=64;
size=110;
repeat;


if(y=>354);
 graph=121;
y-=1;
end


if(y=<354);
  y-=0;
  graph=ali[spin];
  spin++;
  if(spin>17) spin=0;
   end


xspeed=2;
if (x>manx-70 and x<manx+70) lunge=10; end
if (lunge>0) xspeed=4; end;
if (x>manx and lunge<1) direct=1; end
if (x<manx and lunge<1) direct=2; end

if (direct==1) x=x-xspeed; flags=0; end
if (direct==2) x=x+xspeed; flags=1; end


end
if (lunge>0) lunge=lunge-1;
 end

if(collision(type fazer));
size=size+=1;
end


 frame;


until(alien=<0);

 end


///////////////////////////////////////////////////////////////////////

process bubble(x,y)

begin

graph=118;
z=60;
repeat;

  y-=2;

 frame;
 until(y=<389);
 from graph=119 to 120;
 frame;
 return;


 frame;
end
end


////////////////////////////////////////////////////////////////////

                //////// NEW ROOM 2 /////////

//////////////////////////////////////////////////////////////////////


   process goodieroom();

  begin

  change_sound(all_sound,0,250);
        stop_sound(all_sound);

         clear_screen();



signal(type blank,s_sleep);
signal(type blank3, s_sleep_tree);
signal(type blank2, s_sleep);
signal(type water3, s_sleep);
signal(type water2, s_sleep);
signal(type water1, s_sleep);
signal(type snake, s_sleep);
signal(type forcefield, s_sleep);
signal(type forcefield2, s_sleep);
signal(type stopper1, s_sleep);
signal(type bubble, s_sleep);
signal(type man, s_freeze);


      fade(0,0,0,5);
      while(fading);
            frame;
               end
                 gotolroom();
                        end




 process gotolroom();

  begin


       sound16=load_pcm("user\dsd\flames.pcm",1);
       sound80=load_pcm("user\dsd\lightning.pcm",0);

    put_screen(0,200);
    fade_on();
    signal(type man, s_wakeup);

    transport();
    blank4();
    prop();


          frame;
  end




 ////////////////////////////////////////////////////////////////////////

 process transport();

 begin

 sound(sound16,100,250);



 graph=23;

 loop
  y=338;
  x=10;

 frame;
 end

   end


 ////////////////////////////////////////////////////////////////////////
 process croom();

 begin

     signal(type blank4,s_sleep);
     signal(type transport,s_sleep);
     signal(type prop,s_sleep_tree);



     signal(type stopper2,s_sleep);
     signal(type bossweapon,s_sleep_tree);
     signal(type man, s_freeze);

     change_sound(all_sound,0,250);
     stop_sound(all_sound);


      clear_screen();


      fade(0,0,0,5);
      while(fading);
            frame;
               end
                 gocroom();
                        end



 process gocroom();

 begin
 put_screen(0,101);
 fade_on();
    change_sound(all_sound,0,250);
        stop_sound(all_sound);

   sound30=load_pcm("user\dsd\aim.pcm",1);
   sound20=load_pcm("user\dsd\l2.pcm",1);




  sound(sound30,40,280);
  sound(sound20,100,280);

signal(type blank,s_wakeup);
signal(type blank3, s_wakeup_tree);
signal(type blank2, s_wakeup);
signal(type water3, s_wakeup);
signal(type water2, s_wakeup);
signal(type water1, s_wakeup);
signal(type snake, s_wakeup);
signal(type forcefield, s_wakeup);
signal(type forcefield2, s_wakeup);
signal(type man, s_wakeup);
signal(type stopper1, s_wakeup);


   frame;
   end

/////////////////////////////////////////////////////////////////////////////

process blank4();

begin

graph=202;
x=25;
y=325;

loop
frame;
end
end



//////////////////////////////////////////////////////////////////////////////

   process prop();

   begin

   graph=34;

   x=401;
   y=289;
   tubes();
   walkpipe();
   lightning();
    timer[2]=0;
    timer[3]=0;
   loop

   angle-=pi/16;

    if(bonus==1);
     bonus1();

    end

    if(gun==1);
    bonus2();
    end

    if(timer[2]=>130)
    tubefire(262,580);
    tubefire(373,580);
    tubefire(492,580);
     end
     if(timer[2]=>130);
     timer[2]=0;
     end


      if(timer[3]=>200)
    tubefire(262,580);
    tubefire(373,580);
    tubefire(492,580);
     end
     if(timer[3]=>200);
     timer[3]=0;
     end
     frame;
   end
   end



/////////////////////////////////////////////////////////////////////////////

    process lightning ();

    begin
    sounder();


    clock[4]=0;
     z=360;
    loop

     clock[4]+=1;

     if(clock[4]>50);
     lg=1;
     graph=125;
     x=391;
     y=361;
     end

     if(clock[4]>54);
     lg=0;
     end

     if(clock[4]>80);
     lg=1;
     graph=126;
     x=393;
     y=272;
     end

     if(clock[4]>84);
     lg=0;
     end

     if(clock[4]>110);
     lg=1;
     graph=127;
     x=420;
     y=302;
     end

     if(clock[4]>114);
     lg=0;
     end


     if(clock[4]>150);
      lg=1;

     graph=128;
     x=419;
     y=330;
     end

     if(clock[4]>154);
     lg=0;
     end


     if(clock[4]>170);
     lg=0;
     graph=129;
     end

     if(clock[4]>170);
     clock[4]=0;
     end


        frame;
    end
    end


    process sounder();

    begin

    loop

    if(lg==1);
    sound(sound80,100,350);
    lg=0;
    end

    frame;
    end
    end



   ////////////////////////////////////////////////////////////////////////////


   process tubefire(x,y);

   begin

   graph=53;
   z=360;

   repeat;

    y-=rand(6,20);

    frame;

   until(y=<55)

     end
////////////////////////////////////////////////////////////////////////////

   process tubes();

   begin
   blank8();
   blank9();
   y=314;
   x=378;
   z=359;
   graph=130;

   loop
graph=graph+1;
if(graph>132) graph=130;
end

   frame;
   end

   end


 process blank8();

 begin

 graph=123;
 x=377;
 y=373;

 loop
 frame;
 end
 end


 process blank9();

 begin

 graph=124;
 x=377;
 y=373;

 loop
 frame;
 end
 end


////////////////////////////////////////////////////////////////////////////


   process walkpipe();

   begin

   graph=203;
   y=426;
   x=294;
   z=661;

   loop

   frame;
   end
   end

 /////////////////////////////////////////////////////////////////////

 process bonus1();



 begin

 bonus=2;

 graph=204;
 x=212;
 y=346;

 repeat;

  frame;
 until(collision(type man));

       end


/////////////////////////////////////////////////////////////////////

 process bonus2();

 begin
  gun=2;
 graph=204;
 x=593;
 y=346;

 repeat;
   frame;

 until(collision(type man));


       end



 ///////////////////////////////////////////////////////////////////

                //////// NEW ROOM 3 /////////

//////////////////////////////////////////////////////////////////////




   process bossroom();

  begin


       clear_screen();

  change_sound(all_sound,0,250);
        stop_sound(all_sound);


signal(type blank,s_sleep);
signal(type blank3, s_sleep);
signal(type blank2, s_sleep);
signal(type water3, s_sleep);
signal(type water2, s_sleep);
signal(type water1, s_sleep);
signal(type snake, s_sleep);
signal(type forcefield, s_sleep);
signal(type forcefield2, s_sleep);
signal(type stopper1, s_sleep);
signal(type bubble, s_sleep);
signal(type man, s_freeze);


      fade(0,0,0,5);
      while(fading);
            frame;
               end
                 gotoRroom();
                        end





 process gotoRroom();

  begin


      sound14=load_pcm("user\dsd\boss.pcm",1);
      sound15=load_pcm("user\dsd\boss2.pcm",1);
      sound17=load_pcm("user\dsd\faser.pcm",0);
         sound(sound14,50,250);
         sound(sound15,250,250);


    put_screen(0,213);
    fade_on();
    signal(type man, s_wakeup);

     bossweapon();
     stopper2(610,370);

          frame;
            end



////////////////////////////////////////////////////////////////////////////


 process bossweapon();

 begin

  transport2();
  chest();
  extrachest();
  water4();
  water5();
  blank6();

  x=401;
  y=98;
  timer[4]=0;
  loop

    graph=bossw[coun3];
    coun3++;
    if(coun3>27) coun3=0;
    end

  angle=(get_angle(zo)-90000);

 if(timer[4]=>120)
 enermy_laser(x,y,angle-270000);
 timer[4]=0;
      end


     frame;
        end
         end

///////////////////////////////////////////////////////////////////////

 process enermy_laser (x,y,angle);

 begin
  sound(sound17,80,250);
 graph=205;


 repeat;

 advance(20);

 frame;

 if(collision(type man));
  ener=ener-=2;
  hurting=0;
 break;

        frame;
            end

 until(out_region(id,0) or collision(type man));

        frame;
            end

///////////////////////////////////////////////////////////////////////

process bubble2(x,y)

begin

graph=118;
z=130;
repeat;

  y-=2;

 frame;
 until(y=<389);
 from graph=119 to 120;
 frame;
 return;


 frame;
end
end



///////////////////////////////////////////////////////////////

process shooter(x,y,angle);

begin

graph=299;
   amo+=1;
repeat;

     y=y-=15;

     if(out_region(id,0));
     break;
       end
       frame;


     until(collision(type bossweapon));
     sound(sound60,300,250);
     from graph=300 to 320;
      alien=alien-=1;

     frame;

         end

        amo=0;

          end
///////////////////////////////////////////////////////////////////////
  process transport2();

 begin

 graph=23;


  y=338;
  x=770;
  z=355;
  timer[9]=0;
  loop

     if(timer[9]=>50)
     bubble2(rand(210,244),577);
     end
     if(timer[9]=>50)
     timer[9]=0;
     end

     frame;
 end

   end





////////////////////////////////////////////////////////////////////////////

   process stopper2(x,y);

   begin

   graph=214;


     z=250;
   loop

   frame;
   end
   end

////////////////////////////////////////////////////////////////////////////

   process chest();

   begin


   x=400;
   y=387;
   z=110;
      graph=215;
    clock[5]=0;
     loop

    clock[5]+=1;

    if(clock[5]<110)
     x=x-=2;
     if(collision(type man));
     corx=corx-=2;
     end
        end

     if(clock[5]>110);
      x=x+=2;
      if(collision(type man));
      corx=corx+=2;
        end
          end

    if(clock[5]>210);

     clock[5]=0;
     end

      frame;
      end
       end


 /////////////////////////////////////////////////////////////////////
  process water4();


  begin


  x=400;
  y=461;
  z=350;
  flags=4;
  graph=216;
  loop

       frame;
           end
            end


  process water5();

  begin

  x=400;
  y=491;
  flags=4;
  graph=217;
  loop

        frame;
           end
           end

 process blank6();

 begin
  blank7();
 x=771;
 y=317;
 z=10;
 graph=218;
 loop
 frame;
 end
 end


 process blank7();

 begin
 graph=219;
 x=233;
 y=573;
 z=90;
 loop

 frame;
 end
    end


/////////////////////////////////////////////////////////////////////
  process walkchest();

  begin
  graph=220;
  y=554;
  x=480;
  z=110;
  flags=1;
  timer[7]=0;
  loop

  if(timer[7]<=700);
  y=y-=1;
  end
  if(timer[7]>=1500);
  y=y+=1;
  end
  if(timer[7]>=2200);
  timer[7]=0;
  end

  frame;
  end
  end

/////////////////////////////////////////////////////////////////////
  process extrachest();

  begin
  walkchest();
  graph=220;
  y=600;
  x=238;
  z=110;

  timer[8]=0;
  loop
   if(timer[8]<=900);
   y=y-=1;
   end

   if(timer[8]>=500);
   x=x-=1;
   end


   if(timer[8]>=900);
   x=x=130;
   y=y=385;
    end
   if(timer[8]>=1500);
   y=y-=0;


   if(ec==1);
   extrabonus();
   end
    end



  frame;
  end
  end

 ///////////////////////////////////////////////////////////////////////


  process extrabonus();

  begin

  ec=0;

  graph=204;
  x=128;
  y=356;

  repeat

      frame;
  until(collision(type man));
   end

 ///////////////////////////////////////////////////////


 process save_game2();


 begin
 save("dsdsave.dat", offset savegame,sizeof(savegame));
  sound(sound10,250,250);
 frame;
 end


 //////////////////////////////////////////////////////


 process load_game2();


 begin
 load("dsdsave.dat", offset savegame);
 sound(sound11,250,250);

 frame;
 end




//////////////////////////////////////////////////////////////////////////////


  process screenexplo();

  begin
  x=400;
  y=300;


   size=100;
  delete_text(all_text);
  change_sound(all_sound,0,250);
  stop_sound(all_sound);

  repeat;

  sound(sound60,300,250);
  from graph=300 to 320;
  size=size+=10;
  let_me_alone();

  frame;
   end

    until(size=>1600);
    fade(0,0,0,5);
   endscreen();
    end


/////////////////////////////////////////////////////////////////////////

 process endscreen();

 begin
  file=file3;
 LET_ME_ALONE();
 clear_screen();
 fade_on();

  put_screen(0,75);
  x=400;
  y=300;
  size=150;
 loop

 IF(key(_enter));
 clear_screen();
 sound(sound60,300,250);
 from graph=75 to 110;
 frame;
 end
  ender();

  end
  frame;
 end

end
////////////////////////////////////////////////////////////////

 process ender();

 begin

 let_me_alone();
 delete_text(all_text);
  change_sound(all_sound,0,250);
  stop_sound(all_sound);

  frame;

  exit("TO BE CONTINUED IN THE NEXT MISSION OF DSD!", 0);
  end




/////////////////////////////THE END/////////////////////////////













