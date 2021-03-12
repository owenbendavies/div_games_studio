
//-----------------------------------------------------------------------------
// TITLE:      TANK BLAST 2
// AUTHOR:     OWEN DAVIES
// DATE:       13/4/02
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------
//
//  10 scrolls
//
//  scroll 0        main background
//  scroll 1        floor
//  scroll 2        radar
//
//-----------------------------------------------------------------------------
//
//  31 regions
//
//  region 1        main bar
//  region 2        left bar
//  region 3        right bar
//  region 4        volume bar
//  region 5        volume bar
//  region 6        radar
//  region 7        health bar
//
//-----------------------------------------------------------------------------
//
//  z
//
//  512     scroll
//
//  10      water
//
//  0       graphics
//
//  -5      road
//  -6      broken fence
//  -8      crater
//  -10     flag
//  -15     splat
//
//  -20     shadows
//
//  -30     garden fence
//  -40     men
//  -45     flail
//  -50     player1
//  -60     turret      bullet
//  -70     sheell
//  -150    big object
//  -170    helicopter
//  -250    arrow
//
//  -256    text
//
//  -300    radar
//  -308    radar water
//  -309    radar dot bottom;
//  -310    radar dot;
//  -311    radar dot player
//  -312    radar dot helicopter
//
//  -512    mouse
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROGRAM tank_blast;

GLOBAL

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

    screen=1;
    new_screen;

    main_font;
    black_font;

    main_file;
    enemy_file;
    scenery_file;
    game_file;
    player_file;
    weapons_file;
    channel1;
    channel2;
    tune1;
    tune2;

    s_options;
    s_bullet;
    s_button;
    s_engin;
    s_explosion;
    s_shell;
    s_scream;
    s_helicopter;
    s_missile;

    id1;

    player1_levle_position;
    player1_in_flag_area;

    random_terrain;
    terrain_minx;
    terrain_maxx;
    terrain_miny;
    terrain_maxy;

    starting_point_1_x;
    starting_point_1_y;
    starting_point_1_a;

    mission1_point_x;
    mission1_point_y;

    player1_c_max_speed;
    player1_c_min_speed;
    player1_c_armour;
    player1_c_weapon1;
    player1_c_weapon2;
    player1_c_weapon3;
    player1_c_weapon4;
    player1_c_weapon5;
    player1_c_weapon6;
    player1_c_weapon7;
    player1_c_weapon8;
    player1_c_weapon9;
    player1_c_weapon10;
    player1_temp_max_speed;
    player1_temp_min_speed;
    player1_speed;
    player1_weapon_selected;
    player1_game_over;

    top_text;

//-----------------------------------------------------------------------------
//  @ save
//-----------------------------------------------------------------------------

    player_save[]=250,150,1,15,-10,100,20,0,0,0,0,0,0,0,0,0,FALSE,FALSE,FALSE,FALSE,FALSE;

//  0    music_volume;
//  1    effects_volume;
//  2    player1_levle;
//  3    player1_max_speed;
//  4    player1_min_speed;
//  5    player1_armour;
//  6    player1_weapon1;
//  7    player1_weapon2;
//  8    player1_weapon3;
//  9    player_save[9];
//  10   player_save[10];
//  11   player_save[11];
//  12   player_save[12];
//  13   player_save[13];
//  14   player_save[14];
//  15   player_save[15];
//  16   player1_flails;
//  17   player1_double_machine_guns;
//  18   region1_open;
//  19   region2_open;
//  20   region3_open;

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

BEGIN
    set_mode(m800x600);
    set_fps(24,20);

    load_pal("fpg\tb\main.fpg");

    main_file=load_fpg("fpg\tb\main.fpg");
    enemy_file=load_fpg("fpg\tb\enemy.fpg");
    scenery_file=load_fpg("fpg\tb\scenery.fpg");
    game_file=load_fpg("fpg\tb\game.fpg");
    player_file=load_fpg("fpg\tb\player.fpg");
    weapons_file=load_fpg("fpg\tb\weapons.fpg");

    main_font=load_fnt("fnt\tb\main.fnt");
    black_font=load_fnt("fnt\tb\black.fnt");

    tune1=load_pcm("pcm\tb\tunes\tune1.pcm",1);
    tune2=load_pcm("pcm\tb\tunes\tune2.pcm",1);
    s_options=load_pcm("pcm\tb\effects\bullet.pcm",1);

    s_button=load_pcm("pcm\tb\effects\button.pcm",0);
    s_engin=load_pcm("pcm\tb\effects\engin.pcm",1);
    s_explosion=load_pcm("pcm\tb\effects\blast.pcm",0);
    s_shell=load_pcm("pcm\tb\effects\shell.pcm",0);
    s_bullet=load_pcm("pcm\tb\effects\bullet.pcm",0);
    s_scream=load_pcm("pcm\tb\effects\scream.pcm",0);
    s_helicopter=load_pcm("pcm\tb\effects\choppa.pcm",0);
    s_missile=load_pcm("pcm\tb\effects\missile.pcm",0);

    LOOP
        SWITCH (screen);
            CASE 1: owen_games(); END
            CASE 2: title(); END
            CASE 3: main_options(); END
            CASE 4: credits(); END
            CASE 5: campaign(); END
            CASE 6: options(); END
            CASE 7: hot_seat(); END
            CASE 8: scermish(); END
            CASE 20: story(); END
            CASE 101: mission1(); END
            CASE 201: levle1(); END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS main_bar();

PRIVATE;
    region1_height;

BEGIN
    player_save[18]=FALSE;
    region1_height=35;
    define_region(1,200,30,410,region1_height);
    file=main_file;
    graph=21;
    x=405;
    y=300;
    region=1;
    LOOP
        IF(player_save[18]==TRUE AND region1_height<540) region1_height=540; define_region(1,200,30,410,region1_height); END
        IF(player_save[18]==FALSE AND region1_height>35) region1_height=35; define_region(1,200,30,410,region1_height); END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS left_bar();

PRIVATE;
    region2_height;

BEGIN
    player_save[19]=FALSE;
    region2_height=35;
    define_region(2,30,30,150,region2_height);
    file=main_file;
    graph=20;
    x=105;
    y=300;
    region=2;
    LOOP
        IF(player_save[19]==TRUE AND region2_height<540) region2_height=540; define_region(2,30,30,150,region2_height); END
        IF(player_save[19]==FALSE AND region2_height>35) region2_height=35; define_region(2,30,30,150,region2_height); END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS right_bar();

PRIVATE;
    region3_height;

BEGIN
    player_save[20]=FALSE;
    region3_height=35;
    define_region(3,630,30,150,region3_height);
    file=main_file;
    graph=20;
    x=705;
    y=300;
    region=3;
    LOOP
        IF(player_save[20]==TRUE AND region3_height<540) region3_height=540; define_region(3,630,30,150,region3_height); END
        IF(player_save[20]==FALSE AND region3_height>35) region3_height=35; define_region(3,630,30,150,region3_height); END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS bar();

