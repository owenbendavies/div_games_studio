
//-----------------------------------------------------------------------------
// TITLE:      OWEN GAMES
// AUTHOR:     OWEN DAVIES
// DATE:       OWEN GAMES 2001
//-----------------------------------------------------------------------------

PROGRAM owen_games_disk;

GLOBAL

//-----------------------------------------------------------------------------
// @ game options
//-----------------------------------------------------------------------------

    screen=604;
    new_screen;

    volume;
    frequency;

    game_cheats;

    rmain_file;
    rscenery_file;
    rman_file;
    renemy_file;
    reffects_file;
    rtitle_font;
    rmain_font;
    rsmall_font;
    s_tune;
    s_rain;
    s_thunder;
    s_shotgun;
    s_laser;
    s_missile;
    s_explosion;
    s_gun;
    s_flamer;
    s_jet;
    id5;
    info_text;
    player_invincible;
    player_health;
    player_death;
    player_level;
    player_enemy_killed;
    player_enemy_to_kill;
    player_total_enemy_killed;
    player_total_enemy_to_kill;
    boss_killed;
    level_cheat;
    player_cheater;
    player_bullets_x;
    player_bullets_y;
    player_fire_x;
    player_fire_y;
    player_missile_x;
    player_missile_y;
    chaingun_ammo;
    flamer_ammo;
    missile_ammo;

//-----------------------------------------------------------------------------

BEGIN
    set_mode(m640x480);
    set_fps(12,0);

    volume=100;
    frequency=256;

    game_cheats=FALSE;

    rmain_file=load_fpg("fpg\og\rmain.fpg");
    rscenery_file=load_fpg("fpg\og\rscenery.fpg");
    rman_file=load_fpg("fpg\og\rman.fpg");
    renemy_file=load_fpg("fpg\og\renemy.fpg");
    reffects_file=load_fpg("fpg\og\reffects.fpg");
    rtitle_font=load_fnt("fnt\og\rtitle.fnt");
    rmain_font=load_fnt("fnt\og\rmain.fnt");
    rsmall_font=load_fnt("fnt\og\rsmall.fnt");
    s_tune=load_pcm("pcm\og\tunes\rtune.pcm",1);
    s_rain=load_pcm("pcm\og\effects\rain.pcm",1);
    s_thunder=load_pcm("pcm\og\effects\thunder.pcm",0);
    s_laser=load_pcm("pcm\og\effects\laser.pcm",0);
    s_shotgun=load_pcm("pcm\og\effects\shotgun.pcm",0);
    s_missile=load_pcm("pcm\og\effects\missile.pcm",0);
    s_explosion=load_pcm("pcm\og\effects\blast.pcm",0);
    s_gun=load_pcm("pcm\og\effects\gun.pcm",0);
    s_flamer=load_pcm("pcm\og\effects\flamer.pcm",0);
    s_jet=load_pcm("pcm\og\effects\jet.pcm",0);

    LOOP
        SWITCH (screen);

            CASE 604: owen_games(); END
            CASE 605: robo_title(); END
            CASE 606: robo_options(); END
            CASE 607: cheat_menu(); END
            CASE 608: robo_dead(); END
            CASE 609: robo_level_complete(); END
            CASE 610: credits(); END
            CASE 611: robo_level01(); END
            CASE 612: robo_level02(); END
            CASE 613: robo_level03(); END
            CASE 614: robo_level04(); END

        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS pause();

PRIVATE
    text_pause;

BEGIN
    LOOP
    WHILE (NOT key(_f1));
        FRAME;
    END
    WHILE (key(_f1));
        FRAME;
    END
    text_pause=write(rmain_font,320,240,4,"PAUSED");
    FRAME;
    REPEAT
        UNTIL (key(_f1));
        delete_text(text_pause);
        WHILE (key(_f1));
        END
    END
END

//-----------------------------------------------------------------------------
//@robo-marines
//-----------------------------------------------------------------------------

PROCESS rain();

BEGIN
    sound(s_rain,volume+20,frequency);
    sound(s_tune,volume+70,frequency);
    file=rmain_file;
    graph=100;
    x=320;
    y=240;
    z=-600;
    LOOP
    graph+=1;
    IF(graph>102) graph=100; END
    IF(rand(1,20)==1) fade(150,150,150,64); sound(s_thunder,volume+rand(20,70),frequency);
        ELSE
        IF(player_health>30) fade(95,95,95,64); END
        IF(player_health<=30) fade(120,95,95,64); END
        IF(player_invincible==TRUE) fade(95,95,120,64); END
        END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS owen_games();

BEGIN
    mouse.file=rmain_file;
    mouse.graph=20;
    mouse.z=-512;
    rain();
    volume=50;
    load_pal("fpg\og\rmain.fpg");
    player_health=100;
    player_level=0;
    rain();
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=2;
    x=320;
    y=240;
    write(rmain_font,320,220,4,"OWEN GAMES (c) 2002");
    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.right) new_screen=605; END
        IF(key(_space) OR key(_enter) OR mouse.left) new_screen=605; END
        FRAME;
    END
    fade(200,200,200,64);
    sound(s_thunder,volume+70,frequency);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS credits();

BEGIN
    mouse.file=rmain_file;
    mouse.graph=20;
    mouse.z=-512;
    rain();
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=2;
    x=320;
    y=240;
    write(rmain_font,320,220,4,"CREATED BY OWEN DAVIES");
    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.right) exit("OWEN GAMES (c) 2002",0); END
        IF(key(_space) OR key(_enter) OR mouse.left) exit("OWEN GAMES (c) 2002",0); END
        FRAME;
    END
    fade(200,200,200,64);
    sound(s_thunder,volume+70,frequency);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------


PROCESS robo_title();

BEGIN
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=1;
    x=320;
    y=240;
    write(rtitle_font,320,240,4,"ROBO - MARINES");
    write(rsmall_font,320,452,4,"OWEN GAMES (c) 2002");
    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.right) new_screen=606; END
        IF(key(_space) OR key(_enter) OR mouse.left) new_screen=606; END
        FRAME;
    END
    fade(200,200,200,64);
    sound(s_thunder,volume+70,frequency);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS cheat_menu();

BEGIN
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=2;
    x=320;
    y=240;
    write(rtitle_font,320,100,4,"ROBO - MARINES");
    write(rmain_font,150,180,3,"ctrl+2 = CHAINGUN AMMO");
    write(rmain_font,150,220,3,"ctrl+3 = FLAMER AMMO");
    write(rmain_font,150,260,3,"ctrl+4 = MISSILE");
    write(rmain_font,150,300,3,"ctrl+0 = 100% HEALTH");
    write(rmain_font,150,340,3,"ctrl+8 = INVINCIBLE");
    write(rmain_font,150,380,3,"ctrl+9 = COMPLETE LEVLE");
    write(rsmall_font,320,452,4,"OWEN GAMES (c) 2002");
    FRAME;
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_space) OR key(_enter) OR mouse.left) new_screen=606; END
        IF(key(_esc)) new_screen=606; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_options();

