
//-----------------------------------------------------------------------------------------------
//
//  TITLE       Robo Marines 2
//  AUTHOR      Owen Davies
//  COPYRITE    owen games (c) 2002
//
//-----------------------------------------------------------------------------------------------

PROGRAM robo_marines_2;

GLOBAL
    screen=1;
    new_screen=0;

    effects_volume;
    music_volume;

    main_font;
    title_font;

    loading_map;

    main_file;
    player_file;
    scenery_file;
    enemy_file;
    stuff_file;

    s_thunder;
    s_rain;
    s_shotgun;
    s_bullet;
    s_lasser;
    s_scream;

    id1;

    id2;
    id3;
    id4;
    id5;
    id6;
    id7;
    id8;
    id9;
    id10;
    id11;
    id12;

    id13;
    id14;
    id15;
    id16;
    id17;
    id18;
    id19;

    id2_health;
    id3_health;
    id4_health;
    id5_health;
    id6_health;
    id7_health;
    id8_health;
    id9_health;
    id10_health;
    id11_health;
    id12_health;

    id13_health;
    id14_health;
    id15_health;
    id16_health;
    id17_health;
    id18_health;
    id19_health;

    info_text1;
    info_text2;

    password;

    player_save[]=0,FALSE,0,0,0,0,0,FALSE,0,0,0;

    channel1;
    channel2;
    channel3;
    channel4;
    channel5;
    channel6;

//-----------------------------------------------------------------------------------------------

BEGIN
    set_mode(m800x600);
    set_fps(30,0);

    password="AFAOIAGIOA";

    decode_file("map\rm2\loading.map",password);

    main_font=load_fnt("fnt\rm2\main.fnt");
    loading_map=load_map("map\rm2\loading.map");
    load_pal("pal\div2.pal");

    effects_volume=256;
    music_volume=256;

    mouse.file=main_file;
    mouse.graph=1;
    rain();
    LOOP
        SWITCH (screen);
        CASE 1: loading(); END
        CASE 10: owen_games(); END
        CASE 20: title(); END
        CASE 21: options(); END
        CASE 22: controls(); END
        CASE 80: game_over(); END
        CASE 85: levle_complete(); END
        CASE 90: credits(); END
        CASE 91: exit("OWEN GAMES (c) 2002",0); END
        CASE 101: levle1(); END
        CASE 102: levle2(); END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS loading();

BEGIN
    screen=0;
    new_screen=0;

    graph=loading_map;
    x=400;
    y=300;

    write(main_font,400,300,4,"LOADING...");

    fade_on();
    WHILE (fading)
        FRAME;
    END

    main_file=load_fpg("fpg\rm2\main.fpg");
    stuff_file=load_fpg("fpg\rm2\stuff.fpg");
    scenery_file=load_fpg("fpg\rm2\scenery.fpg");
    enemy_file=load_fpg("fpg\rm2\enemy.fpg");
    player_file=load_fpg("fpg\rm2\player.fpg");

    title_font=load_fnt("fnt\rm2\title.fnt");

    s_thunder=load_pcm("pcm\rm2\thunder.pcm",0);
    s_rain=load_pcm("pcm\rm2\rain.pcm",1);
    s_shotgun=load_pcm("pcm\rm2\shotgun.pcm",0);
    s_bullet=load_pcm("pcm\rm2\bullet.pcm",0);
    s_lasser=load_pcm("pcm\rm2\lasser.pcm",0);
    s_scream=load_pcm("pcm\rm2\scream.pcm",0);

    load_wld("wld\rm2\levle.wld",scenery_file);

    fade_off();
    WHILE (fading)
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=10;
END

//-----------------------------------------------------------------------------------------------

PROCESS pause();

PRIVATE
    text_pause;

BEGIN
    LOOP
    WHILE (NOT key(_f1));
        FRAME;
    END
    text_pause=write(main_font,400,300,4,"PAUSED");
    mouse.graph=0;
    WHILE (key(_f1));
        FRAME;
    END
    FRAME;
    REPEAT
        UNTIL (key(_f1));
        delete_text(text_pause);
        mouse.graph=1;
        WHILE (key(_f1));
        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS rain();

PRIVATE;
    thunder;
    thunder_timer;