BEGIN
    write(main_font,105,47,4,"OPTIONS");
    write(main_font,705,47,4,"HEALTH");
    write(main_font,705,240,4,"HEALTH");

    write_int(main_font,640,300,3,& player1_c_weapon1);
    write_int(main_font,640,325,3,& player1_c_weapon2);
    write_int(main_font,640,350,3,& player1_c_weapon3);
    write_int(main_font,640,375,3,& player1_c_weapon4);
    write_int(main_font,640,400,3,& player1_c_weapon5);
    write_int(main_font,640,425,3,& player1_c_weapon6);
    write_int(main_font,640,450,3,& player1_c_weapon7);
    write_int(main_font,640,475,3,& player1_c_weapon8);
    write_int(main_font,640,500,3,& player1_c_weapon9);
    write_int(main_font,640,525,3,& player1_c_weapon10);

    write(main_font,670,300,3,"SHELLS");
    write(main_font,670,325,3,"MISSILES");
    write(main_font,670,350,3,"HIGH SHELLS");
    write(main_font,670,375,3,"3 SHELLS");
    write(main_font,670,400,3,"S.A.M");
    write(main_font,670,425,3,"FLAMERS");
    write(main_font,670,450,3,"MINES");
    write(main_font,670,475,3,"ELETRODE");
    write(main_font,670,500,3,"ANTI TANK");
    write(main_font,670,525,3,"VORTEX");

    top_text=write(main_font,405,47,4,"MISSION 1");

    health_bar(50,705,265,0,-10);
    health_bar(51,705,265,7,-5);
    weapon_selected();
    LOOP
    IF(key(_1)) player1_weapon_selected=1; END
    IF(key(_2)) player1_weapon_selected=2; END
    IF(key(_3)) player1_weapon_selected=3; END
    IF(key(_4)) player1_weapon_selected=4; END
    IF(key(_5)) player1_weapon_selected=5; END
    IF(key(_6)) player1_weapon_selected=6; END
    IF(key(_7)) player1_weapon_selected=7; END
    IF(key(_8)) player1_weapon_selected=8; END
    IF(key(_9)) player1_weapon_selected=9; END
    IF(key(_0)) player1_weapon_selected=10; END
    IF(player1_c_armour>0) define_region(7,655,259,(100/player_save[5])*player1_c_armour,13); END
    IF(player1_c_armour<=0) define_region(7,655,259,1,13); END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS health_bar(graph,x,y,region,z);

BEGIN
    file=main_file;
    LOOP
    IF(graph>50 AND player1_c_armour<50 AND player1_c_armour=>20) graph=52; END
    IF(graph>50 AND player1_c_armour<20) graph=53; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS weapon_selected();

BEGIN
    file=main_file;
    graph=29;
    z=-10;
    x=705;
    LOOP
    IF(player1_weapon_selected==1) y=300; END
    IF(player1_weapon_selected==2) y=325; END
    IF(player1_weapon_selected==3) y=350; END
    IF(player1_weapon_selected==4) y=375; END
    IF(player1_weapon_selected==5) y=400; END
    IF(player1_weapon_selected==6) y=425; END
    IF(player1_weapon_selected==7) y=450; END
    IF(player1_weapon_selected==8) y=475; END
    IF(player1_weapon_selected==9) y=500; END
    IF(player1_weapon_selected==10) y=525; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS thing(file,graph,x,y,z,angle,flags,region);

BEGIN
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS owen_games();

BEGIN
    mouse.file=main_file;
    mouse.graph=10;
    screen=0;
    new_screen=0;
    write(black_font,400,300,4,"OWEN GAMES (c) 2002");
    fade_on();
    channel1=sound(tune1,player_save[0],256);
    file=main_file;
    graph=2;
    x=-200;
    y=300;
        WHILE(new_screen==0);
        x+=20;
        IF(x>900) new_screen=2; END
        IF(mouse.left) new_screen=101; END
        FRAME;
    END
    delete_text(all_text);
    clear_screen();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS title();

BEGIN
    screen=0;
    new_screen=0;
    write(black_font,400,300,4,"TANK BLAST");
    file=main_file;
    graph=2;
    x=-200;
    y=300;
        WHILE(new_screen==0);
        x+=20;
        IF(x>900) delete_text(all_text); fade(200,200,200,2); END
        WHILE(fading==TRUE);
        FRAME;
            new_screen=3;
        END
        FRAME;
    END
    delete_text(all_text);
    clear_screen();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS main_options();

BEGIN
    signal(TYPE main_bar,s_kill);
    signal(TYPE left_bar,s_kill);
    signal(TYPE right_bar,s_kill);
    screen=0;
    new_screen=0;
    main_bar();
    left_bar();
    right_bar();
    player_save[18]=TRUE;
    player_save[19]=TRUE;
    player_save[20]=TRUE;
    write(main_font,405,47,4,"TANK BLAST");
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");
    write(main_font,405,240,4,"CAMPAIGN");
    write(main_font,405,270,4,"SCERMISH");
    write(main_font,405,300,4,"HOT SEAT");
    write(main_font,405,330,4,"OPTIONS");
    write(main_font,405,360,4,"EXIT");

    thing(main_file,22,105,317,-10,0,0,2);
    thing(main_file,22,705,317,-10,0,0,3);
    start_scroll(0,main_file,1,0,0,15);

    fade(100,100,100,64);
        WHILE(new_screen==0);
        scroll[0].y0+=2;
        IF(mouse.left AND mouse.y>230 AND mouse.y<250)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=5;
        END
        IF(mouse.left AND mouse.y>260 AND mouse.y<290)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=8;
        END
        IF(mouse.left AND mouse.y>290 AND mouse.y<310)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=7;
        END
        IF(mouse.left AND mouse.y>320 AND mouse.y<340)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=6;
        END
        IF(mouse.left AND mouse.y>350 AND mouse.y<370)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=4;
        END
        FRAME;
    END
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS credits();