BEGIN
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=1;
    x=320;
    y=240;
    write(rtitle_font,320,100,4,"ROBO - MARINES");
    write(rmain_font,320,180,4,"NEW GAME");
    write(rmain_font,320,220,4,"LOAD GAME");
    write(rmain_font,320,260,4,"CHEATS");
    write(rmain_font,320,300,4,"EXIT");
    write(rsmall_font,320,452,4,"OWEN GAMES (c) 2002");
    FRAME;
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_space) OR key(_enter) OR (mouse.left AND mouse.y>160 AND mouse.y<200)) new_screen=611; END
        IF(mouse.left AND mouse.y>200 AND mouse.y<240)
            load("dat\og\001.dat",&player_level);
            load("dat\og\002.dat",&player_enemy_killed);
            load("dat\og\003.dat",&player_enemy_to_kill);
            load("dat\og\004.dat",&player_total_enemy_killed);
            load("dat\og\005.dat",&player_total_enemy_to_kill);
            load("dat\og\006.dat",&chaingun_ammo);
            load("dat\og\007.dat",&flamer_ammo);
            load("dat\og\008.dat",&missile_ammo);
            load("dat\og\009.dat",&player_health);
            load("dat\og\010.dat",&level_cheat);
            load("dat\og\011.dat",&player_cheater);
            IF(player_level>0) new_screen=609; END
        END
        IF(mouse.left AND mouse.y>240 AND mouse.y<280) new_screen=607; END
        IF(key(_esc) OR (mouse.left AND mouse.y>280 AND mouse.y<320)) new_screen=610; END
        FRAME;
    END
    clear_screen();

    IF(new_screen<>607);
    volume=100;
    signal(TYPE rain,s_kill);
    stop_sound(all_sound);
    END
    delete_text(all_text);

    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_dead();

BEGIN
    player_health=100;
    screen=0;
    new_screen=0;
    file=rscenery_file;
    graph=10;
    x=320;
    y=100;
    rain();
    write(rmain_font,320,240,4,"GAME OVER");
    FRAME;
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.right) new_screen=604; END
        IF(key(_space) OR key(_enter) OR mouse.left) new_screen=604; END
        FRAME;
    END
    clear_screen();
    signal(TYPE rain,s_kill);
    delete_text(all_text);
    stop_sound(all_sound);
    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_level_complete();

BEGIN
    mouse.file=rmain_file;
    mouse.graph=20;
    mouse.z=-512;
    screen=0;
    new_screen=0;
    file=rscenery_file;
    graph=10;
    x=320;
    y=100;

    rain();
    write(rmain_font,320,200,4,"NUMBER OF ENEMY KILLED");
    write_int(rmain_font,310,250,5,& player_enemy_killed);
    write(rmain_font,320,250,4,"/");
    write_int(rmain_font,330,250,3,& player_enemy_to_kill);

    IF(player_enemy_killed>5 OR level_cheat==TRUE)
            player_total_enemy_killed+=player_enemy_killed;
            player_total_enemy_to_kill+=player_enemy_to_kill;
            write(rmain_font,320,300,4,"TOTAL NUMBER OF ENEMY KILLED");
            write_int(rmain_font,310,350,5,& player_total_enemy_killed);
            write(rmain_font,320,350,4,"/");
            write_int(rmain_font,330,350,3,& player_total_enemy_to_kill);
        IF(player_level<4)
            write(rtitle_font,320,50,4,"LEVEL   ");
            write(rtitle_font,320,130,4,"COMPLETET");
            write_int(rtitle_font,480,50,4,& player_level);
            write(rmain_font,160,420,4,"DON'T SAVE");
            write(rmain_font,480,420,4,"SAVE");
        END
        IF(player_level==4 AND player_cheater==FALSE)
            write(rtitle_font,320,50,4,"DEMO");
            write(rtitle_font,320,130,4,"COMPLETE");
        END
        IF(player_level==4 AND player_cheater==TRUE)
            write(rtitle_font,320,50,4,"CHEATER");
            write(rmain_font,320,420,4,"NOW TRY WITHOUT CHEATS");
        END
    END

    IF(player_enemy_killed<6 AND level_cheat==FALSE)
        write(rmain_font,320,420,4,"DID NOT KILL ENOUGH ENEMY");
        write(rtitle_font,320,50,4,"LEVEL NOT");
        write(rtitle_font,320,130,4,"COMPLETET");
    END

    FRAME;
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.right) new_screen=604; END
        IF(player_enemy_killed>5 OR level_cheat==TRUE)
            IF(key(_space) OR (mouse.left AND mouse.x<320 AND mouse.y>380))
                IF(player_level==1) new_screen=612; END
                IF(player_level==2) new_screen=613; END
                IF(player_level==3) new_screen=614; END
                IF(player_level==4 AND player_cheater==FALSE)
                    player_level=0;
                    save("dat\og\001.dat",&player_level,1);
                    save("dat\og\011.dat",&player_cheater,1);
                    new_screen=604;
                END
                IF(player_level==4 AND player_cheater==TRUE)
                    player_level=0;
                    save("dat\og\001.dat",&player_level,1);
                    save("dat\og\011.dat",&player_cheater,1);
                    new_screen=611;
                END
            END
            IF(key(_enter) OR (mouse.left AND mouse.x>320 AND mouse.y>380))
                IF(player_level==4)
                    player_level=0;
                    save("dat\og\001.dat",&player_level,1);
                    save("dat\og\011.dat",&player_cheater,1);
                    new_screen=611;
                    IF(player_cheater==TRUE) new_screen=611; END
                    IF(player_cheater==FALSE) new_screen=604; END
                END
                save("dat\og\001.dat",&player_level,1);
                save("dat\og\002.dat",&player_enemy_killed,1);
                save("dat\og\003.dat",&player_enemy_to_kill,1);
                save("dat\og\004.dat",&player_total_enemy_killed,1);
                save("dat\og\005.dat",&player_total_enemy_to_kill,1);
                save("dat\og\006.dat",&chaingun_ammo,1);
                save("dat\og\007.dat",&flamer_ammo,1);
                save("dat\og\008.dat",&missile_ammo,1);
                save("dat\og\009.dat",&player_health,1);
                save("dat\og\010.dat",&level_cheat,1);
                save("dat\og\011.dat",&player_cheater,1);
                IF(player_level==1) new_screen=612; END
                IF(player_level==2) new_screen=613; END
                IF(player_level==3) new_screen=614; END
            END
        END
        IF(player_enemy_killed<6 AND level_cheat==FALSE)
            IF(key(_space) OR (mouse.left AND mouse.y>380))
                IF(player_level==1) new_screen=611; END
                IF(player_level==2) new_screen=612; END
                IF(player_level==3) new_screen=613; END
                IF(player_level==4) new_screen=614; END
            END
        END

        FRAME;
    END
    clear_screen();
    signal(TYPE rain,s_kill);
    delete_text(all_text);
    stop_sound(all_sound);
    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_level01();

PRIVATE;
    foreground_graph;
    foreground_number;

