// Hi Peeps
//
// I hope you enjoyed playing this game and it will help you
// create your own masterpiece.
//
// I spent a lot of time getting things as finished as I could in time for the div2
// CD.  So if there are lots of bugs I am sorry..... LOL
//
// I am working on a new version of flame which should be completed
// soon which will allow you to create this type of game and infact many others (2d or mode 7)
// very very easily... so watch this space.
//
// I would like to thank everyone who has helped me create this game.
// be it moral support or technical help.
//
// I would also like to thank Tim who created some nice music.
// But I should point out that the title music is my poor atempt and not tims.
//
// Oh and if you're really bored visit
//
//
// www.lightmare.co.uk
//
// You never know you might even find patches and enhancments to my games.
//
//
// If you would like to say hi feel free my email adress is
//
// Jeremy@lightmare.co.uk
//
// and finally.
//
// Go code and have fun!!!!!!!!!!!!!
//
program mball;
global

    levelcheat=0;
    movecheat=0;
    timecheat=0;
    diff=35;
    kfish;
    ballx;
    bally;
    ab2=0;
    mousex2;
    completed[6];
    zoom=0;
    gameon=0;
    fsize=0;
    music1;
    music2;
    firetime=0;
    spikes=0;
    levers=0;
    swingang;
    swind=1;
    lever=1;
    dshad=0;
    canim=0;
    crum=0;
    kf=0;
    pos7;
    wos=0;
    full=0;
    detail=2;
    level=4;
    cplan=0;
    effect=3;
    shade;
    gamepad=2;
    shadow;
    reflection=0;
    stopball=0;
    ang2;
    play=0;
    bheight=0;
    file3d;
    sg1=27;
    mw=700;
    walls=0;
    ballg=140;
    ms=16;
    filet;
    camview=1;
    file1;
    ang3;
    timmy=250;
    don=0;
    chkl;
    chkr;
    style=1;
    awx2;
    chku;
    awx;
    awy;
    chkd;
    dx=0;
    dy=0;
    file2;
    mx=12600;
    my=2222;
    man=0;
    blocks[680*250];
    undox[50];
    undoy[50];
    recordx[12000];
    recordy[12000];
    recordh[12000];
    pos8;
    recordpos=1;
    ballrot=0;
    undot=1;
    joyx;
    joyy;
    joyx2;
    joyy2;
    bt=34;
    tt=125;
    recordtot=0;
    redkey=0;
    orangekey=0;
    bluekey=0;
    greenkey=0;
    purplekey=0;

begin
    set_mode(m640x480);
    mainloop();
end;

process mainloop();
begin

    mw=700;
    load_fnt("user\mbgame\ballf.fnt");
    load_fnt("user\mbgame\choose.fnt");

    load_wav("user\mbgame\bumper.wav",0);
    load_wav("user\mbgame\angel.wav",0);
    load_wav("user\mbgame\metal10.wav",0);
    load_wav("user\mbgame\chorro.wav",0);
    load_wav("user\mbgame\crumble.wav",0);
    load_wav("user\mbgame\mm.wav",0);
    load_wav("user\mbgame\splash.wav",0);

    load_wav("user\mbgame\getready.wav",0);
    load_wav("user\mbgame\key.wav",0);
    load_wav("user\mbgame\jump.wav",0);
    load_wav("user\mbgame\oops1.wav",0);
    load_wav("user\mbgame\oops2.wav",0);
    load_wav("user\mbgame\cyrstal.wav",0);

    music1=load_wav("user\mbgame\mb5.wav",1);
    music2=load_wav("user\mbgame\mball2.wav",1);

    load_wav("user\mbgame\mbi4.wav",0);

    load_wav("user\mbgame\toyworld.wav",0);
    load_wav("user\mbgame\snow.wav",0);
    load_wav("user\mbgame\desert.wav",0);
    load_wav("user\mbgame\parkland.wav",0);
    load_wav("user\mbgame\choc.wav",0);

    load_wav("user\mbgame\camera.wav",0);
    load_wav("user\mbgame\wind.wav",1);
    load_wav("user\mbgame\rain.wav",1);
    load_pcm("user\mbgame\thunder.pcm",0);
    load_wav("user\mbgame\gameover.wav",0);

    load_wav("user\mbgame\time.wav",0);
    load_wav("user\mbgame\congrat.wav",0);

    load_wav("user\mbgame\titled.wav",1);

    file1=load_fpg("user\mbgame\mballt2.fpg");
    file2=load_fpg("user\mbgame\sballs.fpg");
    filet=load_fpg("user\mbgame\mtitle.fpg");
    file3d=load_fpg("user\mbgame\decor.fpg");

    movie();

end;

process mainloop2();
private tim4;

    begin
    wiz(7);
    detail=5;

    loop;
        if (key(_c))
            gameover();
        end;

        if (fps<12)
            set_fps(24,0);
            detail=1;
        end;

        set_fps(24,0);

        if (timecheat==1 and key(_t))
            timmy=timmy+10;
        end;

        tim4=tim4+1;
        if (tim4>24)
            timmy=timmy-1;
            tim4=0;
        end;

        if (key(_1))
            style=1;
        end;

        if (key(_2))
            style=2;
        end;

        frame;

        recordpos=recordpos+1;
        if (play==0)
            recordx[recordpos]=mx;
            recordy[recordpos]=my;
            recordh[recordpos]=bheight;
            recordtot=recordpos;
        end;

        if (play==1)

            if (mouse.left or key(_space))
                play=0;
                levelcomplete();
                recordpos=0;
                recordtot=0;
            end;

            mx=recordx[recordpos];
            my=recordy[recordpos];

            if (recordpos>recordtot-2)
                play=0;
                levelcomplete();
                recordpos=0;
                recordtot=0;
            end;
        end;

    end;
end;

process md7();
begin
    timmy+=200;
    start_mode7(0,file1,1,1,0,220+100+80);
    m7.camera=id;
    m7.height=400+300+200;
    m7.horizon=-200;
    m7.distance=100+80+100;
    m7.distance=100+80+100;

    m7.color=0;
    x=320;
    y=240;
    angle=0;
    angle=90000;

    loop
        if (key(_1))

            m7.camera=id;
            m7.height=400+300+200;
            m7.horizon=-200;
            m7.distance=100+80+100;
            m7.distance=100+80+100;
            style=1;
        end;

        if (key(_3))

            m7.camera=id;
            m7.camera=id;
            m7.height=6600;
            m7.horizon=-900;
            m7.distance=750;
            style=1;
        end;

        if (key(_4))

            m7.camera=id;
            m7.height=170;
            m7.horizon=-50;
            m7.distance=60;
            style=1;
        end;

        frame();
    end;
end;

process pal();
begin

    if (effect==1)
        fade(90,90,90,10);
    end;

    if (effect==2)
        fade(103,103,103,10);
    end;

    if (effect==4)
        fade(108,108,102,10);
    end;

    frame();

    return;

end;

process dmap();
private
    kf2,lavax1,lavay1,lavax2,lavay2,
    lava1=3,lava2,bounce=10,fv,shad,
    wp2,wp,pos,x2,y2,i,j;