BEGIN
    screen=0;
    new_screen=0;
    write(main_font,405,47,4,"TANK BLAST");
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");
    write(main_font,405,240,4,"CREATED BY OWEN DAVIES");
    write(main_font,405,270,4,"HAMMER TECHNOLOGIES (c) 1998");
    write(main_font,405,300,4,"DIV GAMES STUDIO (c) 1998");
    write(main_font,405,330,4,"OWEN GAMES (c) 2002");
        WHILE(new_screen==0);
        scroll[0].y0+=2;
        IF(scan_code<>0 OR mouse.left)
            sound(s_button,player_save[1],256);
            WHILE(scan_code<>0 OR mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            exit("OWEN GAMES (c) 2002",0);
        END
        FRAME;
    END
    stop_scroll(0);
    clear_screen();
    signal(TYPE thing,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS campaign();

BEGIN
    screen=0;
    new_screen=0;
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");
    write(main_font,405,47,4,"CAMPAIGN");
    write(main_font,405,240,4,"1 PLAYER");
    write(main_font,405,250,4,"__________");
    write(main_font,405,280,4,"NEW CAMPAIGN");
    write(main_font,405,310,4,"LOAD CAMPAIGN");
    write(main_font,405,340,4,"BACK");
        WHILE(new_screen==0);
        scroll[0].y0+=2;
        IF(mouse.left AND mouse.y>270 AND mouse.y<290)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
    stop_sound(all_sound);
            new_screen=20;
        END
        IF(mouse.left AND mouse.y>330 AND mouse.y<350)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=3;
        END
        FRAME;
    END
    stop_scroll(0);
    signal(TYPE thing,s_kill);
    delete_text(all_text);
    clear_screen();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS options();

BEGIN
    screen=0;
    new_screen=0;
    player_save[18]=TRUE;
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");
    write(main_font,405,47,4,"OPTIONS");
    write(main_font,405,110,4,"MUSIC VOLUME");
    write(main_font,405,200,4,"EFFECTS VOLUME");
    write(main_font,405,540,4,"BACK");
    thing(main_file,30,300,105,-250,0,0,1);
    thing(main_file,30,510,105,-250,0,1,1);
    thing(main_file,30,300,195,-250,0,0,1);
    thing(main_file,30,510,195,-250,0,1,1);
    thing(main_file,31,405,145,-250,0,0,1);
    thing(main_file,31,405,235,-250,0,0,1);
    thing(main_file,32,405,145,-250,0,0,4);
    thing(main_file,32,405,235,-250,0,0,5);
    channel2=sound(s_options,player_save[1],256);
        WHILE(new_screen==0);
        define_region(4,230,135,player_save[0]*14/10,20);
        define_region(5,230,225,player_save[1]*14/10,20);
        scroll[0].y0+=2;
        IF(player_save[0]>0 AND mouse.left AND mouse.x>280 AND mouse.x<320 AND mouse.y>90 AND mouse.y<130) player_save[0]-=10; change_sound(channel1,player_save[0],256); END
        IF(player_save[0]<250 AND mouse.left AND mouse.x>490 AND mouse.x<530 AND mouse.y>90 AND mouse.y<130) player_save[0]+=10; change_sound(channel1,player_save[0],256); END

        IF(player_save[1]>0 AND mouse.left AND mouse.x>280 AND mouse.x<320 AND mouse.y>180 AND mouse.y<220) player_save[1]-=10; change_sound(channel2,player_save[1],256); END
        IF(player_save[1]<250 AND mouse.left AND mouse.x>490 AND mouse.x<530 AND mouse.y>180 AND mouse.y<220) player_save[1]+=10; change_sound(channel2,player_save[1],256); END

        IF(mouse.left AND mouse.y>530 AND mouse.y<550)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=3;
        END
        FRAME;
    END
     stop_scroll(0);
   clear_screen();
    stop_sound(channel2);
    signal(TYPE thing,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS hot_seat();

BEGIN
    screen=0;
    new_screen=0;
    player_save[18]=TRUE;
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");
    write(main_font,405,47,4,"HOT SEAT");
    write(main_font,405,240,4,"2 PLAYERS");
    write(main_font,405,250,4,"____________");
    write(main_font,405,280,4,"DEATH MATCH");
    write(main_font,405,310,4,"CAPTURE THE FLAG");
    write(main_font,405,340,4,"BACK");
        WHILE(new_screen==0);
        scroll[0].y0+=2;
        IF(mouse.left AND mouse.y>330 AND mouse.y<350)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=3;
        END
        FRAME;
    END
    stop_scroll(0);
    signal(TYPE thing,s_kill);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS scermish();

BEGIN
    screen=0;
    new_screen=0;
    player_save[18]=TRUE;
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");
    write(main_font,405,47,4,"SCERMISH");
    write(main_font,405,240,4,"1 PLAYER");
    write(main_font,405,250,4,"__________");
    write(main_font,405,280,4,"NEW SCERMISH");
    write(main_font,405,310,4,"LOAD SCERMISH");
    write(main_font,405,340,4,"BACK");
        WHILE(new_screen==0);
        scroll[0].y0+=2;
        IF(mouse.left AND mouse.y>330 AND mouse.y<350)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=3;
        END
        FRAME;
    END
    stop_scroll(0);
    signal(TYPE thing,s_kill);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS story();

PRIVATE;
    text_height;
    text1;
    text2;
    text3;
    text4;
    text5;
    text6;
    text7;
    text8;
    text9;
    text10;
    text11;
    text12;
    text13;
    text14;
    text15;
    text16;
    text17;
    text18;
    text19;
    text20;
    text21;
    text22;
    text23;
    text24;
    text25;
    text26;
    text27;
    text28;
    text29;

BEGIN
    screen=0;
    new_screen=0;
    file=main_file;
    graph=40;
    x=400;
    y=300;
    z=-500;
    text_height=10;
    player_save[18]=TRUE;
    player_save[19]=TRUE;
    player_save[20]=TRUE;
    thing(main_file,22,105,317,-10,0,0,2);
    thing(main_file,22,705,317,-10,0,0,3);
    thing(main_file,41,405,47,-500,0,0,0);
    channel1=sound(tune2,player_save[0],256);
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");

    text1=write(main_font,405,80+text_height,4,"WORLD WAR III DRAWS NEAR");
    text2=write(main_font,210,120+text_height,3,"          THE NEW COMMANDER OF THE ARMED");
    text3=write(main_font,210,140+text_height,3,"FORCES OF THE U.S.A, COMMANDER ARVEN");
    text4=write(main_font,210,160+text_height,3,"HAS BEEN SLOWLY SEIZING CONTROLL OF");
    text5=write(main_font,210,180+text_height,3,"THE GOVORMENTS OFFICES. HE IS NOW THE");
    text6=write(main_font,210,200+text_height,3,"SECOND MOST POWERFUL PERSON IN THE");
    text7=write(main_font,210,220+text_height,3,"U.S.A.");

    text8=write(main_font,210,260+text_height,3,"          ONE WEEK AGO THE PRESIDENT OF");
    text9=write(main_font,210,280+text_height,3,"THE U.S.A WAS ASSASINATED. OUR");
    text10=write(main_font,210,300+text_height,3,"INTELEGENCE HAS LED US TO BELIVE THIS");
    text11=write(main_font,210,320+text_height,3,"WAS THE ACTION OF COMMANDER ARVEN. A");
    text12=write(main_font,210,340+text_height,3,"STATE OF EMERGANCY HAS BEEN DECLAIRED");
    text13=write(main_font,210,360+text_height,3,"AND COMMANDER ARVEN HAS DECLAIRED");
    text14=write(main_font,210,380+text_height,3,"HIMSELF ACTING PRESIDENT. HE NOW");
    text15=write(main_font,210,400+text_height,3,"CONTROLS THE U.S.A AND ALL THE ARMED");
    text16=write(main_font,210,420+text_height,3,"FORCES HE HAS SET UP A DICTATORSHIP");
    text17=write(main_font,210,440+text_height,3,"RASIEM WITH HIM AS THE LEADER.");

    text18=write(main_font,210,480+text_height,3,"          COMMANDER ARVEN NOW WANTS");
    text19=write(main_font,210,500+text_height,3,"TO CARRY OUT HIS DREAM OF WORLD");
    text20=write(main_font,210,520+text_height,3,"SUPREMERCY. HE HAS NOW DECLAIRED WAR");
    text21=write(main_font,210,540+text_height,3,"ON EUROPE AND GROUND TROOPS HAVE BEEN");
    text22=write(main_font,210,560+text_height,3,"MOVING INTO FRANCE. THE FRENCH FORCES");
    text23=write(main_font,210,580+text_height,3,"HAVE PUT UP SOME RESISTANCE BUT THE");
    text24=write(main_font,210,600+text_height,3,"U.S.A NOW CONTROLL MOST OF FRANCE. THEY");
    text25=write(main_font,210,620+text_height,3,"ARE NOW TURNING THEIR ATTENTIONS");
    text26=write(main_font,210,640+text_height,3,"TOWARDS ENGLAND. FOR OUR NATION AND");
    text27=write(main_font,210,660+text_height,3,"FOR THE WORLD WE MUST STOP COMMANDER");
    text28=write(main_font,210,680+text_height,3,"AVIN.");
    text29=write(main_font,405,720+text_height,4,"LONG LIVE THE QUEEN");

        WHILE(new_screen==0);
        IF(key(_down) AND text_height>-700) text_height-=5; END
        IF(key(_up) AND text_height<10) text_height+=5; END
        move_text(text1,405,80+text_height);
        move_text(text2,210,120+text_height);
        move_text(text3,210,140+text_height);
        move_text(text4,210,160+text_height);
        move_text(text5,210,180+text_height);
        move_text(text6,210,200+text_height);
        move_text(text7,210,220+text_height);
        move_text(text8,210,260+text_height);
        move_text(text9,210,280+text_height);
        move_text(text10,210,300+text_height);
        move_text(text11,210,320+text_height);
        move_text(text12,210,340+text_height);
        move_text(text13,210,360+text_height);
        move_text(text14,210,380+text_height);
        move_text(text15,210,400+text_height);
        move_text(text16,210,420+text_height);
        move_text(text17,210,440+text_height);
        move_text(text18,210,480+text_height);
        move_text(text19,210,500+text_height);
        move_text(text20,210,520+text_height);
        move_text(text21,210,540+text_height);
        move_text(text22,210,560+text_height);
        move_text(text23,210,580+text_height);
        move_text(text24,210,600+text_height);
        move_text(text25,210,620+text_height);
        move_text(text26,210,640+text_height);
        move_text(text27,210,660+text_height);
        move_text(text28,210,680+text_height);
        move_text(text29,405,720+text_height);

        scroll[0].y0+=2;
        IF(mouse.left)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=101;
        END
        FRAME;
    END
    signal(TYPE thing,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    clear_screen();
    fade_off();
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS mission1();

BEGIN
    player_save[2]=1;
    screen=0;
    new_screen=0;
    thing(main_file,22,105,317,-10,0,0,2);
    thing(main_file,22,705,317,-10,0,0,3);

    player_save[3]=12;
    player_save[4]=-8;
    player_save[5]=100;
    player_save[6]=20;
    player_save[7]=0;
    player_save[8]=0;
    player_save[9]=5;
    player_save[10]=0;
    player_save[11]=0;
    player_save[12]=0;
    player_save[13]=0;
    player_save[14]=0;
    player_save[15]=0;
    player_save[16]=FALSE:
    player_save[17]=FALSE;

    start_scroll(0,main_file,1,0,0,15);
    channel1=sound(tune2,player_save[0],256);
    main_bar();
    left_bar();
    right_bar();
    player_save[18]=TRUE;
    player_save[19]=TRUE;
    player_save[20]=TRUE;
    write(main_font,105,47,4,"TANK");
    write(main_font,705,47,4,"BLAST");

    write(main_font,405,47,4,"MISSION 1");
    write(main_font,210,100,3,"          WE MUST TAKE THE INITATIVE");
    write(main_font,210,120,3,"AND ATTACK BEFORE WE ARE ATTACKED.");
    write(main_font,210,140,3,"WE ARE GOING TO SEND YOU OVER TO FRANCE");
    write(main_font,210,160,3,"TO TRY AND STOP THE U.S.A's ADVANCE");
    write(main_font,210,180,3,"BEFORE IT REACHES ENGLAND. MOST OF");
    write(main_font,210,200,3,"FRANCE IS NOW TAKEN SO LANDING WILL");
    write(main_font,210,220,3,"BE DIDDICULT. ONE IN FRANCE YOU WILL");
    write(main_font,210,240,3,"BE ASSISTING THE FRENCH ARMY IN STOPING");
    write(main_font,210,260,3,"THE U.S.A ARMY.");

    write(main_font,210,300,3,"          ONCE YOU HAVE LANDED YOU");
    write(main_font,210,320,3,"WILL NEED TO TAKE OUT ALL U.S.A TROOPS");
    writE(main_font,210,340,3,"SO THAT WE CAN MAKE A LANDING PLACE FOR");
    writE(main_font,210,360,3,"OUR TROOPS. YOU WILL ALSO NEED TO FIND");
    write(main_font,210,380,3,"SUPPLIES TO AID YOY.");

    write(main_font,405,420,4,"LAND IN FRANCE");
    write(main_font,405,440,4,"SECURE BEACH");
    write(main_font,405,460,4,"TAKE OUT ALL U.S.A TROOPS");
    writE(main_font,405,480,4,"FIND SUPPLIES");

    write(main_font,405,520,4,"GOOD LUCK!");

    fade_on();
        WHILE(new_screen==0);
        scroll[0].y0+=2;
        IF(mouse.left OR scan_code<>0)
            sound(s_button,player_save[1],256);
            WHILE(mouse.left OR scan_code<>0);
            scroll[0].y0+=2;
            FRAME;
            END
            new_screen=201;
        END
        FRAME;
    END
    signal(TYPE thing,s_kill);
    signal(TYPE main_bar,s_kill);
    signal(TYPE left_bar,s_kill);
    signal(TYPE right_bar,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    clear_screen();
    fade_off();
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS levle1();

BEGIN
    mouse.x=0;
    mouse.y=0;
    screen=0;
    new_screen=0;
    player1_in_flag_area=FALSE;
    player1_levle_position=1;
    player1_C_max_speed=player_save[3];
    player1_C_min_speed=player_save[4];
    player1_C_armour=player_save[5];
    player1_C_weapon1=player_save[6];
    player1_C_weapon2=player_save[7];
    player1_C_weapon3=player_save[8];
    player1_C_weapon4=player_save[9];
    player1_C_weapon5=player_save[10];
    player1_C_weapon6=player_save[11];
    player1_C_weapon7=player_save[12];
    player1_C_weapon8=player_save[13];
    player1_C_weapon9=player_save[14];
    player1_C_weapon10=player_save[15];
    main_bar();
    left_bar();
    right_bar();
    levle1_map();
    player_save[18]=FALSE;
    player_save[19]=FALSE;
    player_save[20]=TRUE;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=1; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(1);
    stop_scroll(2);
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS levle1_map();

BEGIN
    random_terrain=rand(1,3);
    mission1_point_x=1800;
    mission1_point_y=170;
    terrain_minx=0;
    terrain_maxx=2000;
    terrain_miny=0;
    terrain_maxy=2000;
    starting_point_1_x=1000;
    starting_point_1_y=1800;
    starting_point_1_a=90000;
    radar();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(1,scenery_file,random_terrain,0,0,15);
    id1=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    bar();
    x=1000;
    y=1000;
    graph=200;
    file=scenery_file;
    radar_dot(100,-111,0);

    water(9,200,2200);
    water(9,600,2200);
    water(9,1000,2200);
    water(9,1400,2200);
    water(9,1800,2200);
    water(9,2200,2200);
    water(9,2600,2200);
    water(9,-200,2200);
    water(9,-600,2200);
    water(9,200,2600);
    water(9,600,2600);
    water(9,1000,2600);
    water(9,1400,2600);
    water(9,1800,2600);
    water(9,2200,2600);
    water(9,2600,2600);
    water(9,-200,2600);
    water(9,-600,2600);
    water(7,200,2000);
    water(7,600,2000);
    water(7,1000,2000);
    water(7,1400,2000);
    water(7,1800,2000);
    water(7,2200,2000);
    water(7,2600,2000);
    water(7,-200,2000);
    water(7,-600,2000);

    road(scenery_file,60,300,1500,0);
    road(scenery_file,60,-300,1500,0);
    road(scenery_file,60,900,1500,0);
    road(scenery_file,61,1280,1473,225000);
    road(scenery_file,61,1415,1350,270000);
    road(scenery_file,60,300,640,0);
    road(scenery_file,60,-300,640,0);
    road(scenery_file,60,900,640,0);
    road(scenery_file,60,1500,640,0);
    road(scenery_file,60,1445,953,90000);
    road(scenery_file,60,2000,640,0);
    road(scenery_file,60,2600,640,0);
    road(scenery_file,60,1602,323,90000);
    road(scenery_file,60,1602,-230,90000);

    bigobject(scenery_file,30,150,1216,0,scenery_file,31,5,92);
    bigobject(scenery_file,30,-150,1216,0,scenery_file,31,5,92);
    bigobject(scenery_file,30,-450,1216,0,scenery_file,31,5,92);
    bigobject(scenery_file,30,287,1378,90000,scenery_file,31,5,92);
    bigobject(scenery_file,30,287,1678,90000,scenery_file,31,5,92);
    bigobject(scenery_file,30,287,1978,90000,scenery_file,31,5,92);
    bigobject(scenery_file,30,287,2278,90000,scenery_file,31,5,92);
    bigobject(scenery_file,30,287,2578,90000,scenery_file,31,5,92);
    bigobject(scenery_file,70,1800,170,44000,scenery_file,71,6,90);

    bigobject(scenery_file,100,200,380,0,scenery_file,110,6,80);
    bigobject(scenery_file,101,516,380,0,scenery_file,111,6,81);
    bigobject(scenery_file,102,832,380,0,scenery_file,110,6,80);
    bigobject(scenery_file,104,1148,380,0,scenery_file,110,6,80);
    bigobject(scenery_file,102,200,880,0,scenery_file,110,6,80);
    bigobject(scenery_file,104,516,880,0,scenery_file,110,6,80);
    bigobject(scenery_file,100,832,880,0,scenery_file,110,6,80);
    bigobject(scenery_file,101,1148,880,0,scenery_file,111,6,81);
    bigobject(scenery_file,103,1750,1500,0,scenery_file,112,6,82);

    garden(200,380,0);
    garden(516,380,0);
    garden(832,380,0);
    garden(1148,380,0);
    garden(200,880,2);
    garden(516,880,2);
    garden(832,880,2);
    garden(1148,880,2);
    garden(1750,1500,2);

    smallobject(40,1730,500,90000,41,4,93);
    smallobject(40,1480,500,180000,41,4,93);


    civilian1(1030,200,230,0);
    civilian1(480,700,600,0);
    civilian1(750,1040,200,0);
    civilian1(90,1150,200,0);
    civilian1(480,1420,600,0);
    civilian1(1300,1920,500,0);
    civilian1(90,250,200,0);
    civilian1(1360,880,400,0);
    civilian1(640,580,600,0);
    civilian1(1070,640,700,0);

    army_turret_base(1400,0,0,300);
    army_man_1(100,100,100,0);

    army_van(50,200,-200,0,FALSE,FALSE,0,20,1);

    army_helicopter(0,400,400,20);

    army_man_3(-500,0);

    land_mine(700,100);

    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS kill();

BEGIN
    signal(TYPE thing,s_kill);
    signal(TYPE main_bar,s_kill);
    signal(TYPE left_bar,s_kill);
    signal(TYPE right_bar,s_kill);
    signal(TYPE flag1,s_kill);
    signal(TYPE player1_mission1_arrow,s_kill);
    signal(TYPE player1_flag1_arrow,s_kill);
    signal(TYPE player1,s_kill);
    signal(TYPE turret1,s_kill);
    signal(TYPE player1_bullet,s_kill);
    signal(TYPE player1_shell,s_kill);
    signal(TYPE army_man_1,s_kill);
    signal(TYPE army_man_2,s_kill);
    signal(TYPE army_man_bullet,s_kill);
    signal(TYPE civilian1,s_kill);
    signal(TYPE radar,s_kill);
    signal(TYPE radar_dot,s_kill);
    signal(TYPE radar_dot_move,s_kill);
    signal(TYPE bigobject,s_kill);
    signal(TYPE player1_flail,s_kill);
    signal(TYPE army_van,s_kill);
    signal(TYPE shadow,s_kill);
    signal(TYPE road,s_kill);
    signal(TYPE bar,s_kill);
    signal(TYPE army_helicopter,s_kill);
    signal(TYPE helicopter_blade,s_kill);
    signal(TYPE helicopter_shadow1,s_kill);
    signal(TYPE helicopter_shadow2,s_kill);
    signal(TYPE army_man_3,s_kill);
    signal(TYPE army_man_missile,s_kill);
    signal(TYPE water,s_kill);
    signal(TYPE garden,s_kill);
    signal(TYPE health_bar,s_kill);
    signal(TYPE splat,s_kill);
    signal(TYPE army_turret_base,s_kill);
    signal(TYPE army_turret_2,s_kill);
    signal(TYPE army_turret_1,s_kill);
    signal(TYPE army_shell,s_kill);
    signal(TYPE garden_fence,s_kill);
    signal(TYPE army_man_4,s_kill);
    signal(TYPE crater,s_kill);
    signal(TYPE land_mine,s_kill);
    signal(TYPE weapon_selected,s_kill);
    signal(TYPE smallobject,s_kill);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS radar();

BEGIN
    file=game_file;
    graph=50;
    x=705;
    y=139;
    z=-300;
    define_region(6,637,71,136,136);
    start_scroll(2,game_file,51,52,6,15);
    region=3;
    scroll[2].z=-305;
    LOOP;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS radar_dot(graph,z,flags);

BEGIN
    cnumber=c_2;
    ctype=c_scroll;
    file=game_file;
        WHILE(father.graph>0);
        x=father.x/10;
        y=father.y/10;
        angle=father.angle;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS radar_dot_move();

BEGIN
    file=game_file;
    graph=75;
    z=-310;
    cnumber=c_2;
    ctype=c_scroll;
    flags=4;
    scroll[2].camera=id;
    LOOP
    x=father.x/10;
    y=father.y/10;
    graph+=1;
    IF(graph=>77) graph=75; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS flag1(graph,x,y);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=game_file;
    z=-10;
    radar_dot(70,-309,0);
    LOOP
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1_mission1_arrow(graph);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=game_file;
    z=-250;
    WHILE (player1_levle_position>0);
        angle=fget_angle(x,y,mission1_point_x,mission1_point_y);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1_flag1_arrow(graph);

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    file=game_file;
    z=-250;
    LOOP
        angle=fget_angle(x,y,starting_point_1_x,starting_point_1_y);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1(x,y,angle)

BEGIN
    cnumber=c_1;
    sound(s_engin,player_save[1],256);
    ctype=c_scroll;
    scroll[1].camera=id;
    file=player_file;
    graph=1;
    z=-50;
    turret1(angle);
    player1_speed=0;
    player1_temp_max_speed=player1_C_max_speed;
    player1_temp_min_speed=player1_C_min_speed;
    player1_weapon_selected=1;
    player1_game_over=FALSE;
    player1_flag1_arrow(30);
    player1_mission1_arrow(32);
    shadow(player_file,2,3,4);
    radar_dot(60,-311,0);
    radar_dot_move();
    IF(player_save[16]==TRUE) player1_flail(); END
        WHILE(player1_C_armour>0);
        advance(player1_speed);
        IF(player1_C_armour<0) player1_C_armour=0; END
        IF(player1_C_armour<50) player1_C_armour=50; END
        IF(key(_left)) angle+=4000; END
        IF(key(_right)) angle-=4000; END
        IF(key(_up)) player1_speed+=1; END
        IF(NOT key(_up) AND player1_speed>0) player1_speed-=1; END
        IF(key(_down)) player1_speed-=1; END
        IF(NOT key(_down) AND player1_speed<0) player1_speed+=1; END
        IF(player1_speed>player1_temp_max_speed) player1_speed=player1_temp_max_speed; END
        IF(player1_speed<player1_temp_min_speed) player1_speed=player1_temp_min_speed; END
        IF(collision(TYPE bigobject) OR collision(TYPE smallobject) OR  collision(TYPE army_van) OR collision(TYPE army_turret_base))
            IF(player1_speed>0) player1_speed=0; advance(-5); END
            IF(player1_speed<0) player1_speed=0; advance(5); END
        END
        IF(x<terrain_minx) x=terrain_minx; delete_text(top_text); top_text=write(main_font,405,46,4,"RETURN TO MISSION"); END
        IF(x>terrain_maxx) x=terrain_maxx; delete_text(top_text); top_text=write(main_font,405,46,4,"RETURN TO MISSION"); END
        IF(y<terrain_miny) y=terrain_miny; delete_text(top_text); top_text=write(main_font,405,46,4,"RETURN TO MISSION"); END
        IF(y>terrain_maxy) y=terrain_maxy; delete_text(top_text); top_text=write(main_font,405,46,4,"RETURN TO MISSION"); END
        IF(collision(TYPE flag1)) player1_in_flag_area=TRUE; ELSE player1_in_flag_area=FALSE; END
        FRAME;
    END
    WHILE(fading==TRUE);
        fade(200,0,0,2);
        sound(s_explosion,player_save[1],256);
        z=-160;
        FILE=weapons_file;
        FROM graph=100 TO 114;
        FRAME(140);
    END
    player1_game_over=TRUE;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_flail()

BEGIN
    ctype=c_scroll;
    z=-42;
    file=player_file;
    graph=20;
    shadow(player_file,22,3,4);
    FRAME;
        WHILE(player_save[5]>0);
        FROM graph=20 TO 21;
        x=father.x;
        y=father.y;
        angle=father.angle;
        IF(collision(TYPE bigobject) OR collision(TYPE smallobject) OR collision(TYPE army_van) OR collision(TYPE army_turret_base));
            IF(player1_speed>0) player1_speed=0; END
            IF(player1_speed<0) player1_speed=0; END
        END
        FRAME();
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS turret1(angle)

PRIVATE
    i_can_fire_bullet;
    i_can_fire_weapon1;
    i_can_fire_weapon2;
    i_can_fire_weapon3;
    i_can_fire_weapon4;
    i_can_fire_weapon5;
    i_can_fire_weapon6;
    i_can_fire_weapon7;
    i_can_fire_weapon8;
    i_can_fire_weapon9;
    i_can_fire_weapon10;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-60;
    file=player_file;
    graph=10;
        WHILE(player1_C_armour>0);
        graph=10;
        x=father.x;
        y=father.y;
        i_can_fire_bullet+=1;
        i_can_fire_weapon1+=1;
        i_can_fire_weapon2+=1;
        i_can_fire_weapon3+=1;
        i_can_fire_weapon4+=1;
        i_can_fire_weapon5+=1;
        i_can_fire_weapon6+=1;
        i_can_fire_weapon7+=1;
        i_can_fire_weapon8+=1;
        i_can_fire_weapon9+=1;
        i_can_fire_weapon10+=1;
        IF(key(_left)) angle+=4000; END
        IF(key(_right)) angle-=4000; END
        IF(key(_z)) angle+=8000; END
        IF(key(_x)) angle-=8000; END
        IF(i_can_fire_bullet>0 AND key(_control))
            IF(player_save[17]==FALSE) graph=11; player1_bullet(x,y,angle);  END
            IF(player_save[17]==TRUE) graph=11; player1_bullet(x,y,angle-5000); player1_bullet(x,y,angle+5000); END
            i_can_fire_bullet=0;
        END
        IF(player1_weapon_selected==1 AND player1_C_weapon1>0 AND i_can_fire_weapon1>40 AND key(_space)) player1_shell(x,y,angle); i_can_fire_weapon1=0; player1_C_weapon1-=1; advance(-10);  graph=11; END
        IF(player1_weapon_selected==4 AND player1_C_weapon4>0 AND i_can_fire_weapon4>50 AND key(_space)) player1_shell(x,y,angle-20000); player1_shell(x,y,angle); player1_shell(x,y,angle+20000); i_can_fire_weapon4=0; player1_C_weapon4-=1; advance(-10); graph=11; END
        FRAME;
    END
    z=-160;
    sound(s_explosion,player_save[1],256);
    FILE=weapons_file;
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_bullet(x,y,angle)

PRIVATE
    player1_bullet_distance_travled;

BEGIN
    cnumber=c_1;
    sound(s_bullet,player_save[1],256);
    ctype=c_scroll;
    z=-60;
    file=weapons_file;
    graph=10;
    WHILE(player1_bullet_distance_travled<600);
    advance(5);
    player1_bullet_distance_travled+=5;
    IF(collision(TYPE civilian1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_man_1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE bigobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_van)) player1_bullet_distance_travled=600; END
    FRAME(20);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_shell(x,y,angle)

PRIVATE
    player1_shell_distance_traveled;

BEGIN
    cnumber=c_1;
    sound(s_shell,player_save[1],256);
    ctype=c_scroll;
    z=-70;
    file=weapons_file;
    graph=30;
        WHILE(player1_shell_distance_traveled<300);
        advance(10);
        player1_shell_distance_traveled+=10;
        IF(collision(TYPE civilian1)) player1_shell_distance_traveled=300; END
        IF(collision(TYPE army_man_1)) player1_shell_distance_traveled=300; END
        IF(collision(TYPE bigobject)) player1_shell_distance_traveled=300; END
        IF(collision(TYPE smallobject)) player1_shell_distance_traveled=300; END
        IF(collision(TYPE army_van)) player1_shell_distance_traveled=300; END
        IF(collision(TYPE army_turret_base)) player1_shell_distance_traveled=300; END
        FRAME(25);
    END
    z=-160;
    sound(s_explosion,player_save[1],256);
    crater(x,y);
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_man_1(x,y,distance_to_travle,march_angle)

PRIVATE
    army_man_1_distance_travled;
    army_man_1_notice_player1;
    army_man_1_can_fire;
    health;
    image;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-40;
    file=enemy_file;
    graph=100;
    health=2;
    army_man_1_notice_player1=FALSE;
    image=FALSE;
    shadow(enemy_file,106,3,4);
    radar_dot(63,-310,0);
        WHILE(health>0);
        army_man_1_can_fire+=1;
        IF(get_dist(id1)<340) army_man_1_notice_player1=TRUE; graph=100;
            ELSE army_man_1_notice_player1=FALSE;
        END
        IF(army_man_1_notice_player1==TRUE) angle=get_angle(id1)-40000; END
        IF(army_man_1_notice_player1==FALSE) image+=1; angle=march_angle; advance(2); army_man_1_distance_travled+=2; END
        IF(army_man_1_notice_player1==FALSE AND (graph=>105 OR graph<102)) graph=102; END
        IF(image>5) graph+=1; image=0; END
        IF(army_man_1_distance_travled>distance_to_travle) march_angle+=180000; army_man_1_distance_travled=0; END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_scream,player_save[1],256); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_scream,player_save[1],256); END
        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>20) graph=101; army_man_bullet(x,y,get_angle(id1)); army_man_1_can_fire=0; END
        FRAME;
    END
    signal(son,s_kill);
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS army_man_2(x,y,distance_to_travle,march_angle)

PRIVATE
    army_man_1_distance_travled;
    army_man_1_notice_player1;
    army_man_1_can_fire;
    health;
    image;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-40;
    file=enemy_file;
    graph=110;
    health=3;
    army_man_1_notice_player1=FALSE;
    image=0;
    shadow(enemy_file,116,3,4);
    radar_dot(63,-310,0);
        WHILE(health>0);
        army_man_1_can_fire+=1;
        IF(get_dist(id1)<340) army_man_1_notice_player1=TRUE; ELSE army_man_1_notice_player1=FALSE; END
        IF(army_man_1_notice_player1==TRUE) graph=100; angle=get_angle(id1); END
        IF(army_man_1_notice_player1==FALSE) image+=1; angle=march_angle; advance(2); army_man_1_distance_travled+=2; END
        IF(army_man_1_notice_player1==FALSE AND (graph=>115 OR graph<112)) graph=112; END
        IF(image>5) graph+=1; image=0; END
        IF(army_man_1_distance_travled>distance_to_travle) march_angle+=180000; army_man_1_distance_travled=0; END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_scream,player_save[1],256); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_scream,player_save[1],256); END
        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>4) graph=111; army_man_bullet(x,y,get_angle(id1)); army_man_1_can_fire=0; END
        FRAME;
    END
    signal(son,s_kill);
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS army_man_3(x,y)