BEGIN
    player_cheater=FALSE;
    player_invincible=FALSE;
    player_level=1;
    screen=0;
    new_screen=0;

    id5=player();
    rain();
    pause();
    m7.height=400;
    m7.distance=30;
    start_mode7(0,rscenery_file,1,1,0,200);
    player_enemy_killed=0;
    player_enemy_to_kill=10;
    player_total_enemy_killed=0;
    player_total_enemy_to_kill=0;

    crate(42,2700,200);

    chaingun_ammo=0;
    flamer_ammo=0;
    missile_ammo=0;
    player_health=100;
    player_death=FALSE;

    enemy1(TRUE,0,1000,0,100);
    enemy1(FALSE,0,1050,150,100);
    enemy1(FALSE,0,2050,-150,100);
    enemy1(TRUE,0,1500,-200,100);
    enemy1(FALSE,0,1200,-100,100);
    enemy1(FALSE,0,2900,0,100);
    enemy1(TRUE,1100,2900,150,100);
    enemy1(TRUE,2200,2900,-200,100);
    enemy1(TRUE,0,2900,0,100);
    enemy1(FALSE,0,2800,-100,100);

    enemy_plane(7000,0);
    enemy_plane(20000,0);
    enemy_plane(21000,-300);
    enemy_plane(21000,300);

    object(rscenery_file,125,1000,100,0);
    object(rscenery_file,125,1000,150,0);
    object(rscenery_file,125,1000,200,0);
    object(rscenery_file,125,2000,-100,0);
    object(rscenery_file,125,2000,-150,0);
    object(rscenery_file,125,2000,-200,0);

    object(rscenery_file,130,2990,-500,0);
    object(rscenery_file,130,2990,500,0);
    object(rscenery_file,130,2000,-600,0);
    object(rscenery_file,130,1000,-650,0);
    object(rscenery_file,130,1400,700,0);
    object(rscenery_file,130,4000,-200,0);

    object(rscenery_file,100,2200,450,0);
    object(rscenery_file,100,3700,300,0);

    wall(rscenery_file,116,3000,0,0);
    wall(rscenery_file,115,3000,200,0);
    wall(rscenery_file,115,3000,-200,0);
    wall(rscenery_file,115,3000,500,0);
    wall(rscenery_file,115,3000,-500,0);
    wall(rscenery_file,115,3000,800,0);
    wall(rscenery_file,115,3000,-800,0);

    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=604; END
        IF(player_death==TRUE) new_screen=608; END
        IF(player_enemy_killed>5 AND id5.x>3000) new_screen=609; END
        IF(player_enemy_killed>5) info_text=90; END

        stop_scroll(9);
        start_scroll(9,rscenery_file,foreground_graph,10,0,15);
        foreground_number+=1;
        IF(foreground_number>9) foreground_number=1; END
            SWITCH (foreground_number);
                CASE 1: foreground_graph=20; END
                CASE 2: foreground_graph=20; END
                CASE 3: foreground_graph=22; END
                CASE 4: foreground_graph=23; END
                CASE 5: foreground_graph=24; END
                CASE 6: foreground_graph=25; END
                CASE 7: foreground_graph=26; END
                CASE 8: foreground_graph=27; END
                CASE 9: foreground_graph=20; END
                CASE 10: foreground_graph=20; END
            END

        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    stop_scroll(9);
    stop_mode7(0);
    stop_sound(all_sound);
    mouse.graph=0;
    player_invincible=FALSE;

    signal(TYPE cheats,s_kill);
    signal(TYPE rain,s_kill);
    signal(TYPE pause,s_kill);
    signal(id5,s_kill);
    signal(TYPE player,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE player_bullets,s_kill);
    signal(TYPE player_fire,s_kill);
    signal(TYPE player_missile,s_kill);
    signal(TYPE enemy1,s_kill);
    signal(TYPE enemy2,s_kill);
    signal(TYPE enemy3,s_kill);
    signal(TYPE enemy_legs,s_kill);
    signal(TYPE enemy_plane,s_kill);
    signal(TYPE robo_land_mine,s_kill);
    signal(TYPE crate,s_kill);
    signal(TYPE laser_blast,s_kill);
    signal(TYPE object,s_kill);

    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_level02();

PRIVATE;
    foreground_graph;
    foreground_number;

BEGIN
    player_invincible=FALSE;
    player_level=2;
    screen=0;
    new_screen=0;

    id5=player();
    rain();
    pause();
    m7.height=400;
    m7.distance=30;
    start_mode7(0,rscenery_file,1,1,0,200);
    player_enemy_killed=0;
    player_enemy_to_kill=12;

    player_death=FALSE;

    enemy1(TRUE,0,1000,0,100);
    enemy1(FALSE,0,1050,-150,100);
    enemy1(TRUE,0,2000,-270,100);
    enemy1(TRUE,0,2800,-50,100);
    enemy1(TRUE,0,2800,50,100);
    enemy1(FALSE,0,2800,0,100);
    enemy1(FALSE,0,3300,-200,100);
    enemy1(FALSE,0,3400,200,100);
    enemy1(FALSE,0,3900,0,100);
    enemy1(TRUE,0,3900,250,100);
    enemy1(TRUE,0,3900,-150,100);

    enemy2(3800,-200,100);

    enemy_plane(7000,0);
    enemy_plane(20000,0);
    enemy_plane(21000,-300);
    enemy_plane(21000,300);

    robo_land_mine(600,-100);
    robo_land_mine(3500,-200);
    robo_land_mine(3200,250);
    robo_land_mine(2000,0);

    crate(100,1400,290);
    crate(2,2200,-200);
    crate(100,3400,250);
    crate(41,3800,-300);
    crate(45,2000,300);

    object(rscenery_file,125,1000,-100,0);
    object(rscenery_file,125,1000,-150,0);
    object(rscenery_file,125,1000,-200,0);

    object(rscenery_file,100,1800,450,0);
    object(rscenery_file,100,3000,0,0);
    object(rscenery_file,100,4500,-200,0);

    object(rscenery_file,130,2000,-400,0);
    object(rscenery_file,130,3000,656,0);

    wall(rscenery_file,110,5000,0,0);
    wall(rscenery_file,110,5000,550,0);
    wall(rscenery_file,110,5000,-550,0);
    wall(rscenery_file,110,5000,1100,0);
    wall(rscenery_file,110,5000,-1100,0);
    wall(rscenery_file,116,4000,0,0);
    wall(rscenery_file,115,4000,200,0);
    wall(rscenery_file,115,4000,-200,0);
    wall(rscenery_file,115,4000,500,0);
    wall(rscenery_file,115,4000,-500,0);
    wall(rscenery_file,115,4000,800,0);
    wall(rscenery_file,115,4000,-800,0);

    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=604; END
        IF(player_death==TRUE) new_screen=608; END
        IF(id5.x>4100) new_screen=609; END

        stop_scroll(9);
        start_scroll(9,rscenery_file,foreground_graph,10,0,15);
        foreground_number+=1;
        IF(foreground_number>9) foreground_number=1; END
            SWITCH (foreground_number);
                CASE 1: foreground_graph=20; END
                CASE 2: foreground_graph=20; END
                CASE 3: foreground_graph=22; END
                CASE 4: foreground_graph=23; END
                CASE 5: foreground_graph=24; END
                CASE 6: foreground_graph=25; END
                CASE 7: foreground_graph=26; END
                CASE 8: foreground_graph=27; END
                CASE 9: foreground_graph=20; END
                CASE 10: foreground_graph=20; END
            END

        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    stop_scroll(9);
    stop_mode7(0);
    stop_sound(all_sound);
    mouse.graph=0;
    player_invincible=FALSE;

    signal(TYPE cheats,s_kill);
    signal(TYPE rain,s_kill);
    signal(TYPE pause,s_kill);
    signal(id5,s_kill);
    signal(TYPE player,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE player_bullets,s_kill);
    signal(TYPE player_fire,s_kill);
    signal(TYPE player_missile,s_kill);
    signal(TYPE enemy1,s_kill);
    signal(TYPE enemy2,s_kill);
    signal(TYPE enemy3,s_kill);
    signal(TYPE enemy_legs,s_kill);
    signal(TYPE enemy_plane,s_kill);
    signal(TYPE robo_land_mine,s_kill);
    signal(TYPE crate,s_kill);
    signal(TYPE laser_blast,s_kill);
    signal(TYPE object,s_kill);

    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_level03();