BEGIN
    channel1=sound(s_rain,effects_volume,256);
    thunder=FALSE;
    thunder_timer=0;
    file=main_file;
    graph=10;
    x=400;
    y=300;
    z=-510;
    fade(90,90,90,64);
    LOOP
    IF(graph=>17) graph=10; END
    graph+=1;
    IF(rand(1,30)==1) fade(150,150,150,64); channel2=sound(s_thunder,effects_volume,256); thunder=TRUE; END
    IF(thunder==TRUE) thunder_timer+=1; END
    IF(thunder_timer>4) fade(90,90,90,64); thunder_timer=0; thunder=FALSE; END
    FRAME(150);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS owen_games();

BEGIN
    screen=0;
    new_screen=0;
    graph=loading_map;
    x=400;
    y=300;
    write(main_font,400,300,4,"OWEN GAMES (c) 2002 PRESENTS");
        WHILE(new_screen==0);
        IF(mouse.left) WHILE(mouse.left==TRUE) FRAME; END new_screen=20; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS title();

BEGIN
    screen=0;
    new_screen=0;
    file=main_file;
    graph=2;
    x=400;
    y=300;
    write(title_font,400,300,4,"ROBO MARINES 2");
        WHILE(new_screen==0);
        IF(mouse.left) WHILE(mouse.left==TRUE) FRAME; END new_screen=21; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS options();

BEGIN
    screen=0;
    new_screen=0;
    file=main_file;
    graph=2;
    x=400;
    y=300;
    write(title_font,400,50,4,"ROBO MARINES 2");
    write(main_font,400,225,4,"NEW GAME");
    write(main_font,400,275,4,"LOAD GAME");
    write(main_font,400,325,4,"CONTROLS");
    write(main_font,400,375,4,"EXIT");
    write(main_font,400,550,4,"OWEN GAMES (c) 2002");
        WHILE(new_screen==0);
        IF(mouse.left AND mouse.y>200 AND mouse.y<250) WHILE(mouse.left==TRUE) FRAME; END new_screen=101; END
        IF(mouse.left AND mouse.y>250 AND mouse.y<300) WHILE(mouse.left==TRUE) FRAME; END load("dat\rm2\data.dat",offset player_save);
            IF(player_save[2]==1) new_screen=102; END
        END
        IF(mouse.left AND mouse.y>300 AND mouse.y<350) WHILE(mouse.left==TRUE) FRAME; END new_screen=22; END
        IF(mouse.left AND mouse.y>350 AND mouse.y<400) WHILE(mouse.left==TRUE) FRAME; END new_screen=90; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS controls();

BEGIN
    screen=0;
    new_screen=0;
    graph=loading_map;
    x=400;
    y=300;
    write(title_font,400,50,4,"CONTROLS");

    write(main_font,200,200,3,"FORWARD");           write(main_font,500,200,3,"UP OR W");
    write(main_font,200,225,3,"BACKWARDS");         write(main_font,500,225,3,"DOWN OR S");
    write(main_font,200,250,3,"SIDE STEP LEFT");    write(main_font,500,250,3,"LEFT OR A");
    write(main_font,200,275,3,"SIDE STEP RIGHT");   write(main_font,500,275,3,"RIGHT OR D");

    write(main_font,200,325,3,"SHOOT");             write(main_font,500,325,3,"MOUSE LEFT");
    write(main_font,200,350,3,"AIM");               write(main_font,500,350,3,"MOUSE");

    write(main_font,200,400,3,"PAUSE");             write(main_font,500,400,3,"F1");
    write(main_font,200,425,3,"QUIT");              write(main_font,500,425,3,"ESC");

    write(main_font,400,550,4,"OWEN GAMES (c) 2002");
        WHILE(new_screen==0);
        IF(mouse.left) WHILE(mouse.left==TRUE) FRAME; END new_screen=21; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS game_over();

BEGIN
    screen=0;
    new_screen=0;
    graph=loading_map;
    x=400;
    y=300;
    write(main_font,400,300,4,"GAME OVER");
        WHILE (new_screen==0);
        IF(mouse.left) WHILE(mouse.left==TRUE) FRAME; END new_screen=10; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS levle_complete();