PRIVATE
    army_man_1_notice_player1;
    army_man_1_can_fire;
    army_man_firing_graph;
    health;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-40;
    file=enemy_file;
    graph=120;
    army_man_1_notice_player1=FALSE;
    shadow(enemy_file,124,3,4);
    health=4;
    radar_dot(63,-310,0);
    FRAME;
        WHILE(health>0);
        army_man_1_can_fire+=1;
        IF(army_man_firing_graph==FALSE) graph=120; END
        IF(get_dist(id1)<340) army_man_1_notice_player1=TRUE; ELSE army_man_1_notice_player1=FALSE; END
        IF(army_man_1_notice_player1==TRUE) angle=get_angle(id1); END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_scream,player_save[1],256); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_scream,player_save[1],256); END
        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>50) army_man_firing_graph=TRUE; graph=121; army_man_missile(x,y,get_angle(id1)); army_man_1_can_fire=0; END
        IF(army_man_firing_graph==TRUE) graph+=1; END
        IF(graph=>123) graph=120; army_man_firing_graph=FALSE; END
        FRAME;
    END
    signal(son,s_kill);
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS army_man_4(x,y,distance_to_travle,march_angle)

PRIVATE
    army_man_1_distance_travled;
    army_man_1_notice_player1;
    army_man_1_can_fire;
    health;
    image;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-40;
    file=enemy_file;
    graph=130;
    health=5;
    army_man_1_notice_player1=FALSE;
    image=FALSE;
    shadow(enemy_file,116,3,4);
    radar_dot(63,-310,0);
        WHILE(health>0);
        army_man_1_can_fire+=1;
        IF(get_dist(id1)<340) army_man_1_notice_player1=TRUE; graph=130;
            ELSE army_man_1_notice_player1=FALSE;
        END
        IF(army_man_1_notice_player1==TRUE) angle=get_angle(id1)-40000; END
        IF(army_man_1_notice_player1==FALSE) image+=1; angle=march_angle; advance(2); army_man_1_distance_travled+=2; END
        IF(army_man_1_notice_player1==FALSE AND (graph=>105 OR graph<102)) graph=132; END
        IF(image>5) graph+=1; image=0; END
        IF(army_man_1_distance_travled>distance_to_travle) march_angle+=180000; army_man_1_distance_travled=0; END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_scream,player_save[1],256); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_scream,player_save[1],256); END