PRIVATE;
    foreground_graph;
    foreground_number;

BEGIN
    player_invincible=FALSE;
    player_level=3;
    screen=0;
    new_screen=0;

    id5=player();
    rain();
    pause();
    m7.height=400;
    m7.distance=30;
    start_mode7(0,rscenery_file,1,1,0,200);
    player_enemy_killed=0;
    player_enemy_to_kill=18;

    enemy1(FALSE,0,1300,-50,100);
    enemy1(FALSE,0,1300,50,100);
    enemy1(TRUE,1600,2400,-50,100);
    enemy1(TRUE,1600,2400,50,100);
    enemy1(FALSE,0,2600,-350,100);
    enemy1(TRUE,2000,3600,-310,100);
    enemy1(TRUE,2000,3400,300,100);
    enemy1(TRUE,2800,4000,200,100);
    enemy1(TRUE,2800,4200,-300,100);
    enemy1(FALSE,0,3700,100,100);

    enemy2(2200,0,100);
    enemy2(3400,-100,100);

    enemy3(FALSE,0,1000,0,200);
    enemy3(FALSE,0,1000,-100,200);
    enemy3(FALSE,0,1000,100,200);
    enemy3(FALSE,0,3300,0,200);
    enemy3(FALSE,0,3200,-100,200);
    enemy3(FALSE,0,3150,100,200);

    enemy_plane(8000,0);
    enemy_plane(22000,0);
    enemy_plane(24000,-300);
    enemy_plane(24000,300);

    crate(3,1650,250);
    crate(100,2500,-350);
    crate(200,3800,0);
    crate(41,3800,150);
    crate(2,3800,-150);
    crate(45,1650,-250);

    robo_land_mine(600,10);
    robo_land_mine(2800,340);
    robo_land_mine(3400,300);
    robo_land_mine(3300,-300);

    object(rscenery_file,130,1500,-600,0);
    object(rscenery_file,130,1500,600,0);
    object(rscenery_file,130,2500,0,0);
    object(rscenery_file,130,2500,-700,0);
    object(rscenery_file,130,3500,-700,0);
    object(rscenery_file,130,2500,700,0);
    object(rscenery_file,130,3500,700,0);

    object(rscenery_file,100,3500,-200,0);

    wall(rscenery_file,116,1510,0,0);
    wall(rscenery_file,115,1510,200,0);
    wall(rscenery_file,115,1510,-200,0);
    wall(rscenery_file,115,1510,500,0);
    wall(rscenery_file,115,1510,-500,0);
    wall(rscenery_file,115,1510,800,0);
    wall(rscenery_file,115,1510,-800,0);

    wall(rscenery_file,110,4000,0,0);
    wall(rscenery_file,110,4000,550,0);
    wall(rscenery_file,110,4000,-550,0);
    wall(rscenery_file,110,4000,1100,0);
    wall(rscenery_file,110,4000,-1100,0);

    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=604; END
        IF(player_death==TRUE) new_screen=608; END

        stop_scroll(9);
        start_scroll(9,rscenery_file,foreground_graph,10,0,15);
        foreground_number+=1;
        IF(foreground_number>9) foreground_number=1; END
            SWITCH (foreground_number);
                CASE 1: foreground_graph=20; END
                CASE 2: foreground_graph=20; END
                CASE 3: foreground_graph=22; END
                CASE 4: foreground_graph=23; END
                CASE 5: foreground_graph=24; END
                CASE 6: foreground_graph=25; END
                CASE 7: foreground_graph=26; END
                CASE 8: foreground_graph=27; END
                CASE 9: foreground_graph=20; END
                CASE 10: foreground_graph=20; END
            END

        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    stop_scroll(9);
    stop_mode7(0);
    stop_sound(all_sound);
    mouse.graph=0;
    player_invincible=FALSE;

    signal(TYPE cheats,s_kill);
    signal(TYPE rain,s_kill);
    signal(TYPE pause,s_kill);
    signal(id5,s_kill);
    signal(TYPE player,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE player_bullets,s_kill);
    signal(TYPE player_fire,s_kill);
    signal(TYPE player_missile,s_kill);
    signal(TYPE enemy1,s_kill);
    signal(TYPE enemy2,s_kill);
    signal(TYPE enemy3,s_kill);
    signal(TYPE enemy_legs,s_kill);
    signal(TYPE enemy_plane,s_kill);
    signal(TYPE robo_land_mine,s_kill);
    signal(TYPE crate,s_kill);
    signal(TYPE laser_blast,s_kill);
    signal(TYPE object,s_kill);

    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS robo_level04();

PRIVATE;
    foreground_graph;
    foreground_number;

BEGIN
    player_invincible=FALSE;
    player_level=4;
    screen=0;
    new_screen=0;

    id5=player();
    rain();
    pause();
    m7.height=400;
    m7.distance=30;
    start_mode7(0,rscenery_file,1,1,0,200);
    player_enemy_killed=0;
    player_enemy_to_kill=15;

    crate(2,200,-50);

    boss1(2000,0,1000);

    enemy1(TRUE,1200,1400,50,100);
    enemy1(TRUE,1200,1400,150,100);
    enemy1(TRUE,1200,1400,-50,100);
    enemy1(TRUE,1200,1400,-150,100);

    enemy3(TRUE,1500,1800,0,200);
    enemy3(TRUE,1500,1800,100,200);
    enemy3(TRUE,1500,1800,200,200);
    enemy3(TRUE,1500,1800,-100,200);
    enemy3(TRUE,1500,1800,-200,200);
    enemy3(TRUE,1000,1200,0,200);
    enemy3(TRUE,1000,1200,100,200);
    enemy3(TRUE,1000,1200,200,200);
    enemy3(TRUE,1000,1200,-100,200);
    enemy3(TRUE,1000,1200,-200,200);

    enemy_plane(8000,0);
    enemy_plane(22000,0);
    enemy_plane(24000,-300);
    enemy_plane(24000,300);

    object(rscenery_file,100,2200,300,0);
    object(rscenery_file,100,2200,-300,0);

    object(rscenery_file,130,1500,-600,0);
    object(rscenery_file,130,1500,600,0);
    object(rscenery_file,130,1000,-600,0);
    object(rscenery_file,130,1000,600,0);

    wall(rscenery_file,110,2500,0,0);
    wall(rscenery_file,110,2500,550,0);
    wall(rscenery_file,110,2500,-550,0);
    wall(rscenery_file,110,2500,1100,0);
    wall(rscenery_file,110,2500,-1100,0);

    FRAME;
        fade_on();
        fade(90,90,90,64);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=604; END
        IF(player_death==TRUE) new_screen=608; END
        IF(boss_killed==TRUE) new_screen=609; END

        stop_scroll(9);
        start_scroll(9,rscenery_file,foreground_graph,10,0,15);
        foreground_number+=1;
        IF(foreground_number>9) foreground_number=1; END
            SWITCH (foreground_number);
                CASE 1: foreground_graph=20; END
                CASE 2: foreground_graph=20; END
                CASE 3: foreground_graph=22; END
                CASE 4: foreground_graph=23; END
                CASE 5: foreground_graph=24; END
                CASE 6: foreground_graph=25; END
                CASE 7: foreground_graph=26; END
                CASE 8: foreground_graph=27; END
                CASE 9: foreground_graph=20; END
                CASE 10: foreground_graph=20; END
            END

        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    stop_scroll(9);
    stop_mode7(0);
    stop_sound(all_sound);
    mouse.graph=0;
    player_invincible=FALSE;

    signal(TYPE cheats,s_kill);
    signal(TYPE rain,s_kill);
    signal(TYPE pause,s_kill);
    signal(id5,s_kill);
    signal(TYPE player,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE player_bullets,s_kill);
    signal(TYPE player_fire,s_kill);
    signal(TYPE player_missile,s_kill);
    signal(TYPE enemy1,s_kill);
    signal(TYPE enemy2,s_kill);
    signal(TYPE enemy3,s_kill);
    signal(TYPE enemy_legs,s_kill);
    signal(TYPE enemy_plane,s_kill);
    signal(TYPE robo_land_mine,s_kill);
    signal(TYPE crate,s_kill);
    signal(TYPE laser_blast,s_kill);
    signal(TYPE object,s_kill);

    fade_off();
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS cheats()