begin
    
    firetime=0;
    spikes=0;
    canim=canim+1;
    if (canim>9)
        canim=0;
    end;
    
    shad=0;
    wp=-240;
    wp2=240;
    if (cplan==5)
        pong(350);
        pong(32);
        pongball();
    end;
    
    loop
        
        spikes=spikes+1;
        
        if (spikes>50)
            spikes=0;
        end;

        firetime=firetime+2;
        
        if (firetime>100)
            firetime=0; 
        end;
        
        fsize=100;
        
        if (firetime==0 or firetime==19 or firetime==39 or firetime==59 or firetime==79)
            fsize=50;
        end;

        if (firetime==1 or firetime==20 or firetime==40 or firetime==60 or firetime==80)
            fsize=10;
        end;

        if (firetime==1 or firetime==21 or firetime==41 or firetime==61 or firetime==81)
            fsize=30;
        end;

        if (firetime==2 or firetime==22 or firetime==42 or firetime==62 or firetime==82)
            fsize=50;
        end;

        if (firetime==3 or firetime==23 or firetime==43 or firetime==63 or firetime==83)
            fsize=75;
        end;
        
        if (swind==1)
            swingang=swingang+8000; 
        end;
        
        if (swind==2)
            swingang=swingang-8000; 
        end;
        
        if (swingang>180000)
            swind=2;
        end;
        
        if (swingang<0000)
            swind=1;
        end;

        canim=canim+1;
        if (canim>10)
            canim=0;
        end;
        
        crum=crum+1;
        
        if (crum>2)
            crum=0;
        end;
        
        reflection=0;
        
        if (cplan==3 and detail>1)
            reflection=1;
        end;
        
        if (effect==1)
            rain(rand(50,610),rand(50,420));
            rain(rand(50,610),rand(50,420));
            rain(rand(50,610),rand(50,420));
        end;

        if (effect==2)
            snow(rand(50,610),rand(50,420));
            snow(rand(50,610),rand(50,420));
            snow(rand(50,610),rand(50,420));
        end;

        if (rand(1,10)==1 and effect==4)
            wind(rand(50,610),rand(-100,580));
        end;

        shadow=0;
        shad=0;
        graph=1;

        flags=0;
        size=30;
        x=64;
        y=400;
        wp=wp-2;
        wp2=wp2-2;
        
        if (style==2)    
            x=320;
            y=240;
            size=100;
        end;
        
        if (wp2<-240)
            wp2=480+240;
        end;
        
        if (wp<-240)
            wp=480+240;
        end;
        
        if (cplan==1)
            
            map_put(file1,1,271,320,240);
            lava1=lava1+1;
            
            if (lava1>5)
                lava1=0;
                lavax1=rand(0,640);
                lavay1=rand(0,480);
            end;

            lava2=lava2+1;
                    
            if (lava2>5)
                lava2=0;
                lavax2=rand(0,640);
                lavay2=rand(0,480);
            end;

            map_xput(file1,1,273+lava1,lavax1,lavay1,0,50+(lava1*30),4);
            map_xput(file1,1,273+lava2,lavax2,lavay2,0,50+(lava2*30),4);

        end;

        if (cplan==2)
            map_put(file1,1,272,320,240);
        end;

        if (cplan==3)
            map_put(file1,1,54,320,240);
        end;

        if (cplan==4)
            map_put(file1,1,270,320,240);
        end;

        if (cplan==5)    
            map_xput(file1,1,290,320,240,0,100,4);
        end;

        x2=mx mod(32);
        y2=my mod(32);
        pos=((my/32)*700)+mx/32;
        kfish=kfish+1;
        
        if (kfish>40)
            kfish=0;
        end;
        
        for (i=0; i<17; i++)
            for (j=0; j<22; j++)
                
                dshad=1;
                if (lever==1)
                    
                    if (blocks[pos]==99)
                        blocks[pos]=206;
                    end;
                
                    if (blocks[pos]==207)
                        blocks[pos]=100;
                    end;

                end;
                
                if (lever==2)
                    
                    if (blocks[pos]==100)
                        blocks[pos]=207;
                    end;
                
                    if (blocks[pos]==206)
                        blocks[pos]=99;
                    end;
                end;
                
                if (blocks[pos]>0 and blocks[pos]<>4)
                    map_put(file1,1,blocks[pos]+1,(j*32)-x2,(i*32-y2));
                end;

                if (blocks[pos]==216)
                    plot3d2(((j*32)-x2),(i*32-y2)+128,162+kf,10,240);
                end;
        
                if (blocks[pos]==288)
                    
                    if (kfish<11)
                        plot3d2(((j*32)-x2),(i*32-y2)+16,208+kfish,10,200);
                    end;
                
                end;
                
                if (blocks[pos]==102)
                    plot3d(((j*32)-x2),(i*32-y2)+16,175+kf);
                end;

                if (blocks[pos]==103)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,186+kf,bounce,120);
                    
                    if (kf<6)
                        bounce=bounce+20;
                    end;
                    
                    if (kf>5)
                        bounce=bounce-20;
                    end;
                    
                    if (kf==0)
                        bounce=0;
                    end;
                end;
                
                if (blocks[pos]==214 and lever==1)
                    plot3d(((j*32)-x2),(i*32-y2),150);
                end;

                if (blocks[pos]==214 and lever==2)
                    plot3d(((j*32)-x2),(i*32-y2),151);
                end;
                
                if (blocks[pos]==94 and detail>1)
                    plot3d(((j*32)-x2),(i*32-y2)+16,109);
                end;

                /////////////////////////////////
                /////////////////////////////////
                //////////balls//////////////////
                /////////////////////////////////

                if (blocks[pos]==91 and detail>0)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,133,0,200);
                    dshad=0;
                end;

                if (blocks[pos]==204)
                    map_put(file1,1,blocks[pos-1]+1,(j*32)-x2,(i*32-y2));
                    swing((j*32)-x2,(i*32-y2)+16,swingang);
                end;
                
                if (blocks[pos]==92 and detail>0)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,134,0,200);
                    dshad=0;
                end;

                if (blocks[pos]==93 and detail>0)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,135,0,200);
                    dshad=0;
                end;
                
                if (blocks[pos]==201)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,110+canim,60,100);
                    plot3dt(((j*32)-x2),(i*32-y2)+14,132,4,450);
                    glowr(((j*32)-x2),(i*32-y2)+14);
                end;

                if (blocks[pos]==208 and firetime>0 and firetime<20)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,152+kf,0,fsize);
                end;

                if (blocks[pos]==209 and firetime>19 and firetime<40)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,152+kf,0,fsize);
                end;

                if (blocks[pos]==210 and firetime>39 and firetime<60)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,152+kf,0,fsize);
                end;

                if (blocks[pos]==211 and firetime>59 and firetime<80)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,152+kf,0,fsize);
                end;

                if (blocks[pos]==212 and firetime>79 and firetime<102)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,152+kf,0,fsize);
                end;
                
                if (blocks[pos]==125)
                    plot3d(((j*32)-x2),(i*32-y2)+16,43+kf);
                end;

                if (blocks[pos]==126)
                    plot3d(((j*32)-x2),(i*32-y2)+16,54+kf);
                end;

                if (blocks[pos]==127)
                    plot3d(((j*32)-x2),(i*32-y2)+16,65+kf);
                end;

                if (blocks[pos]==128)
                    plot3d(((j*32)-x2),(i*32-y2)+16,76+kf);
                end;

                if (blocks[pos]==129)
                    plot3d(((j*32)-x2),(i*32-y2)+16,87+kf);
                end;

                if (blocks[pos]==215)
                    plot3d(((j*32)-x2),(i*32-y2),139+kf);
                end;

                if (blocks[pos]==40 and detail>1)
                    plot3d(((j*32)-x2),(i*32-y2)+16,20);
                end;

                if (blocks[pos]==85)
                    plot3d(((j*32)-x2),(i*32-y2)+16,21);
                end;


                if (blocks[pos]==67)
                    plot3d(((j*32)-x2),(i*32-y2)+16,12);
                end;

                if (blocks[pos]==68)
                    plot3d(((j*32)-x2)-24,(i*32-y2),13);
                end;

                if (blocks[pos]==71)
                    plot3d2(((j*32)-x2),(i*32-y2)+16,197+kf,0,175);
                end;

                if (blocks[pos]==77)
                    plot3d2(((j*32)-x2),(i*32-y2)-18,15,180,340);
                    plot3d2(((j*32)-x2),(i*32-y2)-12,15,190,340);
                    plot3d2(((j*32)-x2),(i*32-y2)-6,15,200,340);
                    plot3d2(((j*32)-x2),(i*32-y2),14,0,210);
                    plot3d2(((j*32)-x2),(i*32-y2)+4,15,200,340);
                    plot3d2(((j*32)-x2),(i*32-y2)+8,15,190,340);
                    plot3d2(((j*32)-x2),(i*32-y2)+12,15,180,340);
                end;
                
                if (blocks[pos]==83)
                    plot3d2(((j*32)-x2),(i*32-y2)-18,16,0,140);
                    plot3d2(((j*32)-x2),(i*32-y2)-12,16,0,140);
                    plot3d2(((j*32)-x2),(i*32-y2)-6,16,0,140);
                    plot3d2(((j*32)-x2),(i*32-y2),16,0,140);
                    plot3d2(((j*32)-x2),(i*32-y2)+4,16,0,140);
                    plot3d2(((j*32)-x2),(i*32-y2)+8,16,0,140);
                    plot3d2(((j*32)-x2),(i*32-y2)+12,18,0,140);
                end;

                if (blocks[pos]==162)
                    plot3d2(((j*32)-x2),(i*32-y2)-18,17,270,140);
                    plot3d2(((j*32)-x2),(i*32-y2)-12,17,270,140);
                    plot3d2(((j*32)-x2),(i*32-y2)-6,17,270,140);
                    plot3d2(((j*32)-x2),(i*32-y2),17,270,140);
                    plot3d2(((j*32)-x2),(i*32-y2)+4,17,270,140);
                    plot3d2(((j*32)-x2),(i*32-y2)+8,17,270,140);
                    plot3d2(((j*32)-x2),(i*32-y2)+12,19,270,140);
                end;


                if (blocks[pos]==82)
                    plot3d2(((j*32)-x2)-18,(i*32-y2),15,180,340);
                    plot3d2(((j*32)-x2)-12,(i*32-y2),15,190,340);
                    plot3d2(((j*32)-x2)-6,(i*32-y2),15,200,340);
                    plot3d2(((j*32)-x2),(i*32-y2),14,0,210);
                    plot3d2(((j*32)-x2)+4,(i*32-y2),15,200,340);
                    plot3d2(((j*32)-x2)+8,(i*32-y2),15,190,340);
                    plot3d2(((j*32)-x2)+12,(i*32-y2),15,180,340);
                end;
                    
                if (blocks[pos]==80)
                    plot3d(((j*32)-x2),(i*32-y2)+16,8);
                end;        

                if (blocks[pos]==81)
                    plot3d(((j*32)-x2),(i*32-y2)+5,10);
                end;

                if (blocks[pos]==72)
                    plot3d(((j*32)-x2),(i*32-y2)+16,9);
                end;
                
                if (blocks[pos]==61)
                    plot3d((j*32)-x2,(i*32-y2),1);
                end;
                
                if (blocks[pos]==62)
                    plot3d((j*32)-x2,(i*32-y2),2);
                end;

                if (blocks[pos]==63)
                    plot3d((j*32)-x2,(i*32-y2),3);
                end;

                if (blocks[pos]==35 and redkey<>0)
                    blocks[pos]=132;
                end;

                if (blocks[pos]==36 and greenkey<>0)
                    blocks[pos]=134;
                end;

                if (blocks[pos]==37 and bluekey<>0)
                    blocks[pos]=135;
                end;

                if (blocks[pos]==38 and orangekey<>0)
                    blocks[pos]=133;
                end;

                if (blocks[pos]==39 and purplekey<>0)
                    blocks[pos]=136;
                end;

                if (blocks[pos]<bt or blocks[pos]>tt)
                    shad=1;
                end;

                if (blocks[pos]==101)
                    plot3d2(((j*32)-x2)-12,(i*32-y2)+8,173,0,180);
                    dshad=0;
                end;

                if (blocks[pos-701]>bt and blocks[pos-701]<tt and shad==1 and blocks[pos]>0 and dshad==1 and blocks[pos-701]<>93 and blocks[pos-701]<>92 and blocks[pos-701]<>91 and gameon==1)
                    if (blocks[pos-701]<>101)
                        map_Xput(file1,1,27,(j*32)-x2,(i*32-y2),0,100,4);        
                    end;
                end;

                if (blocks[pos]==4)
                    map_block_copy(file1, 1, (j*32)-x2-16,(i*32)-y2-16 ,24 ,(j*32)-x2,(i*32)-y2, 32,32);
                    map_Xput(file1,1,blocks[pos]+1,(j*32)-x2,(i*32-y2),0,100,4);
                end;

                if (walls==1 and i<10 and blocks[pos]==10)
                    bgraph((j*32)-x2,(i*32-y2));
                end;

                if (blocks[pos]==2 and rand(1,6)==1)
                    smoke((j*32)-x2,(i*32-y2));
                end;

                if (effect==3)
                    if (blocks[pos]<1 and rand(1,100)==1)
                        bubble((j*32)-x2,(i*32-y2));
                    end;
                end;
                
                shad=0;

                pos=pos+1;
            end;
            
            pos=pos+700-22;
        end;

        // bottom reflection

        if (sg1<1)
            sg1=28;
        end;
        if (sg1>44) sg1=44; end;
        map_xput(file1,1,52,mouse.x,mouse.y-16,0,100,4);

        if (blocks[pos-(700*8)+11]<bt or blocks[pos-(700*8)+11]>tt and blocks[pos-(700*8)+11]<>0);
        pos8=pos;
        
        if (reflection==0 and gameon==1)
            map_xput(file1,1,150,320+14,240+6,0,100,4);
        end;

        if (reflection<>0 and gameon==1)
            reflect(file1,165+full,330,240,200);
            reflect(file1,139,330,240,200);
        end;
    end;
    
    man=man+1;
    if (man>3)
        man=0;
    end;
    
    if (blocks[pos-(700*8)+11]<bt or blocks[pos-(700*8)+11]>tt and blocks[pos-(700*8)+11]<>0);
        if (gameon==1)
            ballreflect();
        end;
    end;
    
    if (reflection==1 and gameon==1)
        map_xput(file1,1,146,320,240,0,100,4);
    end;

    pos7=pos;
    kf=kf+1;
    
    if (kf>9)
        kf=0;
    end;

    frame();