//        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>15) graph=131; army_man_bullet(x,y,get_angle(id1)); army_man_1_can_fire=0; END
        FRAME;
    END
    signal(son,s_kill);
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS splat(x,y);

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-15;
    file=enemy_file;
    graph=90;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS army_man_bullet(x,y,angle)

PRIVATE
    army_man_bullet_distance_travled;

BEGIN
    cnumber=c_1;
    sound(s_bullet,player_save[1],256);
    ctype=c_scroll;
    z=-60;
    file=weapons_file;
    graph=10;
    WHILE(army_man_bullet_distance_travled<600);
    advance(5);
    army_man_bullet_distance_travled+=5;
    IF(collision(TYPE bigobject)) army_man_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) army_man_bullet_distance_travled=600; END
    IF(collision(TYPE player1)) army_man_bullet_distance_travled=600; player1_C_armour-=1; END
    IF(collision(TYPE civilian1)) army_man_bullet_distance_travled=600; END
    FRAME(20);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_man_missile(x,y,angle)

PRIVATE
    army_missile_distance_travled;

BEGIN
    cnumber=c_1;
    sound(s_missile,player_save[1],256);
    ctype=c_scroll;
    z=-70;
    file=weapons_file;
    graph=20;
    FRAME;
        WHILE(army_missile_distance_travled<600);
        advance(10);
        army_missile_distance_travled+=10;
        IF(collision(TYPE army_turret_base)) army_missile_distance_travled=600; END
        IF(collision(TYPE player1)) army_missile_distance_travled=600; player1_C_armour-=10; END
        IF(collision(TYPE army_van))  army_missile_distance_travled=600; END
        IF(collision(TYPE bigobject)) army_missile_distance_travled=600; END
        FRAME(25);
    END
    z=-160;
    sound(s_explosion,player_save[1],256);
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS civilian1(x,y,distance_to_travle,angle)