BEGIN
    LOOP
        IF(key(_control) AND key(_2)) chaingun_ammo+=10; info_text=2; player_cheater=TRUE; END
        IF(key(_control) AND key(_3)) flamer_ammo+=10; info_text=3; player_cheater=TRUE;  END
        IF(key(_control) AND key(_4)) missile_ammo+=10; info_text=4; player_cheater=TRUE;  END
        IF(key(_control) AND key(_0)) player_health=100; info_text=10; player_cheater=TRUE;  END
        IF(key(_control) AND key(_8)) player_invincible=TRUE; player_cheater=TRUE;  END
        IF(key(_control) AND key(_9)) new_screen=609; level_cheat=TRUE; player_cheater=TRUE;  END
        IF(key(_control) AND key(_up)) id5.x+=100; player_cheater=TRUE;  END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player()

PRIVATE;

    out_of_region_text;
    death_timer;
    too_close_text;

BEGIN
    m7.camera=id;
    ctype=c_m7;
    player_weapon();
    player_bar();
    cheats();
    x=0;
    y=0;
    out_of_region_text=write(rmain_font,320,-1000,4,"RETURN TO MISSION");
    too_close_text=write(rmain_font,320,-1000,4,"DON'T GET TOO CLOSE");
    FRAME;
        WHILE(player_health>0);

        IF(key(_up)) x+=15; END
        IF(key(_down)) x-=10; END
        IF(key(_left)) y-=10; END
        IF(key(_right)) y+=10; END

        IF(player_level==1)

            IF(x>900 AND x<1100 AND y>75 AND y<225) x=900; END
            IF(x>920 AND x<1120 AND y>75 AND y<225) x=1120; END
            IF(x>920 AND x<1100 AND y>65 AND y<225) y=65; END
            IF(x>920 AND x<1100 AND y>75 AND y<235) y=235; END

            IF(x>1900 AND x<2100 AND y<-75 AND y>-225) x=1900; END
            IF(x>1920 AND x<2120 AND y<-75 AND y>-225) x=1120; END
            IF(x>1920 AND x<2100 AND y<-65 AND y>-225) y=-65; END
            IF(x>1920 AND x<2100 AND y<-75 AND y>-235) y=-235; END

            IF(y<-300) y=-300; move_text(out_of_region_text,320,240); END
            IF(y>300) y=300; move_text(out_of_region_text,320,240); END
            IF(x<-20) x=-20; move_text(out_of_region_text,320,240); END
            IF(y>-280 AND y<280 AND x=>0) move_text(out_of_region_text,320,-1000); END
            IF(player_enemy_killed<6 AND x>2950) x=2950; info_text=90; END
            IF(player_enemy_killed>5 AND x>2950 AND (y<-40 OR y>40)) x=2950; END
        END

        IF(player_level==2)
            IF(x>1850 AND x<2100 AND y<-110) x=1850; END
            IF(x>1900 AND x<2150 AND y<-110) x=2150; END
            IF(x>1900 AND x<2100 AND y<-100) y=-100; END

            IF(x>900 AND x<1100 AND y<-75 AND y>-225) x=900; END
            IF(x>920 AND x<1120 AND y<-75 AND y>-225) x=1120; END
            IF(x>920 AND x<1100 AND y<-65 AND y>-225) y=-65; END
            IF(x>920 AND x<1100 AND y<-75 AND y>-235) y=-235; END

            IF(x>2850 AND x<3080 AND y<110 AND y>-110) x=2850; END
            IF(x>2870 AND x<3100 AND y<110 AND y>-110) x=3100; END
            IF(x>2870 AND x<3080 AND y<120 AND y>-110) y=120; END
            IF(x>2870 AND x<3080 AND y<110 AND y>-120) y=-120; END

            IF(y<-300) y=-300; move_text(out_of_region_text,320,240); END
            IF(y>300) y=300; move_text(out_of_region_text,320,240); END
            IF(x<-20) x=-20; move_text(out_of_region_text,320,240); END
            IF(y>-280 AND y<280 AND x=>0) move_text(out_of_region_text,320,-1000); END
            IF(x>3950 AND (y<-40 OR y>40)) x=3950; END
        END

        IF(player_level==3)

            IF(x>2350 AND x<2530 AND y<270 AND y>-270) x=2350; END
            IF(x>2370 AND x<2550 AND y<270 AND y>-270) x=2550; END
            IF(x>2370 AND x<2530 AND y<300 AND y>-270) y=300; END
            IF(x>2370 AND x<2530 AND y<270 AND y>-300) y=-300; END

            IF(y<-350) y=-350; move_text(out_of_region_text,320,240); END
            IF(y>350) y=350; move_text(out_of_region_text,320,240); END
            IF(x<-20) x=-20; move_text(out_of_region_text,320,240); END
            IF(y>-330 AND y<330 AND x=>0) move_text(out_of_region_text,320,-1000); END
            IF(x>1450 AND x<1500 AND (y<-40 OR y>40)) x=1450; END
            IF(x>1500 AND x<1550 AND (y<-40 OR y>40)) x=1550; END
            IF(x>3950) x=3950; END
        END

        IF(player_level==4)

            IF(y<-300) y=-300; move_text(out_of_region_text,320,240); END
            IF(y>300) y=300; move_text(out_of_region_text,320,240); END
            IF(x<-20) x=-20; move_text(out_of_region_text,320,240); END
            IF(y>-280 AND y<280 AND x=>0) move_text(out_of_region_text,320,-1000); END
            IF(x>1700) x=1700; move_text(too_close_text,320,200); END
            IF(x<1680) move_text(too_close_text,320,-100); END
        END

        FRAME;
    END
    player_death=TRUE;