end;
end;

process balllight();
begin
//return;
x=327;
y=243;
y=243;
graph=165+full;
//graph=ballg;
if (style<>2) size=218; end;
if (style==2) return; end;
if (style==2) size=bheight-80; x=320; y=240; end;


if (style<>2) ctype=c_m7; end;
flags=4;
height=bheight;

//if (reflection==1)
//if (blocks[pos8-(700*8)+11]<bt or blocks[pos8-(700*8)+11]>tt and blocks[pos8-(700*8)+11]<>0);
//reflect(file,graph,x,y,size);
//end;
//end;


frame();
return;
end;

process ballreflect();
private len;g;
begin
shadow=0;
graph=139;

if (style<>2) ctype=c_m7; end;
if (style==2) size=80; end;

//ctype=c_m7;
x=326;
y=242;
if (style==2) size=70+bheight;
y=230;
x=320;
end;
height=bheight;
flags=4;
if (style<>2) size=220; end;
for (g==3; g<62; g=g+1)
len=0;
if (g==1) len=10; end;
if (g==2) len=14; end;
if (g==3) len=18; end;
if (g==4) len=22; end;
if (g==5) len=26; end;
if (g==6) len=30; end;
if (g==7) len=34; end;
if (g==8) len=38; end;
if (g==9) len=38; end;
if (g==10) len=39; end;
if (g==11) len=40; end;
if (g==12) len=42; end;
if (g==13) len=46; end;
if (g==14) len=50; end;
if (g==15) len=50; end;
if (g==16) len=50; end;
if (g==17) len=50; end;
if (g==18) len=50; end;
if (g==19) len=51; end;
if (g==20) len=52; end;
if (g==21) len=52; end;
if (g==22) len=53; end;
if (g==23) len=53; end;
if (g==24) len=53; end;
if (g==25) len=53; end;
if (g==26) len=54; end;
if (g==27) len=54; end;
if (g==28) len=54; end;
if (g==29) len=54; end;
if (g==30) len=54; end;
if (g==31) len=54; end;
if (g==32) len=54; end;

if (g==64) len=10; end;
if (g==63) len=14; end;
if (g==62) len=18; end;
if (g==61) len=22; end;
if (g==60) len=26; end;
if (g==59) len=30; end;
if (g==58) len=34; end;
if (g==57) len=38; end;
if (g==56) len=38; end;
if (g==55) len=39; end;
if (g==54) len=40; end;
if (g==53) len=42; end;
if (g==52) len=46; end;
if (g==51) len=50; end;
if (g==50) len=50; end;
if (g==49) len=50; end;
if (g==48) len=50; end;
if (g==47) len=50; end;
if (g==46) len=51; end;
if (g==45) len=52; end;
if (g==44) len=52; end;
if (g==43) len=53; end;
if (g==42) len=53; end;
if (g==41) len=53; end;
if (g==40) len=53; end;
if (g==39) len=54; end;
if (g==38) len=54; end;
if (g==37) len=54; end;
if (g==36) len=54; end;
if (g==35) len=54; end;
if (g==34) len=54; end;
if (g==33) len=54; end;
if (style<>2)
map_block_copy(file1, 139, 34-len/2, g, 1, 320-g/2, 210+g, len, 1);
end;

if (style==2)
map_block_copy(file1, 139, 34-len/2, g, 24, 320-g/2, 210+g, len, 1);
end;


end;

//if (reflection==1)
//if (blocks[pos8-(700*8)+11]<bt or blocks[pos8-(700*8)+11]>tt and blocks[pos8-(700*8)+11]<>0);
//reflect(file,graph,x,y,size);
//end;
//end;

frame();
//fade(200,200,200,10);
return;
end;


process ball();
private roll,chk,jump2=10; rb=0;grav,jump,tim=0; psx,psy;
begin
//sound(0,250,250);
if (dx<>0 or dy<>0) undot=undot+1; end;
undox[undot]=mx;
undoy[undot]=my;
if (undot>50) undot=1; end;

//psx=mx+320;
//psy=my+240;
//chk=blocks[((psy)/32)*300+(psx)/32];
file=file2;
ctype=c_m7;
jump=0;
loop
if (levers>0) levers=levers-1; end;

if (timecheat==1 and key(_f) and full<9) full=full+1; end;
if (rand(1,6)==1 and effect==4)
dx=dx+1;
end;
joyx=get_joy_position(0);
joyy=get_joy_position(1);
joyx2=get_joy_position(2);
joyy2=get_joy_position(3);

if (gamepad==1)
if (stopball<1)
if (don<4)
dx=(joyx-70)/2;
dy=(joyy-43)/2;
end;
end;
end;

if (gamepad==2)
if (stopball<1)
if (don<4)

if (movecheat==1)

if (key(_right)) dx=dx+2; end;
if (key(_left)) dx=dx-2; end;
if (key(_up)) dy=dy-2; end;
if (key(_down)) dy=dy+2; end;

end;
end;
end;
end;

ballrot=ballrot+2000;
ballg=140;
if (stopball>0) stopball=stopball-1; end;
if (play==2)
height=recordh[recordpos];;
end;

roll=roll+1;


chk=blocks[((psy)/32)*mw+(psx)/32];
if (chk>33 and chk<28 and dx<>0 and dy<>0 and roll>10)
roll=0;
//sound(3,200,(200)+(dx*10)+(dy*10));
end;
//undot=undot+1;
if (timmy<0);
gameover();

end;
chk=blocks[((psy)/32)*mw+(psx)/32];
if (chk>0)
if (chk<28 or chk>35)
if (chk<208 or chk>214)
undox[undot]=mx;
undoy[undot]=my;
undot=undot+1;
end;
end;
end;
if (undot>30) undot=1; end;
size=220;
if (don>0) don=don-1; end;
psx=mx+342;
psy=my+240;
chkl=blocks[((psy)/32)*mw+(psx-16)/32];
chkr=blocks[((psy)/32)*mw+(psx+16)/32];
chku=blocks[((psy-16)/32)*mw+(psx)/32];
chkd=blocks[((psy+16)/32)*mw+(psx)/32];
chk=blocks[((psy)/32)*mw+(psx)/32];

file=file1;
graph=ballg;
//graph=140;
x=320+4;
y=240;
//mx=mx+dx/4;
//my=my+dy/4;

mx=mx+dx/2;
my=my+dy/2;

if (dx<-ms) dx=-ms; end;
if (dx>ms) dx=ms; end;
if (dy>ms) dy=ms; end;
if (dy<-ms) dy=-ms; end;

rb=0;
if ((chk==2 or chkl==2 or chkr==2 or chku==2 or chkd==2) and height<30 and grav<30)
if (rand(0,4)==1) wiz(9); end;
jump=10;
jump2=10;
grav=grav+32;
rb=1;
end;

//if (jump==0 and rb==0)
//jump=10;
//grav=32;
//end;

if (jump>1) jump=jump-1; end;

if (jump>1) height=height+grav; grav=grav-2; end;
if (jump==1) height=height-grav; grav=grav+2; end;
if ((jump<1 and jump>0) or height<2) height=0;
height=0;
if (grav<4) jump=0; grav=0; end;
if (grav>4)
jump=jump2;
jump2=jump2-2;
grav=grav-(grav/2);
end;
//end;
//jump=0;
end;

chkl=blocks[((psy)/32)*mw+(psx-16)/32];
chkr=blocks[((psy)/32)*mw+(psx+16)/32];
chku=blocks[((psy-16)/32)*mw+(psx)/32];
chkd=blocks[((psy+16)/32)*mw+(psx)/32];

if (chku>bt and chku<tt) my=my+2;
spark2(320,240-16);
ballg=141;
end;
if (chkd>bt and chkd<tt) my=my-2;
spark2(320,240+16);
ballg=141;
end;
if (chkl>bt and chkl<tt) mx=mx+2;
spark2(320-16,240);
ballg=141;
end;
if (chkr>bt and chkr<tt) mx=mx-2;
spark2(320+16,240);
ballg=141;
end;


chkl=blocks[((psy)/32)*mw+(psx-16)/32];
chkr=blocks[((psy)/32)*mw+(psx+16)/32];
chku=blocks[((psy-16)/32)*mw+(psx)/32];
chkd=blocks[((psy+16)/32)*mw+(psx)/32];

chk=blocks[((psy)/32)*mw+(psx)/32];

if (chk==214 and lever==1 and levers==0)
lever=2; levers=10;
//wiz(8);
sound(5,255,300);
end;


if (chk==214 and lever==2 and levers==0)
lever=1; levers=10;
//wiz(8);
sound(5,255,300);
end;

if (chk==215)
blocks[((psy)/32)*mw+(psx)/32]=blocks[((psy)/32)*mw+(psx-32)/32];
wiz(26);
timmy=timmy+50;
end;


chk=blocks[((psy)/32)*mw+(psx)/32];
if (chk==201)
blocks[((psy)/32)*mw+(psx)/32]=blocks[((psy)/32)*mw+(psx-32)/32];