BEGIN
    screen=0;
    new_screen=0;

    graph=loading_map;
    x=400;
    y=300;


    write(main_font,400,250,4,"NUMBER OF ENEMY KILLED");
    write_int(main_font,380,275,5,& player_save[3]);
    write(main_font,400,275,4,"/");
    write_int(main_font,420,275,3,& player_save[4]);

    IF(player_save[3]>7)
            player_save[5]+=player_save[3];
            player_save[6]+=player_save[4];
            write(main_font,400,350,4,"TOTAL NUMBER OF ENEMY KILLED");
            write_int(main_font,380,375,5,& player_save[5]);
            write(main_font,400,375,4,"/");
            write_int(main_font,420,375,3,& player_save[6]);
        IF(player_save[2]==1)
            write(title_font,400,50,4,"LEVEL");
            write(title_font,400,140,4,"COMPLETET");
            write(main_font,200,500,4,"DON'T SAVE");
            write(main_font,600,500,4,"SAVE");
        END
        IF(player_save[2]==2 AND player_save[7]==FALSE)
            write(title_font,400,50,4,"GAME");
            write(title_font,400,140,4,"COMPLETE");
            write(main_font,400,500,4,"CREATED BY OWEN DAVIES");
        END
        IF(player_save[2]==2 AND player_save[7]==TRUE)
            write(title_font,400,50,4,"CHEATER");
            write(main_font,400,500,4,"NOW TRY WITHOUT CHEATS");
        END
    END

    IF(player_save[3]<6)
        write(main_font,400,500,4,"DID NOT KILL ENOUGH ROBOTS");
        write(title_font,400,50,4,"LEVEL NOT");
        write(title_font,400,140,4,"COMPLETET");
    END

        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=10; END

        IF((player_save[2]==1 AND player_save[3]>7) OR (player_save[2]==2 AND player_save[3]>12))
            IF(mouse.left AND mouse.x<320 AND mouse.y>380)
                IF(player_save[2]==1) new_screen=102; END
                IF(player_save[2]==2 AND player_save[7]==FALSE)
                    player_save[2]=0;
                    save("dat\rm2\data.dat",offset player_save,sizeof(player_save));
                    new_screen=10;
                END
                IF(player_save[2]==2 AND player_save[7]==TRUE)
                    player_save[2]=0;
                    save("dat\rm2\data.dat",offset player_save,sizeof(player_save));
                    new_screen=101;
                END
            END

            IF(mouse.left AND mouse.x>320 AND mouse.y>380)
                IF(player_save[2]==2 AND player_save[7]==FALSE)
                    player_save[2]=0;
                    save("dat\rm2\data.dat",offset player_save,sizeof(player_save));
                    new_screen=10;
                END
                IF(player_save[2]==2 AND player_save[7]==TRUE)
                    player_save[2]=0;
                    save("dat\rm2\data.dat",offset player_save,sizeof(player_save));
                    new_screen=101;
                END
                save("dat\rm2\data.dat",offset player_save,sizeof(player_save));
                IF(player_save[2]==1) new_screen=102; END
            END
        END

        IF((player_save[2]==1 AND player_save[3]<=7) OR (player_save[2]==2 AND player_save[3]<=12))
            IF(mouse.left AND mouse.y>380)
                IF(player_save[2]==1) new_screen=101; END
                IF(player_save[2]==2) new_screen=102; END
            END
        END

        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS credits();

BEGIN
    screen=0;
    new_screen=0;
    graph=loading_map;
    x=400;
    y=300;
    write(title_font,400,50,4,"ROBO MARINES 2");

    write(main_font,400,250,4,"CREATED BY");
    write(main_font,400,275,4,"OWEN DAVIES");

    write(main_font,400,325,4,"SHAREWARE VERSION");

    write(main_font,400,550,4,"OWEN GAMES (c) 2002");
        WHILE(new_screen==0);
        IF(mouse.left) WHILE(mouse.left==TRUE) FRAME; END new_screen=91; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;

END

//-----------------------------------------------------------------------------------------------

PROCESS levle1();