END

//-----------------------------------------------------------------------------

PROCESS player_weapon()

PRIVATE;

    gun_timer;
    gun_selected;
    gun_graph;
    gun_animation_type;
    frame_speed;
    firing_angle;

BEGIN
    mouse.file=rmain_file;
    mouse.graph=20;
    mouse.x=340;
    mouse.y=220;
    mouse.z=-254;
    file=rman_file;
    x=390;
    y=295;
    z=-255;
    gun_timer=9;
    gun_selected=1;
    gun_animation_type=1;
    frame_speed=100;
    FRAME;
        WHILE(player_health>0);
            gun_timer+=1;

            mouse.y=220;
            IF(mouse.x<280) mouse.x=280; END
            IF(mouse.x>370) mouse.x=370; END

            IF(mouse.x<340) firing_angle=fget_dist(mouse.x,mouse.y,340,220)*100; END
            IF(mouse.x=>340) firing_angle=-fget_dist(mouse.x,mouse.y,340,220)*100; END

            IF(gun_selected==1) frame_speed=100; x=400; y=335; END
            IF(gun_selected==2) frame_speed=40;  x=400; y=375; END
            IF(gun_selected==3) frame_speed=120; x=320; y=375; END
            IF(gun_selected==4) frame_speed=100; x=450; y=300; END

            IF(chaingun_ammo==0 AND flamer_ammo==0 AND missile_ammo==0) gun_selected=1; END
            IF(chaingun_ammo>0 AND flamer_ammo==0 AND missile_ammo==0) gun_selected=2; END
            IF(flamer_ammo>0 AND missile_ammo==0) gun_selected=3; END
            IF(missile_ammo>0) gun_selected=4; END

            IF(gun_selected==1 AND (key(_space) OR mouse.left) AND gun_timer>8) sound(s_shotgun,volume+50,frequency); gun_timer=0; gun_animation_type=2; player_bullets(800,firing_angle,id5.x+40,id5.y+20);  END
            IF(gun_selected==2 AND chaingun_ammo>0 AND (key(_space) OR mouse.left) AND gun_timer>2) sound(s_gun,volume+50,frequency); gun_timer=0; gun_animation_type=3; player_bullets(1200,firing_angle,id5.x+40,id5.y+20); chaingun_ammo-=1; END
            IF(gun_selected==3 AND flamer_ammo>0 AND (key(_space) OR mouse.left)) sound(s_flamer,volume+50,frequency); gun_timer=0; gun_animation_type=4; player_fire(400,firing_angle,id5.x+80,id5.y+rand(0,40)); flamer_ammo-=1; END
            IF(gun_selected==4 AND missile_ammo>0 AND (key(_space) OR mouse.left) AND gun_timer>8) sound(s_missile,volume+200,frequency); gun_timer=0; gun_animation_type=5; player_missile(1200,firing_angle,id5.x+40,id5.y+20); missile_ammo-=1; END

            IF(gun_selected==1 AND NOT (gun_animation_type==2 OR gun_animation_type==1)) gun_graph=1; END
            IF(gun_animation_type==1 AND gun_selected==1) gun_graph=1; END
            IF(gun_animation_type==2 AND gun_selected==1) gun_graph+=1; END
            IF(gun_animation_type==2 AND gun_selected==1 AND gun_graph>7) gun_animation_type=1; END

            IF(gun_selected==2 AND NOT (gun_animation_type==3 OR gun_animation_type==1)) gun_graph=10; END
            IF(gun_animation_type==1 AND gun_selected==2) gun_graph=10; END
            IF(gun_animation_type==3 AND gun_selected==2) gun_graph+=1; END
            IF(gun_animation_type==3 AND gun_selected==2 AND gun_graph>14) gun_animation_type=1; END

            IF(gun_selected==3 AND NOT (gun_animation_type==4 OR gun_animation_type==1)) gun_graph=20; END
            IF(gun_animation_type==1 AND gun_selected==3) gun_graph=20; END
            IF(gun_animation_type==4 AND gun_selected==3) gun_graph+=1; END
            IF(gun_animation_type==4 AND gun_selected==3 AND gun_graph>27) gun_animation_type=1; gun_graph=20; END

            IF(gun_selected==4 AND NOT (gun_animation_type==5 OR gun_animation_type==1)) gun_graph=30; END
            IF(gun_animation_type==1 AND gun_selected==4) gun_graph=30; END
            IF(gun_animation_type==5 AND gun_selected==4) gun_graph+=1; END
            IF(gun_animation_type==5 AND gun_selected==4 AND gun_graph>33) gun_animation_type=1; END

            SWITCH (gun_graph);
                CASE 1: graph=1; END
                CASE 2: graph=2; END
                CASE 3: graph=3; END
                CASE 4: graph=2; END
                CASE 5: graph=4; END
                CASE 6: graph=5; END
                CASE 7: graph=4; END
                CASE 10: graph=11; END
                CASE 11: graph=12; END
                CASE 12: graph=13; END
                CASE 13: graph=14; END
                CASE 14: graph=15; END
                CASE 20: graph=21; END
                CASE 21: graph=22; END
                CASE 22: graph=23; END
                CASE 23: graph=22; END
                CASE 24: graph=21; END
                CASE 25: graph=24; END
                CASE 26: graph=25; END
                CASE 27: graph=24; END
                CASE 30: graph=31; END
                CASE 31: graph=32; END
                CASE 32: graph=33; END
                CASE 34: graph=32; END
            END
        FRAME(frame_speed);
    END
END

//-----------------------------------------------------------------------------

PROCESS player_bar()

PRIVATE
    ammo_text;
    information_type;

BEGIN
    info_text=0;
    file=rmain_file;
    graph=10;
    x=320;
    y=37;
    write_int(rmain_font,560,35,3,& ammo_text);
    write_int(rmain_font,90,35,3,& player_health);
    information_type=write(rmain_font,320,35,4,"");
    FRAME;
    WHILE(player_health>0);
    IF(info_text==0) delete_text(information_type);
        IF(player_level==1) information_type=write(rmain_font,320,35,4,"KILL LOTS OF ROBOTS"); END
        IF(player_level==2) information_type=write(rmain_font,320,35,4,"GET THROUGH THE FENCE"); END
        IF(player_level==3) information_type=write(rmain_font,320,35,4,"FIND THE PLANS"); END
        IF(player_level==4) information_type=write(rmain_font,320,35,4,"DESTROY THE R91 UNIT"); END
    END

    IF(info_text==2) delete_text(information_type); information_type=write(rmain_font,320,35,4,"CHAINGUN AMMO"); END
    IF(info_text==3) delete_text(information_type); information_type=write(rmain_font,320,35,4,"FLAMER AMMO"); END
    IF(info_text==4) delete_text(information_type); information_type=write(rmain_font,320,35,4,"MISSILES"); END
    IF(info_text==10) delete_text(information_type); information_type=write(rmain_font,320,35,4,"MEDICAL KIT"); END
    IF(info_text==20) delete_text(information_type); information_type=write(rmain_font,320,35,4,"LAND MINE!"); END
    IF(info_text==80) delete_text(information_type); information_type=write(rmain_font,320,35,4,"ENEMY MISSILES"); END
    IF(info_text==90) delete_text(information_type); information_type=write(rmain_font,320,35,4,"GET OUT OF THE AREA"); END
    IF(info_text==91) delete_text(information_type); information_type=write(rmain_font,320,35,4,"KILL LOTS OF ROBOTS"); END
    IF(info_text==100) delete_text(information_type); information_type=write(rmain_font,320,35,4,"BOOBY TRAP!"); END
    IF(player_health<=30) delete_text(information_type); information_type=write(rmain_font,320,35,4,"LOW HEALTH!"); END
    IF(player_invincible==TRUE) delete_text(information_type); information_type=write(rmain_font,320,35,4,"INVINCIBLE"); END

    IF(chaingun_ammo>0 AND flamer_ammo==0 AND missile_ammo==0) ammo_text=chaingun_ammo; END
    IF(flamer_ammo>0 AND missile_ammo==0) ammo_text=flamer_ammo; END
    IF(missile_ammo>0) ammo_text=missile_ammo; END
    IF(chaingun_ammo==0 AND flamer_ammo==0 AND missile_ammo==0) ammo_text=1; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS enemy_legs(moving,distance,x,y,health)