if (full<9) full=full+1; end;
wiz(12);
gotc();
end;

chk=blocks[((psy+32)/32)*mw+(psx)/32];
if (chk==201)
blocks[((psy+32)/32)*mw+(psx)/32]=blocks[((psy)/32)*mw+(psx-32)/32];

if (full<9) full=full+1; end;
wiz(12);
gotc();
end;

chk=blocks[((psy-32)/32)*mw+(psx)/32];
if (chk==201)
blocks[((psy-32)/32)*mw+(psx)/32]=blocks[((psy)/32)*mw+(psx-32)/32];

if (full<9) full=full+1; end;
wiz(12);
gotc();
end;


chk=blocks[((psy)/32)*mw+(psx)/32];

ms=16;

if (chk==10 or (key(_p)) and full>8)
if (play==0)
completed[cplan]=completed[cplan]+1;
save("savegame.dat", offset completed, sizeof(completed));
end;
wiz(27);
redkey=0;
greenkey=0;
orangekey=0;
bluekey=0;
purplekey=0;
play=1;
recordpos=1;
//load("user\mbgame\lev2.dat", offset blocks);
settime();
end;

if (chk==4)
don=3;
ms=32;
// dx=dx*2;
// dy=dy*2;
//if (dx=16; end;
//if (dy<0) dy=-16; end;
//if (dy>0) dy=16; end;
end;


if (chk==125) sound(5,255,300); redkey=1; wiz(8); blocks[((psy)/32)*mw+(psx)/32]=137; end;

if (chk==126) sound(5,255,300); orangekey=1; wiz(8); blocks[((psy)/32)*mw+(psx)/32]=137; end;

if (chk==127) sound(5,255,300); greenkey=1; wiz(8); blocks[((psy)/32)*mw+(psx)/32]=137; end;

if (chk==128) sound(5,255,300); bluekey=1; wiz(8); blocks[((psy)/32)*mw+(psx)/32]=137; end;

if (chk==129) sound(5,255,300); purplekey=1; wiz(8); blocks[((psy)/32)*mw+(psx)/32]=137; end;


if (chk==3)
ms=8;
spark2(320,240);
end;

if (chk>26 and chk<34 and height<20)
if (crum==1)sound(4,255,300); end;

blocks[((psy)/32)*mw+(psx)/32]=blocks[((psy)/32)*mw+(psx)/32]+1;
end;
if (chk==34 and height<20)
blocks[((psy)/32)*mw+(psx)/32]=0;
end;


if (chk<1 and height<20)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-5;
balld();
return;
end;

if (chk==208 and height<60 and firetime>0 and firetime<20)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-10;
balld();
return;
end;

if (chk==209 and height<60 and firetime>19 and firetime<40)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-10;
balld();
return;
end;

if (chk==210 and height<60 and firetime>39 and firetime<60)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-10;
balld();
return;
end;

if (chk==211 and height<60 and firetime>59 and firetime<80)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-10;
balld();
return;
end;

if (chk==213 and height<60 and spikes<50)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-10;
balld();
return;
end;


if (chk==212 and height<60 and firetime>79 and firetime<101)
//mx=undox[undot];
//my=undoy[undot];
sound(6,255,300);
dx=0;
dy=0;
timmy=timmy-10;
balld();
return;
end;



if (chk==7)
stopball=3;
dx=-32;
dy=0;
ms=40;
//fade(200,200,200,10);
end;

if (chk==5)
stopball=3;

dx=32;
dy=0;
ms=40;
//fade(200,200,200,10);
end;

if (chk==6)
stopball=3;

dx=0;
dy=32;
ms=40;
//fade(200,200,200,10);
end;

if (chk==8)
stopball=3;

dx=0;
dy=-32;
ms=40;
//fade(200,200,200,10);
end;

if ((chkr>bt and chkr<tt))
ballg=141;
//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;
dx=-dx;
don=5;
sound(0,255,340);
//dy=-dy;
mx=mx+dx;
//mx=mx+dx/2;

//my=my+dy;
tim=5;
if (dx<0) dx=dx+1; end;
if (dx>0) dx=dx-1; end;
if (dy>0) dy=dy-1; end;
if (dy<0) dy=dy+1; end;

//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;


end;


if ((chkl>bt and chkl<tt))
ballg=141;
//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;
dx=-dx;
don=5;
sound(0,255,340);
//dy=-dy;
mx=mx+dx;
//mx=mx+dx/2;

//my=my+dy;
tim=5;
if (dx<0) dx=dx+1; end;
if (dx>0) dx=dx-1; end;
if (dy>0) dy=dy-1; end;
if (dy<0) dy=dy+1; end;

//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;


end;

chkl=blocks[((psy)/32)*mw+(psx-16)/32];
chkr=blocks[((psy)/32)*mw+(psx+16)/32];
chku=blocks[((psy-16)/32)*mw+(psx)/32];
chkd=blocks[((psy+16)/32)*mw+(psx)/32];

if (dx<-ms) dx=-ms; end;
if (dx>ms) dx=ms; end;
if (dy>ms) dy=ms; end;
if (dy<-ms) dy=-ms; end;

if ((chku>bt and chku<tt))
ballg=141;
//if ((chku==10 or chkd==10))
//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;
//dx=-dx;
dy=-dy;
don=5;
sound(0,255,340);
//mx=mx+dx;
my=my+dy;
//fade(200,200,200,10);
//my=my+dy/2;


if (dx<0) dx=dx+1; end;
if (dx>0) dx=dx-1; end;
if (dy>0) dy=dy-1; end;
if (dy<0) dy=dy+1; end;

//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;


end;

if ((chkd>bt and chkd<tt))
ballg=141;
//if ((chku==10 or chkd==10))
//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;
//dx=-dx;
dy=-dy;
don=5;
sound(0,255,340);
//mx=mx+dx;
my=my+dy;
//fade(200,200,200,10);
//my=my+dy/2;


if (dx<0) dx=dx+1; end;
if (dx>0) dx=dx-1; end;
if (dy>0) dy=dy-1; end;
if (dy<0) dy=dy+1; end;

//if (dx<0) dx=dx+1; end;
//if (dx>0) dx=dx-1; end;
//if (dy>0) dy=dy-1; end;
//if (dy<0) dy=dy+1; end;


end;


if (dx<-ms) dx=-ms; end;
if (dx>ms) dx=ms; end;
if (dy>ms) dy=ms; end;
if (dy<-ms) dy=-ms; end;


//frame();
if (tim==5)
if (dx<0) dx=dx+1; end;
if (dx>0) dx=dx-1; end;
if (dy>0) dy=dy-1; end;
if (dy<0) dy=dy+1; end;

end;
tim=tim+1; if (tim>24) tim=0; end;
if (key(_q)) walls=0; end;
if (key(_w)) walls=1; end;
//file=file2;
//graph=26;
bheight=height;
if (reflection==1)
//if (blocks[pos8-(700*8)+11]<bt or blocks[pos8-(700*8)+11]>tt and blocks[pos8-(700*8)+11]<>0);
//reflect(file,graph,x,y,size);
//end;
end;
bheight=height;
ballreflect();
balllight();
flags=4;

if (style==2);
map_xput(file1,1,ballg,320,230,0,70+bheight,0);
end;
if (style==2) graph=ballg; end;
graph=23;

//angle=angle+2000;
frame();
end;
end;

process bat();
private angw,tims,ang;
begin
//write_int(1,320,200,1,offset angw);
size=300;
file=file1;
file=file2;
ctype=c_m7;
loop

if (tims>0) tims=tims-1; end;

x=mouse.x;
y=mouse.y;
if (x<10) x=10; end;
if (x>630) x=630; end;
if (y<10) y=10; end;
if (y>470) y=470; end;

//ang=fget_angle(x,y-10,320,240);
if (mouse.left and tims==0)
ang=fget_angle(x,y-10,320,240);
bullet(ang,x,y); tims=2;
//if (rand(1,3)==3) sound(1,100,300); end;
//ang2=ang;
end;
//frame();

file=file2;
//graph=3;
//graph=2;
//graph=27;
angw=(ang/1000)/22;
if (angw==-5) graph=38; awx=26; awy=0; end;
if (angw==-6) graph=39; awx=40; awy=0;end;
if (angw==-7) graph=40; awx=48; awy=0;end;
if (angw==-8) graph=41; awx=52; awy=0;end;
if (angw==8) graph=42; awx=52; awy=0;end;
if (angw==7) graph=43; awx=48; awy=0;end;
if (angw==6) graph=44;awx=40; awy=0; end;
if (angw==5) graph=45;awx=26; awy=0; end;
if (angw==4) graph=46;awx=36; awy=0; end;
if (angw==3) graph=47;awx=26; awy=0; end;
if (angw==2) graph=48;awx=16; awy=0; end;
if (angw==1) graph=49;awx=8; awy=0; end;
if (angw==1) graph=50;awx=0; awy=0; end;
if (angw==-1) graph=51;awx=0; awy=0; end;
if (angw==-2) graph=52;awx=0; awy=0; end;
if (angw==-3) graph=53;awx=0; awy=0; end;
if (angw==-4) graph=54;awx=20; awy=0; end;
sg1=graph;

//graph=36+angw;
ang2=ang;
flags=0;
//if (x>320 and y<240) flags=1; end;
//if (x<320 and y>240) flags=2; end;
ang=fget_angle(x,y-10,320,240);
ang3=ang;
//if (mouse.left and tims==0) bullet(ang,x,y); tims=2;
//if (rand(1,3)==3) sound(1,100,300); end;
//ang2=ang;
//end;
//x=320;
//my=240;
//if (flags==1) x=(mouse.x)-32; end;

x=(mouse.x)-32;
if (x>320 and y<240) flags=1; x=(mouse.x)+16;  end;
if (x<320 and y>240) flags=2; end;
if (x>320 and y>240) flags=3; x=(mouse.x)+24; end;
y=(mouse.y);
flags=0;
x=(mouse.x)-32;

//if (mouse.left and tims==0) bullet(ang,x,y); tims=2;
//if (rand(1,3)==3) sound(1,100,300); end;
//ang2=ang;
//end;