BEGIN
    screen=0;
    new_screen=0;

    set_fog(0,1000);
    set_env_color(0,0,0);

    player_save[7]=FALSE;
    player_save[2]=1;
    player_save[3]=0;
    player_save[4]=11;
    player_save[5]=0;
    player_save[6]=0;
    player_save[8]=0;
    player_save[9]=0;
    player_save[10]=0;
    player_save[0]=100;
    player_save[1]=FALSE;

    id1=player();
    player_weapon();
    player_bar();
    pause();

    lava(13,101);
    lava(14,101);
    lava(15,101);
    lava(16,101);

    id2_health=1;
    id3_health=1;
    id4_health=1;
    id5_health=1;
    id6_health=1;
    id7_health=1;
    id8_health=1;
    id9_health=1;
    id10_health=1;
    id11_health=1;
    id12_health=1;
    id2=enemy1(2,4000,3700);
    id3=enemy1(3,6000,4400);
    id4=enemy1(4,6000,3300);
    id5=enemy1(5,8700,2600);
    id6=enemy1(6,8700,5000);
    id7=enemy1(7,11800,3300);
    id8=enemy1(8,13000,4000);
    id9=enemy1(9,12800,4900);
    id10=enemy1(10,18000,2700);
    id11=enemy1(11,18000,3500);
    id12=enemy1(12,16000,4600);

    info_text1=1;
    info_text2=1;

        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=10; END
        IF(player_save[1]==TRUE) new_screen=80; END
        IF(player_save[3]>7) info_text1=3; info_text2=2; END
        IF(id1.x>19140) new_screen=85; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    stop_mode8(0);

    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(id3,s_kill);
    signal(id4,s_kill);
    signal(id5,s_kill);
    signal(id6,s_kill);
    signal(id7,s_kill);
    signal(id8,s_kill);
    signal(id9,s_kill);
    signal(id10,s_kill);
    signal(id11,s_kill);
    signal(id12,s_kill);

    signal(TYPE player,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE bullets,s_kill);
    signal(TYPE enemy1,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE enemy_body,s_kill);
    signal(TYPE lava,s_kill);
    signal(TYPE lasser,s_kill);
    signal(TYPE pause,s_kill);

    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------

PROCESS levle2();

BEGIN
    screen=0;
    new_screen=0;

    set_fog(0,1000);
    set_env_color(0,0,0);

    player_save[7]=FALSE;
    player_save[2]=2;
    player_save[3]=0;
    player_save[4]=11;
    player_save[5]=0;
    player_save[6]=0;
    player_save[8]=0;
    player_save[9]=0;
    player_save[10]=0;
    player_save[1]=FALSE;

    player_save[0]+=30;
    IF(player_save[0]>100) player_save[2]=100; END

    player_save[8]+=20;

    id1=player();
    player_weapon();
    player_bar();
    pause();

    lava(33,101);
    lava(40,101);
    lava(41,101);
    lava(42,101);

    id2_health=2;
    id3_health=2;
    id4_health=1;
    id5_health=1;
    id6_health=1;
    id7_health=1;
    id8_health=1;
    id9_health=1;
    id10_health=1;
    id11_health=1;
    id12_health=1;
    id13_health=2;
    id14_health=1;
    id15_health=1;
    id16_health=1;
    id17_health=1;
    id18_health=2;
    id19_health=1;
    id2=enemy2(2,4400,9232);
    id3=enemy2(3,4416,9584);
    id4=enemy1(4,4784,9280);
    id5=enemy1(5,4864,9584);
    id6=enemy1(6,18480,9200);
    id7=enemy1(7,18512,9616);
    id8=enemy1(8,18544,10176);
    id9=enemy1(9,14624,8080);
    id10=enemy1(10,14688,8576);
    id11=enemy1(11,7536,9456);
    id12=enemy1(12,7008,10208);
    id13=enemy2(13,17040,9456);
    id14=enemy1(14,14384,10768);
    id15=enemy1(15,14592,11360);
    id16=enemy1(16,10176,8432);
    id17=enemy1(17,10096,7808);
    id18=enemy2(18,10096,10672);
    id19=enemy1(19,11056,10320);

    info_text1=4;
    info_text2=3;

        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=10; END
        IF(player_save[1]==TRUE) new_screen=80; END
        IF(player_save[3]>12) info_text1=5; END
        IF(id1.x>19408) new_screen=85; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    stop_mode8(0);

    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(id3,s_kill);
    signal(id4,s_kill);
    signal(id5,s_kill);
    signal(id6,s_kill);
    signal(id7,s_kill);
    signal(id8,s_kill);
    signal(id9,s_kill);
    signal(id10,s_kill);
    signal(id11,s_kill);
    signal(id12,s_kill);

    signal(id13,s_kill);
    signal(id14,s_kill);
    signal(id15,s_kill);
    signal(id16,s_kill);
    signal(id17,s_kill);
    signal(id18,s_kill);
    signal(id19,s_kill);

    signal(TYPE player,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE bullets,s_kill);
    signal(TYPE enemy1,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE enemy_body,s_kill);
    signal(TYPE lava,s_kill);
    signal(TYPE lasser,s_kill);
    signal(TYPE pause,s_kill);

    screen=new_screen;