PRIVATE;

    explosion;
    animation_graph;

BEGIN
    animation_graph=1;
    ctype=c_m7;
    explosion=FALSE;
    file=renemy_file;
    FRAME;
        WHILE(health>0 AND x>id5.x-50);
        x=father.x;
        y=father.y;
        IF(moving==TRUE AND x>distance) animation_graph+=1; END
        IF(animation_graph>8) animation_graph=1; END
        IF(fget_dist(id.x,id.y,player_bullets_x,player_bullets_y)<100) health-=100; signal(TYPE player_bullets,s_kill); END
        IF(fget_dist(id.x,id.y,player_fire_x,player_fire_y)<150) health-=100; END
        IF(fget_dist(id.x,id.y,player_missile_x,player_missile_y)<100) health=0; explosion=TRUE; signal(TYPE player_missile,s_kill); END
        SWITCH (animation_graph);
            CASE 1: graph=1; END
            CASE 2: graph=2; END
            CASE 3: graph=3; END
            CASE 4: graph=2; END
            CASE 5: graph=1; END
            CASE 6: graph=4; END
            CASE 7: graph=5; END
            CASE 8: graph=4; END
        END
        FRAME;
    END
    signal(FATHER,s_kill);
    IF(explosion==TRUE AND health<=0);
    player_enemy_killed+=1;
        sound(s_explosion,volume+100,frequency);
        file=reffects_file;
        graph=100;
        size=300;
        height=250;
        signal(TYPE player_missile,s_kill);
        WHILE(graph<114);
            graph+=1;
            FRAME(50);
        END
    END

    IF(explosion==FALSE AND health<=0);
    player_enemy_killed+=1;
        file=renemy_file;
        graph=6;
        signal(TYPE player_bullets,s_kill);
        WHILE(graph<9 AND x>id5.x-50);
            graph+=1;
            x+=40;
            FRAME;
        END
        WHILE(x>id5.x-50);
        graph=9;
        FRAME;
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS enemy1(moving,distance,x,y,health)

PRIVATE;

    gun_timer;

BEGIN
    ctype=c_m7;
    file=renemy_file;
    graph=10;
    enemy_legs(moving,distance,x,y,health);
    z=-10;
    height=200;
    FRAME;
        WHILE(health>0 AND x>id5.x-50);
        IF(moving==TRUE AND x>distance) x-=5; END
        gun_timer+=1;
        IF(get_dist(id5)<900 AND x>id5.x  AND gun_timer>rand(8,16)) sound(s_laser,volume,frequency); gun_timer=0; laser_blast(x-10,y+25,140); enemy_laser(800,get_angle(id5),x-10,y+25,200); END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS enemy2(x,y,health)

PRIVATE;

    animation_graph;
    gun_timer;
    gun_shot;
    explosion=FALSE;

BEGIN
    animation_graph=1;
    gun_shot=FALSE;
    ctype=c_m7;
    file=renemy_file;
    z=-10;
    FRAME;
        WHILE(health>0 AND x>id5.x-50);
        IF(animation_graph>5) animation_graph=1; gun_shot=FALSE; END
        IF(fget_dist(id.x,id.y,player_bullets_x,player_bullets_y)<100) health=0; END
        IF(fget_dist(id.x,id.y,player_fire_x,player_fire_y)<150) health=0; END
        IF(fget_dist(id.x,id.y,player_missile_x,player_missile_y)<100) health=0; explosion=TRUE; END
        SWITCH (animation_graph);
            CASE 1: graph=15; END
            CASE 2: graph=16; END
            CASE 3: graph=17; END
            CASE 4: graph=16; END
            CASE 5: graph=15; END
        END
        gun_timer+=1;
        IF(get_dist(id5)<900 AND x>id5.x  AND gun_timer>rand(20,25)) sound(s_missile,volume+200,frequency); gun_timer=0; laser_blast(x-10,y+15,140); gun_shot=TRUE; enemy_missile(800,get_angle(id5),x-10,y+25);  END
        IF(gun_shot==TRUE) animation_graph+=1; END
        FRAME;
    END
    IF(explosion==TRUE AND health<=0);
        player_enemy_killed+=1;
        sound(s_explosion,volume+100,frequency);
        file=reffects_file;
        graph=100;
        size=300;
        height=250;
        signal(TYPE player_missile,s_kill);
        WHILE(graph<114);
            graph+=1;
            FRAME(50);
        END
    END

    IF(explosion==FALSE AND health<=0);
        player_enemy_killed+=1;
        file=renemy_file;
        graph=6;
        signal(TYPE player_bullets,s_kill);
        WHILE(graph<9 AND x>id5.x-50);
            graph+=1;
            x+=40;
            FRAME;
        END
        WHILE(x>id5.x-50);
        graph=9;
        FRAME;
        END
    END

END

//-----------------------------------------------------------------------------

PROCESS enemy3(moving,distance,x,y,health)

BEGIN
    ctype=c_m7;
    file=renemy_file;
    graph=20;
    enemy_legs(moving,distance,x,y,health);
    z=-10;
    height=145;
    FRAME;
        WHILE(health>0 AND x>id5.x-50);
        IF(moving==TRUE AND x>distance) x-=5; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS enemy_plane(x,y)

PRIVATE;
    jet_sound;

BEGIN
    ctype=c_m7;
    jet_sound=FALSE;
    file=renemy_file;
    graph=80;
    size=500;
    height=900;
    FRAME;
    WHILE(x>id5.x-50);
    IF(jet_sound==FALSE AND get_dist(id5)<1600) sound(s_jet,volume+200,frequency); jet_sound=TRUE;  END
    x-=100;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS boss1_legs(x,y,health)