//x=x+awx;
//y=y+awy;
if (style==1)
size=300;
file=file1;
ctype=c_m7;
x=x+awx;
y=y+awy;
end;

if (style==2)
size=100;
graph=53;
file=file1;
ctype=c_screen;
z=-2000;
x=mouse.x;
y=mouse.y-8;
end;

file=file2;

if (reflection==1)
reflect(file,graph,x,y,size);
end;


//map_xput(file1,1,54,320,240,0,100,4);

frame();
end;
end;

process bullet(angle,x,y);
private fx,lfx;
begin
y=y-8;
size=300;
lfx=rand(47,51);
//x=x+rand(-2,2);
//y=y+rand(-2,2);
file=file2;
ctype=c_m7;
fx=rand(1,4);
//if (fx==1) flags=2; end;
//if (fx==2) flags=1; end;
repeat
if (style==1);
ctype=c_m7;
size=300;
end;
if (style==2);
ctype=c_screen;
size=100;
z=-4000;
end;

//size=size+4;
//x=mouse.x;
//y=mouse.y;
file=file2;
graph=rand(21,24);
//size=400;
advance(8);
//glow(x,y);
//x=320;
//my=240;
//flags=4;
if (y>225 and y<255 and x>305 and x<335);
smoke2(x,y);
ballmaths(angle);
return;
end;
map_xput(file1,1,lfx,x,y-8,0,25,4);

if (reflection==1)
reflect(file,graph,x,y,size);
end;

frame();
until (x<0 or x>640 or y<0 or y>480 or size>400);
end;

process glow(x,y);
begin
size=100;
file=file2;
graph=25;
ctype=c_m7;
//flags=4;
frame();
end;

process ballmaths(angle);
private x3,y3;
begin
if (stopball>0) return; end;
sound(2,200,400);
x=320;
y=240;
advance(4);
if (don<4);
dx=dx+(x-320);
dy=dy+(y-240);
end;
end;

process bgraph(x,y);
private xmo,ymo;
begin
size=400;
ctype=c_m7;
file=file2;
graph=6;
flags=4;
xmo=mouse.x;
ymo=mouse.y;
if (x>100 and x<540 and y>240) flags=4; end;
if (x>000 and x<640 and y>240) return; end;
if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;

if (reflection==1)
reflect(file,graph,x,y,size);
end;


frame();
end;

process smoke(x,y);
private sz,rx,ry,xmo,ymo;
begin
x=x+mx;
y=y+my;


sz=rand(20,40);
graph=10;
graph=28;
rx=rand(-4,4);
ry=rand(-4,4);
size=300;
graph=rand(57,61);
//write_int(1,320,100,2,offset xmo);
//write_int(1,320,200,2,offset ymo);
xmo=x;
ymo=y;
repeat

x=xmo-mx;
y=ymo-my;

ymo=ymo-rx;
xmo=xmo-ry;
//size=400;
if (style==1)
ctype=c_m7;
size=200;
end;
file=file2;
//graph=10;
flags=4;
//xmo=mouse.x;
//ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=(sz+(height)/20);
end;

if (style==1)
//z=-3000;
//ctype=c_screen;
size=(sz+(height/2));
end;


//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
flags=4;

frame();
height=height+16;
//graph=graph+1;
until (height>300);
end;

process rain(x,y);
private sz,rx,ry,xmo,ymo;
begin
x=x+mx;
y=y+my;
height=500;
sz=rand(20,40);
graph=10;
graph=28;
//rx=rand(-4,4);
//ry=rand(-4,4);
size=200;
graph=rand(57,61);
graph=62;
flags=4;
//write_int(1,320,100,2,offset xmo);
//write_int(1,320,200,2,offset ymo);
xmo=x;
ymo=y;
repeat

x=xmo-mx;
y=ymo-my;

ymo=ymo-rx;
xmo=xmo-ry;
//size=400;
if (style==1)
ctype=c_m7;
size=300;
end;
file=file2;
//graph=10;
flags=4;
//xmo=mouse.x;
//ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=(sz+(height)/20);
end;

if (style==1)
//z=-3000;
//ctype=c_screen;
//size=(sz+(height/2));
end;


//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
//flags=4;

if (height<80)
graph=63;
end;
frame();
height=height-64;

//graph=graph+1;
until (height<10);
end;

process snow(x,y);
private sz,rx,ry,xmo,ymo;
begin
x=x+mx;
y=y+my;
height=400;
sz=rand(20,40);
graph=10;
graph=28;
//rx=rand(-4,4);
//ry=rand(-4,4);
size=100;
graph=rand(57,61);
graph=64;
//flags=4;
//write_int(1,320,100,2,offset xmo);
//write_int(1,320,200,2,offset ymo);
xmo=x;
ymo=y;
repeat

rx=rand(-1,1);
ry=rand(-1,1);
x=xmo-mx;
y=ymo-my;

ymo=ymo-rx;
xmo=xmo-ry;
//size=400;
if (style==1)
ctype=c_m7;
size=100;
end;
file=file2;
//graph=10;
//flags=4;
//xmo=mouse.x;
//ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=(sz+(height)/20);
end;

if (style==1)
//z=-3000;
//ctype=c_screen;
//size=(sz+(height/2));
end;


//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
//flags=4;

//if (height<80)
//graph=63;
//end;
frame();
height=height-32;

//graph=graph+1;
until (height<10);
end;

process wind(x,y);
private sz,rx,ry,xmo,ymo;
begin
x=-64;
x=x+mx;
y=y+my;
height=400;
sz=rand(20,40);
graph=10;
graph=28;
//rx=rand(-4,4);
//ry=rand(-4,4);
size=100;
graph=rand(57,61);
graph=66;
//flags=4;
//write_int(1,320,100,2,offset xmo);
//write_int(1,320,200,2,offset ymo);
xmo=x;
ymo=y;
repeat

rx=rand(-1,1);
ry=rand(-1,1);
x=xmo-mx;
y=ymo-my;

ymo=ymo-rx;
xmo=xmo-ry;
//size=400;
if (style==1)
ctype=c_m7;
size=100;
end;
file=file2;
//graph=10;
//flags=4;
//xmo=mouse.x;
//ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=(sz+(height)/20);
end;

if (style==1)
//z=-3000;
//ctype=c_screen;
//size=(sz+(height/2));
end;


//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
//flags=4;

//if (height<80)
//graph=63;
//end;
frame();
angle=angle+9000;
xmo=xmo+8;
height=height+rand(-32,32);

//graph=graph+1;
until (x>680);
end;


process bubble(x,y);
private sz,rx,ry,xmo,ymo;
begin
x=x+mx;
y=y+my;
height=0;
sz=rand(20,40);
graph=65;
graph=28;
//rx=rand(-4,4);
//ry=rand(-4,4);
size=100;
graph=rand(57,61);
graph=65;
//flags=4;
//write_int(1,320,100,2,offset xmo);
//write_int(1,320,200,2,offset ymo);
xmo=x;
ymo=y;
repeat

rx=rand(-1,1);
ry=rand(-1,1);
x=xmo-mx;
y=ymo-my;

ymo=ymo-rx;
xmo=xmo-ry;
//size=400;
if (style==1)
ctype=c_m7;
size=100;
end;
file=file2;
//graph=10;
//flags=4;
//xmo=mouse.x;
//ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=(sz+(height)/20);
end;

if (style==1)
//z=-3000;
//ctype=c_screen;
//size=(sz+(height/2));
end;


//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
//flags=4;

//if (height<80)
//graph=63;
//end;
frame();
height=height+32;

//graph=graph+1;
until (height>400);
end;


process gotc();
private sz,rx,ry,xmo,ymo;
begin
file=file3d;
x=320;
y=240;
x=x+mx;
y=y+my;
height=0;
sz=rand(20,40);
graph=65;
graph=28;
//rx=rand(-4,4);
//ry=rand(-4,4);
size=100;
graph=rand(57,61);
graph=65;
//flags=4;
//write_int(1,320,100,2,offset xmo);
//write_int(1,320,200,2,offset ymo);
xmo=x;
ymo=y;
size=300;
graph=121;
repeat

rx=rand(-1,1);
ry=rand(-1,1);
x=xmo-mx;
y=ymo-my;

ymo=ymo-rx;
xmo=xmo-ry;
//size=400;
if (style==1)
ctype=c_m7;
size=100;
end;
file=file3d;
//graph=10;
//flags=4;
//xmo=mouse.x;
//ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=(sz+(height)/20);
end;

if (style==1)
//z=-3000;
//ctype=c_screen;
//size=(sz+(height/2));
end;


//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
//flags=4;

//if (height<80)
//graph=63;
//end;
graph=graph+1;
frame();
height=height+32;

//graph=graph+1;
until (height>400 or graph>130);
end;




process smoke2(x,y);
private sz,rx,ry,xmo,ymo;
begin
sz=rand(0,20);
graph=10;
graph=28;
rx=rand(-4,4);
ry=rand(-4,4);
size=300;
//graph=rand(57,61);
repeat
x=x+rx;
y=y+ry;
//size=400;
if (style==1)
ctype=c_m7;
size=200;
end;
file=file2;
//graph=10;
flags=4;
xmo=mouse.x;
ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;
if (style==2)
z=-3000;
ctype=c_screen;
size=sz+(height/15);
end;
//height=height+64;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
//graph=rand(57,61);
//flags=0;
frame();
height=height+64;
graph=graph+1;
until (height>400);
end;

process spark(x,y);
private rx,ry,xmo,ymo,sph;
begin
graph=17;
sph=128;
rx=rand(-8,8);
ry=rand(-8,8);
repeat
x=x+rx;
y=y+ry;
sph=sph-32;
size=300;
ctype=c_m7;
file=file2;
if (style==2)
size=50+height/4;
ctype=c_screen;
z=-2000;
end;
//graph=10;
//flags=4;

xmo=mouse.x;
ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;

if (reflection==1)
reflect(file,graph,x,y,size);
end;


frame();
//size=size-40;
height=height+sph;
//graph=graph+1;
until (sph<-40);
end;



process spark2(x,y);
begin
//spark(x,y);
//spark(x,y);
//spark(x,y);
spark(x,y);
spark(x,y);
spark(x,y);

end;