END

//-----------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------

PROCESS player()

PRIVATE;
    laver_heart;
    red;

BEGIN
    start_mode8(id,0,0);

    ctype=c_m8;
    radius=150;
    z=1200;
    m8_step=1;

    IF(player_save[2]==1) go_to_flag(1); END
    IF(player_save[2]==2) go_to_flag(2); END

    laver_heart=0;
    red=FALSE;
        WHILE(player_save[0]>0);
        z=1200;
        laver_heart+=1;

        IF(laver_heart>20 AND (m8_sector==13 OR m8_sector==14 OR m8_sector==15 OR m8_sector==16 OR m8_sector==33 OR m8_sector==40 OR m8_sector==41 OR m8_sector==42)) red=TRUE; info_text1=2; laver_heart=0; fade(150,95,95,64); player_save[0]-=1; channel3=sound(s_scream,effects_volume,256); END
        IF((m8_sector<13 OR (m8_sector>16 AND m8_sector<33) OR (m8_sector>33 AND m8_sector<40) OR m8_sector>43) AND red==TRUE) red=FALSE; fade(95,95,95,64); END

        IF(key(_up) OR key(_w)) x+=20; END
        IF(key(_down) OR key(_s)) x-=15; END
        IF(key(_left) OR key(_a)) y-=15; END
        IF(key(_right) OR key(_d)) y+=15; END

//        IF(key(_up)) x+=30; END
//        IF(key(_down)) x-=20; END
//        IF(key(_left)) y-=20; END
//        IF(key(_right)) y+=20; END


        FRAME;
    END
    player_save[1]=TRUE;
END

//-----------------------------------------------------------------------------------------------

PROCESS player_weapon()

PRIVATE;

    gun_timer;
    gun_selected;
    gun_animation_type;
    firing_angle;
    gun_graph;