PRIVATE
    civilian_1_distance_travled;
    civilian_1_notice_player1;
    civilian_1_alive;
    civilian_anomation;
    origonal;
    graph_random;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-40;
    file=enemy_file;
    civilian_1_notice_player1=FALSE;
    civilian_1_alive=TRUE;
    graph_random=rand(1,6);
    IF(graph_random==1) graph=200; END
    IF(graph_random==2) graph=210; END
    IF(graph_random==3) graph=220; END
    IF(graph_random==4) graph=230; END
    IF(graph_random==5) graph=240; END
    IF(graph_random==6) graph=250; END
    origonal=graph;
    shadow(enemy_file,208,3,4);
    radar_dot(61,-310,0);
    FRAME;
        WHILE(civilian_1_alive==TRUE);
        civilian_anomation+=1;
        angle+=rand(-10000,10000);
        IF(civilian_anomation>3 AND graph<origonal+7) graph+=1; civilian_anomation=0; END
        IF(graph==origonal+7) graph=origonal; END
        IF(get_dist(id1)<150) civilian_1_notice_player1=TRUE; ELSE civilian_1_notice_player1=FALSE; END
        IF(NOT collision(TYPE bigobject) AND NOT collision(TYPE water) AND NOT collision(TYPE garden_fence) AND civilian_1_notice_player1==TRUE) angle=get_angle(id1)-180000; advance(3); END
        IF(collision(TYPE bigobject)) angle-=135000; END
        IF(civilian_1_notice_player1==FALSE) angle=angle; advance(2); civilian_1_distance_travled+=2; END
        IF(civilian_1_distance_travled>distance_to_travle) angle+=180000; civilian_1_distance_travled=0; END
        IF(collision(TYPE army_man_bullet)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1_bullet)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1_shell)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1)) civilian_1_alive=FALSE; sound(s_scream,player_save[1],256); END
        IF(collision(TYPE player1_flail)) civilian_1_alive=FALSE; sound(s_scream,player_save[1],256); END
        IF(collision(TYPE army_man_1)) angle+=135000; END
        IF(collision(TYPE army_van)) angle+=135000; END
        IF(collision(TYPE bigobject)) angle+=135000; END
        IF(collision(TYPE smallobject)) angle+=135000; END
        IF(collision(TYPE army_turret_base)) angle+=135000; END
        IF(collision(TYPE water)) angle+=135000; END
        IF(collision(TYPE garden_fence)) angle+=135000; END
        FRAME;
    END
    signal(son,s_kill);
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS bigobject(file,graph,x,y,angle,shadow_file,shadow_graph,shadow_height2,radar_dot_graph)

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    z=-150;
    shadow(shadow_file,shadow_graph,shadow_height2,4);
    IF(radar_dot_graph>0) radar_dot(radar_dot_graph,-309,0); END
    IF(graph==100 AND random_terrain==2) graph=120; END
    IF(graph==102 AND random_terrain==2) graph=122; END
    IF(graph==104 AND random_terrain==2) graph=123; END
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS army_van(graph,x,y,angle,mooving,stop,distance_to_travle,health,turret)