process spark3(x,y,height);
private rx,ry,xmo,ymo,sph;
begin
if (height>300) return; end;
graph=25;
sph=128;
rx=rand(-32,32);
ry=rand(-32,32);
repeat
x=x+rx;
y=y+ry;
sph=sph-32;
size=rand(300,1000);
ctype=c_m7;
file=file1;
//graph=10;
//flags=4;
xmo=mouse.x;
ymo=mouse.y;
//if (x>100 and x<540 and y>240) flags=4; end;
//if (x>000 and x<640 and y>240) return; end;
//if (x>xmo-96 and x<xmo+96 and y<ymo+96 and y>ymo-96) flags=4; end;

if (reflection==1)
reflect(file,graph,x,y,size);
end;

frame();
//size=size-40;
height=height+sph;
//graph=graph+1;
until (sph<-40);
end;





process balld();
private fall;
begin
waz(rand(10,11));
fade(0,0,0,10);
frame();
x=320+4;
fall=1;
y=240;
height=500;
file=file1;
ctype=c_m7;
//fade(100,150,200,5);
graph=140;
mx=undox[undot];
my=undoy[undot];
fall=2;
size=200;
repeat
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
if (height<500 and height>400) fade (200,200,200,10);
end;
if (height<400)  fade(70,70,150,5);
end;
height=height-fall;
fall=fall+8;
frame();
until (height<0);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
mx=undox[undot];
my=undoy[undot];
ball();
fade(100,100,100,10);
pal();
end;

process player();
begin
return;
file=file2;
x=380;
y=440;
z=-4500;
loop
graph=36;
frame();
end;
end;

process cursor();
begin
file=file2;
x=280;
y=440;
z=-5500;
loop
graph=0;
x=mouse.x;
y=mouse.y;
if (mouse.right) graph=37; end;
frame();
end;
end;

process logos();
private ttim;
begin
song(1);
x=320;
y=240;
fade(0,0,0,10);
size=200;
repeat
if (ttim>20 and ttim<50 and size>100) size=size-10; end;
if (ttim>120 and ttim<150 and size<100) size=size+10; end;
if (ttim==20) graph=2; fade(100,100,100,5); end;
if (ttim==100) graph=2; fade(200,200,200,5); end;
if (ttim==120) graph=1; size=50; fade(200,200,200,5); end;
if (ttim==130) fade(100,100,100,5); end;
if (ttim==200) fade(0,0,0,5); end;
file=filet;
frame();
ttim=ttim+1;
until (ttim>220);
titles();
end;

process startlevel();
private ran;
begin
gameon=0;
firetime=0;
spikes=0;
ran=rand(1,2);
if (ran==1)
sound(music2,500,256);
end;

if (ran==2)
sound(music1,255,256);
end;


lever=1;
delete_text(all_text);
stop_song();
let_me_alone();
frame();
//settine();
//if (cplan==1)
//load("user\mbgame\lev4.dat", offset blocks);
//effect=4;
////frame();
//end;


//if (cplan==2)
//load("user\mbgame\lev2.dat", offset blocks);
//effect=1;
//end;

//if (cplan==3)
//load("user\mbgame\lev3.dat", offset blocks);
//effect=2;
//end;
//if (cplan==4)
//effect=3;
//load("user\mbgame\lev5.dat", offset blocks);
//frame();
//frame();
//end;
//song(0);

//if (cplan==5)
//load("user\mbgame\lev6.dat", offset blocks);
//effect=1;
//end;


fade(0,0,0,10);
frame(); frame(); frame();
frame(); frame(); frame();
frame(); frame(); frame();
frame(); frame(); frame();

mainloop2();
fade(100,100,100,2);

//song(0);
settime();
dmap();
if (style==1)
md7();
end;
cursor();
player();
//ball();
spaceship();
//balllight();
//ballreflect();
bat();
write_int(1,320,388,2,offset timmy);

//write_int(1,320,100,2,offset joyx2);
//write_int(1,320,200,2,offset joyy2);


set_fps(24,0);
fade(100,100,100,4);
//write_int(0,100,100,1,offset mx);
//song(0);
getready();
replaying();
frame();
//frame();
//getready();
pal();
end;

process titles();
private sze,frr=0,ang,tamy=0;flug=0,tima,tc=0,rp1,rp2;
begin
load_pal("user\mbgame\main.pal");
set_mode(m640x480);
stop_sound(all_sound);
//sound(28,255,280);
//sound(28,255,280);
sound(28,210,280);
sound(24,210,280);
sound(28,210,280);
sound(24,210,280);

frame();
sound(28,200,280);
//sound(28,200,280);
frame();
//sound(28,200,280);
sound(28,200,280);