BEGIN
    mouse.x=400;
    mouse.y=300;
    file=player_file;
    x=390;
    y=295;
    z=-255;
    gun_timer=0;
    gun_selected=1;
    gun_animation_type=1;
    gun_graph=1;
       WHILE(player_save[0]>0);
            gun_timer+=1;

            mouse.y=300;
            IF(mouse.x<300) mouse.x=300; END
            IF(mouse.x>500) mouse.x=500; END

            IF(mouse.x<400) firing_angle=fget_dist(mouse.x,mouse.y,400,300)*100; END
            IF(mouse.x=>400) firing_angle=-fget_dist(mouse.x,mouse.y,400,300)*100; END

            IF(gun_selected==1) x=500; y=375; END
            IF(gun_selected==2) x=560; y=460; END
            IF(gun_selected==3) x=320; y=375; END
            IF(gun_selected==4) x=450; y=300; END

            IF(player_save[8]==0 AND player_save[9]==0 AND player_save[10]==0) gun_selected=1; END
            IF(player_save[8]>0 AND player_save[9]==0 AND player_save[10]==0) gun_selected=2; END
            IF(player_save[9]>0 AND player_save[10]==0) gun_selected=3; END
            IF(player_save[10]>0) gun_selected=4; END

            IF(gun_selected==1 AND (mouse.left) AND gun_timer>55) channel4=sound(s_shotgun,effects_volume,256); gun_animation_type=2;
            bullets(firing_angle); gun_timer=0;
            END

            IF(gun_selected==2 AND (mouse.left) AND gun_timer>8) player_save[8]-=1; channel5=sound(s_bullet,effects_volume+100,256); gun_timer=0; gun_animation_type=4;
            bullets(firing_angle);
            END

            IF(gun_selected==1 AND (gun_animation_type<1 OR gun_animation_type>2)) gun_animation_type=1; END
            IF(gun_selected==1 AND gun_animation_type==1) gun_graph=1; END
            IF(gun_selected==1 AND gun_animation_type==2 AND gun_graph<41) gun_graph+=1; END
            IF(gun_selected==1 AND gun_animation_type==2 AND gun_graph=>41) gun_animation_type=1; gun_graph=1; END

            IF(gun_selected==2 AND (gun_animation_type<3 OR gun_animation_type>4)) gun_animation_type=3; END
            IF(gun_selected==2 AND gun_animation_type==3) gun_graph=101; END
            IF(gun_selected==2 AND gun_animation_type==4 AND gun_graph<108) gun_graph+=1; END
            IF(gun_selected==2 AND gun_animation_type==4 AND gun_graph=>108) gun_animation_type=1; gun_graph=101; END

            SWITCH(gun_graph);
                CASE 1: graph=10; END
                CASE 2: graph=11; END
                CASE 3: graph=12; END
                CASE 4: graph=13; END
                CASE 5: graph=14; END
                CASE 6: graph=15; END
                CASE 7: graph=16; END
                CASE 8: graph=17; END
                CASE 9: graph=18; END
                CASE 10: graph=19; END
                CASE 11: graph=20; END
                CASE 12: graph=19; END
                CASE 13: graph=18; END
                CASE 14: graph=16; END
                CASE 15: graph=15; END
                CASE 16: graph=14; END
                CASE 17: graph=13; END
                CASE 18: graph=12; END
                CASE 19: graph=11; END
                CASE 20: graph=10; END
                CASE 21: graph=21; END
                CASE 22: graph=22; END
                CASE 23: graph=23; END
                CASE 24: graph=24; END
                CASE 25: graph=25; END
                CASE 26: graph=26; END
                CASE 27: graph=27; END
                CASE 28: graph=28; END
                CASE 29: graph=29; END
                CASE 30: graph=30; END
                CASE 31: graph=31; END
                CASE 32: graph=30; END
                CASE 33: graph=29; END
                CASE 34: graph=28; END
                CASE 35: graph=27; END
                CASE 36: graph=26; END
                CASE 37: graph=25; END
                CASE 38: graph=24; END
                CASE 39: graph=23; END
                CASE 40: graph=22; END
                CASE 41: graph=21; END
                CASE 101: graph=40; END
                CASE 102: graph=41; END
                CASE 103: graph=42; END
                CASE 104: graph=43; END
                CASE 105: graph=44; END
                CASE 106: graph=45; END
                CASE 107: graph=46; END
                CASE 108: graph=47; END
            END
        FRAME(65);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_bar();

PRIVATE;
    bar_text_1;
    bar_text_1_type;
    bar_text_1_current;
    bar_text_2;
    bar_text_2_current;
    bar_text_3;
    bar_text_3_current;