BEGIN
    boss_killed=FALSE;
    ctype=c_m7;
    file=renemy_file;
    graph=101;
    size=200;
    FRAME;
        WHILE(health>0);
        x=father.x;
        y=father.y;
        IF(fget_dist(id.x,id.y,player_bullets_x,player_bullets_y)<100) signal(TYPE player_bullets,s_kill); player_bullets_x=0; player_bullets_y=0; health-=100; END
        IF(fget_dist(id.x,id.y,player_fire_x,player_fire_y)<150) health-=50; player_fire_x=0; player_fire_y=0; END
        IF(fget_dist(id.x,id.y,player_missile_x,player_missile_y)<100) signal(TYPE player_missile,s_kill); health-=500; player_missile_x=0; player_missile_y=0; END
        FRAME;
    END
    signal(FATHER,s_kill);
    IF(health<=0);
    player_enemy_killed+=1;
        sound(s_explosion,volume+100,frequency);
        file=reffects_file;
        graph=100;
        size=1000;
        height=250;
        WHILE(graph<114);
            graph+=1;
            FRAME(50);
        END
    END
    boss_killed=TRUE;
END

//-----------------------------------------------------------------------------

PROCESS boss1(x,y,health)

PRIVATE;

    gun_timer;

BEGIN
    ctype=c_m7;
    file=renemy_file;
    graph=100;
    boss1_legs(x,y,health);
    z=-10;
    size=200;
    height=400;
    FRAME;
        WHILE(health>0 AND x>id5.x-50);
        gun_timer+=1;
        IF(get_dist(id5)<900 AND x>id5.x  AND gun_timer>rand(10,15)) sound(s_laser,volume+100,frequency); gun_timer=0; laser_blast(x-10,y+50,300); laser_blast(x-10,y-50,300); laser_blast(x-10,y+50,400); laser_blast(x-10,y-50,400); enemy_laser(800,get_angle(id5),x-10,y+50,350); enemy_laser(800,get_angle(id5),x-10,y-50,350); enemy_laser(800,get_angle(id5),x-10,y+50,450); enemy_laser(800,get_angle(id5),x-10,y-50,450); END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS object(file,graph,x,y,height)

BEGIN
    ctype=c_m7;
    size=400;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS crate(crate_type,x,y)

PRIVATE
    collected;
    explosive;

BEGIN
    file=rscenery_file;
    IF(crate_type<100) graph=120; END
    IF(crate_type==100) graph=121; END
    IF(crate_type>100) graph=122; END
    ctype=c_m7;
    collected=FALSE;
    explosive=FALSE;
    FRAME;
    WHILE(collected==FALSE AND x>id5.x-50);
    IF(get_dist(id5)<100)
        IF(crate_type==2) chaingun_ammo+=50; collected=TRUE; info_text=2; END
        IF(crate_type==3) flamer_ammo+=50; collected=TRUE; info_text=3; END
        IF(crate_type==4) missile_ammo+=10; collected=TRUE; info_text=4; END
        IF(crate_type==40) player_health+=100; collected=TRUE; info_text=10; END
        IF(crate_type==41) player_health+=50; collected=TRUE; info_text=10; END
        IF(crate_type==42) player_health+=40; collected=TRUE; info_text=10; END
        IF(crate_type==43) player_health+=30; collected=TRUE; info_text=10; END
        IF(crate_type==44) player_health+=20; collected=TRUE; info_text=10; END
        IF(crate_type==45) player_health+=10; collected=TRUE; info_text=10; END
        IF(crate_type==100) explosive=TRUE; collected=TRUE; info_text=100; IF(player_invincible==FALSE) player_health-=20; END END
        IF(crate_type==200) new_screen=609; collected=TRUE; END
    END
    FRAME;
    END
    IF(explosive==TRUE);
        sound(s_explosion,volume+200,frequency);
        file=reffects_file;
        graph=100;
        size=300;
        height=200;
        x+=10;
        WHILE(graph<114);
            graph+=1;
            FRAME(50);
        END
    END

END

//-----------------------------------------------------------------------------

PROCESS robo_land_mine(x,y)

PRIVATE
    exploded;

BEGIN
    file=rscenery_file;
    graph=90;
    ctype=c_m7;
    exploded=FALSE;
    size=200;
    FRAME;
        WHILE(exploded==FALSE AND x>id5.x-50);
            IF(get_dist(id5)<100) exploded=TRUE; IF(player_invincible==FALSE) player_health-=10; END END
        FRAME;
    END
    IF(exploded==TRUE);
        sound(s_explosion,volume+200,frequency);
        file=reffects_file;
        graph=100;
        size=300;
        x+=10;
        info_text=20;
        height=200;
        WHILE(graph<114);
            graph+=1;
        FRAME(50);
    END
    END
END

//-----------------------------------------------------------------------------

PROCESS wall(file,graph,x,y,height)

BEGIN
    ctype=c_m7;
    size=400;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS laser_blast(x,y,height)

PRIVATE

    laser_timer;

BEGIN
    ctype=c_m7;
    file=reffects_file;
    graph=10;
    FRAME;
    WHILE(laser_timer==0);
    laser_timer+=1;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS enemy_laser(distance_to_travel,angle,x,y,height)

PRIVATE

    laser_distance;
    laser_hit;

BEGIN
    ctype=c_m7;
    file=reffects_file;
    graph=15;
    FRAME;
    WHILE(laser_distance<distance_to_travel AND laser_hit==FALSE);
    advance(200);
    laser_distance+=200;
    IF(get_dist(id5)<100) laser_hit=TRUE; IF(player_invincible==FALSE) player_health-=2; END END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS enemy_missile(distance_to_travel,angle,x,y)

PRIVATE

    missile_distance;
    mieeile_hit;
    explosion;

BEGIN
    ctype=c_m7;
    file=reffects_file;
    graph=2;
    height=300;
    FRAME;
    WHILE(missile_distance<distance_to_travel AND mieeile_hit==FALSE);
    advance(200);
    missile_distance+=200;
    IF(get_dist(id5)<100) mieeile_hit=TRUE; IF(player_invincible==FALSE) player_health-=10; END explosion=TRUE; END
    FRAME;
    END
    IF(explosion==TRUE);
        sound(s_explosion,volume+100,frequency);
        file=reffects_file;
        graph=100;
        size=300;
        height=250;
        y=id5.y;
        x=id5.x+100;
        info_text=80;
        WHILE(graph<114);
            graph+=1;
            FRAME(50);
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS player_bullets(distance_to_travel,angle,x,y)

PRIVATE
    bullets_distance;

BEGIN
    bullets_distance=0;
    ctype=c_m7;
    file=reffects_file;
    graph=1;
    height=250;
    FRAME;
    WHILE(bullets_distance<distance_to_travel);
    player_bullets_x=x;
    player_bullets_y=y;
    advance(200);
    bullets_distance+=200;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player_fire(distance_to_travel,angle,x,y)

PRIVATE
    fire_distance;

BEGIN
    fire_distance=0;
    ctype=c_m7;
    file=reffects_file;
    graph=rand(101,108);
    size=200;
    height=rand(200,300);
    FRAME;
    WHILE(fire_distance<distance_to_travel);
    size+=30;
    graph+=1;
    IF(graph>107) graph=rand(101,108); END
    player_fire_x=x;
    player_fire_y=y;
    advance(200);
    fire_distance+=100;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player_missile(distance_to_travel,angle,x,y)

PRIVATE
    missile_distance;

BEGIN
    missile_distance=0;
    ctype=c_m7;
    file=reffects_file;
    graph=2;
    height=350;
    FRAME;
        WHILE(missile_distance<distance_to_travel);
            player_missile_x=x;
            player_missile_y=y;
            advance(200);
            missile_distance+=200;
        FRAME;
    END
END

//-----------------------------------------------------------------------------