sze=1500;
clear_screen();
fade(0,0,0,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(100,100,100,10);

frame(); frame(); frame(); frame();
//frame(); frame(); frame(); frame();

rp1=0;
tima=0;
tc=tc+1;
if (tc>60) tc=0; end;
rp2=640;
set_fps(24,0);
//planet();
put(filet,86,320,240);
fade(100,100,100,10);
file=filet;
graph=64;
x=320;
y=140;
size=800;
angle=180000;
loop

if (key(_t))
if (key(_i))
if (key(_m))
//if (key(_p))
levelcheat=1;
fade(200,200,200,10);
//end;
end;
end;
end;

if (key(_m))
if (key(_e))
if (key(_l))
//if (key(_p))
movecheat=1;
fade(200,200,200,10);
//end;
end;
end;
end;

if (key(_w))
if (key(_i))
if (key(_l))
//if (key(_p))
movecheat=1;
fade(200,200,200,10);
//end;
end;
end;
end;


tima=tima+1;
if (tima>20) tima=0; end;
tc=tc+1;
if (tc>300) tc=0; end;
if (tc==1) fade(100,97,97,1); end;
if (tc==50) fade(100,97,97,1); end;
if (tc==100) fade(100,100,97,1); end;
if (tc==150) fade(97,100,97,1); end;
if (tc==200) fade(97,97,100,1); end;
if (tc==250) fade(100,97,100,1); end;

rp1=rp1-2; if(rp1<-640) rp1=640; end;
put(filet,86,rp1,240);
put(filet,86,rp1+1280,240);

put(filet,86,rp1+640,240);
put(filet,86,rp1-640,240);

xput(filet,88+frr,320,240,ang,sze,4,0);

if (sze>300) sze=sze-100; end;
//ang=ang+200;

put(filet,85,320,140);
//put(filet,85,320-32,140+32);
xput(filet,85,320-32,140+32,100,100,4,0);
tamy=tamy+1;
if (tamy>2) tamy=0;
frr=frr+1;
end;
if (frr>20) frr=0; end;

flug=0;
if (tima>10) flug=4; end;

xput(filet,87,320,400,50,50,flug,0);


//put(filet,63,320,240);
angle=0;
size=100;
if (graph<84) graph=graph+1; end;

if (size>100)
size=size-20;
end;
if (angle>0)
angle=angle-5000;
end;
if (key(_space) or mouse.left)
stop_song();
fade(100,100,100,10);
put(filet,85,320-64,140+64);
frame();
planet();
//startlevel();
return;
end;
frame();
end;
end;



process plot3d2(x,y,graph,height,size);
begin
//size=220;
file=file3d;
//if (graph>12 or graph<18)
//size=100;
//end;

if (y<40) flags=4; end;

//graph=(640/14)/14;
ctype=c_m7;
//if (y>240) flags=4; end;

if (reflection==1)
reflect(file,graph,x,y,size);
end;


frame();
return;
end;


process plot3d(x,y,graph);
begin
size=220;
file=file3d;
if (graph>12 or graph<18)
size=100;
end;

if (graph==10)
size=60;
end;


if (y<40) flags=4; end;

//graph=(640/14)/14;
ctype=c_m7;
//if (y>240) flags=4; end;

if (reflection==1)
reflect(file,graph,x,y,size);
end;


frame();
return;
end;

process plot3dt(x,y,graph,flags,size);
begin
//size=220;
file=file3d;

if (y<40) flags=4; end;

//graph=(640/14)/14;
ctype=c_m7;
//if (y>240) flags=4; end;

if (reflection==1)
reflect(file,graph,x,y,size);
end;
frame();
return;
end;

process getready()
private xti;
begin
x=320;
xti=0;
file=filet;
y=180+180;
size=50;
graph=5;
repeat
xti=xti+1;
//x=x-32;
//angle=angle-5000;
//size=size-2;
//if (size<1);
//flags=4;
//end;
if (xti>30)
size=size-5;
end;
frame();
until (xti>50);
end;

process replaying()
private xti;
begin
x=64;
xti=0;
file=filet;
y=64;
z=-2500;
size=100;
graph=6;
loop
xti=xti+1;
if (xti>20) xti=0; end;
graph=0;
if (play==1 and xti>10) graph=6; end;
frame();
end;
end;

process reflect(file,graph,x,y,size);
begin
ctype=c_m7;
flags=6;
//shade=1;
//if (blocks[pos8-(700*8)+11]>bt and blocks[pos8-(700*8)+11]<tt);
//shade=0;
//end;
//if (reflection==1)
if (shadow==1 and graph>139 and graph<142) return; end;
//end;

frame();
return;
end;

process planet();
private cpr,adv=600,xpo,m3,ot,ttm,m2,a2,ip,m1,pf;
begin
//fffwefe
load("user\mbgame\savegame.dat", offset completed);
stop_sound(all_sound);
//mouse.x=mousex2;
fade(0,0,0,7);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
//frame(); frame(); frame(); frame();
fade(100,100,100,5);

let_me_alone();
clear_screen();
stop_song();
frame();
//song(2);
x=320;
m3=1;
m1=0;
ttm=5;
y=370;
ot=80;
size=100;
cpr=cplan;
a2=ab2;
loop;
xpo=mouse.x;
if (m3==1)
ot=ot-8;
if (ot<60) m3=2; end;
end;

if (m3==2)
ot=ot+8;
if (ot>100) m3=1; end;
end;


star();
if (ttm>0 ) ttm=ttm-1; end;

if (mouse.left or key(_space) and ttm<1 and completed[cplan]<5)
stop_sound(all_sound);
fade(0,0,0,10);
ab2=a2;
//mousex2=mouse.x;
frame(); frame(); frame();
frame(); frame(); frame();
frame(); frame(); frame();

startlevel();
return;
end;

if (cpr<>cplan)
stop_sound(all_sound);
if (cplan==1) sound(18,255,320); end;
if (cplan==2) sound(19,255,320); end;
if (cplan==3) sound(17,255,320); end;
if (cplan==4) sound(20,255,320); end;
if (cplan==5) sound(16,255,320); end;

if (cplan==1) sound(18,255,320); end;
if (cplan==2) sound(19,255,320); end;
if (cplan==3) sound(17,255,320); end;
if (cplan==4) sound(20,255,320); end;
if (cplan==5) sound(16,255,320); end;


cpr=cplan;
end;

if (levelcheat==1 and key(_a) and completed[cplan]<5) completed[cplan]=completed[cplan]+1; end;
if (completed[1]==5 and completed[2]==5 and completed[3]==5 and completed[4]==5 and completed[5]==5)
movieend();
end;


delete_text(all_text);
if (cplan==1)
//
//write(2,490,ot,2," EASY");

end;

if (cplan==2)
//write(2,410,ot,2," PARK");
//write(2,410,ot,2," EASY");

end;

//write_int(2,410,40,2,offset cplan);


if (cplan==3)
//write(2,440,ot,2," SNOW");
end;

if (cplan==4)
//write(2,470,ot,2,"SWEET");
end;

if (cplan==5)
//write(2,410,ot,2,"TOY");
end;


m2=m2+1; if (m2>3) pf=pf+1; m2=0; end;

if (pf>10) pf=1; end;
if (key(_right)) mouse.x=320; a2=a2+6000; end;
if (key(_left)) mouse.x=320; a2=a2-6000; end;

if (xpo<320) mouse.x=320; a2=a2+7000; end;
if (xpo>320) mouse.x=320; a2=a2-7000; end;


angle=a2;
for (ip=1; ip<6; ip++)
if (ip==1) graph=8+pf; end;
if (ip==2) graph=19+pf; end;
if (ip==3) graph=30+pf; end;
if (ip==4) graph=41+pf; end;
if (ip==5) graph=52+pf; end;

x=320;
y=240;
//if (adv>240) adv=adv-10; end;

advance(adv);
y=(240-y)+y/2;
dplan(ip,x,y,graph);
angle=angle+70000;
end;
graph=0;
if (adv>240) adv=adv-40; end;

file=filet;
graph=111+completed[cplan];
x=320;
y=100;
size=120;
angle=0;

frame();
end;
end;

process dplan(height,x,y,graph);
begin
file=filet;
z=-1500;
size=y-20;
y=y+100;
z=-y*20;
if (height<>cplan)
flags=4;
end;
frame();
if (size>200)
cplan=height;
end;
return;
end;

process star();
private rx,ry;
begin
z=200;
size=1;
rx=rand(-10,10);
ry=rand(-10,10);
graph=rand(21,24);
x=rand(300,340);
y=rand(220,260);
repeat
size=size+2;
angle=angle+3000;
x=x-rx;
y=y-ry;
file=file2;
frame();
until (x<0 or x>640 or y<0 or y>480 or size>100);
return;
end;

process levelcomplete();
begin

let_me_alone();
stop_mode7(0);
planet();
mx=12600;
my=2222;
man=0;
//blocks[680*250];
//undox[50];
//undoy[50];
//recordx[12000];
//recordy[12000];
//recordh[12000];
pos8=0;
dx=0;
dy=0;
recordpos=1;
ballrot=0;
undot=1;

return;
end;

process wiz(samp);
private m1,fr,samp;
begin
wos=1;
fr=0;
m1=1;
x=320;
y=160+150;
size=10;
file=file3d;
//angle=-90000;
loop;
graph=22+fr;
flags=0;
if (fr==4 and m1==1)
sound (samp,256,380);
end;
//angle=angle+4000;
if (m1==1) size=size+10; y=y+2; fr=fr+1; end;
if (m1==2) size=size-10; y=y-2; fr=fr-1; end;
if (fr>19) m1=2; end;
if (fr<0) wos=0; return; end;
if (fr<2) flags=4; end;
if (size>100) size=100; end;
frame();
end;
end;

process waz(samp);
private m1,fr,samp;
begin
wos=1;
fr=0;
m1=1;
x=320;
y=160+150;
size=30;
file=file3d;
//angle=-90000;
loop;
graph=98+fr;
flags=0;
if (fr==4 and m1==1)
sound (samp,256,395);
end;
//angle=angle+4000;
if (m1==1) size=size+10; y=y+2; fr=fr+1; end;
if (m1==2) size=size-10; y=y-2; fr=fr-1; end;
if (fr>9) m1=2; end;
if (fr<0) wos=0; return; end;
if (fr<2) flags=4; end;
if (size>100) size=100; end;
frame(125);
end;
end;

process glowr(x,y);
begin
frame();
map_xput(file1,1,204,x,y-14,0,120,4);
frame();
return;
end;

process settime();
begin

dx=0;
dy=0;
mx=12600;
my=2222;
full=0;
detail=2;
level=4;
//cplan=0;

if (play==1) firetime=3; end;



firetime=0;
spikes=0;
levers=0;
swingang=0;
swind=1;
lever=1;

full=0;
if (cplan==1) timmy=250; end;
if (cplan==2) timmy=220; end;
if (cplan==3) timmy=220; end;
if (cplan==4) timmy=220; end;
if (cplan==5) timmy=80; end;

if (cplan==1)
//load("user\mbgame\lev4.dat", offset blocks);

if (play==0)
if (completed[cplan]==0) load("user\mbgame\hot1.dat", offset blocks); timmy=70+diff; end;
if (completed[cplan]==1) load("user\mbgame\hot2.dat", offset blocks); timmy=110+diff; end;
if (completed[cplan]==2) load("user\mbgame\hot3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==3) load("user\mbgame\hot4.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==4) load("user\mbgame\hot5.dat", offset blocks); timmy=120+diff; end;
end;

if (play==1)
if (completed[cplan]==1) load("user\mbgame\hot1.dat", offset blocks); timmy=70+diff; end;
if (completed[cplan]==2) load("user\mbgame\hot2.dat", offset blocks); timmy=110+diff; end;
if (completed[cplan]==3) load("user\mbgame\hot3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==4) load("user\mbgame\hot4.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==5) load("user\mbgame\hot5.dat", offset blocks); timmy=120+diff; end;
end;


effect=4;
//frame();
end;

//settime();
/////////////////////////////////////////////////////////////////////////////
//////////////////////// DONE //////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

if (cplan==2)
if (play==0)
if (completed[cplan]==0) load("user\mbgame\park1.dat", offset blocks); timmy=70+diff; end;
if (completed[cplan]==1) load("user\mbgame\park2.dat", offset blocks); timmy=60+diff; end;
if (completed[cplan]==2) load("user\mbgame\park3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==3) load("user\mbgame\park4.dat", offset blocks); timmy=48+diff; end;
if (completed[cplan]==4) load("user\mbgame\park5.dat", offset blocks); timmy=140+diff; end;
end;

if (play==1)
if (completed[cplan]==1) load("user\mbgame\park1.dat", offset blocks); timmy=70+diff; end;
if (completed[cplan]==2) load("user\mbgame\park2.dat", offset blocks); timmy=60+diff; end;
if (completed[cplan]==3) load("user\mbgame\park3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==4) load("user\mbgame\park4.dat", offset blocks); timmy=48+diff; end;
if (completed[cplan]==5) load("user\mbgame\park5.dat", offset blocks); timmy=140+diff; end;
end;

effect=1;
end;

if (cplan==3)

if (play==0)
if (completed[cplan]==0) load("user\mbgame\snow1.dat", offset blocks); timmy=50+diff; end;
if (completed[cplan]==1) load("user\mbgame\snow2.dat", offset blocks); timmy=110+diff; end;
if (completed[cplan]==2) load("user\mbgame\snow3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==3) load("user\mbgame\snow4.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==4) load("user\mbgame\snow5.dat", offset blocks); timmy=170+diff; end;

end;

if (play==1)
if (completed[cplan]==1) load("user\mbgame\snow1.dat", offset blocks); timmy=50+diff; end;
if (completed[cplan]==2) load("user\mbgame\snow2.dat", offset blocks); timmy=110+diff; end;
if (completed[cplan]==3) load("user\mbgame\snow3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==4) load("user\mbgame\snow4.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==5) load("user\mbgame\snow5.dat", offset blocks); timmy=170+diff; end;
end;

//load("user\mbgame\lev3.dat", offset blocks);
effect=2;
end;

if (cplan==4)
effect=3;

if (play==0)
if (completed[cplan]==0) load("user\mbgame\choc1.dat", offset blocks); timmy=100+diff; end;
if (completed[cplan]==1) load("user\mbgame\choc2.dat", offset blocks); timmy=60+diff; end;
if (completed[cplan]==2) load("user\mbgame\choc3.dat", offset blocks); timmy=120+diff; end;
if (completed[cplan]==3) load("user\mbgame\choc4.dat", offset blocks); timmy=80+diff; end;
if (completed[cplan]==4) load("user\mbgame\choc5.dat", offset blocks); timmy=150+diff; end;
end;

if (play==1)
if (completed[cplan]==1) load("user\mbgame\choc1.dat", offset blocks); timmy=100+diff; end;
if (completed[cplan]==2) load("user\mbgame\choc2.dat", offset blocks); timmy=60+diff; end;
if (completed[cplan]==3) load("user\mbgame\choc3.dat", offset blocks); timmy=120+diff; end;
if (completed[cplan]==4) load("user\mbgame\choc4.dat", offset blocks); timmy=80+diff; end;
if (completed[cplan]==5) load("user\mbgame\choc5.dat", offset blocks); timmy=150+diff; end;
end;


//load("user\mbgame\lev5.dat", offset blocks);
//frame();
frame();
end;
//song(0);



if (cplan==5)

effect=0;

if (play==0)
if (completed[cplan]==0) load("user\mbgame\toy1.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==1) load("user\mbgame\toy2.dat", offset blocks); timmy=60+diff; end;
if (completed[cplan]==2) load("user\mbgame\toy3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==4) load("user\mbgame\toy4.dat", offset blocks); timmy=70+diff; end;
if (completed[cplan]==3) load("user\mbgame\toy5.dat", offset blocks); timmy=20+diff; end;
end;

if (play==1)
if (completed[cplan]==1) load("user\mbgame\toy1.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==2) load("user\mbgame\toy2.dat", offset blocks); timmy=60+diff; end;
if (completed[cplan]==3) load("user\mbgame\toy3.dat", offset blocks); timmy=90+diff; end;
if (completed[cplan]==5) load("user\mbgame\toy4.dat", offset blocks); timmy=70+diff; end;
if (completed[cplan]==4) load("user\mbgame\toy5.dat", offset blocks); timmy=20+diff; end;
end;


//load("user\mbgame\lev6.dat", offset blocks);
//effect=1;
end;

///////////////////////////////////////

//end;
firetime=0;
spikes=0;

if (play==1) firetime=3; end;


end;

process swing(x,y,angle);
private sha,xb1,yb1,k;yb,a2;
begin
if (x>300 and x<340)
if (y>212 and y<256)
if (swingang>70000 and swingang<120000)
dx=0;
dy=0;
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
wiz(rand(10,11));
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);
spark3(320,240,height);

//my=my-70;
timmy=timmy-10;
my=my-128;
frame();
//fade(200,200,200,10);

return;
end;
end;
end;

spikes=0;
firetime=0;
xb1=x;
yb1=y;
yb=y;
y=0;
plot3d2(x,yb1,12,400,30);
plot3d2(x,yb1,138,460,140);
plot3d2(x,yb1,138,540,140);
plot3d2(x,yb1,138,620,140);
plot3d2(x,yb1,138,700,140);
plot3d2(x,yb1,138,780,140);

sha=0;
for (k==1; k<8; k++);
advance(10);
if (k<7) plot3d2(x,yb1,12,(y*5)+400,30); end;
if (k==7) plot3d2(x,yb1+2,12,(y*5)+400,80); end;
end;
frame();

if (swingang>10000 and swingang<180000) sha=20; end;


if (swingang>30000 and swingang<160000) sha=40; end;


if (swingang>50000 and swingang<140000) sha=60; end;


if (swingang>70000 and swingang<120000) sha=80; end;


map_xput(file1,1,206,x,yb1-16,0,sha,4);

end;

process movie();
private fram;
begin
recordpos=0;
play=0;
stop_sound(all_sound);
frame();
frame();
set_fps(30,0):
set_mode(m320x240);
frame();
fram=0;
start_fli("user\mbgame\introm.flc", 0, 0);
frame();
frame();
frame();
frame();
frame();
sound(15,142,260);
sound(15,142,260);
sound(15,142,260);
sound(15,142,260);


repeat
frame_fli();
frame();
if (mouse.left or key(_space)) fram=2000; end;
fram=fram+1;
until (fram>800);
titles();

end;



process spaceship();
begin
y=0;
x=320;
height=200;
size=250;
ctype=c_m7;
file=file3d;
repeat
graph=162+z;
z=z+1;
if (y>230 and y<250)
ball();
gameon=1;
//spaceship();
balllight();
ballreflect();
end;


if (y<240) height=height-20; end;
if (y>240) height=height-20; end;
if (z>9) z=0; end;
frame();
y=y+16;
until (y>580);
end;

process gameover();
begin

dx=0;
dy=0;
mx=12600;
my=2222;
full=0;
detail=2;
level=4;
cplan=0;
effect=3;
delete_text(all_text);
stop_sound(all_sound);
let_me_alone();
//movie();
//let_me_alone();
movie2();
end;

process movie2();
private fram;
begin
stop_mode7(0);
clear_screen();
let_me_alone();
frame();
clear_screen();
frame();
//fade(0,0,0,10);
recordpos=0;
stop_sound(all_sound);
sound(25,255,275);
frame();
frame();

file=filet;
x=320;
y=240;
graph=118;

sound(21,255,260);
fade(200,200,200,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(100,100,100,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(0,0,0,10);
frame(); frame(); frame(); frame();


file=filet;
x=320;
y=240;
graph=119;

sound(21,255,262);

fade(200,200,200,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(100,100,100,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(0,0,0,10);
frame(); frame(); frame(); frame();


file=filet;
x=320;
y=240;
graph=120;

sound(21,255,260);

fade(200,200,200,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(100,100,100,10);
frame(); frame(); frame(); frame();
frame(); frame(); frame(); frame();
fade(0,0,0,10);
frame(); frame(); frame(); frame();


graph=0;

set_fps(20,0):
set_mode(m320x240);
fade(0,0,0,10);
frame(); frame();

rain3(); rain3(); rain3();
rain3(); rain3(); rain3();
rain3(); rain3(); rain3();
rain3(); rain3(); rain3();


fram=0;
start_fli("user\mbgame\grave6.flc", 0, 0);
fade_on();
frame();
frame();
frame();
frame();
frame();
fade(100,100,100,4);
sound(22,160,260);
sound(23,255,260);


//sound(15,256,260);
repeat
rain2(); rain2(); rain2();
rain2(); rain2(); rain2();
rain2(); rain2(); rain2();
rain2(); rain2(); rain2();

if (fram==30 or fram==230 or fram==430 or fram==670) fade(170,140,160,10); end;
if (fram==39 or fram==239 or fram==439 or fram==679) sound(24,255,270); fade(100,100,100,10); end;

if (fram<99) frame_fli(); end;

frame();
if (mouse.left or key(_space)) fram=2000; end;
fram=fram+1;
if (fram>928)
fade(0,0,0,1);
end;
until (fram>970);
let_me_alone();
stop_sound(all_sound);
movie();

end;

process rain2();
begin
size=rand(50,100);
file=filet;
graph=117;
x=rand(0,320);
y=rand(-100,0);
repeat
flags=4;
y=y+16;
frame();
until (y>260);

end;

process rain3();
begin
size=rand(50,100);
file=filet;
graph=117;
x=rand(0,320);
y=rand(0,240);
repeat
flags=4;
y=y+16;
frame();
until (y>260);

end;


process pong(y);
private tens;
begin
file=file1;
graph=0;
//graph=267;
//y=340;
x=320;
repeat
//if (rand(0,4)<4)
if (x<ballx) x=x+8; end;
if (x>ballx) x=x-8; end;
//end;

map_xput(file1,1,267,x,y-8,0,100,4);
frame();
until (cplan<0);
end;

process pongball();
private spx,spy,dbx,dby;
begin
dbx=0;
dby=0;
file=file1;
graph=0;
//graph=267;
y=240;
x=320;
repeat
if (dbx==0) ballx=ballx-spx; end;
if (dbx==1) ballx=ballx+spx; end;
if (dby==0) bally=bally-spy; end;
if (dby==1) bally=bally+spy; end;

if (bally<32) dby=1; spy=rand(4,8);spx=rand(4,8); end;
if (bally>320) dby=0; spy=rand(4,8);spx=rand(4,8); end;
if (ballx>600) dbx=0; spx=rand(4,8); end;
if (ballx<40) dbx=1; spx=rand(4,8); end;



map_xput(file1,1,268,ballx,bally,0,100,4);
frame();
until (cplan<0);
end;




process movieend();
private fram;
begin
let_me_alone();
recordpos=0;
play=0;
stop_sound(all_sound);
frame();
frame();
set_fps(18,0):
set_mode(m320x240);
frame();
fram=0;
start_fli("user\mbgame\explode5.flc", 0, 0);
frame();
frame();
frame();
frame();
frame();
sound(28,142,260);
sound(28,142,260);
sound(28,142,260);
sound(28,142,260);


repeat
frame_fli();
frame();
if (mouse.left or key(_space)) fram=2000; end;
fram=fram+1;
until (fram>92);
//titles();

completed[1]=0;
completed[2]=0;
completed[3]=0;
completed[4]=0;
completed[5]=0;
save("user\mbgame\savegame.dat", offset completed, sizeof(completed));
//movie();
credits();
end;

process credits();
private ctime=0;
begin
load_pal("user\mbgame\main.pal");
clear_screen();
set_mode(m640x480);
x=320;
y=240;
file=file1;
flags=4;
frame();
graph=271;
size=180;
repeat
angle=angle+2000;
if (ctime==1)
delete_text(all_text);
write(2,300,160,1,"CREATED BY");
write(2,300,240,1,"Jeremy Wood");
fade(100,100,100,6);
end;

if (ctime==50)
delete_text(all_text);
write(2,300,160,1,"  MUSIC");
write(2,300,240,1," TIM Wood");
fade(100,100,100,6);
graph=272;
end;

if (ctime==100)
delete_text(all_text);
write(2,300,160,1," SUPPORT");
write(2,300,240,1,"   WIL  ");
fade(100,100,100,6);
graph=270;
end;

if (ctime==150)
delete_text(all_text);
write(2,300,160,1,"THANKS TO");
write(2,300,240,1,"   MIKE  ");
fade(100,100,100,6);
graph=272;
end;

if (ctime==200)
delete_text(all_text);
write(2,300,160,1,"THANKS TO");
write(2,300,240,1," WILLIAM");
fade(100,100,100,6);
graph=271;
end;

if (ctime==150)
delete_text(all_text);
write(2,300,160,1,"THANKS TO");
write(2,300,240,1,"JON + MIKE");
fade(100,100,100,6);
graph=54;
end;

if (ctime==250)
delete_text(all_text);
write(2,300,40,1,"THANKS TO");
write(2,300,140,1,"DIV CHAT!");
write(2,300,240,1,"AND");
write(2,300,340,1," FASTTRAK");

fade(100,100,100,6);
graph=290;
end;

if (ctime==300)
graph=269;
delete_text(all_text);
write(2,300,120,1,"THANKS TO");
write(2,300,200,1,"EVERYONE ");
write(2,300,280,1,"WHO HELPED");
size=1500;
fade(100,100,100,6);
end;

if (ctime==350)
size=0;
delete_text(all_text);
write(2,300,160,1," TO BE ");
write(2,300,240,1,"CONTINUED....");
graph=24;
fade(100,100,100,6);
end;


if (ctime==390 or ctime==40 or ctime==90 or ctime==140 or  ctime==190 or ctime==240 or ctime==290 or ctime==340)
fade(0,0,0,6);
end;

frame();
ctime=ctime+1;
until(ctime>400);
delete_text(all_text);
movie();
end;