BEGIN
    file=main_file;
    graph=4;
    x=367;
    y=40;
    write_int(main_font,85,40,3,& player_save[0]);
    bar_text_1_type=1;
    bar_text_1_current=1;
    bar_text_1=write(main_font,720,40,3,"1");
    bar_text_2_current=0;
    bar_text_2=write(main_font,400,25,4,"");
    bar_text_3_current=0;
    bar_text_3=write(main_font,400,55,4,"");
        LOOP
        IF(player_save[8]==0 AND player_save[9]==0 AND player_save[10]==0) bar_text_1_type=1; END
        IF(player_save[8]>0 AND player_save[9]==0 AND player_save[10]==0) bar_text_1_type=2; END
        IF(player_save[9]>0 AND player_save[10]==0) bar_text_1_type=3; END
        IF(player_save[10]>0) bar_text_1_type=4; END
        IF(bar_text_1_current<>bar_text_1_type); delete_text(bar_text_1);
            IF(bar_text_1_type==1) bar_text_1_current=1; bar_text_1=write(main_font,720,40,3,"1"); END
            IF(bar_text_1_type==2) bar_text_1_current=2; bar_text_1=write_int(main_font,720,40,3,& player_save[8]); END
            IF(bar_text_1_type==3) bar_text_1_current=3; bar_text_1=write_int(main_font,720,40,3,& player_save[9]); END
            IF(bar_text_1_type==4) bar_text_1_current=4; bar_text_1=write_int(main_font,720,40,3,& player_save[10]); END
        END
        IF(bar_text_2_current<>info_text1); delete_text(bar_text_2);
            IF(info_text1==1) bar_text_2_current=1; bar_text_2=write(main_font,400,25,4,"LEVLE 1"); END
            IF(info_text1==2) bar_text_2_current=2; bar_text_2=write(main_font,400,25,4,"GET OUT OF THE LAVA!"); END
            IF(info_text1==3) bar_text_2_current=3; bar_text_2=write(main_font,400,25,4,"GET TO THE BUNKER"); END
            IF(info_text1==4) bar_text_2_current=4; bar_text_2=write(main_font,400,25,4,"LEVLE 2"); END
            IF(info_text1==5) bar_text_2_current=5; bar_text_2=write(main_font,400,25,4,"GET TO THE CAVES"); END
        END
        IF(bar_text_3_current<>info_text2); delete_text(bar_text_3);
            IF(info_text2==1) bar_text_3_current=1; bar_text_3=write(main_font,400,55,4,"DEAL WITH THE ROBOT PROBLEM"); END
            IF(info_text2==2) bar_text_3_current=2; bar_text_3=write(main_font,400,55,4,"DESTROY AS MANY ROBOTS AS POSSIBLE"); END
            IF(info_text2==3) bar_text_3_current=3; bar_text_3=write(main_font,400,55,4,"DESTROY LOTS OF ROBOTS"); END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS bullets(angle)

PRIVATE
    distance_travled;
    bullets_collision;

BEGIN
    file=stuff_file;
    graph=1;
    x=id1.x;
    y=id1.y;
    ctype=c_m8;
    radius=200;
    z=1150;
    distance_travled=0;
    m8_step=1;
    bullets_collision=FALSE;
        WHILE(distance_travled<2600 AND bullets_collision==FALSE);

        IF(get_dist(id2)<400 AND id2_health>0) id2_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id3)<400 AND id3_health>0) id3_health-=1; bullets_collision=TRUE;  END
        IF(get_dist(id4)<400 AND id4_health>0) id4_health-=1; bullets_collision=TRUE;  END
        IF(get_dist(id5)<400 AND id5_health>0) id5_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id6)<400 AND id6_health>0) id6_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id7)<400 AND id7_health>0) id7_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id8)<400 AND id8_health>0) id8_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id9)<400 AND id9_health>0) id9_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id10)<400 AND id10_health>0) id10_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id11)<400 AND id11_health>0) id11_health-=1; bullets_collision=TRUE; END
        IF(get_dist(id12)<400 AND id12_health>0) id12_health-=1; bullets_collision=TRUE; END

        IF(player_save[2]>1)
            IF(get_dist(id13)<400 AND id13_health>0) id13_health-=1; bullets_collision=TRUE; END
            IF(get_dist(id14)<400 AND id14_health>0) id14_health-=1; bullets_collision=TRUE; END
            IF(get_dist(id15)<400 AND id15_health>0) id15_health-=1; bullets_collision=TRUE; END
            IF(get_dist(id16)<400 AND id16_health>0) id16_health-=1; bullets_collision=TRUE; END
            IF(get_dist(id17)<400 AND id17_health>0) id17_health-=1; bullets_collision=TRUE; END
            IF(get_dist(id18)<400 AND id18_health>0) id18_health-=1; bullets_collision=TRUE; END
            IF(get_dist(id19)<400 AND id19_health>0) id19_health-=1; bullets_collision=TRUE; END
        END

        advance(10);
        distance_travled+=10;
        FRAME(5);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy1(number,x,y)

PRIVATE;
    firing_rate;