PRIVATE
    distance_travled;
    army_van_1_stop;
    army_van_1_speed;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-48;
    file=enemy_file;
    IF(graph==50 OR graph==51) shadow(enemy_file,31,3,4); END
    IF(graph==52 OR graph==53) shadow(enemy_file,32,3,4); END
    army_van_1_stop=FALSE;
    army_van_1_speed=10;
    radar_dot(65,-310,0);
    IF(turret==1) army_turret_1(); END
        WHILE(health>0);
        IF(mooving==TRUE AND distance_travled<distance_to_travle AND army_van_1_stop==FALSE) advance(army_van_1_speed); distance_travled+=10; END
        IF(get_dist(id1)<150 AND stop==TRUE) army_van_1_stop=TRUE; END
        IF(collision(TYPE player1)) army_van_1_speed=0; ELSE army_van_1_speed=10; END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health-=20; END
//        IF(x<terrain_minx-300) signal(id,s_kill); END
//        IF(x>terrain_maxx+300) signal(id,s_kill); END
//        IF(y<terrain_miny-300) signal(id,s_kill); END
//        IF(y>terrain_maxy+300) signal(id,s_kill); END
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion,player_save[1],256);
    FILE=weapons_file;
    FROM graph=100 TO 114;
    FRAME(140);
//    blown_up_thing(stuff_file,59,x,y,angle);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_turret_1()

PRIVATE
    army_turret_1_can_fire;

BEGIN
    file=enemy_file;
    graph=30;
    cnumber=c_1;
    ctype=c_scroll;
    z=-48;
    LOOP
        x=father.x;
        y=father.y;
        army_turret_1_can_fire+=1;
        angle=get_angle(id1);
        IF(army_turret_1_can_fire>5 AND get_dist(id1)<340) graph=33; army_man_bullet(x,y,get_angle(id1)); army_turret_1_can_fire=0; ELSE graph=30; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS shadow(file,graph,shadow_height,flags);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    z=-20;
    WHILE(father.graph>0);
    x=father.x+shadow_height;
    y=father.y+shadow_height;
    angle=father.angle;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS road(file,graph,x,y,angle)

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-5;
    IF(graph==60) radar_dot(95,-309,4); END
    IF(graph==61) radar_dot(96,-309,4); END
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS army_helicopter(angle,x,y,health)