BEGIN
    file=enemy_file;
    graph=1;
    ctype=c_m8;
    radius=200;
    z=1000;
    m8_step=1;
    firing_rate=0;
        LOOP
        IF(number==2 AND id2_health=<0) BREAK; END
        IF(number==3 AND id3_health=<0) BREAK; END
        IF(number==4 AND id4_health=<0) BREAK; END
        IF(number==5 AND id5_health=<0) BREAK; END
        IF(number==6 AND id6_health=<0) BREAK; END
        IF(number==7 AND id7_health=<0) BREAK; END
        IF(number==8 AND id8_health=<0) BREAK; END
        IF(number==9 AND id9_health=<0) BREAK; END
        IF(number==10 AND id10_health=<0) BREAK; END
        IF(number==11 AND id11_health=<0) BREAK; END
        IF(number==12 AND id12_health=<0) BREAK; END
        IF(number==13 AND id13_health=<0) BREAK; END
        IF(number==14 AND id14_health=<0) BREAK; END
        IF(number==15 AND id15_health=<0) BREAK; END
        IF(number==16 AND id16_health=<0) BREAK; END
        IF(number==17 AND id17_health=<0) BREAK; END
        IF(number==18 AND id18_health=<0) BREAK; END
        IF(number==19 AND id19_health=<0) BREAK; END
        firing_rate+=1;
        IF(firing_rate>30 AND get_dist(id1)<3000 AND x>(id1.x-50)) channel6=sound(s_lasser,effects_volume,256); lasser(get_angle(id1)); firing_rate=0; END
        FRAME;
    END
    player_save[3]+=1;
    graph=11;
    LOOP
    graph+=1;
    IF(graph>23) BREAK; END
    FRAME;
    END
    enemy_body(24,x,y);
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy2(number,x,y)

PRIVATE;
    firing_rate;

BEGIN
    file=enemy_file;
    graph=2;
    ctype=c_m8;
    radius=200;
    z=1000;
    m8_step=1;
    firing_rate=0;
        LOOP
        IF(number==2 AND id2_health=<0) BREAK; END
        IF(number==3 AND id3_health=<0) BREAK; END
        IF(number==4 AND id4_health=<0) BREAK; END
        IF(number==5 AND id5_health=<0) BREAK; END
        IF(number==6 AND id6_health=<0) BREAK; END
        IF(number==7 AND id7_health=<0) BREAK; END
        IF(number==8 AND id8_health=<0) BREAK; END
        IF(number==9 AND id9_health=<0) BREAK; END
        IF(number==10 AND id10_health=<0) BREAK; END
        IF(number==11 AND id11_health=<0) BREAK; END
        IF(number==12 AND id12_health=<0) BREAK; END
        IF(number==13 AND id13_health=<0) BREAK; END
        IF(number==14 AND id14_health=<0) BREAK; END
        IF(number==15 AND id15_health=<0) BREAK; END
        IF(number==16 AND id16_health=<0) BREAK; END
        IF(number==17 AND id17_health=<0) BREAK; END
        IF(number==18 AND id18_health=<0) BREAK; END
        IF(number==19 AND id19_health=<0) BREAK; END
        FRAME;
    END
    player_save[3]+=1;
    graph=11;
    LOOP
    graph+=1;
    IF(graph>23) BREAK; END
    FRAME;
    END
    enemy_body(24,x,y);
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy_body(graph,x,y);

BEGIN
    file=enemy_file;
    ctype=c_m8;
    z=1000;
    radius=200;
        LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------


PROCESS lava(sector,flow);

BEGIN
        LOOP
        flow+=1;
        IF(flow>110) flow=101; END;
        set_sector_texture(sector,flow,-1,-1);
        FRAME(300);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS lasser(angle)

PRIVATE
    distance_travled;

BEGIN
    file=stuff_file;
    graph=10;
    x=father.x;
    y=father.y;
    ctype=c_m8;
    radius=100;
    z=1150;
    distance_travled=0;
    m8_step=1;
    flags=4;
        LOOP
        IF(distance_travled>3000) BREAK; END

        IF(get_dist(id1)<200) player_save[0]-=1; BREAK; END

        advance(10);
        distance_travled+=10;
        FRAME(5);
    END
END

//-----------------------------------------------------------------------------------------------