PRIVATE
    distance_traveled;
    army_helicopter_can_fire;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-170;
    file=enemy_file;
    graph=20;
    helicopter_blade(health);
    helicopter_shadow1();
    radar_dot(66,-312,0);
        WHILE(health>0);
        advance(8);
        distance_traveled+=8;
        army_helicopter_can_fire+=1;
        IF(distance_traveled>800) angle+=rand(80000,100000); distance_traveled=0; END
        IF(get_dist(id1)<350) sound(s_helicopter,player_save[1],256); END
        IF(get_dist(id1)<250 AND army_helicopter_can_fire>40) army_man_missile(x,y,get_angle(id1)); army_helicopter_can_fire=0; END
//        IF(collision(TYPE player1_anti_aircraft_missile)) health=0; END
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion,player_save[1],256);
    FILE=weapons_file;
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS helicopter_blade(health)

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-171;
    file=enemy_file;
    graph=21;
    helicopter_shadow2();
        WHILE(health>0);
        x=father.x;
        y=father.y;
        angle+=10000;
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion,player_save[1],256);
    FILE=weapons_file;
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS helicopter_shadow2()

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-169;
    file=enemy_file;
    graph=23;
    flags=4;
    size=70;
    LOOP
        x=father.x+60;
        y=father.y+60;
        angle=father.angle;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS helicopter_shadow1()

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-169;
    file=enemy_file;
    graph=22;
    flags=4;
    size=70;
    LOOP
        x=father.x+60;
        y=father.y+60;
        angle=father.angle;
        FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS water(graph,x,y);

PRIVATE
    coast;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=10;
    file=scenery_file;
    IF(graph==9); radar_dot(79,-308,0); END
    IF(graph==7); radar_dot(78,-308,0); END
    LOOP
    coast+=1;
    IF(graph==7 AND coast>10) coast=0; graph=8; END
    IF(graph==8 AND coast>10) coast=0; graph=7; END
    IF(graph==9 AND flags==0 AND coast>10) coast=0; flags=1; END
    IF(graph==9 AND flags==1 AND coast>10) coast=0; flags=0; END
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS garden(x,y,flags);

PRIVATE
    x_move;
    y_move;

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=scenery_file;
//    graph=133;
    graph=500;
    IF(flags==0) y-=100; y_move-=80; END
    IF(flags>0) y+=100; y_move-=100; END
    x_move=-100;

    radar_dot(88,-307,4);
    radar_dot(89,-308,flags);

    IF(flags==0);
    garden_fence(x_move+x+380-400,y_move+y+177-300,0);
    garden_fence(x_move+x+460-400,y_move+y+177-300,0);
    garden_fence(x_move+x+540-400,y_move+y+177-300,0);
    garden_fence(x_move+x+620-400,y_move+y+177-300,0);
    garden_fence(x_move+x+430-400,y_move+y+623-300,0);
    garden_fence(x_move+x+380-400,y_move+y+623-300,0);
    garden_fence(x_move+x+570-400,y_move+y+623-300,0);
    garden_fence(x_move+x+620-400,y_move+y+623-300,0);
    END

    IF(flags>0);
    garden_fence(x_move+x+380-400,y_move+y+623-300,0);
    garden_fence(x_move+x+460-400,y_move+y+623-300,0);
    garden_fence(x_move+x+540-400,y_move+y+623-300,0);
    garden_fence(x_move+x+620-400,y_move+y+623-300,0);
    garden_fence(x_move+x+430-400,y_move+y+177-300,0);
    garden_fence(x_move+x+380-400,y_move+y+177-300,0);
    garden_fence(x_move+x+570-400,y_move+y+177-300,0);
    garden_fence(x_move+x+620-400,y_move+y+177-300,0);
    END

    garden_fence(x_move+x+658-400,y_move+y+580-300,90000);
    garden_fence(x_move+x+658-400,y_move+y+500-300,90000);
    garden_fence(x_move+x+658-400,y_move+y+420-300,90000);
    garden_fence(x_move+x+658-400,y_move+y+340-300,90000);
    garden_fence(x_move+x+658-400,y_move+y+260-300,90000);
    garden_fence(x_move+x+658-400,y_move+y+216-300,90000);

    garden_fence(x_move+x+342-400,y_move+y+580-300,90000);
    garden_fence(x_move+x+342-400,y_move+y+500-300,90000);
    garden_fence(x_move+x+342-400,y_move+y+420-300,90000);
    garden_fence(x_move+x+342-400,y_move+y+340-300,90000);
    garden_fence(x_move+x+342-400,y_move+y+260-300,90000);
    garden_fence(x_move+x+342-400,y_move+y+216-300,90000);


    LOOP
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS garden_fence(x,y,angle);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=scenery_file;
    graph=130;
    z=-30;
    shadow(scenery_file,132,3,4);
    LOOP;
    IF(collision(TYPE player1)) graph=131; z=-6; signal(son,s_kill); END
    IF(collision(TYPE player1_shell))  graph=131; z=-6; signal(son,s_kill);  END
    IF(collision(TYPE player1_flail))  graph=131; z=-6; signal(son,s_kill);  END
    IF(collision(TYPE army_shell))  graph=131; z=-6;  signal(son,s_kill);  END
    IF(collision(TYPE army_man_missile))  graph=131; z=-6;  signal(son,s_kill);  END
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS army_turret_2()

PRIVATE
    army_turret_2_can_fire;

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-49;
    file=enemy_file;
    graph=41;
        x=father.x;
        y=father.y;
    WHILE(father.graph>0);
        army_turret_2_can_fire+=1;
        angle=get_angle(id1);
        IF(army_turret_2_can_fire>50 AND get_dist(id1)<350) graph=42; army_shell(x,y,angle); army_turret_2_can_fire=0; ELSE graph=41; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS army_turret_base(x,y,angle,armour)

BEGIN
    cnumber=c_1;
    file=enemy_file;
    graph=40;
    ctype=c_scroll;
    z=-48;
    army_turret_2();
    shadow(enemy_file,43,4,4);
    radar_dot(91,-310,0);
    FRAME;
        WHILE(armour>0);
        IF(collision(TYPE player1_bullet)) armour-=1; END
        IF(collision(TYPE player1_shell)) armour-=20; END
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion,player_save[1],256);
    FILE=weapons_file;
    FROM graph=100 TO 114;
    FRAME(140);
//    blown_up_thing(stuff_file,59,x,y,angle);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_shell(x,y,angle)

PRIVATE
    army_shell_distance_travled;

BEGIN
    sound(s_shell,player_save[1],256);
    cnumber=c_1;
    ctype=c_scroll;
    z=-70;
    file=weapons_file;
    graph=30;
    FRAME;
        WHILE(army_shell_distance_travled<200);
        advance(30);
        army_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) army_shell_distance_travled=300; END
        IF(collision(TYPE player1)) army_shell_distance_travled=600; player1_C_armour-=10; END
        IF(collision(TYPE army_van)) army_shell_distance_travled=600; END
        FRAME(75);
    END
    crater(x,y);
    z=-160;
    sound(s_explosion,player_save[1],256);
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS crater(x,y);

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    z=-8;
    file=weapons_file;
    graph=120;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS land_mine(x,y)

PRIVATE
    land_mine_active;

BEGIN
    land_mine_active=TRUE;
    cnumber=c_1;
    ctype=c_scroll;
    z=-35;
    file=weapons_file;
    graph=40;
    WHILE(land_mine_active==TRUE);
        IF(collision(TYPE player1)) land_mine_active=FALSE; player1_C_armour-=10; END
        IF(collision(TYPE player1_flail)) land_mine_active=FALSE; END
    FRAME;
    END
    z=-160;
    sound(s_explosion,player_save[1],256);
    crater(x,y);
    FILE=weapons_file;
    FROM graph=100 TO 114;
    FRAME(140);
    END
END

//-----------------------------------------------------------------------------

PROCESS smallobject(graph,x,y,angle,shadow_graph,shadow_height,radar_graph);

BEGIN
    cnumber=c_1;
    ctype=c_scroll;
    file=scenery_file;
    z=-150;
    radar_dot(radar_graph,-110,0);
    shadow(scenery_file,shadow_graph,shadow_height,4);
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------
