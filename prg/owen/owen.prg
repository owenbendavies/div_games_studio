
//-----------------------------------------------------------------------------
// TITLE:      OWEN GAMES
// AUTHOR:     OWEN DAVIES
// DATE:       OWEN GAMES 2001
//-----------------------------------------------------------------------------

compiler_options
_extended_conditions;

PROGRAM owen_games_disk;

GLOBAL

//-----------------------------------------------------------------------------
// @ game options
//-----------------------------------------------------------------------------

    screen=3;
    new_screen;

    volume;
    frequency;

    small_main_font;
    title_main_font;
    big_main_font;

    s_tune1;
    s_tune2;
    s_tune3;
    s_tune4;
    s_tune5;
    s_tune6;
    s_tune7;
    s_tune8;
    s_tune9;
    s_tune10;
    s_tune11;
    s_tune12;
    s_tune15;
    s_div;

    game_cheats;

    games_file;

    worms_file;
    worms_title_font;
    worms_main_font;
    worms_number_font;
    worms_normal_font;
    worm_small_font;
    worms_tune;
    s_worms_explosion;
    worm_players;
    player1_worm;
    player2_worm;
    player3_worm;
    player4_worm;
    player5_worm;
    worm1_pos;
    worm2_pos;
    worm3_pos;
    worm4_pos;
    worm5_pos;
    worm1_fin_pos;
    worm2_fin_pos;
    worm3_fin_pos;
    worm4_fin_pos;
    worm5_fin_pos;
    worm_time;
    worm_start_timer;
    worm1_death;
    worm2_death;
    worm3_death;
    worm4_death;
    worm5_death;

    znake_file;
    pong_file;
    small_small_font;
    worm_length=8;
    apples=0;
    small_ball2;
    special_1s=0;
    special_2s=0;
    special_3s=0;
    special_4s=0;
    small_score=0;
    small_topscore=0;
    raquet1;
    raquet2;
    number_of_balls;
    small_player1_score;
    small_player2_score;

    space_main_file;
    space_ships_file;
    space_main_font;
    space_s_laser;
    space_players;
    id1;
    id2;
    id3;
    id4;
    space_ship1_explosion;
    space_ship2_explosion;
    space_ship3_explosion;
    space_ship4_explosion;
    space_fortress_explosion;
    space_player1_health;
    space_player2_health;
    space_player3_health;
    space_player4_health;
    space_fortress_health;
    space_player_winner;

    ast_score=0;
    ast_high_score=0;
    ast_file;

    frames_per_second;
    main_file;
    stuff_file;
    scenery_file;
    guns_file;
    game_file;
    photo_file;
    title_font;
    main_font;
    small_font;
    s_engin1;
    s_gun1;
    s_shell;
    s_explosion1;
    s_aaah;
    s_missile;
    s_helicopter;
    main_background;
    hot_seat_game_type;
    hot_seat_players;
    player1_levle_position;
    player1_in_flag_area;
    hot_seat_player1_capture_flag;
    hot_seat_player2_capture_flag;
    random_terrain;
    terrain_minx;
    terrain_maxx;
    terrain_miny;
    terrain_maxy;
    starting_point_1_x;
    starting_point_1_y;
    starting_point_1_a;
    starting_point_2_x;
    starting_point_2_y;
    starting_point_2_a;
    mission1_point_x;
    mission1_point_y;
    mission2_point_x;
    mission2_point_y;
    mission3_point_x;
    mission3_point_y;
    player1_C_max_speed;
    player1_C_min_speed;
    player1_C_armour;
    player1_C_weapon1;
    player1_C_weapon2;
    player1_C_weapon3;
    player1_C_weapon4;
    player1_C_weapon5;
    player1_C_weapon6;
    player1_C_weapon7;
    player1_C_weapon8;
    player1_C_weapon9;
    player1_C_weapon10;
    player1_temp_max_speed;
    player1_temp_min_speed;
    player1_speed;
    player1_weapon_selected;
    player1_game_over;
    player1_out_of_region_text;
    id11;
    hot_seat_player1_speed;
    hot_seat_player1_max_speed;
    hot_seat_player1_min_speed;
    hot_seat_player1_armour;
    hot_seat_player1_game_over;
    hot_seat_player1_out_of_region_text;
    id12;
    hot_seat_player2_speed;
    hot_seat_player2_max_speed;
    hot_seat_player2_min_speed;
    hot_seat_player2_armour;
    hot_seat_player2_game_over;
    hot_seat_player2_out_of_region_text;
    spy_dead;
    player1_levle;
    player1_max_speed;
    player1_min_speed;
    player1_armour;
    player1_weapon1;
    player1_weapon2;
    player1_weapon3;
    player1_weapon4;
    player1_weapon5;
    player1_weapon6;
    player1_weapon7;
    player1_weapon8;
    player1_weapon9;
    player1_weapon10;
    player1_flails;
    player1_double_machine_guns;

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
    s_rmissile;
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
    set_fps(18,18);

    volume=100;
    frequency=256;

    game_cheats=FALSE;

    games_file=load_fpg("fpg\og\games.fpg");

    s_tune1=load_pcm("pcm\og\tunes\tune1.pcm",1);
    s_tune2=load_pcm("pcm\og\tunes\tune2.pcm",1);
    s_tune3=load_pcm("pcm\og\tunes\tune3.pcm",1);
    s_tune4=load_pcm("pcm\og\tunes\tune4.pcm",1);
    s_tune5=load_pcm("pcm\og\tunes\tune5.pcm",1);
    s_tune6=load_pcm("pcm\og\tunes\tune6.pcm",1);
    s_tune7=load_pcm("pcm\og\tunes\tune7.pcm",1);
    s_tune8=load_pcm("pcm\og\tunes\tune8.pcm",1);
    s_tune9=load_pcm("pcm\og\tunes\tune9.pcm",1);
    s_tune10=load_pcm("pcm\og\tunes\tune10.pcm",1);
    s_tune11=load_pcm("pcm\og\tunes\tune11.pcm",1);
    s_tune12=load_pcm("pcm\og\tunes\tune12.pcm",1);
    s_tune15=load_pcm("pcm\og\tunes\tune15.pcm",1);
    s_div=load_pcm("pcm\og\div.pcm",1);

    small_main_font=load_fnt("fnt\og\small.fnt");
    title_main_font=load_fnt("fnt\og\main.fnt");
    big_main_font=load_fnt("fnt\og\big.fnt");

    worms_file=load_fpg("fpg\og\worms.fpg");
    worms_title_font=load_fnt("fnt\og\wtitle.fnt");
    worms_main_font=load_fnt("fnt\og\wmain.fnt");
    worms_number_font=load_fnt("fnt\og\wnum.fnt");
    worms_normal_font=load_fnt("fnt\og\wnorm.fnt");
    worm_small_font=load_fnt("fnt\og\wsmall.fnt");
    worms_tune=load_pcm("pcm\og\tune.pcm",1);
    s_worms_explosion=load_pcm("pcm\og\effects\wblast.pcm",0);

    znake_file=load_fpg("fpg\og\znake.fpg");
    pong_file=load_fpg("fpg\og\pong.fpg");
    small_small_font=load_fnt("fnt\og\sgsmall.fnt");

    space_main_file=load_fpg("fpg\og\spmain.fpg");
    space_ships_file=load_fpg("fpg\og\spships.fpg");
    space_main_font=load_fnt("fnt\og\space.fnt");
    space_s_laser=load_pcm("pcm\og\effects\splaser.pcm",0);

    ast_file=load_fpg("fpg\og\ast.fpg");

    s_engin1=load_pcm("pcm\og\effects\tengin1.pcm",1);
    s_gun1=load_pcm("pcm\og\effects\tgun1.pcm",0);
    s_shell=load_pcm("pcm\og\effects\tshell.pcm",0);
    s_explosion1=load_pcm("pcm\og\effects\texplos1.pcm",0);
    s_aaah=load_pcm("pcm\og\effects\taaah.pcm",0);
    s_missile=load_pcm("pcm\og\effects\tmiss.pcm",0);
    s_helicopter=load_pcm("pcm\og\effects\tchop.pcm",0);

    title_font=load_fnt("fnt\og\ttitle.fnt");
    main_font=load_fnt("fnt\og\tmain.fnt");
    small_font=load_fnt("fnt\og\tsmall.fnt");

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
    s_rmissile=load_pcm("pcm\og\effects\missile.pcm",0);
    s_explosion=load_pcm("pcm\og\effects\blast.pcm",0);
    s_gun=load_pcm("pcm\og\effects\gun.pcm",0);
    s_flamer=load_pcm("pcm\og\effects\flamer.pcm",0);
    s_jet=load_pcm("pcm\og\effects\jet.pcm",0);


    main_file=load_fpg("fpg\og\tmain.fpg");
    stuff_file=load_fpg("fpg\og\tstuff.fpg");
    scenery_file=load_fpg("fpg\og\tscen.fpg");
    guns_file=load_fpg("fpg\og\tguns.fpg");
    game_file=load_fpg("fpg\og\tgame.fpg");
    photo_file=load_fpg("fpg\og\tphotos.fpg");

    LOOP
        SWITCH (screen);
            CASE 1: owen_games(); END
            CASE 2: games(); END
            CASE 3: div_games(); END
            CASE 98: credits(); END
            CASE 99: exit("OWEN GAMES (c) 2001",0); END

            CASE 100: worms_worm_title(); END
            CASE 110: worms_worm_betting(); END
            CASE 120: worms_worm_game(); END
            CASE 130: worms_worm_winner(); END

            CASE 200: small_znake_start(); END
            CASE 205: small_znake(); END
            CASE 210: small_pong_start(); END
            CASE 215: small_pong(); END

            CASE 300: space_blast(); END
            CASE 310: one_player(); END
            CASE 311: two_players(); END
            CASE 312: three_players(); END
            CASE 313: four_players(); END
            CASE 314: winner(); END

            CASE 400: asteroids(); END

            CASE 501: tank_owen_games(); END
            CASE 502: title(); END
            CASE 503: options(); END
            CASE 505: game_type(); END
            CASE 507: mission_complete(); END
            CASE 508: game_over(); END
            CASE 509: hot_seat_type(); END
            CASE 510: load_game(); END
            CASE 511: save_game(); END
            CASE 512: tank_upgrades(); END
            CASE 519: story_line(); END
            CASE 520: levle1_mission(); END
            CASE 521: levle1(); END
            CASE 522: levle2_mission(); END
            CASE 523: levle2(); END
            CASE 524: levle3_mission(); END
            CASE 525: levle3(); END
            CASE 526: levle4_mission(); END
            CASE 527: levle4(); END
            CASE 528: levle5_mission(); END
            CASE 529: levle5(); END
            CASE 530: levle6_mission(); END
            CASE 531: levle6(); END
            CASE 532: levle7_mission(); END
            CASE 533: levle7(); END
            CASE 550: scermish(); END
            CASE 570: death_match(); END
            CASE 580: capture_the_flag(); END
            CASE 590: exit_screen(); END

            CASE 605: robo_title(); END
            CASE 606: robo_options(); END
            CASE 608: robo_dead(); END
            CASE 609: robo_level_complete(); END
            CASE 611: robo_level01(); END
            CASE 612: robo_level02(); END
            CASE 613: robo_level03(); END
            CASE 614: robo_level04(); END

        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS title_background_pictures(x,y);

BEGIN
    file=games_file;
    graph=rand(1,11);
    LOOP
    IF(rand(1,9)==1) graph=rand(1,21); END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS div_games();

BEGIN
    sound(s_div,volume,frequency);
    load_pal("fpg\og\worms.fpg");
    fade(100,100,100,64);
    set_mode(m640x480);
    set_fps(18,18);
    mouse.file=worms_file;
    mouse.graph=0;
    screen=0;
    new_screen=0;
    screen=0;
    new_screen=0;
    start_fli("fli\og\div.fli",160,120);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
            WHILE(frame_fli()<>0);
            FRAME;
            END
        end_fli();
        IF(key(_esc)) new_screen=1; END
        IF(mouse.left OR key(_space) OR key(_enter)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE title_background_pictures,s_kill);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS owen_games();

BEGIN
    load_pal("fpg\og\worms.fpg");
    fade(100,100,100,64);
    sound(s_tune10,volume+50,frequency);
    sound(s_tune12,volume,frequency);
    sound(s_tune6,volume,frequency);
    set_mode(m640x480);
    set_fps(18,18);
    mouse.file=worms_file;
    mouse.graph=9;
    screen=0;
    new_screen=0;
    file=games_file;
    graph=50;
    x=320;
    y=240;
    z=-10;
    screen=0;
    new_screen=0;
    title_background_pictures(107,80);
    title_background_pictures(320,80);
    title_background_pictures(533,80);
    title_background_pictures(107,240);
    title_background_pictures(320,240);
    title_background_pictures(533,240);
    title_background_pictures(107,400);
    title_background_pictures(320,400);
    title_background_pictures(533,400);
    write(small_main_font,320,450,4,"OWEN GAMES (c) 2001");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=2; END
        IF(mouse.left OR key(_space) OR key(_enter)) new_screen=2; END
        FRAME;
    END
    signal(TYPE title_background_pictures,s_kill);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------


PROCESS games();

PRIVATE
    top_writing;

BEGIN
    screen=0;
    new_screen=0;
    title_background_pictures(107,80);
    title_background_pictures(320,80);
    title_background_pictures(533,80);
    title_background_pictures(107,240);
    title_background_pictures(320,240);
    title_background_pictures(533,240);
    title_background_pictures(107,400);
    title_background_pictures(320,400);
    title_background_pictures(533,400);
    top_writing=write(big_main_font,320,40,4,"OWEN GAMES");
    write(title_main_font,320,100,4,"TANK BLAST");
    write(title_main_font,320,140,4,"ROBO MARINES");
    write(title_main_font,320,180,4,"WORM BETTING");
    write(title_main_font,320,220,4,"SPACE BLAST");
    write(title_main_font,320,260,4,"ZNAKE");
    write(title_main_font,320,300,4,"PONG");
    write(title_main_font,320,340,4,"ASTEROIDS");
    write(title_main_font,320,380,4,"OPTIONS");
    write(title_main_font,320,420,4,"EXIT");
    write(small_main_font,320,460,4,"OWEN GAMES (c) 2001");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(game_cheats==TRUE) delete_text(top_writing); top_writing=write(big_main_font,320,40,4,"CHEATS ON"); END
        IF(game_cheats==FALSE AND mouse.right AND mouse.x<1 AND mouse.y<1) game_cheats=TRUE; END
        IF(game_cheats==TRUE AND mouse.left AND mouse.x<1 AND mouse.y<1) game_cheats=FALSE; delete_text(top_writing); top_writing=write(big_main_font,320,40,4,"CHEATS OFF"); END
        IF(mouse.left AND mouse.y>80 AND mouse.y<120) new_screen=501; END
        IF(mouse.left AND mouse.y>120 AND mouse.y<160) new_screen=605; END
        IF(mouse.left AND mouse.y>160 AND mouse.y<200) new_screen=100; END
        IF(mouse.left AND mouse.y>200 AND mouse.y<240) new_screen=300; END
        IF(mouse.left AND mouse.y>240 AND mouse.y<280) new_screen=200; END
        IF(mouse.left AND mouse.y>280 AND mouse.y<320) new_screen=210; END
        IF(mouse.left AND mouse.y>320 AND mouse.y<360) new_screen=400; END
        IF(mouse.left AND mouse.y>400 AND mouse.y<440) new_screen=98; END
        IF(key(_esc)) new_screen=98; END
        FRAME;
    END
    signal(TYPE title_background_pictures,s_kill);
    stop_sound(all_sound);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS credits();

BEGIN
    sound(s_tune1,volume+50,frequency);
    screen=0;
    new_screen=0;
    screen=0;
    new_screen=0;
    title_background_pictures(107,80);
    title_background_pictures(320,80);
    title_background_pictures(533,80);
    title_background_pictures(107,240);
    title_background_pictures(320,240);
    title_background_pictures(533,240);
    title_background_pictures(107,400);
    title_background_pictures(320,400);
    title_background_pictures(533,400);
    write(small_main_font,320,170,4,"CREATED BY OWEN DAVIES");
    write(small_main_font,320,205,4,"HAMMER TECHNOLOGIES (c) 1998");
    write(small_main_font,320,240,4,"DIV GAMES STUDIO (c) 1998");
    write(small_main_font,320,275,4,"OWEN GAMES (c) 2001");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=99; END
        IF(mouse.left OR key(_space) OR key(_enter)) new_screen=99; END
        FRAME;
    END
    signal(TYPE title_background_pictures,s_kill);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
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
    text_pause=write(main_font,320,240,4,"PAUSED");
    FRAME;
    REPEAT
        UNTIL (key(_f1));
        delete_text(text_pause);
        WHILE (key(_f1));
        END
    END
END

//-----------------------------------------------------------------------------
//  @WORMS
//-----------------------------------------------------------------------------

PROCESS worms_worm_background(y);

BEGIN
    start_scroll(0,worms_file,5,0,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    x=320;
    LOOP
        x-=10;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worms_worm_title();

PRIVATE;
    worm_graph;

BEGIN
    set_mode(m640x480);
    set_fps(18,18);
    load_pal("fpg\og\worms.fpg");
    sound(worms_tune,volume+100,frequency);
    player1_worm=0;
    player2_worm=0;
    player3_worm=0;
    player4_worm=0;
    player5_worm=0;
    mouse.file=worms_file;
    mouse.graph=9;
    screen=0;
    new_screen=0;
    worm_graph=1;
    write(worms_title_font,320,40,4,"WORM BETTING");
    write(worms_main_font,320,350,4,"PLACE YOUR BETS");
    write(worms_main_font,320,400,4,"BACK");
    file=worms_file;
    graph=50;
    x=320;
    y=250;
    worms_worm_background(180);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        graph+=1;
        IF(graph>53) graph=50; END
        IF(mouse.y>330 AND mouse.y<370 AND mouse.left) new_screen=110; END
        IF(mouse.y>380 AND mouse.y<420 AND mouse.left) new_screen=1; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_scroll(0);
    signal(TYPE worms_worm_background,s_kill);
    stop_sound(all_sound);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS worms_worm_betting();

PRIVATE;
    player1_betted;
    player2_betted;
    player3_betted;
    player4_betted;
    player5_betted;

BEGIN
    worm_players=1;
    player1_betted=FALSE;
    player2_betted=FALSE;
    player3_betted=FALSE;
    player4_betted=FALSE;
    player5_betted=FALSE;
    sound(worms_tune,volume+100,frequency);
    mouse.file=worms_file;
    mouse.graph=9;
    screen=0;
    new_screen=0;
    write(worms_title_font,320,40,4,"BEGIN RACE");
    write(worms_normal_font,50,300,3,"DASHER");
    write(worms_normal_font,50,340,3,"WORMWIND");
    write(worms_normal_font,50,380,3,"I DUNNO");
    write(worms_normal_font,50,420,3,"RAZOR");
    write(worms_normal_font,50,460,3,"THUNDER");
    write(worms_main_font,350,300,3,"PLAYER");
    write(worms_main_font,350,340,3,"PLAYER");
    write(worms_main_font,350,380,3,"PLAYER");
    write(worms_main_font,350,420,3,"PLAYER");
    write(worms_main_font,350,460,3,"PLAYER");
    write_int(worms_main_font,550,300,3,& player1_worm);
    write_int(worms_main_font,550,340,3,& player2_worm);
    write_int(worms_main_font,550,380,3,& player3_worm);
    write_int(worms_main_font,550,420,3,& player4_worm);
    write_int(worms_main_font,550,460,3,& player5_worm);
    worms_worm_background(210);
    worm_card(320,170);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(mouse.y<250 AND mouse.left) new_screen=120; END
        IF(player1_worm>5) player1_worm=1; END
        IF(player2_worm>5) player2_worm=1; END
        IF(player3_worm>5) player3_worm=1; END
        IF(player4_worm>5) player4_worm=1; END
        IF(player5_worm>5) player5_worm=1; END
        IF(player1_betted==FALSE AND mouse.y>280 AND mouse.y<320 AND mouse.left) player1_worm=worm_players; player1_betted=TRUE; worm_players+=1; END
        IF(player2_betted==FALSE AND mouse.y>320 AND mouse.y<360 AND mouse.left) player2_worm=worm_players; player2_betted=TRUE; worm_players+=1; END
        IF(player3_betted==FALSE AND mouse.y>360 AND mouse.y<400 AND mouse.left) player3_worm=worm_players; player3_betted=TRUE; worm_players+=1; END
        IF(player4_betted==FALSE AND mouse.y>400 AND mouse.y<440 AND mouse.left) player4_worm=worm_players; player4_betted=TRUE; worm_players+=1; END
        IF(player5_betted==FALSE AND mouse.y>440 AND mouse.y<480 AND mouse.left) player5_worm=worm_players; player5_betted=TRUE; worm_players+=1; END
        IF(key(_esc)) new_screen=100; END
        FRAME;
    END
    stop_scroll(0);
    signal(TYPE worms_worm_background,s_kill);
    signal(TYPE worm_card,s_kill);
    stop_sound(all_sound);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS worms_worm_game();

PRIVATE;
    worm_graph;
    camera_move;
    camera2_move;
    worm_positions;
    worm_start_text;
    worm_start_timer_text;

BEGIN
    IF(rand(1,1)==1) worms_land_mine(); END
    worm_start_timer=300;
    worm_time=0;
    worm1_pos=0;
    worm2_pos=0;
    worm3_pos=0;
    worm4_pos=0;
    worm5_pos=0;
    worm_start_text=3;
    worm1_fin_pos=0;
    worm2_fin_pos=0;
    worm3_fin_pos=0;
    worm4_fin_pos=0;
    worm5_fin_pos=0;
    sound(worms_tune,volume+100,frequency);
    mouse.graph=0;
    screen=0;
    new_screen=0;
    start_scroll(0,worms_file,1,102,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    x=320;
    y=240;
    worm1();
    worm2();
    worm3();
    worm4();
    worm5();
    camera_move=FALSE;
    camera2_move=TRUE;
    write_int(worms_number_font,130,30,5,& worm_time);
    worm_positions=1;
    worm_start_timer_text=write_int(worms_title_font,320,240,4,& worm_start_text);
    pause();
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(worm_start_timer>0) worm_start_timer-=8; END
        IF(worm_start_timer>200) worm_start_text=3; END
        IF(worm_start_timer<201 AND worm_start_timer>100) worm_start_text=2; END
        IF(worm_start_timer>0 AND worm_start_timer<101) worm_start_text=1; END
        IF(worm_start_timer<1) delete_text(worm_start_timer_text); END
        IF(worm_start_timer<1 AND worm1_pos<1400 AND worm2_pos<1400 AND worm3_pos<1400 AND worm4_pos<1400 AND worm5_pos<1400) worm_time+=8; END
        IF(worm_start_timer<1 AND camera_move==TRUE AND camera2_move==TRUE) x+=8; END
        IF(worm1_pos>320 OR worm2_pos>320 OR worm3_pos>320 OR worm4_pos>320 OR worm5_pos>320) camera_move=TRUE; END
        IF(worm1_pos>1280 OR worm2_pos>1280 OR worm3_pos>1280 OR worm4_pos>1280 OR worm5_pos>1280) camera2_move=FALSE; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_pos>1550) new_screen=130; END
        IF(worm1_death==TRUE AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_pos>1550) new_screen=130; END
        IF(worm1_pos>1550 AND worm2_death==TRUE AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_pos>1550) new_screen=130; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_death==TRUE AND worm4_pos>1550 AND worm5_pos>1550) new_screen=130; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_death==TRUE AND worm5_pos>1550) new_screen=130; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_death==TRUE) new_screen=130; END
        IF(worm1_pos>1280 AND worm1_fin_pos==0 AND worm1_death==FALSE) worm1_fin_pos+=worm_positions; worm_positions+=1; END
        IF(worm2_pos>1280 AND worm2_fin_pos==0 AND worm2_death==FALSE) worm2_fin_pos+=worm_positions; worm_positions+=1; END
        IF(worm3_pos>1280 AND worm3_fin_pos==0 AND worm3_death==FALSE) worm3_fin_pos+=worm_positions; worm_positions+=1; END
        IF(worm4_pos>1280 AND worm4_fin_pos==0 AND worm4_death==FALSE) worm4_fin_pos+=worm_positions; worm_positions+=1; END
        IF(worm5_pos>1280 AND worm5_fin_pos==0 AND worm5_death==FALSE) worm5_fin_pos+=worm_positions; worm_positions+=1; END
        IF(worm1_death==TRUE) worm1_fin_pos=0; END
        IF(worm2_death==TRUE) worm2_fin_pos=0; END
        IF(worm3_death==TRUE) worm3_fin_pos=0; END
        IF(worm4_death==TRUE) worm4_fin_pos=0; END
        IF(worm5_death==TRUE) worm5_fin_pos=0; END
        IF(key(_esc)) new_screen=100; END
        FRAME;
    END
    signal(TYPE worms_land_mine,s_kill);
    signal(TYPE pause,s_kill);
    signal(TYPE worm1,s_kill);
    signal(TYPE worm2,s_kill);
    signal(TYPE worm3,s_kill);
    signal(TYPE worm4,s_kill);
    signal(TYPE worm5,s_kill);
    fade_off();
    clear_screen();
    delete_text(all_text);
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS worms_worm_winner();

PRIVATE;
    worm_graph;

BEGIN
    sound(worms_tune,volume+100,frequency);
    mouse.file=worms_file;
    mouse.graph=9;
    screen=0;
    new_screen=0;
    IF(worm1_fin_pos==1) write(worms_title_font,320,40,4,"WORM 1 WINS"); write(worms_main_font,320,100,4,"DASHER"); worm_podium_winner(10,320,279,1);
        IF(player1_worm==1) write(worms_main_font,320,180,4,"PLAYER 1 WINS"); END
        IF(player1_worm==2) write(worms_main_font,320,180,4,"PLAYER 2 WINS"); END
        IF(player1_worm==3) write(worms_main_font,320,180,4,"PLAYER 3 WINS"); END
        IF(player1_worm==4) write(worms_main_font,320,180,4,"PLAYER 4 WINS"); END
        IF(player1_worm==5) write(worms_main_font,320,180,4,"PLAYER 5 WINS"); END
    END
    IF(worm2_fin_pos==1) write(worms_title_font,320,40,4,"WORM 2 WINS"); write(worms_main_font,320,100,4,"WORMWIND"); worm_podium_winner(20,320,279,1);
        IF(player2_worm==1) write(worms_main_font,320,180,4,"PLAYER 1 WINS"); END
        IF(player2_worm==2) write(worms_main_font,320,180,4,"PLAYER 2 WINS"); END
        IF(player2_worm==3) write(worms_main_font,320,180,4,"PLAYER 3 WINS"); END
        IF(player2_worm==4) write(worms_main_font,320,180,4,"PLAYER 4 WINS"); END
        IF(player2_worm==5) write(worms_main_font,320,180,4,"PLAYER 5 WINS"); END
    END
    IF(worm3_fin_pos==1) write(worms_title_font,320,40,4,"WORM 3 WINS"); write(worms_main_font,320,100,4,"I DUNNO"); worm_podium_winner(30,320,279,1);
        IF(player3_worm==1) write(worms_main_font,320,180,4,"PLAYER 1 WINS"); END
        IF(player3_worm==2) write(worms_main_font,320,180,4,"PLAYER 2 WINS"); END
        IF(player3_worm==3) write(worms_main_font,320,180,4,"PLAYER 3 WINS"); END
        IF(player3_worm==4) write(worms_main_font,320,180,4,"PLAYER 4 WINS"); END
        IF(player3_worm==5) write(worms_main_font,320,180,4,"PLAYER 5 WINS"); END
    END
    IF(worm4_fin_pos==1) write(worms_title_font,320,40,4,"WORM 4 WINS"); write(worms_main_font,320,100,4,"RAZOR"); worm_podium_winner(40,320,279,1);
        IF(player4_worm==1) write(worms_main_font,320,180,4,"PLAYER 1 WINS"); END
        IF(player4_worm==2) write(worms_main_font,320,180,4,"PLAYER 2 WINS"); END
        IF(player4_worm==3) write(worms_main_font,320,180,4,"PLAYER 3 WINS"); END
        IF(player4_worm==4) write(worms_main_font,320,180,4,"PLAYER 4 WINS"); END
        IF(player4_worm==5) write(worms_main_font,320,180,4,"PLAYER 5 WINS"); END
    END
    IF(worm5_fin_pos==1) write(worms_title_font,320,40,4,"WORM 5 WINS"); write(worms_main_font,320,100,4,"THUNDER"); worm_podium_winner(50,320,279,1);
        IF(player5_worm==1) write(worms_main_font,320,180,4,"PLAYER 1 WINS"); END
        IF(player5_worm==2) write(worms_main_font,320,180,4,"PLAYER 2 WINS"); END
        IF(player5_worm==3) write(worms_main_font,320,180,4,"PLAYER 3 WINS"); END
        IF(player5_worm==4) write(worms_main_font,320,180,4,"PLAYER 4 WINS"); END
        IF(player5_worm==5) write(worms_main_font,320,180,4,"PLAYER 5 WINS"); END
    END
    write_int(worms_number_font,320,220,4,& worm_time);
    IF(worm1_fin_pos==2) worm_podium_winner(10,230,294,0); END
    IF(worm2_fin_pos==2) worm_podium_winner(20,230,294,0); END
    IF(worm3_fin_pos==2) worm_podium_winner(30,230,294,0); END
    IF(worm4_fin_pos==2) worm_podium_winner(40,230,294,0); END
    IF(worm5_fin_pos==2) worm_podium_winner(50,230,294,0); END
    IF(worm1_fin_pos==3) worm_podium_winner(10,400,311,1); END
    IF(worm2_fin_pos==3) worm_podium_winner(20,400,311,1); END
    IF(worm3_fin_pos==3) worm_podium_winner(30,400,311,1); END
    IF(worm4_fin_pos==3) worm_podium_winner(40,400,311,1); END
    IF(worm5_fin_pos==3) worm_podium_winner(50,400,311,1); END
    IF(worm1_fin_pos==4) worm_podium_winner(10,155,327,0); END
    IF(worm2_fin_pos==4) worm_podium_winner(20,155,327,0); END
    IF(worm3_fin_pos==4) worm_podium_winner(30,155,327,0); END
    IF(worm4_fin_pos==4) worm_podium_winner(40,155,327,0); END
    IF(worm5_fin_pos==4) worm_podium_winner(50,155,327,0); END
    IF(worm1_fin_pos==5) worm_podium_winner(10,485,344,1); END
    IF(worm2_fin_pos==5) worm_podium_winner(20,485,344,1); END
    IF(worm3_fin_pos==5) worm_podium_winner(30,485,344,1); END
    IF(worm4_fin_pos==5) worm_podium_winner(40,485,344,1); END
    IF(worm5_fin_pos==5) worm_podium_winner(50,485,344,1); END

    IF(worm1_fin_pos==0) worm_podium_grave_stone(); write(worm_small_font,320,430,4,"DASHER IS PLAYING HIS GOLDEN HARP"); END
    IF(worm2_fin_pos==0) worm_podium_grave_stone(); write(worm_small_font,320,430,4,"WORMWIND POPPED HIS CLOGS"); END
    IF(worm3_fin_pos==0) worm_podium_grave_stone(); write(worm_small_font,320,430,4,"I DUNNO KICKED THE BUCKET"); END
    IF(worm4_fin_pos==0) worm_podium_grave_stone(); write(worm_small_font,320,430,4,"R.I.P RAZOR"); END
    IF(worm5_fin_pos==0) worm_podium_grave_stone(); write(worm_small_font,320,430,4,"STRUCK BY LIGHTNING"); END

    file=worms_file;
    graph=60;
    x=320;
    y=240;
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_space) OR mouse.left) new_screen=100; END
        IF(key(_esc)) new_screen=100; END
        FRAME;
    END
    stop_scroll(0);
    signal(TYPE worm_podium_winner,s_kill);
    signal(TYPE worm_podium_grave_stone,s_kill);
    signal(TYPE worms_worm_background,s_kill);
    stop_sound(all_sound);
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS worm_podium_winner(graph,x,y,flags);

PRIVATE;
    anomation;
    orgraph;

BEGIN
    file=worms_file;
    orgraph=graph;
    anomation=1;
    LOOP
        graph+=1;
        anomation+=1;
        IF(anomation>4) graph=orgraph; anomation=1; END
        IF(rand(1,10)==1) flags=0; END
        IF(rand(1,10)==10) flags=1; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm_podium_grave_stone();

BEGIN
    file=worms_file;
    graph=90;
    x=475;
    y=326;
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm_card(x,y);

PRIVATE
    worm_card_timer;
    worm_card_number;

BEGIN
    file=worms_file;
    worm_card_number=1;
    worm_card_timer=0;
    LOOP
        worm_card_timer+=1;
        IF(worm_card_timer>40) worm_card_timer=0; worm_card_number+=1; END
        IF(worm_card_number>5) worm_card_number=1; END

        SWITCH (worm_card_number);
            CASE 1: graph=14; END
            CASE 2: graph=24; END
            CASE 3: graph=34; END
            CASE 4: graph=44; END
            CASE 5: graph=54; END
        END

        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm1();

PRIVATE
    worm1_graph;

BEGIN
    worm1_death=FALSE;
    worm1_graph=0;
    ctype=c_scroll;
    file=worms_file;
    graph=10;
    x=45;
    y=60;
    flags=1;
    WHILE(worm1_death==false);
        worm1_pos=x;
        worm1_graph+=1;
        IF(worm_start_timer<1) x+=rand(1,15); END
        IF(worm1_graph>1) graph+=1; worm1_graph=0; END
        IF(graph>13) graph=10; END
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_1)) x+=5; END
        IF(collision(TYPE worms_land_mine)) worm1_death=TRUE; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm2();

PRIVATE
    worm2_graph;

BEGIN
    worm2_death=FALSE;
    worm2_graph=0;
    ctype=c_scroll;
    file=worms_file;
    graph=20;
    x=45;
    y=150;
    flags=1;
    WHILE(worm2_death==false);
        worm2_pos=x;
        worm2_graph+=1;
        IF(worm_start_timer<1) x+=rand(1,15); END
        IF(worm2_graph>1) graph+=1; worm2_graph=0; END
        IF(graph>23) graph=20; END
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_2)) x+=5; END
        IF(collision(TYPE worms_land_mine)) worm2_death=TRUE; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm3();

PRIVATE
    worm3_graph;

BEGIN
    worm3_death=FALSE;
    worm3_graph=0;
    ctype=c_scroll;
    file=worms_file;
    graph=30;
    x=45;
    y=250;
    flags=1;
    WHILE(worm3_death==false);
        worm3_pos=x;
        worm3_graph+=1;
        IF(worm_start_timer<1) x+=rand(1,15); END
        IF(worm3_graph>1) graph+=1; worm3_graph=0; END
        IF(graph>33) graph=30; END
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_3)) x+=5; END
        IF(collision(TYPE worms_land_mine)) worm3_death=TRUE; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm4();

PRIVATE
    worm4_graph;

BEGIN
    worm4_death=FALSE;
    worm4_graph=0;
    ctype=c_scroll;
    file=worms_file;
    graph=40;
    x=45;
    y=340;
    flags=1;
    WHILE(worm4_death==false);
        worm4_pos=x;
        worm4_graph+=1;
        IF(worm_start_timer<1) x+=rand(1,15); END
        IF(worm4_graph>1) graph+=1; worm4_graph=0; END
        IF(graph>43) graph=40; END
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_4)) x+=5; END
        IF(collision(TYPE worms_land_mine)) worm4_death=TRUE; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm5();

PRIVATE
    worm5_graph;

BEGIN
    worm5_death=FALSE;
    worm5_graph=0;
    ctype=c_scroll;
    file=worms_file;
    graph=50;
    x=45;
    y=430;
    flags=1;
    WHILE(worm5_death==false);
        worm5_pos=x;
        worm5_graph+=1;
        IF(worm_start_timer<1) x+=rand(1,15); END
        IF(worm5_graph>1) graph+=1; worm5_graph=0; END
        IF(graph>53) graph=50; END
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_5)) x+=5; END
        IF(collision(TYPE worms_land_mine)) worm5_death=TRUE; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worms_land_mine();

PRIVATE
    land_mine_lane;
    land_mine_explosion;

BEGIN
    land_mine_explosion=FALSE;
    ctype=c_scroll;
    file=worms_file;
    graph=70;
    x=rand(650,1300);
    flags=1;
    land_mine_lane=rand(1,5);
    IF(land_mine_lane==1) y=60; END
    IF(land_mine_lane==2) y=150; END
    IF(land_mine_lane==3) y=240; END
    IF(land_mine_lane==4) y=330; END
    IF(land_mine_lane==5) y=420; END
    WHILE(land_mine_explosion==FALSE);
        IF(collision(TYPE worm1)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm2)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm3)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm4)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm5)) land_mine_explosion=TRUE; END
        FRAME;
    END
        size=80;
        sound(s_worms_explosion,volume,frequency);
        z=0;
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @SMALL GAMES
//-----------------------------------------------------------------------------

PROCESS small_znake_start();

BEGIN
    mouse.graph=0;
    set_mode(m640x400);
    set_fps(18,18);
    load_pal("fpg\og\znake.fpg");
    load("dat\og\smallg.dat",&small_topscore);
    screen=0;
    new_screen=0;
    sound(s_tune2,volume+100,frequency);
    write_int(small_small_font,280,8,0,&small_score);
    write_int(small_small_font,570,8,0,&small_topscore);
    start_scroll(0,znake_file,2,0,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    small_znake_pitch();
    write(small_small_font,320,240,4,"PRESS ANY KEY TO START");
    LOOP
        FRAME;
            fade_on();
            WHILE (new_screen==0);
            y-=2;
            IF(scan_code>0) new_screen=205; END
            FRAME;
        END
        worm_length=8;
        small_score=0;
        signal(TYPE small_worm_head,s_kill);
        signal(TYPE small_worm_segment,s_kill);
        signal(TYPE small_apple,s_kill);
        signal(TYPE small_special_1,s_kill);
        signal(TYPE small_special_2,s_kill);
        signal(TYPE small_special_3,s_kill);
        signal(TYPE small_znake_pitch,s_kill);
        signal(TYPE small_explosion,s_kill);
        clear_screen();
        delete_text(all_text);
        stop_sound(all_sound);
        stop_scroll(0);
        screen=new_screen;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_znake();

BEGIN
    screen=0;
    new_screen=0;
    apples=0;
    special_1s=0;
    special_2s=0;
    special_3s=0;
    special_4s=0;
    sound(s_tune2,volume+100,frequency);
    write_int(small_small_font,280,8,0,&small_score);
    write_int(small_small_font,570,8,0,&small_topscore);
    small_worm_head(16,192,16,0);
    start_scroll(0,znake_file,2,0,0,15);
    scroll.camera=id;
    pause();
    ctype=c_scroll;
    small_znake_pitch();
    LOOP
        FRAME;
            WHILE (new_screen==0);
            y-=2;
            IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_1)) small_apple(rand(1,38)*16,rand(3,23)*16); END
            IF (rand(0,32)==0 and apples<3)
                small_apple(rand(1,38)*16,rand(3,23)*16);
                apples++;
            END
            IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_2)) small_special_1(rand(1,38)*16,rand(3,23)*16); END
            IF (rand(0,128)==0 and special_1s<2)
                small_special_1(rand(1,38)*16,rand(3,23)*16);
                special_1s++;
            END
            IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_3)) small_special_2(rand(1,38)*16,rand(3,23)*16); END
            IF (rand(0,150)==0 and special_2s<1)
                small_special_2(rand(1,38)*16,rand(3,23)*16);
                special_2s++;
            END
            IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_4)) small_special_3(rand(1,38)*16,rand(3,23)*16); END
            IF (rand(0,150)==0 AND special_3s<1)
                small_special_3(rand(1,38)*16,rand(3,23)*16);
                special_3s++;
            END
            IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_5)) small_special_4(rand(1,38)*16,rand(3,23)*16); END
            IF (rand(0,200)==0 AND special_4s<1)
                small_special_4(rand(1,38)*16,rand(3,23)*16);
                special_4s++;
            END
            IF(apples==0)
                small_apple(rand(1,38)*16,rand(3,23)*16);
                apples++;
            END
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
        worm_length=8;
        small_score=0;
        signal(TYPE small_worm_head,s_kill);
        signal(TYPE small_worm_segment,s_kill);
        signal(TYPE small_apple,s_kill);
        signal(TYPE small_special_1,s_kill);
        signal(TYPE small_special_2,s_kill);
        signal(TYPE small_special_3,s_kill);
        signal(TYPE small_special_4,s_kill);
        signal(TYPE small_znake_pitch,s_kill);
        signal(TYPE small_explosion,s_kill);
        fade_off();
        clear_screen();
        delete_text(all_text);
        stop_sound(all_sound);
        stop_scroll(0);
        screen=new_screen;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_pong_start();

BEGIN
    mouse.graph=0;
    set_mode(m640x400);
    set_fps(18,18);
    load_pal("fpg\og\pong.fpg");
    screen=0;
    new_screen=0;
    sound(s_tune5,volume+100,frequency);
    start_scroll(0,pong_file,2,102,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    file=pong_file;
    graph=1;
    z=0;
    write_int(small_small_font,604,2,0,& small_player1_score);
    write_int(small_small_font,24,380,0,& small_player2_score);
    write(small_small_font,320,240,4,"PRESS ANY KEY TO START");
    LOOP
        FRAME;
            fade_on();
            WHILE (new_screen==0)
            y-=2;
            IF(scan_code>0) new_screen=215; END
            FRAME;
        END
        signal(TYPE small_ball_2,s_kill);
        signal(TYPE small_asteroid,s_kill);
        signal(TYPE pause,s_kill);
        signal(TYPE small_raquet,s_kill);
        signal(TYPE small_ball,s_kill);
        clear_screen();
        stop_sound(all_sound);
        stop_scroll(0);
        delete_text(all_text);
        screen=new_screen;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_pong();

BEGIN
    screen=0;
    new_screen=0;
    sound(s_tune5,volume+100,frequency);
    start_scroll(0,pong_file,2,102,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    pause();
    raquet1=small_raquet(12,48,_q,_a);
    raquet2=small_raquet(628,48,_up,_down);
    small_ball(320,200,2,2);
    file=pong_file;
    graph=1;
    z=0;
    write_int(small_small_font,604,2,0,& small_player1_score);
    write_int(small_small_font,24,380,0,& small_player2_score);
    LOOP
        FRAME;
            WHILE (new_screen==0)
            y-=2;
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
        fade_off();
        signal(TYPE small_asteroid,s_kill);
        signal(TYPE small_ball_2,s_kill);
        signal(TYPE pause,s_kill);
        signal(TYPE small_raquet,s_kill);
        signal(TYPE small_ball,s_kill);
        clear_screen();
        stop_sound(all_sound);
        stop_scroll(0);
        delete_text(all_text);
        screen=new_screen;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_worm_head(x,y,ix,iy)

PRIVATE
    apple_id;
    special_1_id;
    special_2_id;
    special_3_id;
    special_4_id;

BEGIN
    file=znake_file;
    graph=21;
    small_worm_segment(128,priority+1);
    REPEAT
        FRAME;
        IF (key(_right)) ix=16; iy=0; graph=21; END
        IF (key(_left)) ix=-16; iy=0; graph=22; END
        IF (key(_down)) ix=0; iy=16; graph=24; END
        IF (key(_up)) ix=0; iy=-16; graph=23; END
        IF (apple_id=collision(TYPE small_apple))
            signal(apple_id,s_kill);
            apples--;
            worm_length+=4;
            small_score+=10;
        END
        IF (special_1_id=collision(TYPE small_special_1))
            signal(special_1_id,s_kill);
            special_1s--;
            worm_length+=4;
            small_score+=20;
        END
        IF (special_2_id=collision(TYPE small_special_2))
            signal(special_2_id,s_kill);
            special_2s--;
            worm_length+=4;
            small_score+=50;
        END
        IF (special_3_id=collision(TYPE small_special_3))
            signal(special_3_id,s_kill);
            small_explosion(x,y);
            special_3s--;
            worm_length-=4;
        END
        IF (special_4_id=collision(TYPE small_special_4))
            signal(special_4_id,s_kill);
            special_4s--;
            worm_length+=4;
            small_score-=30;
        END
        IF(worm_length<0)
            worm_length=0;
        END
        x=x+ix;
        y=y+iy;
    UNTIL (collision(TYPE small_znake_pitch) or collision(type small_worm_segment));
    fade_off();
    fade_on();
    IF (small_score>small_topscore)
        small_topscore=small_score;
        save("dat\og\smallg.dat",&small_topscore,1);
    END
    small_score=0;
    worm_length=8;
    signal(son,s_kill_tree);
    small_worm_head(16,192,16,0);
END

//-----------------------------------------------------------------------------

PROCESS small_explosion(x,y)

BEGIN
        file=znake_file;
        size=80;
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_worm_segment(n,priority)

BEGIN
    file=znake_file;
    IF (n>0) small_worm_segment(n-1,priority+1); END
    LOOP
        IF (priority<worm_length)
            graph=20;
        ELSE
            graph=0;
        END
        x=father.x;
        y=father.y;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_apple(x,y)

BEGIN
    file=znake_file;
    graph=50;
    LOOP FRAME; END
END

//-----------------------------------------------------------------------------

PROCESS small_znake_pitch()

BEGIN
    file=znake_file;
    graph=1;
    x=320;
    y=200;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_special_1(x,y)

BEGIN
    file=znake_file;
    graph=51;
    LOOP FRAME; END
END

//-----------------------------------------------------------------------------

PROCESS small_special_2(x,y)

BEGIN
    file=znake_file;
    graph=52;
    LOOP FRAME; END
END

//-----------------------------------------------------------------------------

PROCESS small_special_3(x,y)

BEGIN
    file=znake_file;
    graph=53;
    LOOP FRAME; END
END

//-----------------------------------------------------------------------------

PROCESS small_special_4(x,y)

BEGIN
    file=znake_file;
    graph=54;
    LOOP FRAME; END
END

//-----------------------------------------------------------------------------

PROCESS small_ball(x,y,ix,iy);

PRIVATE
    direction;

BEGIN
    file=pong_file;
    graph=20;
    direction=rand(1,2);
    REPEAT
        FRAME(20);
        IF(collision(TYPE small_asteroid))
            ix=-ix; END
        IF (y==28 or y==372)
            iy=-iy;
        END
        IF ((x==20 and abs(y-raquet1.y)<44) or
           (x==620 and abs(y-raquet2.y)<44))
            ix=-ix;
        END
        IF(x<0)
            small_player1_score+=1; END
        IF(x>640)
            small_player2_score+=1; END
        IF(direction==1)
            x=x-ix;
            y=y-iy;
        END
        IF(direction==2)
            x=x+ix;
            y=y+iy;
        END
    UNTIL (out_region(id,0))
    IF(number_of_balls==0) small_ball(320,200,ix,iy); END
    IF(number_of_balls>0) number_of_balls-=1; END
END

//-----------------------------------------------------------------------------

PROCESS small_ball_2(x,y,ix,iy);

PRIVATE
    direction;

BEGIN
    file=pong_file;
    graph=19;
    direction=rand(1,2);
    REPEAT
        FRAME(20);
        IF(collision(TYPE small_asteroid))
            ix=-ix; END
        IF (y==28 or y==372)
            iy=-iy;
        END
        IF ((x==20 and abs(y-raquet1.y)<44) or
           (x==620 and abs(y-raquet2.y)<44))
            ix=-ix;
        END
        IF(x<0)
            small_player1_score+=1; END
        IF(x>640)
            small_player2_score+=1; END
        IF(direction==1)
            x=x-ix;
            y=y-iy;
        END
        IF(direction==2)
            x=x+ix;
            y=y+iy;
        END
    UNTIL (out_region(id,0))
    small_ball2=FALSE;
END

//-----------------------------------------------------------------------------


PROCESS small_asteroid();

BEGIN
    file=pong_file;
    graph=21;
    x=rand(220,420);
    y=-10;
    FRAME;
        WHILE(y<500)
        y+=(rand(2,5));
        x+=(rand(0,10));
        x-=(rand(0,10));
        graph+=1;
        IF(graph>39) graph=21; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------


PROCESS small_raquet(x,y,up,down)

PRIVATE
    reverse;
    spin;
BEGIN
    file=pong_file;
    graph=11;
    reverse=FALSE;
    spin=FALSE;
    small_ball2=FALSE;
    LOOP
        FRAME;
            IF(rand(0,400)==0)
                flags=4; END
            IF(rand(0,200)==0)
                flags=0; END
            IF(rand(0,600)==0)
                small_ball(320,200,2,2); number_of_balls+=1; END
            IF(small_ball2==FALSE AND rand(0,400)==0)
                small_ball_2(320,200,1,1); small_ball2=TRUE; END
            IF(rand(0,400)==0)
                graph=10; END
            IF(rand(0,400)==0)
                graph=12; END
            IF(rand(0,200)==0)
                graph=11; END
            IF(rand(0,600)==0)
                reverse=TRUE; END
            IF(rand(0,200)==0)
                reverse=FALSE; END
            IF(spin==TRUE) angle+=40000; END
            IF(rand(0,500)==0)
                spin=TRUE; END
            IF(rand(0,200)==0)
                spin=FALSE; angle=0; END
            IF(rand(0,200)==0)
                small_asteroid(); END
            IF(reverse==FALSE)
                IF (key(up) and y>48)
                    y=y-8;
                END
                IF (key(down) and y<352)
                    y=y+8;
                END
            END
            IF(reverse==TRUE)
                IF (key(up) and y<352)
                    y=y+8;
                END
                IF (key(down) and y>48)
                    y=y-8;
                END
        END
    END
END

//-----------------------------------------------------------------------------
//  @SPACE BLAST
//-----------------------------------------------------------------------------

PROCESS space_blast();

BEGIN
    space_ship1_explosion=FALSE;
    space_ship2_explosion=FALSE;
    space_ship3_explosion=FALSE;
    space_ship4_explosion=FALSE;
    set_mode(m640x480);
    set_fps(18,18);
    load_pal("fpg\og\spmain.fpg");
    sound(s_tune4,volume,frequency);
    mouse.file=space_main_file;
    mouse.graph=10;
    screen=0;
    new_screen=0;
    write(space_main_font,320,140,4,"ONE PLAYER");
    write(space_main_font,320,190,4,"TWO PLAYERS");
    write(space_main_font,320,240,4,"THREE PLAYERS");
    write(space_main_font,320,290,4,"FOUR PLAYERS");
    write(space_main_font,320,340,4,"BACK");
    start_scroll(0,space_main_file,1,102,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    LOOP
        FRAME;
            fade_on();
            WHILE (new_screen==0);
            y-=2;
            IF(mouse.y>120 AND mouse.y<170 AND mouse.left) new_screen=310; END
            IF(mouse.y>170 AND mouse.y<220 AND mouse.left) new_screen=311; END
            IF(mouse.y>220 AND mouse.y<270 AND mouse.left) new_screen=312; END
            IF(mouse.y>270 AND mouse.y<320 AND mouse.left) new_screen=313; END
            IF(mouse.y>320 AND mouse.y<420 AND mouse.left) new_screen=1; END
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
        fade_off();
        clear_screen();
        delete_text(all_text);
        stop_sound(all_sound);
        stop_scroll(0);
        screen=new_screen;
    END
END

//-----------------------------------------------------------------------------

PROCESS one_player();

BEGIN
    mouse.graph=0;
    space_players=50;
    screen=0;
    new_screen=0;
    put_screen(space_main_file,9);
    sound(s_tune4,volume,frequency);
    id1=space_player1(space_players,320,480);
    space_fortress(space_players,1000,500);
    pause();
    start_scroll(0,space_main_file,20,102,0,15);
    FRAME;
        fade_on();
        WHILE (new_screen==0)
        IF(key(_esc)) new_screen=300; END
        IF(space_player1_health<=0) space_player_winner=5; new_screen=314; END
        IF(space_fortress_health<=0) space_player_winner=6; new_screen=314; END
        FRAME;
    END
    fade_off();
    clear_screen();
    stop_sound(all_sound);
    delete_text(all_text);
    stop_scroll(0);
    signal(id1,s_kill);
    signal(TYPE space_torpedo1,s_kill);
    signal(TYPE space_torpedo2,s_kill);
    signal(TYPE space_torpedo3,s_kill);
    signal(TYPE space_torpedo4,s_kill);
    signal(TYPE pause,s_kill);
    signal(id,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS two_players();

BEGIN
    mouse.graph=0;
    space_players=50;
    screen=0;
    new_screen=0;
    put_screen(space_main_file,9);
    sound(s_tune4,volume,frequency);
    id1=space_player1(space_players,320,480);
    id2=space_player2(space_players,320,240);
    define_region(1,0,0,319,480);
    define_region(2,322,0,319,480);
    start_scroll(0,space_main_file,20,102,1,15);
    start_scroll(1,space_main_file,20,102,2,15);
    space_fortress(space_players,1000,500);
    pause();
    FRAME;
        fade_on();
        WHILE (new_screen==0)
        IF(key(_esc)) new_screen=300; END
        IF(space_player1_health<=0) space_player_winner=2; new_screen=314; END
        IF(space_player2_health<=0) space_player_winner=1; new_screen=314; END
        IF(space_player1_health<=0 AND space_player2_health<=0) space_player_winner=0; new_screen=314; END
        FRAME;
    END
    fade_off();
    clear_screen();
    stop_sound(all_sound);
    delete_text(all_text);
    stop_scroll(0);
    stop_scroll(1);
    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(TYPE space_torpedo1,s_kill);
    signal(TYPE space_torpedo2,s_kill);
    signal(TYPE space_torpedo3,s_kill);
    signal(TYPE space_torpedo4,s_kill);
    signal(id,s_kill);
    signal(TYPE pause,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS three_players();

BEGIN
    mouse.graph=0;
    space_players=40;
    screen=0;
    new_screen=0;
    put_screen(space_main_file,9);
    sound(s_tune4,volume,frequency);
    id1=space_player1(space_players,320,480);
    id2=space_player2(space_players,320,240);
    id3=space_player3(space_players,420,240);
    define_region(1,0,0,319,239);
    define_region(2,322,0,640,239);
    define_region(3,0,242,319,480);
    start_scroll(0,space_main_file,20,102,1,15);
    start_scroll(1,space_main_file,20,102,2,15);
    start_scroll(2,space_main_file,20,102,3,15);
    space_fortress(space_players,1000,500);
    pause();
    FRAME;
        fade_on();
        WHILE (new_screen==0)
        IF(key(_esc)) new_screen=300; END
        IF(space_player1_health<=0 AND space_player2_health<=0) space_player_winner=3; new_screen=314; END
        IF(space_player1_health<=0 AND space_player3_health<=0) space_player_winner=2; new_screen=314; END
        IF(space_player2_health<=0 AND space_player3_health<=0) space_player_winner=1; new_screen=314; END
        IF(space_player1_health<=0 AND space_player2_health<=0 AND space_player3_health<=0) space_player_winner=0; new_screen=314; END
        FRAME;
    END
    signal(TYPE pause,s_kill);
    fade_off();
    clear_screen();
    stop_sound(all_sound);
    delete_text(all_text);
    stop_scroll(0);
    stop_scroll(1);
    stop_scroll(2);
    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(id3,s_kill);
    signal(TYPE space_torpedo1,s_kill);
    signal(TYPE space_torpedo2,s_kill);
    signal(TYPE space_torpedo3,s_kill);
    signal(TYPE space_torpedo4,s_kill);
    signal(id,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS four_players();

BEGIN
    mouse.graph=0;
    space_players=40;
    screen=0;
    new_screen=0;
    put_screen(space_main_file,9);
    sound(s_tune4,volume,frequency);
    id1=space_player1(space_players,320,480);
    id2=space_player2(space_players,320,280);
    id3=space_player3(space_players,420,440);
    id4=space_player4(space_players,420,240);
    define_region(1,0,0,319,239);
    define_region(2,322,0,640,239);
    define_region(3,0,242,319,480);
    define_region(4,322,242,640,480);
    start_scroll(0,space_main_file,20,102,1,15);
    start_scroll(1,space_main_file,20,102,2,15);
    start_scroll(2,space_main_file,20,102,3,15);
    start_scroll(3,space_main_file,20,102,4,15);
    space_fortress(space_players,1000,500);
    pause();
    FRAME;
        fade_on();
        WHILE (new_screen==0)
        IF(key(_esc)) new_screen=300; END
        IF(space_player1_health<=0 AND space_player2_health<=0 AND space_player3_health<=0) space_player_winner=4; new_screen=314; END
        IF(space_player1_health<=0 AND space_player2_health<=0 AND space_player4_health<=0) space_player_winner=3; new_screen=314; END
        IF(space_player1_health<=0 AND space_player3_health<=0 AND space_player4_health<=0) space_player_winner=2; new_screen=314; END
        IF(space_player2_health<=0 AND space_player3_health<=0 AND space_player4_health<=0) space_player_winner=1; new_screen=314; END
        IF(space_player1_health<=0 AND space_player2_health<=0 AND space_player3_health<=0 AND space_player4_health<=0) space_player_winner=0; new_screen=314; END
        FRAME;
    END
    signal(TYPE pause,s_kill);
    fade_off();
    clear_screen();
    stop_sound(all_sound);
    delete_text(all_text);
    stop_scroll(0);
    stop_scroll(1);
    stop_scroll(2);
    stop_scroll(3);
    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(id3,s_kill);
    signal(id4,s_kill);
    signal(TYPE space_torpedo1,s_kill);
    signal(TYPE space_torpedo2,s_kill);
    signal(TYPE space_torpedo3,s_kill);
    signal(TYPE space_torpedo4,s_kill);
    signal(id,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS winner();

BEGIN
    sound(s_tune4,volume,frequency);
    mouse.file=space_main_file;
    mouse.graph=10;
    screen=0;
    new_screen=0;
    start_scroll(0,space_main_file,1,102,0,15);
    scroll.camera=id;
    ctype=c_scroll;
    IF(space_player_winner==0) write(space_main_font,320,240,4,"DRAW"); END
    IF(space_player_winner==1) write(space_main_font,320,240,4,"PLAYER 1 WINS"); END
    IF(space_player_winner==2) write(space_main_font,320,240,4,"PLAYER 2 WINS"); END
    IF(space_player_winner==3) write(space_main_font,320,240,4,"PLAYER 3 WINS"); END
    IF(space_player_winner==4) write(space_main_font,320,240,4,"PLAYER 4 WINS"); END
    IF(space_player_winner==5) write(space_main_font,320,240,4,"YOU LOOSE"); END
    IF(space_player_winner==6) write(space_main_font,320,240,4,"YOU WIN"); END
    LOOP
        FRAME;
            fade_on();
            WHILE (new_screen==0);
            y-=2;
            IF(key(_space) OR key(_enter) OR mouse.left) new_screen=300; END
            IF(key(_esc)) new_screen=300; END
            FRAME;
        END
        fade_off();
        clear_screen();
        delete_text(all_text);
        stop_sound(all_sound);
        stop_scroll(0);
        screen=new_screen;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_player1(size,x,y);

PRIVATE
    fire_torpedo1=0;
    player1_live;
    player_collision;

BEGIN
    space_player1_health=100;
    player1_live=TRUE;
    ctype=c_scroll;
    scroll[0].camera=id;
    file=space_ships_file;
    graph=1;
    write_int(space_main_font,160,0,1,& space_player1_health);
    FRAME;
        WHILE (player1_live==TRUE)
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_1)) space_player1_health=100; END
        fire_torpedo1+=1;
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END
        IF(key(_up)) advance(10); END
        IF(key(_control) AND fire_torpedo1>12) space_torpedo1(space_players,x,y,angle); fire_torpedo1=0; END
        IF(player_collision==FALSE AND collision(TYPE space_player2)) space_explosion(space_players,x,y); player_collision=TRUE; space_player1_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player3)) space_explosion(space_players,x,y); player_collision=TRUE; space_player1_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player4)) space_explosion(space_players,x,y); player_collision=TRUE; space_player1_health-=5; END
        IF(NOT collision(TYPE space_player2) AND NOT collision(TYPE space_player3) AND NOT collision(TYPE space_player4)) player_collision=FALSE; END
        IF(x<0) x=0; END
        IF(x>1920) x=1920; END
        IF(y<0) y=0; END
        IF(y>1440) y=1440; END
        IF(space_player1_health<1) player1_live=FALSE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_player2(size,x,y)

PRIVATE
    fire_torpedo2=0;
    player2_live;
    player_collision;

BEGIN
    space_player2_health=100;
    player2_live=TRUE;
    ctype=c_scroll;
    scroll[1].camera=id;
    file=space_ships_file;
    graph=2;
    write_int(space_main_font,480,0,1,& space_player2_health);
    FRAME;
        WHILE (player2_live==TRUE)
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_2)) space_player2_health=100; END
        fire_torpedo2+=1;
        IF(key(_r)) angle+=5000; END
        IF(key(_t)) angle-=5000; END
        IF(key(_q)) advance(10); END
        IF(key(_space) AND fire_torpedo2>12) space_torpedo2(space_players,x,y,angle); fire_torpedo2=0; END
        IF(player_collision==FALSE AND collision(TYPE space_player1)) space_explosion(space_players,x,y); player_collision=TRUE; space_player2_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player3)) space_explosion(space_players,x,y); player_collision=TRUE; space_player2_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player4)) space_explosion(space_players,x,y); player_collision=TRUE; space_player2_health-=5; END
        IF(NOT collision(TYPE space_player1) AND NOT collision(TYPE space_player3) AND NOT collision(TYPE space_player4)) player_collision=FALSE; END
        IF(x<0) x=0; END
        IF(x>1920) x=1920; END
        IF(y<0) y=0; END
        IF(y>1440) y=1440; END
        IF(space_player2_health<1) player2_live=FALSE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_player3(size,x,y)

PRIVATE
    fire_torpedo3=0;
    player3_live;
    player_collision;

BEGIN
    space_player3_health=100;
    player3_live=TRUE;
    ctype=c_scroll;
    scroll[2].camera=id;
    file=space_ships_file;
    graph=1;
    write_int(space_main_font,160,242,1,& space_player3_health);
    FRAME;
        WHILE (player3_live==TRUE)
        fire_torpedo3+=1;
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_3)) space_player3_health=100; END
        IF(key(_o)) angle+=5000; END
        IF(key(_p)) angle-=5000; END
        IF(key(_u)) advance(10); END
        IF(key(_comma) AND fire_torpedo3>12) space_torpedo3(space_players,x,y,angle); fire_torpedo3=0; END
        IF(player_collision==FALSE AND collision(TYPE space_player1)) space_explosion(space_players,x,y); player_collision=TRUE; space_player3_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player2)) space_explosion(space_players,x,y); player_collision=TRUE; space_player3_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player4)) space_explosion(space_players,x,y); player_collision=TRUE; space_player3_health-=5; END
        IF(NOT collision(TYPE space_player1) AND NOT collision(TYPE space_player2) AND NOT collision(TYPE space_player4)) player_collision=FALSE; END
        IF(x<0) x=0; END
        IF(x>1920) x=1920; END
        IF(y<0) y=0; END
        IF(y>1440) y=1440; END
        IF(space_player3_health<1) player3_live=FALSE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_player4(size,x,y)

PRIVATE
    fire_torpedo4=0;
    player4_live;
    player_collision;

BEGIN
    space_player4_health=100;
    player4_live=TRUE;
    ctype=c_scroll;
    scroll[3].camera=id;
    file=space_ships_file;
    graph=2;
    write_int(space_main_font,480,242,1,& space_player4_health);
    FRAME;
        WHILE(player4_live==TRUE)
        IF(game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_4)) space_player4_health=100; END
        fire_torpedo4+=1;
        IF(joy.left) angle+=5000; END
        IF(joy.right) angle-=5000; END
        IF(joy.up) advance(10); END
        IF(joy.button1 AND fire_torpedo4>12) space_torpedo4(space_players,x,y,angle); fire_torpedo4=0; END
        IF(player_collision==FALSE AND collision(TYPE space_player1)) space_explosion(space_players,x,y); player_collision=TRUE; space_player4_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player2)) space_explosion(space_players,x,y); player_collision=TRUE; space_player4_health-=5; END
        IF(player_collision==FALSE AND collision(TYPE space_player3)) space_explosion(space_players,x,y); player_collision=TRUE; space_player4_health-=5; END
        IF(NOT collision(TYPE space_player1) AND NOT collision(TYPE space_player2) AND NOT collision(TYPE space_player3)) player_collision=FALSE; END
        IF(x<0) x=0; END
        IF(x>1920) x=1920; END
        IF(y<0) y=0; END
        IF(y>1440) y=1440; END
        IF(space_player4_health<1) player4_live=FALSE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_fortress(size,x,y)

PRIVATE
    fire_torpedo_fortress=0;
    fortress_live;

BEGIN
    space_fortress_health=200;
    fortress_live=TRUE;
    ctype=c_scroll;
    file=space_ships_file;
    graph=20;
    FRAME;
        WHILE(fortress_live==TRUE)
        fire_torpedo_fortress+=1;
        angle+=5000;
        IF(fire_torpedo_fortress>60 AND get_dist(id1)<300) space_torpedo_fortress(space_players,x,y,get_angle(id1)); fire_torpedo_fortress=0; END
        IF(fire_torpedo_fortress>60 AND get_dist(id2)<300) space_torpedo_fortress(space_players,x,y,get_angle(id2)); fire_torpedo_fortress=0; END
        IF(fire_torpedo_fortress>60 AND get_dist(id3)<300) space_torpedo_fortress(space_players,x,y,get_angle(id3)); fire_torpedo_fortress=0; END
        IF(fire_torpedo_fortress>60 AND get_dist(id4)<300) space_torpedo_fortress(space_players,x,y,get_angle(id4)); fire_torpedo_fortress=0; END
        IF(space_fortress_health<1) fortress_live=FALSE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END


//-----------------------------------------------------------------------------

PROCESS space_torpedo1(size,x,y,angle)

PRIVATE
    torpedo_hit1;

BEGIN
    torpedo_hit1=FALSE;
    sound(space_s_laser,volume,frequency);
    ctype=c_scroll;
    advance(20);
    file=space_ships_file;
    graph=10;
    z=100;
    FRAME;
        WHILE (torpedo_hit1==FALSE)
        advance(16);
        IF(collision(TYPE space_player2)) torpedo_hit1=TRUE; space_player2_health-=5; END
        IF(collision(TYPE space_player3)) torpedo_hit1=TRUE; space_player3_health-=5; END
        IF(collision(TYPE space_player4)) torpedo_hit1=TRUE; space_player4_health-=5; END
        IF(collision(TYPE space_fortress)) torpedo_hit1=TRUE; space_fortress_health-=5; END
        IF(x<0) torpedo_hit1=TRUE; END
        IF(x>2000) torpedo_hit1=TRUE; END
        IF(y<0) torpedo_hit1=TRUE; END
        IF(y>1500) torpedo_hit1=TRUE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_torpedo2(size,x,y,angle)

PRIVATE
    torpedo_hit2;

BEGIN
    torpedo_hit2=FALSE;
    sound(space_s_laser,volume,frequency);
    ctype=c_scroll;
    advance(20);
    file=space_ships_file;
    graph=10;
    z=100;
    FRAME;
        WHILE (torpedo_hit2==FALSE)
        advance(16);
        IF(collision(TYPE space_player1)) torpedo_hit2=TRUE; space_player1_health-=5; END
        IF(collision(TYPE space_player3)) torpedo_hit2=TRUE; space_player3_health-=5; END
        IF(collision(TYPE space_player4)) torpedo_hit2=TRUE; space_player4_health-=5; END
        IF(collision(TYPE space_fortress)) torpedo_hit2=TRUE; space_fortress_health-=5; END
        IF(x<0) torpedo_hit2=TRUE; END
        IF(x>2000) torpedo_hit2=TRUE; END
        IF(y<0) torpedo_hit2=TRUE; END
        IF(y>1500) torpedo_hit2=TRUE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_torpedo3(size,x,y,angle)

PRIVATE
    torpedo_hit3;

BEGIN
    torpedo_hit3=FALSE;
    sound(space_s_laser,volume,frequency);
    ctype=c_scroll;
    advance(20);
    file=space_ships_file;
    graph=10;
    z=100;
    FRAME;
        WHILE (torpedo_hit3==FALSE)
        advance(16);
        IF(collision(TYPE space_player1)) torpedo_hit3=TRUE; space_player1_health-=5; END
        IF(collision(TYPE space_player2)) torpedo_hit3=TRUE; space_player2_health-=5; END
        IF(collision(TYPE space_player4)) torpedo_hit3=TRUE; space_player4_health-=5; END
        IF(collision(TYPE space_fortress)) torpedo_hit3=TRUE; space_fortress_health-=5; END
        IF(x<0) torpedo_hit3=TRUE; END
        IF(x>2000) torpedo_hit3=TRUE; END
        IF(y<0) torpedo_hit3=TRUE; END
        IF(y>1500) torpedo_hit3=TRUE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_torpedo4(size,x,y,angle)

PRIVATE
    torpedo_hit4;

BEGIN
    torpedo_hit4=FALSE;
    sound(space_s_laser,volume,frequency);
    ctype=c_scroll;
    advance(20);
    file=space_ships_file;
    graph=10;
    z=100;
    FRAME;
        WHILE (torpedo_hit4==FALSE)
        advance(16);
        IF(collision(TYPE space_player1)) torpedo_hit4=TRUE; space_player1_health-=5; END
        IF(collision(TYPE space_player2)) torpedo_hit4=TRUE; space_player2_health-=5; END
        IF(collision(TYPE space_player3)) torpedo_hit4=TRUE; space_player3_health-=5; END
        IF(collision(TYPE space_fortress)) torpedo_hit4=TRUE; space_fortress_health-=5; END
        IF(x<0) torpedo_hit4=TRUE; END
        IF(x>2000) torpedo_hit4=TRUE; END
        IF(y<0) torpedo_hit4=TRUE; END
        IF(y>1500) torpedo_hit4=TRUE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_torpedo_fortress(size,x,y,angle)

PRIVATE
    torpedo_fortress_hit;

BEGIN
    torpedo_fortress_hit=FALSE;
    sound(space_s_laser,volume,frequency);
    ctype=c_scroll;
    advance(20);
    file=space_ships_file;
    graph=11;
    z=100;
    FRAME;
        WHILE (torpedo_fortress_hit==FALSE)
        advance(16);
        IF(collision(TYPE space_player1)) torpedo_fortress_hit=TRUE; space_player1_health-=20; END
        IF(collision(TYPE space_player2)) torpedo_fortress_hit=TRUE; space_player2_health-=20; END
        IF(collision(TYPE space_player3)) torpedo_fortress_hit=TRUE; space_player3_health-=20; END
        IF(collision(TYPE space_player4)) torpedo_fortress_hit=TRUE; space_player4_health-=20; END
        IF(x<0) torpedo_fortress_hit=TRUE; END
        IF(x>2000) torpedo_fortress_hit=TRUE; END
        IF(y<0) torpedo_fortress_hit=TRUE; END
        IF(y>1500) torpedo_fortress_hit=TRUE; END
        FRAME;
        END
        sound(s_explosion1,volume,frequency);
        z=0;
        FROM graph=51 TO 70;
        FRAME;
    END
END


//-----------------------------------------------------------------------------

PROCESS space_explosion(size,x,y)

PRIVATE
    explosion_1234;

BEGIN
    explosion_1234=FALSE;
    sound(s_explosion1,volume,frequency);
    ctype=c_scroll;
    file=space_ships_file;
    WHILE (explosion_1234==TRUE)
        FRAME;
    END
    FROM graph=51 TO 70;
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @ASTEROIDS
//-----------------------------------------------------------------------------

PROCESS asteroids();

BEGIN
    mouse.graph=0;
    screen=0;
    new_screen=0;
    sound(s_tune2,volume+100,frequency);
    load("dat\og\ast.dat",&ast_high_score);
    pause();

    set_mode(m640x480);
    set_fps(18,18);
    put_screen(ast_file,63);
    ast_ship(320,240,41);

    write(small_small_font,475,20,5,"TOP SCORE = ");
    write_int(small_small_font,485,20,3,OFFSET ast_high_score);
    write(small_small_font,155,20,5,"SCORE = ");
    write_int(small_small_font,165,20,3,OFFSET ast_score);
    FROM x=1 TO 4; ast_asteroid(1); END
    FROM x=1 TO 4; ast_asteroid(21); END
        FRAME;
            fade_on();
            WHILE (new_screen==0);
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
        ast_score=0;
        clear_screen();
        signal(TYPE pause,s_kill);
        signal(TYPE ast_ship,s_kill);
        signal(TYPE ast_shot,s_kill);
        signal(TYPE ast_asteroid,s_kill);
        signal(TYPE ast_new_coordinates,s_kill);
        signal(TYPE ast_sheild,s_kill);
        delete_text(all_text);
        stop_sound(all_sound);
        stop_scroll(0);
        screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS ast_ship(x,y,graph)

PRIVATE
    fire_shot;
    sheild;

BEGIN
    file=ast_file;
    sheild=FALSE;
    LOOP
        fire_shot+=1;
        IF (key(_left)) angle=angle+10000; END
        IF (key(_right)) angle=angle-10000; END
        IF (key(_up)) advance(8); END
        IF(key(_down)) advance(-5); END
        IF (fire_shot>7 AND (key(_control) OR key(_space))) ast_shot(x,y,angle); fire_shot=0; END
        IF(sheild==FALSE AND collision(TYPE ast_asteroid)) BREAK; END
        IF(sheild==FALSE AND game_cheats==TRUE AND key(_l_shift) AND key(_tab) AND key(_1)) ast_sheild(); sheild=TRUE;  END
        ast_new_coordinates();
        FRAME;
    END
    sound(s_worms_explosion,volume,frequency);
    FROM graph=100 TO 114; FRAME; END
    ast_ship(320,240,41);
    IF(ast_score>ast_high_score) ast_high_score=ast_score;
    save("dat\og\ast.dat",&ast_high_score,1); END
    signal(TYPE ast_asteroid,s_kill);
    FROM x=1 TO 4; ast_asteroid(1); END
    FROM x=1 TO 4; ast_asteroid(21); END
    ast_score=0;
END

//-----------------------------------------------------------------------------

PROCESS ast_shot(x,y,angle)
BEGIN
    sound(space_s_laser,volume,frequency);
    file=ast_file;
    advance(24); graph=42;
    WHILE (NOT out_region(id,0))
        advance(16);
        FRAME;
    END
END

//-----------------------------------------------------------------------------


PROCESS ast_asteroid(graphnumber)
BEGIN
    file=ast_file;
    LOOP
        x=0; y=0; graph=graphnumber;
        angle=rand(-180000,180000);
        LOOP
            graph=graph+1;
            IF (graph==graphnumber+20) graph=graphnumber; END
            advance(4);
            IF (collision (TYPE ast_shot)) BREAK; END
            ast_new_coordinates();
            FRAME;
        END
        sound(s_worms_explosion,volume,frequency);
        ast_score=ast_score+5;
        FROM graph=100 TO 114; FRAME; END
    END
END

//-----------------------------------------------------------------------------


PROCESS ast_new_coordinates()
BEGIN
    IF (father.x<-20) father.x=father.x+680; END
    IF (father.x>660) father.x=father.x-680; END
    IF (father.y<-20) father.y=father.y+520; END
    IF (father.y>500) father.y=father.y-520; END
END

//-----------------------------------------------------------------------------

PROCESS ast_sheild();
BEGIN
    file=ast_file;
    graph=90;
    flags=4;
    x=father.x;
    y=father.y;
    LOOP
    x=father.x;
    y=father.y;
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @TANK BLAST
//-----------------------------------------------------------------------------

PROCESS tank_owen_games();

BEGIN
    load_pal("fpg\og\tmain.fpg");
    set_mode(m640x480);
    frames_per_second=24;
    set_fps(frames_per_second,0);
    main_background=rand(1,6);
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    sound(s_tune15,volume,frequency);
    file=main_file;
    graph=2;
    x=0;
    y=240;
    put_screen(photo_file,main_background);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(x<320) x+=15; END
        IF(x>319 AND y<600) y+=15; END
        IF(y>599) new_screen=502; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS title();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    write(small_font,320,460,4,"OWEN GAMES (c) 2001");
    file=main_file;
    graph=3;
    x=0;
    y=240;
    put_screen(photo_file,main_background);
    FRAME;
        WHILE (new_screen==0);
        IF(x<320) x+=15; END
        IF(x>319 AND y>80) y-=15; END
        IF(y<79) new_screen=503; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS options();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    write(small_font,320,460,4,"OWEN GAMES (c) 2001");
    file=main_file;
    graph=4;
    x=-400;
    y=280;
    put_screen(photo_file,main_background);
    put(main_file,3,320,80);
    FRAME;
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(mouse.left AND mouse.y>200 AND mouse.y<240) new_screen=505; END
        IF(mouse.left AND mouse.y>240 AND mouse.y<280) new_screen=509; END
        IF(mouse.left AND mouse.y>280 AND mouse.y<320) new_screen=550; END
                IF(x<320) x+=15; END
        IF(key(_esc) OR mouse.left AND mouse.y>320 AND mouse.y<360) new_screen=590; END
        FRAME;
    END
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS exit_screen();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=1;
    FRAME;
        WHILE (new_screen==0);
        FRAME;
    END
    stop_scroll(0);
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS game_type();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    write(small_font,320,460,4,"OWEN GAMES (c) 2001");
    file=main_file;
    graph=6;
    x=0;
    y=280;
    put_screen(photo_file,main_background);
    put(main_file,3,320,80);
    FRAME;
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(x<320) x+=15; END
        IF(mouse.left AND mouse.y>200 AND mouse.y<240) new_screen=519; END
        IF(mouse.left AND mouse.y>240 AND mouse.y<280) new_screen=510; END
        IF(mouse.left AND mouse.y>280 AND mouse.y<320) new_screen=550; END
        IF(key(_esc) OR mouse.left AND mouse.y>320 AND mouse.y<360) new_screen=501; END
        FRAME;
    END
    stop_scroll(0);
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS mission_complete();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    sound(s_tune4,volume,frequency);
    write(title_font,320,200,4,"MISSION");
    write(title_font,320,280,4,"COMPLETE");
    put_screen(photo_file,main_background);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(mouse.left) new_screen=512; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_type();

PRIVATE
    hot_seat_players_text;

BEGIN
    hot_seat_players=2;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    write(small_font,320,460,4,"OWEN GAMES (c) 2001");
    file=main_file;
    graph=9;
    x=0;
    y=280;
    put_screen(photo_file,main_background);
    put(main_file,3,320,80);
    FRAME;
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(x<320) x+=15; END
        IF(mouse.left AND mouse.y>240 AND mouse.y<280) new_screen=570; END
        IF(mouse.left AND mouse.y>280 AND mouse.y<320) new_screen=580; END
        IF(key(_esc) OR mouse.left AND mouse.y>320 AND mouse.y<360) new_screen=501; END
        FRAME;
    END
    stop_scroll(0);
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS game_over();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,20);
    sound(s_tune3,volume,frequency);
    IF(player1_game_over==TRUE) write(title_font,320,240,4,"GAME OVER!"); END
    IF(spy_dead==TRUE) write(title_font,320,240,4,"GAME OVER!"); END
    IF(hot_seat_player1_game_over==TRUE AND hot_seat_player2_game_over==FALSE AND hot_seat_player1_capture_flag==FALSE AND hot_seat_player1_capture_flag==FALSE) write(title_font,320,240,4,"PLAYER 2 WINS!"); END
    IF(hot_seat_player1_game_over==FALSE AND hot_seat_player2_game_over==TRUE AND hot_seat_player1_capture_flag==FALSE AND hot_seat_player1_capture_flag==FALSE) write(title_font,320,240,4,"PLAYER 1 WINS!"); END
    IF(hot_seat_player1_game_over==TRUE AND hot_seat_player2_game_over==TRUE AND hot_seat_player1_capture_flag==FALSE AND hot_seat_player1_capture_flag==FALSE) write(title_font,320,240,4,"DRAW!"); END
    IF(hot_seat_player1_capture_flag==TRUE AND hot_seat_player2_capture_flag==FALSE) write(title_font,320,240,4,"PLAYER 1 WINS!"); END
    IF(hot_seat_player1_capture_flag==FALSE AND hot_seat_player2_capture_flag==TRUE) write(title_font,320,240,4,"PLAYER 2 WINS!"); END
    IF(hot_seat_player1_capture_flag==TRUE AND hot_seat_player2_capture_flag==TRUE) write(title_font,320,240,4,"DRAW!"); END
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        fade(rand(0,200),0,0,5);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=501; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS load_game();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    write(small_font,320,460,4,"OWEN GAMES (c) 2001");
    sound(s_tune10,volume,frequency);
    file=main_file;
    graph=10;
    x=0;
    y=280;
    put_screen(photo_file,main_background);
    put(main_file,3,320,80);
    FRAME;
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(x<320) x+=15; END
        IF(mouse.left AND mouse.y>145 AND mouse.y<190) load("dat\og\1levle.dat",&player1_levle); load("dat\og\1xspeed.dat",&player1_max_speed); load("dat\og\1nspeed.dat",&player1_min_speed); load("dat\og\1armour.dat",&player1_armour); load("dat\og\1w1.dat",&player1_weapon1); load("dat\og\1w2.dat",&player1_weapon2); load("dat\og\1w3.dat",&player1_weapon3); load("dat\og\1w4.dat",&player1_weapon4); load("dat\og\1w5.dat",&player1_weapon5); load("dat\og\1w6.dat",&player1_weapon6); load("dat\og\1w7.dat",&player1_weapon7); load("dat\og\1w8.dat",&player1_weapon8); load("dat\og\1w9.dat",&player1_weapon9); load("dat\og\1w10.dat",&player1_weapon10); load("dat\og\1flails.dat",&player1_flails); load("dat\og\1double.dat",&player1_double_machine_guns); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>190 AND mouse.y<235) load("dat\og\2levle.dat",&player1_levle); load("dat\og\2xspeed.dat",&player1_max_speed); load("dat\og\2nspeed.dat",&player1_min_speed); load("dat\og\2armour.dat",&player1_armour); load("dat\og\2w1.dat",&player1_weapon1); load("dat\og\2w2.dat",&player1_weapon2); load("dat\og\2w3.dat",&player1_weapon3); load("dat\og\2w4.dat",&player1_weapon4); load("dat\og\2w5.dat",&player1_weapon5); load("dat\og\2w6.dat",&player1_weapon6); load("dat\og\2w7.dat",&player1_weapon7); load("dat\og\2w8.dat",&player1_weapon8); load("dat\og\2w9.dat",&player1_weapon9); load("dat\og\2w10.dat",&player1_weapon10); load("dat\og\2flails.dat",&player1_flails); load("dat\og\2double.dat",&player1_double_machine_guns); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>235 AND mouse.y<280) load("dat\og\3levle.dat",&player1_levle); load("dat\og\3xspeed.dat",&player1_max_speed); load("dat\og\3nspeed.dat",&player1_min_speed); load("dat\og\3armour.dat",&player1_armour); load("dat\og\3w1.dat",&player1_weapon1); load("dat\og\3w2.dat",&player1_weapon2); load("dat\og\3w3.dat",&player1_weapon3); load("dat\og\3w4.dat",&player1_weapon4); load("dat\og\3w5.dat",&player1_weapon5); load("dat\og\3w6.dat",&player1_weapon6); load("dat\og\3w7.dat",&player1_weapon7); load("dat\og\3w8.dat",&player1_weapon8); load("dat\og\3w9.dat",&player1_weapon9); load("dat\og\3w10.dat",&player1_weapon10); load("dat\og\3flails.dat",&player1_flails); load("dat\og\3double.dat",&player1_double_machine_guns); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>280 AND mouse.y<325) load("dat\og\4levle.dat",&player1_levle); load("dat\og\4xspeed.dat",&player1_max_speed); load("dat\og\4nspeed.dat",&player1_min_speed); load("dat\og\4armour.dat",&player1_armour); load("dat\og\4w1.dat",&player1_weapon1); load("dat\og\4w2.dat",&player1_weapon2); load("dat\og\4w3.dat",&player1_weapon3); load("dat\og\4w4.dat",&player1_weapon4); load("dat\og\4w5.dat",&player1_weapon5); load("dat\og\4w6.dat",&player1_weapon6); load("dat\og\4w7.dat",&player1_weapon7); load("dat\og\4w8.dat",&player1_weapon8); load("dat\og\4w9.dat",&player1_weapon9); load("dat\og\4w10.dat",&player1_weapon10); load("dat\og\4flails.dat",&player1_flails); load("dat\og\4double.dat",&player1_double_machine_guns); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>325 AND mouse.y<370) load("dat\og\5levle.dat",&player1_levle); load("dat\og\5xspeed.dat",&player1_max_speed); load("dat\og\5nspeed.dat",&player1_min_speed); load("dat\og\5armour.dat",&player1_armour); load("dat\og\5w1.dat",&player1_weapon1); load("dat\og\5w2.dat",&player1_weapon2); load("dat\og\5w3.dat",&player1_weapon3); load("dat\og\5w4.dat",&player1_weapon4); load("dat\og\5w5.dat",&player1_weapon5); load("dat\og\5w6.dat",&player1_weapon6); load("dat\og\5w7.dat",&player1_weapon7); load("dat\og\5w8.dat",&player1_weapon8); load("dat\og\5w9.dat",&player1_weapon9); load("dat\og\5w10.dat",&player1_weapon10); load("dat\og\5flails.dat",&player1_flails); load("dat\og\5double.dat",&player1_double_machine_guns); new_screen=player1_levle+500; END
        IF(key(_esc) OR mouse.left AND mouse.y>370 AND mouse.y<415) new_screen=501; END
        FRAME;
    END
    stop_scroll(0);
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS save_game();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,main_background);
    put(main_file,10,320,280);
    write(title_font,320,60,4,"SAVE GAME");
    sound(s_tune4,volume,frequency);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(mouse.left AND mouse.y>145 AND mouse.y<190) save("dat\og\1levle.dat",&player1_levle,1); save("dat\og\1xspeed.dat",&player1_max_speed,1); save("dat\og\1nspeed.dat",&player1_min_speed,1); save("dat\og\1armour.dat",&player1_armour,1); save("dat\og\1w1.dat",&player1_weapon1,1); save("dat\og\1w2.dat",&player1_weapon2,1); save("dat\og\1w3.dat",&player1_weapon3,1); save("dat\og\1w4.dat",&player1_weapon4,1); save("dat\og\1w5.dat",&player1_weapon5,1); save("dat\og\1w6.dat",&player1_weapon6,1); save("dat\og\1w7.dat",&player1_weapon7,1); save("dat\og\1w8.dat",&player1_weapon8,1); save("dat\og\1w9.dat",&player1_weapon9,1); save("dat\og\1w10.dat",&player1_weapon10,1); save("dat\og\1flails.dat",&player1_flails,1); save("dat\og\1double.dat",&player1_double_machine_guns,1); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>190 AND mouse.y<235) save("dat\og\2levle.dat",&player1_levle,1); save("dat\og\2xspeed.dat",&player1_max_speed,1); save("dat\og\2nspeed.dat",&player1_min_speed,1); save("dat\og\2armour.dat",&player1_armour,1); save("dat\og\2w1.dat",&player1_weapon1,1); save("dat\og\2w2.dat",&player1_weapon2,1); save("dat\og\2w3.dat",&player1_weapon3,1); save("dat\og\2w4.dat",&player1_weapon4,1); save("dat\og\2w5.dat",&player1_weapon5,1); save("dat\og\2w6.dat",&player1_weapon6,1); save("dat\og\2w7.dat",&player1_weapon7,1); save("dat\og\2w8.dat",&player1_weapon8,1); save("dat\og\2w9.dat",&player1_weapon9,1); save("dat\og\2w10.dat",&player1_weapon10,1); save("dat\og\2flails.dat",&player1_flails,1); save("dat\og\2double.dat",&player1_double_machine_guns,1); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>235 AND mouse.y<280) save("dat\og\3levle.dat",&player1_levle,1); save("dat\og\3xspeed.dat",&player1_max_speed,1); save("dat\og\3nspeed.dat",&player1_min_speed,1); save("dat\og\3armour.dat",&player1_armour,1); save("dat\og\3w1.dat",&player1_weapon1,1); save("dat\og\3w2.dat",&player1_weapon2,1); save("dat\og\3w3.dat",&player1_weapon3,1); save("dat\og\3w4.dat",&player1_weapon4,1); save("dat\og\3w5.dat",&player1_weapon5,1); save("dat\og\3w6.dat",&player1_weapon6,1); save("dat\og\3w7.dat",&player1_weapon7,1); save("dat\og\3w8.dat",&player1_weapon8,1); save("dat\og\3w9.dat",&player1_weapon9,1); save("dat\og\3w10.dat",&player1_weapon10,1); save("dat\og\3flails.dat",&player1_flails,1); save("dat\og\3double.dat",&player1_double_machine_guns,1); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>280 AND mouse.y<325) save("dat\og\4levle.dat",&player1_levle,1); save("dat\og\4xspeed.dat",&player1_max_speed,1); save("dat\og\4nspeed.dat",&player1_min_speed,1); save("dat\og\4armour.dat",&player1_armour,1); save("dat\og\4w1.dat",&player1_weapon1,1); save("dat\og\4w2.dat",&player1_weapon2,1); save("dat\og\4w3.dat",&player1_weapon3,1); save("dat\og\4w4.dat",&player1_weapon4,1); save("dat\og\4w5.dat",&player1_weapon5,1); save("dat\og\4w6.dat",&player1_weapon6,1); save("dat\og\4w7.dat",&player1_weapon7,1); save("dat\og\4w8.dat",&player1_weapon8,1); save("dat\og\4w9.dat",&player1_weapon9,1); save("dat\og\4w10.dat",&player1_weapon10,1); save("dat\og\4flails.dat",&player1_flails,1); save("dat\og\4double.dat",&player1_double_machine_guns,1); new_screen=player1_levle+500; END
        IF(mouse.left AND mouse.y>325 AND mouse.y<370) save("dat\og\5levle.dat",&player1_levle,1); save("dat\og\5xspeed.dat",&player1_max_speed,1); save("dat\og\5nspeed.dat",&player1_min_speed,1); save("dat\og\5armour.dat",&player1_armour,1); save("dat\og\5w1.dat",&player1_weapon1,1); save("dat\og\5w2.dat",&player1_weapon2,1); save("dat\og\5w3.dat",&player1_weapon3,1); save("dat\og\5w4.dat",&player1_weapon4,1); save("dat\og\5w5.dat",&player1_weapon5,1); save("dat\og\5w6.dat",&player1_weapon6,1); save("dat\og\5w7.dat",&player1_weapon7,1); save("dat\og\5w8.dat",&player1_weapon8,1); save("dat\og\5w9.dat",&player1_weapon9,1); save("dat\og\5w10.dat",&player1_weapon10,1); save("dat\og\5flails.dat",&player1_flails,1); save("dat\og\5double.dat",&player1_double_machine_guns,1); new_screen=player1_levle+500; END
        IF(key(_esc) OR mouse.left AND mouse.y>370 AND mouse.y<415) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS tank_upgrades();

PRIVATE
    new_weapon;
    more_weapons;
    body_upgrade;

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,main_background);
    write(title_font,320,60,4,"TANK UPGRADES");
    IF(player1_armour<200) write(main_font,320,140,4,"ARMOUR PLATES"); END
    IF(player1_weapon2==0) write(main_font,320,180,4,"MISSILE LAUNCHER"); new_weapon=2; END
    IF(player1_weapon2>0 AND player1_weapon4==0) write(main_font,320,180,4,"MULTI-SHELLS"); new_weapon=4; END
    IF(player1_weapon1==20) write(main_font,320,220,4,"MORE SHELLS"); more_weapons=1; END
    IF(player1_weapon1>20 AND player1_weapon2==10) write(main_font,320,220,4,"MORE MISSILES"); more_weapons=2;  END
    IF(player1_weapon1>20 AND player1_weapon2>10 AND player1_weapon4==10) write(main_font,320,220,4,"MORE MULTI-SHELLS"); more_weapons=4; END
    IF(player1_double_machine_guns==FALSE) write(main_font,320,260,4,"DOUBLE-MACHINE GUNS"); END
    IF(player1_max_speed<20) write(main_font,320,300,4,"FASTER ENGINES"); END
    write(main_font,320,340,4,"STRONGER ENGINES");
    IF(player1_flails==FALSE) write(main_font,320,380,4,"FLAILS (ANTI-MINE)"); body_upgrade=1; END
    put_screen(photo_file,main_background);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(player1_armour<300 AND mouse.y>120 AND mouse.y<160 AND mouse.left) player1_armour+=50; new_screen=511; END
        IF(new_weapon==2 AND player1_weapon2==0 AND mouse.y>160 AND mouse.y<200 AND mouse.left) player1_weapon2+=10; new_screen=511; END
        IF(new_weapon==4 AND player1_weapon2>0 AND player1_weapon4==0 AND mouse.y>160 AND mouse.y<200 AND mouse.left) player1_weapon4+=5; new_screen=511; END
        IF(more_weapons==1 AND player1_weapon1==20 AND mouse.y>200 AND mouse.y<240 AND mouse.left) player1_weapon1+=10; new_screen=511; END
        IF(more_weapons==2 AND player1_weapon1>20 AND player1_weapon2==10 AND mouse.y>200 AND mouse.y<240 AND mouse.left) player1_weapon2+=5; new_screen=511; END
        IF(more_weapons==4 AND player1_weapon1>20 AND player1_weapon2>10 AND player1_weapon4==10 AND mouse.y>200 AND mouse.y<240 AND mouse.left) player1_weapon4+=5; new_screen=511; END
        IF(player1_double_machine_guns==FALSE AND mouse.y>240 AND mouse.y<280 AND mouse.left) player1_double_machine_guns=TRUE; new_screen=511; END
        IF(player1_max_speed<20 AND mouse.y>280 AND mouse.y<320 AND mouse.left) player1_max_speed+=5; player1_min_speed+=2; new_screen=511; END
        IF(body_upgrade==1 AND player1_flails==FALSE AND mouse.y>360 AND mouse.y<400 AND mouse.left) player1_flails=TRUE; new_screen=511; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS story_line();

BEGIN
    sound(s_tune15,volume,frequency);
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    player1_levle=21;
    new_screen=0;
    put_screen(photo_file,7);
    write(title_font,320,0,1,"TANK BLAST");
    write(small_font,10,140,0,"     WAR HAS BROKEN OUT IN THE MIDDLE EAST AND BRITISH TROOPS");
    write(small_font,10,160,0,"ARE AT THE FRONT LINES. AT THE MOMENT S.A.S TROOPS ARE BEING");
    write(small_font,10,180,0,"USED TO ACOMPLISH MISSIONS BEHIND THE ENEMY LINES. YOU ARE PART");
    write(small_font,10,200,0,"OF A NEW TYPE OF WARFARE, CODE NAMED TANK BLAST. YOU COMMAND");
    write(small_font,10,220,0,"A NEW SCOUT TANK WHICH IS FAST AND DURIBLE. YOU AND YOUR CREW");
    write(small_font,10,240,0,"ARE BEING SENT BEHIND ENEMY LINES TO DO THE JOB OF THE S.A.S,");
    write(small_font,10,260,0,"BUT WITH LESS CASULTIES. YOUR CREW WILL BE PUT UP AGAINST THE ");
    write(small_font,10,280,0,"FULL FORCE OF THE ENEMY AS YOU GO BEHIND ENEMY LINES. AS YOUR");
    write(small_font,10,300,0,"TANK BECOMES MORE SUCESFUL IT WILL BE UPGRADED, BUT APART FROM");
    write(small_font,10,320,0,"THAT, YOU'RE ON YOURE OWN");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=520; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS kill();

BEGIN
    signal(TYPE levle1_map,s_kill);
    signal(TYPE levle2_map,s_kill);
    signal(TYPE levle3_map,s_kill);
    signal(TYPE levle4_map,s_kill);
    signal(TYPE player1_flail,s_kill);
    signal(TYPE player1_flag_arrow,s_kill);
    signal(TYPE hot_seat_player1_arrow,s_kill);
    signal(TYPE hot_seat_player2_arrow,s_kill);
    signal(TYPE player1_mission1_arrow,s_kill);
    signal(TYPE player1_mission2_arrow,s_kill);
    signal(TYPE player1_mission3_arrow,s_kill);
    signal(TYPE army_turret_1,s_kill);
    signal(TYPE road,s_kill);
    signal(TYPE hill,s_kill);
    signal(TYPE background_music,s_kill);
    signal(TYPE player1_missile,s_kill);
    signal(TYPE player1_anti_aircraft_missile,s_kill);
    signal(TYPE barbed_wire_fence,s_kill);
    signal(TYPE player1,s_kill);
    signal(id2,s_kill);
    signal(TYPE bar,s_kill);
    signal(TYPE turret1,s_kill);
    signal(TYPE bigobject,s_kill);
    signal(TYPE missionbigobject,s_kill);
    signal(TYPE smallobject,s_kill);
    signal(TYPE highobject,s_kill);
    signal(TYPE army_man_1,s_kill);
    signal(TYPE army_van_1,s_kill);
    signal(TYPE flag1,s_kill);
    signal(TYPE flag2,s_kill);
    signal(TYPE pause,s_kill);
    signal(TYPE splat,s_kill);
    signal(TYPE player1_bullet,s_kill);
    signal(TYPE player1_shell,s_kill);
    signal(TYPE civilian1,s_kill);
    signal(TYPE blown_up_thing,s_kill);
    signal(TYPE weapon_selected,s_kill);
    signal(TYPE player1_low_armour,s_kill);
    signal(TYPE hot_seat_player1_arrow,s_kill);
    signal(TYPE hot_seat_player2_arrow,s_kill);
    signal(id11,s_kill);
    signal(id12,s_kill);
    signal(TYPE hot_seat_bar,s_kill);
    signal(TYPE hot_seat_turret1,s_kill);
    signal(TYPE hot_seat_turret2,s_kill);
    signal(TYPE army_turret_2,s_kill);
    signal(TYPE army_turret_base,s_kill);
    signal(TYPE hot_seat_player1_bullet,s_kill);
    signal(TYPE hot_seat_player1_shell,s_kill);
    signal(TYPE hot_seat_player2_bullet,s_kill);
    signal(TYPE hot_seat_player2_shell,s_kill);
    signal(TYPE player1_anti_tank_shell,s_kill);
    signal(TYPE army_man_bullet,s_kill);
    signal(TYPE army_shell,s_kill);
    signal(TYPE land_mine,s_kill);
    signal(TYPE hot_seat_player1,s_kill);
    signal(TYPE hot_seat_player2,s_kill);
    signal(TYPE army_helicopter,s_kill);
    signal(TYPE helicopter_blade,s_kill);
    signal(TYPE helicopter_shadow1,s_kill);
    signal(TYPE helicopter_shadow2,s_kill);
    signal(TYPE levle5_spy,s_kill);
    signal(TYPE player1_high_shell,s_kill);
    signal(TYPE player1_high_shell_explosion,s_kill);
    signal(TYPE multi1_map,s_kill);
    signal(TYPE multi2_map,s_kill);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @ GAME SCENERY
//-----------------------------------------------------------------------------

PROCESS levle1_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=1300;
    terrain_miny=0;
    terrain_maxy=1300;
    starting_point_1_x=1000;
    starting_point_1_y=100;
    starting_point_1_a=235000;
    starting_point_2_x=100;
    starting_point_2_y=1200;
    starting_point_2_a=45000;
    mission1_point_x=830;
    mission1_point_y=980;
    mission2_point_x=0;
    mission2_point_y=0;
    mission3_point_x=0;
    mission3_point_y=0;
    random_terrain=rand(1,3);
    land_mine(608,293);
    road(scenery_file,40,610,0,90000);
    road(scenery_file,40,610,595,90000);
    road(scenery_file,40,610,1299,90000);
    road(scenery_file,40,610,900,90000);
    army_van_1(50,1088,554,180000,FALSE,TRUE,0,20,0);
    army_van_1(51,1102,442,163000,FALSE,TRUE,0,20,0);
    army_van_1(52,843,559,35000,FALSE,TRUE,0,20,0);
    army_van_1(53,1040,332,212000,FALSE,TRUE,0,20,0);
    army_man_1(100,834,301,0,90000,2,15);
    army_man_1(100,801,297,0,90000,2,15);
    army_man_1(100,551,187,1020,270000,2,15);
    army_man_1(100,667,189,1020,270000,2,15);
    army_man_1(100,771,918,0,0,2,15);
    army_man_1(100,808,1061,0,0,2,15);
    army_man_1(100,208,1066,550,90000,2,15);
    army_man_1(100,245,558,250,0,2,15);
    army_man_1(100,978,624,330,107000,2,15);
    civilian1(160,160,500,580,rand(200,500),rand(0,360000));
    civilian1(160,160,669,466,rand(200,500),rand(0,360000));
    civilian1(160,160,946,459,rand(200,500),rand(0,360000));
    civilian1(160,160,618,699,rand(200,500),rand(0,360000));
    bigobject(scenery_file,10,400,350,0);
    bigobject(scenery_file,10,400,770,0);
    bigobject(scenery_file,10,830,770,0);
    bigobject(scenery_file,10,400,970,0);
    smallobject(scenery_file,26,800,290,0);
    smallobject(scenery_file,26,836,294,270000);
    bigobject(scenery_file,25,1080,681,0);
    bigobject(scenery_file,25,1298,681,0);
    missionbigobject(scenery_file,13,830,980,0,100);
    highobject(scenery_file,30,400,550,90000,100);
    highobject(scenery_file,30,620,770,0,100);
    barbed_wire_fence(721,911,270000,10);
    barbed_wire_fence(721,991,270000,10);
    barbed_wire_fence(721,1071,270000,10);
    barbed_wire_fence(937,910,90000,10);
    barbed_wire_fence(937,990,90000,10);
    barbed_wire_fence(937,1070,90000,10);
    bigobject(scenery_file,21,732,1121,0);
    bigobject(scenery_file,21,927,1121,0);
    barbed_wire_fence(782,1131,0,10);
    barbed_wire_fence(877,1131,0,10);
    barbed_wire_fence(822,1131,0,10);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS levle2_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=2199;
    terrain_miny=0;
    terrain_maxy=1498;
    starting_point_1_x=159;
    starting_point_1_y=1322;
    starting_point_1_a=45000;
    starting_point_2_x=2008;
    starting_point_2_y=140;
    starting_point_2_a=225000;
    mission1_point_x=800;
    mission1_point_y=700;
    mission2_point_x=0;
    mission2_point_y=0;
    mission3_point_x=0;
    mission3_point_y=0;
    random_terrain=rand(1,3);
    civilian1(160,160,625,374,rand(200,500),rand(0,360000));
    civilian1(160,160,1399,501,rand(200,500),rand(0,360000));
    civilian1(160,160,916,461,rand(200,500),rand(0,360000));
    civilian1(160,160,1219,813,rand(200,500),rand(0,360000));
    civilian1(160,160,852,884,rand(200,500),rand(0,360000));
    army_man_1(100,581,812,240,90000,2,15);
    army_man_1(100,457,699,320,180000,2,15);
    army_man_1(100,1206,572,270,0,2,15);
    army_man_1(100,1072,859,330,45000,2,15);
    army_man_1(100,1645,700,210,90000,2,15);
    army_man_1(110,880,910,400,120000,3,3);
    army_man_1(110,1323,718,500,280000,3,3);
    army_man_1(110,759,557,270,0,3,3);
    army_man_1(110,1263,532,380,90000,3,3);
    army_man_1(110,989,688,370,0,3,3);
    army_van_1(50,843,623,300000,FALSE,TRUE,0,20,0);
    army_van_1(51,969,631,216000,FALSE,TRUE,0,20,0);
    army_van_1(52,905,748,19000,FALSE,TRUE,0,20,0);
    army_van_1(50,647,698,0,FALSE,TRUE,0,20,1);
    army_van_1(51,750,796,30000,FALSE,TRUE,0,20,0);
    blown_up_thing(stuff_file,59,1046,685,15000);
    blown_up_thing(stuff_file,59,730,673,228000);
    blown_up_thing(stuff_file,59,855,698,0);
    blown_up_thing(stuff_file,59,918,802,315000);
    land_mine(518,702);
    land_mine(1314,654);
    land_mine(1141,733);
    land_mine(634,821);
    land_mine(726,612);
    splat(685,757);
    splat(849,526);
    splat(1202,630);
    splat(1064,758);
    splat(1466,686);
    splat(1323,752);
    splat(538,646);
    splat(293,695);
    splat(1312,296);
    splat(1416,1130);
    road(scenery_file,40,0,700,0);
    road(scenery_file,40,600,700,0);
    road(scenery_file,40,1186,670,5000);
    road(scenery_file,40,1772,587,10000);
    road(scenery_file,40,2353,482,10000);
    road(scenery_file,40,1350,965,95000);
    road(scenery_file,40,1403,1498,95000);
    road(scenery_file,40,1288,342,95000);
    road(scenery_file,40,1254,0,95000);
    bigobject(scenery_file,11,735,460,86000);
    bigobject(scenery_file,12,1110,487,0);
    bigobject(scenery_file,10,1525,849,0);
    bigobject(scenery_file,11,1554,454,0);
    bigobject(scenery_file,11,1154,944,60000);
    bigobject(scenery_file,11,741,989,60000);
    bigobject(scenery_file,25,534,437,270000);
    bigobject(scenery_file,25,694,298,0);
    bigobject(scenery_file,25,994,298,0);
    bigobject(scenery_file,25,535,934,90000);
    bigobject(scenery_file,25,697,1071,0);
    bigobject(scenery_file,25,994,1071,0);
    bigobject(scenery_file,25,1151,1071,0);
    bigobject(scenery_file,25,1574,1071,0);
    bigobject(scenery_file,25,1711,910,90000);
    bigobject(scenery_file,25,1711,797,90000);
    bigobject(scenery_file,25,1711,369,90000);
    bigobject(scenery_file,25,1550,298,0);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS levle3_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=1499;
    terrain_miny=0;
    terrain_maxy=1499;
    starting_point_1_x=1400;
    starting_point_1_y=750;
    starting_point_1_a=180000;
    starting_point_2_x=360;
    starting_point_2_y=1400;
    starting_point_2_a=90000;
    mission1_point_x=790;
    mission1_point_y=150;
    mission2_point_x=64;
    mission2_point_y=148;
    mission3_point_x=0;
    mission3_point_y=0;
    random_terrain=3;
    civilian1(160,160,1102,1055,rand(200,500),rand(0,360000));
    civilian1(160,160,842,1278,rand(200,500),rand(0,360000));
    civilian1(160,160,1178,1344,rand(200,500),rand(0,360000));
    civilian1(160,160,1050,1203,rand(200,500),rand(0,360000));
    civilian1(160,160,950,1326,rand(200,500),rand(0,360000));
    army_man_1(100,511,487,150,0,2,15);
    army_man_1(100,230,490,150,180000,2,15);
    army_man_1(100,960,40,480,270000,2,15);
    army_man_1(100,938,512,400,90000,2,15);
    army_man_1(100,506,171,260,180000,2,15);
    army_man_1(100,521,904,0,135000,2,15);
    army_man_1(100,890,320,330,180000,2,15);
    army_man_1(100,51,455,270,45000,2,15);
    army_man_1(100,340,24,460,270000,2,15);
    army_turret_base(470,270,0,300);
    land_mine(992,723);
    land_mine(993,760);
    land_mine(685,749);
    land_mine(333,1178);
    land_mine(363,1146);
    land_mine(629,880);
    land_mine(534,1002);
    road(scenery_file,40,1499,750,0);
    road(scenery_file,40,901,752,0);
    road(scenery_file,41,521,779,45000);
    road(scenery_file,41,386,901,90000);
    road(scenery_file,40,354,1292,90000);
    road(scenery_file,40,355,1499,90000);
    road(scenery_file,41,377,714,135000);
    road(scenery_file,40,347,333,90000);
    road(scenery_file,40,342,0,90000);
    bigobject(scenery_file,25,0,550,0);
    bigobject(scenery_file,25,140,550,0);
    bigobject(scenery_file,25,600,550,0);
    bigobject(scenery_file,25,890,550,0);
    bigobject(scenery_file,25,1027,398,90000);
    bigobject(scenery_file,25,1027,113,90000);
    bigobject(scenery_file,25,1027,0,90000);
    smallobject(scenery_file,26,240,480,270000);
    smallobject(scenery_file,26,510,480,0);
    bigobject(scenery_file,11,1291,1037,0);
    bigobject(scenery_file,12,871,1069,270000);
    bigobject(scenery_file,11,721,1354,330000);
    bigobject(scenery_file,11,995,1499,272000);
    bigobject(scenery_file,12,1337,1353,297000);
    smallobject(scenery_file,26,513,895,0);
    missionbigobject(scenery_file,10,790,150,0,600);
    missionbigobject(scenery_file,10,64,148,340000,600);
    bigobject(scenery_file,12,756,432,250000);
    highobject(scenery_file,30,562,107,0,100);
    highobject(scenery_file,30,306,107,0,100);
    barbed_wire_fence(320,551,0,10);
    barbed_wire_fence(410,551,0,10);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS levle4_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=2000;
    terrain_miny=0;
    terrain_maxy=1500;
    starting_point_1_x=1900;
    starting_point_1_y=1000;
    starting_point_1_a=180000;
    starting_point_2_x=800;
    starting_point_2_y=1400;
    starting_point_2_a=45000;
    mission1_point_x=300;
    mission1_point_y=260;
    mission2_point_x=270;
    mission2_point_y=1270;
    mission3_point_x=1780;
    mission3_point_y=230;
    random_terrain=rand(1,3);
    army_man_1(100,1190,190,650,180000,2,15);
    army_man_1(100,1179,263,650,180000,2,15);
    army_man_1(100,1360,85,325,270000,2,15);
    army_man_1(100,1435,70,325,270000,2,15);
    army_man_1(110,750,870,370,0,3,3);
    army_man_1(110,380,1260,350,0,3,3);
    army_man_1(110,351,1330,280,0,3,3);
    army_man_1(110,190,375,200,0,3,3);
    army_man_1(110,420,155,230,270000,3,3);
    army_man_1(110,1865,135,200,180000,3,3);
    army_man_1(110,1865,328,200,180000,3,3);
    army_man_1(110,1680,225,0,180000,3,3);
    army_man_2(120,365,1170,3);
    army_turret_base(900,750,0,300);
    land_mine(1110,1200);
    land_mine(238,1057);
    land_mine(1117,641);
    land_mine(440,428);
    land_mine(789,992);
    army_van_1(53,1940,1200,180000,TRUE,FALSE,750,20,1);
    road(scenery_file,40,1999,1200,0);
    road(scenery_file,40,1400,1202,0);
    road(scenery_file,41,1016,1228,45000);
    road(scenery_file,40,714,1486,45000);
    smallobject(scenery_file,26,955,720,270000);
    smallobject(scenery_file,26,950,780,180000);
    smallobject(scenery_file,26,375,1160,270000);
    missionbigobject(scenery_file,50,300,260,54000,400);
    missionbigobject(scenery_file,50,270,1270,25000,400);
    missionbigobject(scenery_file,50,1780,230,80000,400);
    hill(scenery_file,5,300,275,100);
    hill(scenery_file,5,310,1230,110);
    hill(scenery_file,5,1770,240,90);
    barbed_wire_fence(1261,191,270000,10);
    barbed_wire_fence(1261,273,270000,10);
    bigobject(scenery_file,25,1999,600,0);
    bigobject(scenery_file,25,1700,600,0);
    bigobject(scenery_file,25,1400,600,0);
    bigobject(scenery_file,25,1261,462,90000);
    bigobject(scenery_file,25,1261,0,90000);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS levle5_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=1300;
    terrain_miny=0;
    terrain_maxy=1500;
    starting_point_1_x=650;
    starting_point_1_y=70;
    starting_point_1_a=270000;
    starting_point_2_x=800;
    starting_point_2_y=1400;
    starting_point_2_a=45000;
    mission1_point_x=175;
    mission1_point_y=1390;
    mission2_point_x=0;
    mission2_point_y=0;
    mission3_point_x=0;
    mission3_point_y=0;
    random_terrain=rand(1,3);
    land_mine(544,467);
    land_mine(594,470);
    land_mine(688,473);
    land_mine(645,445);
    army_man_1(110,475,535,0,90000,3,3);
    army_man_1(110,750,535,0,90000,3,3);
    army_man_1(110,60,1220,280,0,3,3);
    army_man_1(110,60,1175,280,0,3,3);
    army_man_1(110,65,1065,880,0,3,3);
    army_man_1(110,55,1111,880,0,3,3);
    army_man_1(110,860,1350,0,0,3,3);
    army_man_1(110,1025,750,680,270000,3,3);
    army_man_1(110,1150,740,680,270000,3,3);
    army_man_1(110,500,700,0,0,3,3);
    army_man_1(110,1090,800,270,270000,3,3);
    army_man_2(120,865,1310,3);
    army_man_2(120,865,975,3);
    army_helicopter(200,310000,363,963,20);
    bigobject(scenery_file,25,1300,500,0);
    bigobject(scenery_file,25,1000,500,0);
    bigobject(scenery_file,25,0,500,0);
    bigobject(scenery_file,25,300,500,0);
    bigobject(scenery_file,25,925,500,0);
    bigobject(scenery_file,25,764,844,0);
    bigobject(scenery_file,25,437,637,90000);
    bigobject(scenery_file,25,576,844,0);
    bigobject(scenery_file,25,437,706,90000);
    bigobject(scenery_file,25,276,844,0);
    bigobject(scenery_file,25,0,844,0);
    levle5_spy(160,160,175,1390);
    smallobject(scenery_file,26,739,525,0);
    smallobject(scenery_file,26,478,525,270000);
    smallobject(scenery_file,26,875,980,180000);
    smallobject(scenery_file,26,875,1300,270000);
    smallobject(scenery_file,26,870,1355,180000);
    road(scenery_file,41,735,655,180000);
    road(scenery_file,41,611,519,135000);
    road(scenery_file,40,585,138,90000);
    road(scenery_file,40,585,0,90000);
    road(scenery_file,40,1132,685,0);
    road(scenery_file,40,1300,685,0);
    road(scenery_file,40,1096,1000,90000);
    road(scenery_file,40,1104,1499,90000);
    road(scenery_file,40,782,1102,0);
    road(scenery_file,40,276,1103,0);
    road(scenery_file,40,0,1104,0);
    barbed_wire_fence(900,552,90000,10);
    barbed_wire_fence(900,632,90000,10);
    barbed_wire_fence(900,712,90000,10);
    barbed_wire_fence(900,792,90000,10);
    bigobject(scenery_file,50,200,665,45000);
    bigobject(scenery_file,12,200,1300,56000);
    bigobject(scenery_file,11,620,1294,57000);
    bigobject(scenery_file,11,207,993,59000);
    bigobject(scenery_file,11,623,971,59000);
    bigobject(scenery_file,11,617,1364,57000);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS levle6_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=2000;
    terrain_miny=0;
    terrain_maxy=1500;
    starting_point_1_x=90;
    starting_point_1_y=750;
    starting_point_1_a=0;
    starting_point_2_x=800;
    starting_point_2_y=1400;
    starting_point_2_a=45000;
    mission1_point_x=1220;
    mission1_point_y=100;
    mission2_point_x=1850;
    mission2_point_y=90;
    mission3_point_x=1570;
    mission3_point_y=300;
    random_terrain=rand(1,3);
    army_helicopter(200,300000,800,550,20);
    army_man_2(120,735,895,3);
    army_man_2(120,1350,755,3);
    army_man_1(110,760,695,480,0,3,3);
    army_man_1(110,770,810,480,0,3,3);
    army_man_1(110,1310,680,0,180000,3,3);
    army_man_1(110,1360,805,0,180000,3,3);
    army_man_1(110,1350,100,400,0,3,3);
    army_man_1(110,1240,220,700,0,3,3);
    army_man_1(110,1560,550,270,0,3,3);
    army_man_1(110,1710,930,430,270000,3,3);
    army_man_1(110,930,1400,500,90000,3,3);
    army_man_1(110,1050,1360,500,90000,3,3);
    army_man_1(110,1380,1265,280,0,3,3);
    army_man_1(110,1750,375,140,270000,3,3);
    army_van_1(50,820,1030,0,FALSE,TRUE,0,20,1);
    army_van_1(51,830,1240,50000,FALSE,TRUE,0,20,0);
    army_van_1(52,850,1400,0,FALSE,TRUE,0,20,0);
    army_van_1(53,1160,1100,160000,FALSE,TRUE,0,20,1);
    army_van_1(52,1130,970,150,FALSE,TRUE,0,20,0);
    bigobject(scenery_file,50,900,150,220000);
    army_turret_base(1650,450,0,300);
    missionbigobject(scenery_file,60,1220,100,280000,10);
    missionbigobject(scenery_file,60,1850,90,225000,10);
    missionbigobject(scenery_file,60,1570,300,0,10);
    road(scenery_file,41,580,720,180000);
    road(scenery_file,41,454,585,135000);
    road(scenery_file,40,425,205,90000);
    road(scenery_file,40,422,0,90000);
    road(scenery_file,40,980,752,0);
    road(scenery_file,40,1580,750,0);
    road(scenery_file,40,2000,750,0);
    road(scenery_file,61,2200,300,0);
    road(scenery_file,61,2000,300,0);
    road(scenery_file,61,1400,300,0);
    road(scenery_file,40,990,1066,90000);
    road(scenery_file,40,992,1499,90000);
    road(scenery_file,40,1307,1260,0);
    road(scenery_file,40,1715,1065,90000);
    road(scenery_file,40,1720,1499,90000);
    road(scenery_file,40,1401,1266,0);
    hill(scenery_file,5,90,750,0);
    barbed_wire_fence(700,692,270000,10);
    barbed_wire_fence(700,811,270000,10);
    barbed_wire_fence(700,771,270000,10);
    barbed_wire_fence(1653,639,0,10);
    barbed_wire_fence(1773,639,0,10);
    barbed_wire_fence(1693,639,0,10);
    barbed_wire_fence(1652,862,180000,10);
    barbed_wire_fence(1773,862,180000,10);
    barbed_wire_fence(1692,862,180000,10);
    barbed_wire_fence(1323,1215,270000,10);
    barbed_wire_fence(1323,1255,270000,10);
    barbed_wire_fence(1323,1335,270000,10);
    bigobject(scenery_file,25,700,500,90000);
    bigobject(scenery_file,25,700,200,90000);
    bigobject(scenery_file,25,700,-100,90000);
    bigobject(scenery_file,25,700,1000,90000);
    bigobject(scenery_file,25,700,1300,90000);
    bigobject(scenery_file,25,700,1600,90000);
    bigobject(scenery_file,25,863,638,0);
    bigobject(scenery_file,25,1163,638,0);
    bigobject(scenery_file,25,1463,638,0);
    bigobject(scenery_file,25,1963,638,0);
    bigobject(scenery_file,25,2263,638,0);
    bigobject(scenery_file,25,1963,862,0);
    bigobject(scenery_file,25,2263,862,0);
    bigobject(scenery_file,25,1463,862,0);
    bigobject(scenery_file,25,1323,1024,90000);
    bigobject(scenery_file,25,1323,1499,90000);
    smallobject(scenery_file,26,742,887,270000);
    smallobject(scenery_file,26,1340,815,90000);
    smallobject(scenery_file,26,1346,750,0);
    smallobject(scenery_file,26,1298,685,90000);
    bigobject(scenery_file,11,1530,1410,58000);
    bigobject(scenery_file,11,1520,1040,100000);
    bigobject(scenery_file,12,1860,1340,330000);
    bigobject(scenery_file,12,1855,1155,330000);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS levle7_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=2000;
    terrain_miny=0;
    terrain_maxy=1000;
    starting_point_1_x=90;
    starting_point_1_y=750;
    starting_point_1_a=0;
    starting_point_2_x=800;
    starting_point_2_y=1400;
    starting_point_2_a=45000;
    mission1_point_x=1220;
    mission1_point_y=100;
    mission2_point_x=1850;
    mission2_point_y=90;
    mission3_point_x=1570;
    mission3_point_y=300;
    random_terrain=rand(1,3);

    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS multi1_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=800;
    terrain_miny=0;
    terrain_maxy=1000;
    starting_point_1_x=400;
    starting_point_1_y=80;
    starting_point_1_a=270000;
    starting_point_2_x=400;
    starting_point_2_y=920;
    starting_point_2_a=90000;
    mission1_point_x=0;
    mission1_point_y=0;
    mission2_point_x=0;
    mission2_point_y=0;
    mission3_point_x=0;
    mission3_point_y=0;
    random_terrain=rand(1,3);
    road(scenery_file,40,400,0,90000);
    road(scenery_file,40,402,583,90000);
    road(scenery_file,40,404,1000,90000);
    civilian1(160,160,300,300,rand(200,500),rand(0,360000));
    civilian1(160,160,680,440,rand(200,500),rand(0,360000));
    civilian1(160,160,400,540,rand(200,500),rand(0,360000));
    civilian1(160,160,490,370,rand(200,500),rand(0,360000));
    civilian1(160,160,150,670,rand(200,500),rand(0,360000));
    civilian1(160,160,480,650,rand(200,500),rand(0,360000));
    bigobject(scenery_file,25,170,750,0);
    bigobject(scenery_file,25,0,750,0);
    bigobject(scenery_file,25,650,750,0);
    bigobject(scenery_file,25,800,750,0);
    bigobject(scenery_file,25,170,250,0);
    bigobject(scenery_file,25,0,250,0);
    bigobject(scenery_file,25,650,250,0);
    bigobject(scenery_file,25,800,250,0);
    bigobject(scenery_file,10,170,500,0);
    bigobject(scenery_file,11,620,580,0);
    bigobject(scenery_file,11,860,430,330000);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS multi2_map();

BEGIN
    terrain_minx=0;
    terrain_maxx=1300;
    terrain_miny=0;
    terrain_maxy=1500;
    starting_point_1_x=650;
    starting_point_1_y=70;
    starting_point_1_a=270000;
    starting_point_2_x=175;
    starting_point_2_y=1450;
    starting_point_2_a=45000;
    mission1_point_x=0;
    mission1_point_y=0;
    mission2_point_x=0;
    mission2_point_y=0;
    mission3_point_x=0;
    mission3_point_y=0;
    random_terrain=rand(1,3);
    land_mine(645,445);
    army_man_1(110,475,535,0,90000,2,15);
    army_man_1(110,750,535,0,90000,2,15);
    army_man_1(110,60,1220,280,0,2,15);
    army_man_1(110,60,1175,280,0,2,15);
    army_man_1(110,65,1065,880,0,2,15);
    army_man_1(110,55,1111,880,0,2,15);
    army_man_1(110,860,1350,0,0,2,15);
    army_man_1(110,1025,750,680,270000,2,15);
    army_man_1(110,1150,740,680,270000,2,15);
    army_man_1(110,500,700,0,0,2,15);
    army_man_1(110,1090,800,270,270000,2,15);
    army_man_1(110,865,1310,0,0,2,15);
    army_man_1(110,865,975,0,0,2,15);
    bigobject(scenery_file,25,1300,500,0);
    bigobject(scenery_file,25,1000,500,0);
    bigobject(scenery_file,25,0,500,0);
    bigobject(scenery_file,25,300,500,0);
    bigobject(scenery_file,25,925,500,0);
    bigobject(scenery_file,25,764,844,0);
    bigobject(scenery_file,25,437,637,90000);
    bigobject(scenery_file,25,576,844,0);
    bigobject(scenery_file,25,437,706,90000);
    bigobject(scenery_file,25,276,844,0);
    bigobject(scenery_file,25,0,844,0);
    smallobject(scenery_file,26,739,525,0);
    smallobject(scenery_file,26,478,525,270000);
    smallobject(scenery_file,26,875,980,180000);
    smallobject(scenery_file,26,875,1300,270000);
    smallobject(scenery_file,26,870,1355,180000);
    road(scenery_file,41,735,655,180000);
    road(scenery_file,41,611,519,135000);
    road(scenery_file,40,585,138,90000);
    road(scenery_file,40,585,0,90000);
    road(scenery_file,40,1132,685,0);
    road(scenery_file,40,1300,685,0);
    road(scenery_file,40,1096,1000,90000);
    road(scenery_file,40,1104,1499,90000);
    road(scenery_file,40,782,1102,0);
    road(scenery_file,40,276,1103,0);
    road(scenery_file,40,0,1104,0);
    barbed_wire_fence(900,552,90000,10);
    barbed_wire_fence(900,632,90000,10);
    barbed_wire_fence(900,712,90000,10);
    barbed_wire_fence(900,792,90000,10);
    bigobject(scenery_file,50,200,665,45000);
    bigobject(scenery_file,12,200,1300,56000);
    bigobject(scenery_file,11,620,1294,57000);
    bigobject(scenery_file,11,207,993,59000);
    bigobject(scenery_file,11,623,971,59000);
    bigobject(scenery_file,11,617,1364,57000);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
// @ missions
//-----------------------------------------------------------------------------

PROCESS levle1_mission();

BEGIN
    player1_max_speed=15;
    player1_min_speed=-10;
    player1_armour=100;
    player1_weapon1=20;
    player1_weapon2=0;
    player1_weapon3=0;
    player1_weapon4=0;
    player1_weapon5=0;
    player1_weapon6=0;
    player1_weapon7=0;
    player1_weapon8=0;
    player1_weapon9=0;
    player1_weapon10=0;
    player1_flails=FALSE;
    player1_double_machine_guns=FALSE;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    player1_levle=21;
    new_screen=0;
    put_screen(photo_file,main_background);
    write(title_font,320,0,1,"MISSION 1");
    write(small_font,10,140,0,"     WE HAVE RECEIVED REPORTS THAT SOMETHING SUSPICIOUS");
    write(small_font,10,160,0,"HAS BEEN HAPPENING AT A WEAPONS FACTORY IN THIS SECTOR. WE FEAR");
    write(small_font,10,180,0,"THE WORST AND THE SITUATION MUST BE DEALT WITH IMMEDIATLY. WE");
    write(small_font,10,200,0,"HAVE FOUND OUT THAT THERE IS A SMALL, GUARDED SHED AND WE");
    write(small_font,10,220,0,"BELIVE THIS IS WHERE THE PROBLEM IS.");
    write(small_font,320,260,1,"YOUR MISSION:- DESTROY THE STORAGE SHED");
    write(small_font,10,300,0,"    BEING ONLY A FACTORY, THE AREA IS NOT HEAVELY GUARDED. ALSO,");
    write(small_font,10,320,0,"TRY TO DESTROY SOME OF THE VANS TO SLOW DOWN WEAPONS");
    write(small_font,10,340,0,"PRODUCTION. AFTER YOU HAVE COMPLETED YOUR MISSION RETURN TO");
    write(small_font,10,360,0,"WHERE YOU STARTED AND WE WILL COLLECT YOU FROM THERE.");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle2_mission();

BEGIN
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    player1_levle=23;
    new_screen=0;
    put_screen(photo_file,main_background);
    write(title_font,320,0,1,"MISSION 2");
    write(small_font,10,140,0,"     YESTERDAY THE S.A.S AMBUSHED A CONVOY CARRYING VITAL");
    write(small_font,10,160,0,"SUPLIES TO THE ENEMY FRONT LINES. THOUGH THEY MANAGED TO STOP");
    write(small_font,10,180,0,"THE CONVOY THEY FAILED TO DESTROY IT AND THERE ARE STILL VITAL");
    write(small_font,10,200,0,"SUPPLIES. WE HAVE RECIVED INTELIGENCE THAT THEY WILL BE");
    write(small_font,10,220,0,"CONTINUING SOON SO THIS MISSION IS URGENT!");
    write(small_font,320,260,1,"YOUR MISSION:- DESTROY THE CONVOY");
    write(small_font,10,300,0,"     THERE WILL BE SOME FORCES BUT MOST WERE WIPED OUT BY THE");
    write(small_font,10,320,0,"S.A.S YOU MUST DESTROY ALL VANS OR OUR FRONT LINES COULD BE AT");
    write(small_font,10,340,0,"RISK. AFTER YOU HAVE COMPLETED YOUR MISSION RETURN TO WHERE YOU");
    write(small_font,10,360,0,"STARTED AND WE WILL COLLECT YOU FROM THERE.");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle3_mission();

BEGIN
    player1_weapon3=5;
    player1_levle=25;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,11);
    write(title_font,320,0,1,"MISSION 3");
    write(small_font,10,120,0,"     OUR SPY HAS JUST REPORTED A SERIOUS THREAT TO OUR ARMY. WE");
    write(small_font,10,140,0,"HAVE FOUND A FACTORY PRODUCING NAPALM MISSILES. THIS IS A REAL");
    write(small_font,10,160,0,"THREAT TO OUR FRONT LINES AS THIS DEADLY SUBSTANCE HAS A DEADLY");
    write(small_font,10,180,0,"KILLING POWER ON MEN. PRODUCTION OF NAPALM MUST BE STOPPED");
    write(small_font,10,200,0,"IMMIDIATLY TO AVOID SERIOUS LOSSES OF MEN ON THE FRONT LINES. ALSO");
    write(small_font,10,220,0,"DESTROYING THIS FACTORY WOULD BE A GREAT FINANCIAL LOSS TO THE");
    write(small_font,10,240,0,"ENEMY!");
    write(small_font,320,280,1,"YOUR MISSION:- DESTROY THE FACTORY");
    write(small_font,10,320,0,"    TO IMPROVE THE CHANCES OF SUCCES WE ARE SENDING YOU IN AT NIGHT.");
    write(small_font,10,340,0,"WE ARE ALSO GIVING YOU SOME NEW SHELLS THAT CAN FIRE OVER WALLS.");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle4_mission();

BEGIN
    player1_levle=27;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,10);
    write(title_font,320,0,1,"MISSION 4");
    write(small_font,10,120,0,"     WE ARE CURRENTLY PLANNING TO BOMB AN ARMY BASE IN THE AREA");
    write(small_font,10,140,0,"BUT THE FIRST ATTEMPT FAILED BECAUSE OF ANTI-AIRCRAFT MISSILES.");
    write(small_font,10,160,0,"WE HAVE DISCOVERED THE LOCATION OF THESE MISSILE SITES AND WANT");
    write(small_font,10,180,0,"YOU TO DESTROY THEM, SO WE CAN BOMB THE BASE. THERE ARE THREE");
    write(small_font,10,200,0,"SAM MISSILE BATTERIES IN THE AREA BUT THEY ARE QUITE HEAVELY");
    write(small_font,10,220,0,"GUARDED. WE ALSO HAVE INFORMATION OF A TURRET IN THE AREA: TRY");
    write(small_font,10,240,0,"TO DESTROY THIS TO HELP FUTURE MISSIONS.");
    write(small_font,320,280,1,"YOUR MISSION:- DESTROY THE THREE SAM MISSILE BATTERIES");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle5_mission();

BEGIN
    player1_weapon6=5;
    player1_levle=29;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,2);
    write(title_font,320,0,1,"MISSION 5");
    write(small_font,10,120,0,"     ONE OF OUR TOP SPYS HAS BEEN CAPTURED AND IS BEING HELD IN");
    write(small_font,10,140,0,"A 'PRISONER OF WAR CAMP'. HE HAS IMPORTANT INFORMATION REGARDING");
    write(small_font,10,160,0,"THE DEFENCE SYSTEMS OF A NEARBY AIRPORT, WHICH WE NEED TO TAKE");
    write(small_font,10,180,0,"OUT OF ACTION. THE SPY HAS ESCAPED FROM HIS CELL THROUGH A HOLE");
    write(small_font,10,200,0,"IN THE ROOF, BUT HAS FAILED TO GET OUT OF THE CAMP. YOU NEED TO");
    write(small_font,10,220,0,"GET HIM OUT OF THE CAMP. WE ARE GIVING YOU SOME ANTI AIRCRAFT");
    write(small_font,10,240,0,"MISSILES TO DEAL WITH THE HELICOPTER.");
    write(small_font,320,280,1,"YOUR MISSION:- ASSIST THE SPYS ESCAPE");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle6_mission();

BEGIN
    player1_levle=31;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,2);
    write(title_font,320,0,1,"MISSION 6");
    write(small_font,10,120,0,"     OUR SPY HAS GIVEN US THE INFORMATION ABOUT THE AIRPORT,");
    write(small_font,10,140,0,"BUT IT IS TOO DIFICLUT TO DESTROY WITH AN AIRSTRIKE, SO WE");
    write(small_font,10,160,0,"GOING TO SEND YOU IN TO DO THE JOB. THE AIRPORT HAS A FEW");
    write(small_font,10,180,0,"BUILDINGS AND PLAINS, AS WELL AS GOOD DEFENCE SYSTEMS. IT IS ");
    write(small_font,10,200,0,"WELL GAURDED WITH TURRETS AND TROOPS. YOU WILL NEED TO DESTROY");
    write(small_font,10,220,0,"AS MANY PLAINS AND BUILDINGS AS POSIBLE TO MAKE THE AIRPORT");
    write(small_font,10,240,0,"UNUSABLE, ALSO TRY AND DESTROY AS MANY TURRETS AS POSIBLE.");
    write(small_font,320,280,1,"YOUR MISSION:- DESTROY THE AIRPORT");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle7_mission();

BEGIN
    player1_levle=33;
    mouse.file=main_file;
    mouse.graph=12;
    screen=0;
    new_screen=0;
    put_screen(photo_file,2);
    write(title_font,320,0,1,"MISSION 7");
    write(small_font,10,120,0,"     WE HAVE JUST RECEIVED INFORMATION ABOUT A CONVOY CARRYING");
    write(small_font,10,140,0,"AN IMPORTANT MILITARY LEADER, AND WE MUST EMLIMINATE HIM.");
    write(small_font,10,160,0,"THE CONVOY HAS BEEN TRAVELING NORTH TO THE HILLS WHERE HE MAY");
    write(small_font,10,180,0,"BE ABLE TO GET ACROSS THE BORDER. WHAT WE PLAN TO DO BLOCK THE");
    write(small_font,10,200,0,"MAIN ROAD THEN YOU CAN GO IN AND ASSASSINATE THE COMMANDER.");
    write(small_font,10,220,0,"TO AID YOU IN YOUR MISSION WE ARE GOING TO GIVE YOU A TURRET");
    write(small_font,10,240,0,"SNIPER SO YOU CAN ASSASSINATE HIM WITH LITTLE DAMEAGE TO YOU.");
    write(small_font,320,280,1,"YOUR MISSION:- ASSASSINATE THE COMANDER");
    write(main_font,320,400,1,"GOOD LUCK!");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc) OR mouse.left OR key(_enter)) new_screen=player1_levle+500; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------
// @ levles
//-----------------------------------------------------------------------------

PROCESS levle1();

BEGIN
    player1_in_flag_area=FALSE;
    player1_levle_position=1;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle1_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=22;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle2();

BEGIN
    player1_in_flag_area=FALSE;
    player1_levle_position=5;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle2_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=24;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle3();

BEGIN
    player1_in_flag_area=FALSE;
    player1_levle_position=2;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle3_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        fade(85,85,85,64);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=26;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle4();

BEGIN
    player1_in_flag_area=FALSE;
    player1_levle_position=3;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle4_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=28;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle5();

BEGIN
    spy_dead=FALSE;
    player1_in_flag_area=FALSE;
    player1_levle_position=1;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle5_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(spy_dead==TRUE) new_screen=508; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=30;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle6();

BEGIN
    player1_in_flag_area=FALSE;
    player1_levle_position=3;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle6_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(spy_dead==TRUE) new_screen=508; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=32;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle7();

BEGIN
    player1_in_flag_area=FALSE;
    player1_levle_position=3;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    levle7_map();
    flag1(20,starting_point_1_x,starting_point_1_y);
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_in_flag_area==TRUE AND player1_levle_position<1) new_screen=507; END
        IF(spy_dead==TRUE) new_screen=508; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(0);
    stop_sound(all_sound);
    player1_levle=20;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------
// @ multi-games
//-----------------------------------------------------------------------------

PROCESS scermish();

PRIVATE
    scermish_map;

BEGIN
    stop_scroll(0);
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    player1_levle_position=0;
    player1_max_speed=15;
    player1_min_speed=-10;
    player1_armour=100;
    player1_weapon1=30;
    player1_weapon2=10;
    player1_weapon3=0;
    player1_weapon4=5;
    player1_weapon5=0;
    player1_weapon6=0;
    player1_weapon7=0;
    player1_weapon8=0;
    player1_weapon9=0;
    player1_weapon10=0;
    player1_flails=FALSE;
    player1_double_machine_guns=FALSE;
    player1_in_flag_area=FALSE;
    player1_C_max_speed=player1_max_speed;
    player1_C_min_speed=player1_min_speed;
    player1_C_armour=player1_armour;
    player1_C_weapon1=player1_weapon1;
    player1_C_weapon2=player1_weapon2;
    player1_C_weapon3=player1_weapon3;
    player1_C_weapon4=player1_weapon4;
    player1_C_weapon5=player1_weapon5;
    player1_C_weapon6=player1_weapon6;
    player1_C_weapon7=player1_weapon7;
    player1_C_weapon8=player1_weapon8;
    player1_C_weapon9=player1_weapon9;
    player1_C_weapon10=player1_weapon10;
    frames_per_second=12;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    background_music();
    bar();
    pause();
    scermish_map=rand(1,5);
    IF(scermish_map==1) levle1_map(); END
    IF(scermish_map==2) levle2_map(); END
    IF(scermish_map==3) levle3_map(); END
    IF(scermish_map==4) levle4_map(); END
    IF(scermish_map==5) levle5_map(); END
    start_scroll(0,scenery_file,random_terrain,102,0,15);
    id2=player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    flag1(20,starting_point_1_x,starting_point_1_y);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(player1_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    player1_armour=100;
    stop_scroll(0);
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS death_match();

PRIVATE
    death_match_map;

BEGIN
    hot_seat_game_type=2;
    frames_per_second=8;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    death_match_map=rand(2,2);
    IF(death_match_map==1) levle1_map(); END
    IF(death_match_map==2) levle2_map(); END
    IF(death_match_map==3) multi1_map(); END
    IF(death_match_map==4) multi2_map(); END
    define_region(1,0,0,319,480);
    define_region(2,322,0,319,480);
    start_scroll(1,scenery_file,random_terrain,102,1,15);
    start_scroll(2,scenery_file,random_terrain,102,2,15);
    hot_seat_bar();
    background_music();
    pause();
    flag1(20,starting_point_1_x,starting_point_1_y);
    flag2(21,starting_point_2_x,starting_point_2_y);
    id11=hot_seat_player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    id12=hot_seat_player2(starting_point_2_x,starting_point_2_y,starting_point_2_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(hot_seat_player1_game_over==TRUE) new_screen=508; END
        IF(hot_seat_player2_game_over==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(1);
    stop_scroll(2);
    stop_sound(all_sound);
    player1_game_over=FALSE;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS capture_the_flag();

PRIVATE
    capture_the_flag_map;

BEGIN
    hot_seat_game_type=3;
    hot_seat_player1_capture_flag=FALSE;
    hot_seat_player2_capture_flag=FALSE;
    frames_per_second=8;
    mouse.file=main_file;
    mouse.graph=11;
    screen=0;
    new_screen=0;
    capture_the_flag_map=rand(1,4);
    IF(capture_the_flag_map==1) levle1_map(); END
    IF(capture_the_flag_map==2) levle2_map(); END
    IF(capture_the_flag_map==3) multi1_map(); END
    IF(capture_the_flag_map==4) multi2_map(); END
    define_region(1,0,0,319,480);
    define_region(2,322,0,319,480);
    start_scroll(1,scenery_file,random_terrain,102,1,15);
    start_scroll(2,scenery_file,random_terrain,102,2,15);
    hot_seat_bar();
    background_music();
    pause();
    flag1(20,starting_point_1_x,starting_point_1_y);
    flag2(21,starting_point_2_x,starting_point_2_y);
    id11=hot_seat_player1(starting_point_1_x,starting_point_1_y,starting_point_1_a);
    id12=hot_seat_player2(starting_point_2_x,starting_point_2_y,starting_point_2_a);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=501; END
        IF(hot_seat_player1_game_over==TRUE) new_screen=508; END
        IF(hot_seat_player2_game_over==TRUE) new_screen=508; END
        IF(hot_seat_player1_capture_flag==TRUE) new_screen=508; END
        IF(hot_seat_player2_capture_flag==TRUE) new_screen=508; END
        FRAME;
    END
    kill();
    stop_scroll(1);
    stop_scroll(2);
    stop_sound(all_sound);
    player1_game_over=FALSE;
    clear_screen();
    delete_text(all_text);
    signal(TYPE kill,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------
//  @ GAME OPTIONS
//-----------------------------------------------------------------------------

PROCESS bar()

BEGIN
    z=-240;
    file=game_file;
    graph=50;
    x=320;
    y=240;
    write_int(small_font,593,460,5,& player1_C_armour);
    write_int(small_font,24,20,4,& player1_C_weapon1);
    write_int(small_font,54,20,4,& player1_C_weapon2);
    write_int(small_font,84,20,4,& player1_C_weapon3);
    write_int(small_font,114,20,4,& player1_C_weapon4);
    write_int(small_font,144,20,4,& player1_C_weapon5);
    write_int(small_font,494,20,4,& player1_C_weapon6);
    write_int(small_font,524,20,4,& player1_C_weapon7);
    write_int(small_font,554,20,4,& player1_C_weapon8);
    write_int(small_font,584,20,4,& player1_C_weapon9);
    write_int(small_font,614,20,4,& player1_C_weapon10);
    weapon_selected();
    player1_low_armour();
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
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS weapon_selected()

BEGIN
    z=-240;
    flags=4;
    file=game_file;
    graph=52;
    x=23;
    y=20;
    LOOP
        IF(player1_weapon_selected==1) x=23; END
        IF(player1_weapon_selected==2) x=54; END
        IF(player1_weapon_selected==3) x=85; END
        IF(player1_weapon_selected==4) x=115; END
        IF(player1_weapon_selected==5) x=146; END
        IF(player1_weapon_selected==6) x=493; END
        IF(player1_weapon_selected==7) x=524; END
        IF(player1_weapon_selected==8) x=555; END
        IF(player1_weapon_selected==9) x=585; END
        IF(player1_weapon_selected==10) x=616; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_low_armour()

BEGIN
    z=-240;
    flags=4;
    file=game_file;
    graph=0;
    x=592;
    y=460;
    LOOP
        IF(player1_C_armour<50) graph=53; END
        IF(player1_C_armour<20) graph=54; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_bar()

BEGIN
    z=-240;
    file=game_file;
    graph=51;
    x=320;
    y=240;
    write(small_font,315,26,4,"PLAYER 1");
    write_int(small_font,593,20,5,& hot_seat_player1_armour);
    write(small_font,315,465,4,"PLAYER 2");
    write_int(small_font,27,460,3,& hot_seat_player2_armour);
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS background_music();

PRIVATE
    track;

BEGIN
    track=rand(1,2);
    FRAME;
    IF(track==1) sound(s_tune4,volume,frequency); END
    IF(track==2) sound(s_tune10,volume,frequency);
                 sound(s_tune12,volume,frequency); END
    FRAME;
END

//-----------------------------------------------------------------------------

PROCESS flag1(graph,x,y);

BEGIN
    ctype=c_scroll;
    file=game_file;
    z=-10;
    LOOP
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS flag2(graph,x,y);

BEGIN
    ctype=c_scroll;
    file=game_file;
    z=-10;
    LOOP
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1_mission1_arrow();

BEGIN
    ctype=c_scroll;
    file=game_file;
    graph=30;
    z=-190;
    FRAME;
    WHILE (player1_levle_position>0);
        angle=fget_angle(x,y,mission1_point_x,mission1_point_y);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1_mission2_arrow();

BEGIN
    ctype=c_scroll;
    file=game_file;
    graph=30;
    z=-190;
    FRAME;
    WHILE (player1_levle_position>0);
        angle=fget_angle(x,y,mission2_point_x,mission2_point_y);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1_mission3_arrow();

BEGIN
    ctype=c_scroll;
    file=game_file;
    graph=30;
    z=-190;
    FRAME;
    WHILE (player1_levle_position>0);
        angle=fget_angle(x,y,mission3_point_x,mission3_point_y);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS player1_flag_arrow();

BEGIN
    ctype=c_scroll;
    file=game_file;
    graph=31;
    z=-190;
    FRAME;
    WHILE (graph==31);
        angle=fget_angle(x,y,starting_point_1_x,starting_point_1_y);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS hot_seat_player1_arrow();

BEGIN
    ctype=c_scroll;
    file=game_file;
    graph=32;
    z=-190;
    FRAME;
    WHILE (graph==32);
        IF(hot_seat_game_type==2) angle=get_angle(id12); END
        IF(hot_seat_game_type==3) angle=fget_angle(x,y,starting_point_2_x,starting_point_2_y); END
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS hot_seat_player2_arrow();

BEGIN
    ctype=c_scroll;
    file=game_file;
    graph=31;
    z=-190;
    FRAME;
    WHILE (graph==31);
        IF(hot_seat_game_type==2) angle=get_angle(id11); END
        IF(hot_seat_game_type==3) angle=fget_angle(x,y,starting_point_1_x,starting_point_1_y); END
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------
//  @ GAME STUFF
//------------------------------------------------------------------------------

PROCESS player1(x,y,angle)

PRIVATE
    game_over_timer;

BEGIN
    player1_speed=0;
    player1_temp_max_speed=player1_C_max_speed;
    player1_temp_min_speed=player1_C_min_speed;
    player1_weapon_selected=1;
    player1_game_over=FALSE;
    ctype=c_scroll;
    scroll[0].camera=id;
    z=-50;
    file=stuff_file;
    graph=1;
    turret1(angle);
    sound(s_engin1,volume,frequency);
    player1_flag_arrow();
    player1_mission1_arrow();
    IF(mission2_point_x>0 AND mission2_point_y>0) player1_mission2_arrow(); END
    IF(mission3_point_x>0 AND mission3_point_y>0) player1_mission3_arrow(); END
    IF(player1_flails==TRUE) player1_flail(); END
    FRAME;
        WHILE(player1_C_armour>0);
        advance(player1_speed);
        IF(player1_C_armour<0) player1_C_armour=0; END
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END
        IF(key(_up)) player1_speed+=1; END
        IF(NOT key(_up) AND player1_speed>0) player1_speed-=1; END
        IF(key(_down)) player1_speed-=1; END
        IF(NOT key(_down) AND player1_speed<0) player1_speed+=1; END
        IF(player1_speed>player1_temp_max_speed) player1_speed=player1_temp_max_speed; END
        IF(player1_speed<player1_temp_min_speed) player1_speed=player1_temp_min_speed; END
        IF(collision(TYPE bigobject) OR collision(TYPE army_van_1) OR collision(TYPE army_turret_base) OR collision(TYPE smallobject) OR collision(TYPE missionbigobject));
            IF(player1_speed=>0) player1_speed=-20; ELSE player1_speed=10; END
        END
        IF(x<terrain_minx) x=terrain_minx; END
        IF(x>terrain_maxx) x=terrain_maxx; END
        IF(y<terrain_miny) y=terrain_miny; END
        IF(y>terrain_maxy) y=terrain_maxy; END
        IF(collision(TYPE barbed_wire_fence)) player1_temp_max_speed=7; player1_temp_min_speed=-5; END
        IF(NOT collision(TYPE barbed_wire_fence)) player1_temp_max_speed=player1_max_speed; player1_temp_min_speed=player1_min_speed; END
        IF(collision(TYPE flag1)) player1_in_flag_area=TRUE; ELSE player1_in_flag_area=FALSE; END
        FRAME;
    END
    game_over_timer=15;
    WHILE(game_over_timer>0);
        fade(200,0,0,5);
        sound(s_explosion1,volume,frequency);
        z=-160;
        FILE=guns_file;
        FROM graph=100 TO 114;
        game_over_timer-=1;
        FRAME(50);
    END
    player1_game_over=TRUE;
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player1(x,y,angle)

PRIVATE
    game_over_timer;

BEGIN
    hot_seat_player1_speed=0;
    hot_seat_player1_max_speed=15;
    hot_seat_player1_min_speed=-10;
    hot_seat_player1_armour=100;
    hot_seat_player1_game_over=FALSE;
    ctype=c_scroll;
    scroll[2].camera=id;
    z=-50;
    file=stuff_file;
    graph=1;
    hot_seat_player1_arrow();
    hot_seat_turret1(angle);
    sound(s_engin1,volume,frequency);
    FRAME;
        WHILE(hot_seat_player1_armour>0);
        advance(hot_seat_player1_speed);
        IF(hot_seat_player1_armour<0) hot_seat_player1_armour=0; END
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END
        IF(key(_up)) hot_seat_player1_speed+=1; END
        IF(NOT key(_up) AND hot_seat_player1_speed>0) hot_seat_player1_speed-=1; END
        IF(key(_down)) hot_seat_player1_speed-=1; END
        IF(NOT key(_down) AND hot_seat_player1_speed<0) hot_seat_player1_speed+=1; END
        IF(hot_seat_player1_speed>hot_seat_player1_max_speed) hot_seat_player1_speed=hot_seat_player1_max_speed; END
        IF(hot_seat_player1_speed<hot_seat_player1_min_speed) hot_seat_player1_speed=hot_seat_player1_min_speed; END
        IF(collision(TYPE hot_seat_player2) OR collision(TYPE bigobject) OR collision(TYPE army_van_1) OR collision(TYPE army_turret_base) OR collision(TYPE smallobject) OR collision(TYPE missionbigobject));
            IF(hot_seat_player1_speed=>0) hot_seat_player1_speed=-20; ELSE hot_seat_player1_speed=10; END
        END
        IF(x<terrain_minx) x=terrain_minx; END
        IF(x>terrain_maxx) x=terrain_maxx; END
        IF(y<terrain_miny) y=terrain_miny; END
        IF(y>terrain_maxy) y=terrain_maxy; END
        IF(collision(TYPE barbed_wire_fence)) hot_seat_player1_max_speed=7; hot_seat_player1_min_speed=-5; END
        IF(NOT collision(TYPE barbed_wire_fence)) hot_seat_player1_max_speed=15; hot_seat_player1_min_speed=-10; END
        IF(collision(TYPE flag2)) hot_seat_player1_capture_flag=TRUE; END
        FRAME;
    END
    game_over_timer=15;
    WHILE(game_over_timer>0);
        fade(200,0,0,5);
        sound(s_explosion1,volume,frequency);
        z=-160;
        FILE=guns_file;
        FROM graph=100 TO 114;
        game_over_timer-=1;
        FRAME(50);
    END
    hot_seat_player1_game_over=TRUE;
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player2(x,y,angle)

PRIVATE
    game_over_timer;

BEGIN
    hot_seat_player2_speed=0;
    hot_seat_player2_max_speed=15;
    hot_seat_player2_min_speed=-10;
    hot_seat_player2_armour=100;
    hot_seat_player2_game_over=FALSE;
    ctype=c_scroll;
    scroll[1].camera=id;
    z=-50;
    file=stuff_file;
    graph=1;
    hot_seat_turret2(angle);
    sound(s_engin1,volume,frequency);
    hot_seat_player2_arrow();
    FRAME;
        WHILE(hot_seat_player2_armour>0);
        advance(hot_seat_player2_speed);
        IF(hot_seat_player2_armour<0) hot_seat_player2_armour=0; END
        IF(key(_r)) angle+=5000; END
        IF(key(_t)) angle-=5000; END
        IF(key(_q)) hot_seat_player2_speed+=1; END
        IF(NOT key(_q) AND hot_seat_player2_speed>0) hot_seat_player2_speed-=1; END
        IF(key(_a)) hot_seat_player2_speed-=1; END
        IF(NOT key(_a) AND hot_seat_player2_speed<0) hot_seat_player2_speed+=1; END
        IF(hot_seat_player2_speed>hot_seat_player2_max_speed) hot_seat_player2_speed=hot_seat_player2_max_speed; END
        IF(hot_seat_player2_speed<hot_seat_player2_min_speed) hot_seat_player2_speed=hot_seat_player2_min_speed; END
        IF(collision(TYPE hot_seat_player1) OR collision(TYPE bigobject) OR collision(TYPE army_van_1) OR collision(TYPE army_turret_base) OR collision(TYPE smallobject) OR collision(TYPE missionbigobject));
            IF(hot_seat_player2_speed=>0) hot_seat_player2_speed=-20; ELSE hot_seat_player2_speed=10; END
        END
        IF(collision(TYPE barbed_wire_fence)) hot_seat_player2_max_speed=7; hot_seat_player2_min_speed=-5; END
        IF(NOT collision(TYPE barbed_wire_fence)) hot_seat_player2_max_speed=15; hot_seat_player2_min_speed=-10; END
        IF(x<terrain_minx) x=terrain_minx; END
        IF(x>terrain_maxx) x=terrain_maxx; END
        IF(y<terrain_miny) y=terrain_miny; END
        IF(y>terrain_maxy) y=terrain_maxy; END
        IF(collision(TYPE flag1)) hot_seat_player2_capture_flag=TRUE; END
        FRAME;
    END
    game_over_timer=15;
    WHILE(game_over_timer>0);
        fade(200,0,0,5);
        sound(s_explosion1,volume,frequency);
        z=-160;
        FILE=guns_file;
        FROM graph=100 TO 114;
        game_over_timer-=1;
        FRAME(50);
    END
    hot_seat_player2_game_over=TRUE;
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
    i_can_fire_weapon6;
    i_can_fire_weapon10;

BEGIN
    ctype=c_scroll;
    z=-100;
    file=stuff_file;
    graph=10;
    FRAME;
        WHILE(player1_C_armour>0);
        x=father.x;
        y=father.y;
        i_can_fire_bullet+=1;
        i_can_fire_weapon1+=1;
        i_can_fire_weapon2+=1;
        i_can_fire_weapon3+=1;
        i_can_fire_weapon4+=1;
        i_can_fire_weapon6+=1;
        i_can_fire_weapon10+=1;
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END
        IF(key(_z)) angle+=10000; END
        IF(key(_x)) angle-=10000; END
        IF(i_can_fire_bullet>1 AND key(_control))
            IF(player1_double_machine_guns==FALSE) player1_bullet(x,y,angle);  END
            IF(player1_double_machine_guns==TRUE) player1_bullet(x,y,angle-5000); player1_bullet(x,y,angle+5000); END
            i_can_fire_bullet=0;
        END
        IF(player1_weapon_selected==1 AND player1_C_weapon1>0 AND i_can_fire_weapon1>30 AND key(_space)) player1_shell(x,y,angle); i_can_fire_weapon1=0; player1_C_weapon1-=1; advance(-10); END
        IF(player1_weapon_selected==2 AND player1_C_weapon2>0 AND i_can_fire_weapon2>30 AND key(_space)) player1_missile(x,y,angle); i_can_fire_weapon2=0; player1_C_weapon2-=1; advance(-10); END
        IF(player1_weapon_selected==3 AND player1_C_weapon3>0 AND i_can_fire_weapon3>30 AND key(_space)) player1_high_shell(x,y,angle); i_can_fire_weapon3=0; player1_C_weapon3-=1; advance(-10); END
        IF(player1_weapon_selected==4 AND player1_C_weapon4>0 AND i_can_fire_weapon4>40 AND key(_space)) player1_shell(x,y,angle-7000); player1_shell(x,y,angle); player1_shell(x,y,angle+7000); i_can_fire_weapon4=0; player1_C_weapon4-=1; advance(-10); END
        IF(player1_weapon_selected==6 AND player1_C_weapon6>0 AND i_can_fire_weapon6>40 AND key(_space)) player1_anti_aircraft_missile(x,y,angle); i_can_fire_weapon6=0; player1_C_weapon6-=1; advance(-10); END
        IF(player1_weapon_selected==10 AND player1_C_weapon10>0 AND i_can_fire_weapon10>60 AND key(_space)) player1_anti_tank_shell(x,y,angle); i_can_fire_weapon10=0; player1_C_weapon10-=1; advance(-15); END
        FRAME;
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_turret1(angle)

PRIVATE
    i_can_fire_bullet;
    i_can_fire_shell;

BEGIN
    ctype=c_scroll;
    z=-100;
    file=stuff_file;
    graph=10;
    FRAME;
        WHILE(hot_seat_player1_armour>0);
        x=father.x;
        y=father.y;
        i_can_fire_bullet+=1;
        i_can_fire_shell+=1;
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END
        IF(key(_alt)) angle+=10000; END
        IF(key(_control)) angle-=10000; END
        IF(i_can_fire_bullet>1 AND key(_c_backslash)) hot_seat_player1_bullet(x,y,angle); i_can_fire_bullet=0; END
        IF(i_can_fire_shell>30 AND key(_r_shift)) hot_seat_player1_shell(x,y,angle); i_can_fire_shell=0; advance(-10); END
        FRAME;
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_turret2(angle)

PRIVATE
    i_can_fire_bullet;
    i_can_fire_shell;

BEGIN
    ctype=c_scroll;
    z=-100;
    file=stuff_file;
    graph=10;
    FRAME;
        WHILE(hot_seat_player2_armour>0);
        x=father.x;
        y=father.y;
        i_can_fire_bullet+=1;
        i_can_fire_shell+=1;
        IF(key(_r)) angle+=5000; END
        IF(key(_t)) angle-=5000; END
        IF(key(_x)) angle+=10000; END
        IF(key(_c)) angle-=10000; END
        IF(i_can_fire_bullet>1 AND key(_tab)) hot_seat_player2_bullet(x,y,angle); i_can_fire_bullet=0; END
        IF(i_can_fire_shell>30 AND key(_space)) hot_seat_player2_shell(x,y,angle); i_can_fire_shell=0; advance(-10); END
        FRAME;
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_flail()

BEGIN
    ctype=c_scroll;
    z=-42;
    file=stuff_file;
    graph=20;
    FRAME;
        WHILE(player1_armour>0);
        FROM graph=20 TO 21;
        x=father.x;
        y=father.y;
        angle=father.angle;
        IF(collision(TYPE bigobject) OR collision(TYPE army_van_1) OR collision(TYPE army_turret_base) OR collision(TYPE smallobject) OR collision(TYPE missionbigobject));
            IF(player1_speed=>0) player1_speed=-20; ELSE player1_speed=10; END
        END
        FRAME;
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS army_man_1(graph,x,y,distance_to_travle,march_angle,health,firing_rate)

PRIVATE
    army_man_1_distance_travled;
    army_man_1_notice_player1;
    army_man_1_notice_hot_seat_player1;
    army_man_1_notice_hot_seat_player2;
    army_man_1_can_fire;

BEGIN
    ctype=c_scroll;
    z=-40;
    file=stuff_file;
    army_man_1_notice_player1=FALSE;
    army_man_1_notice_hot_seat_player1=FALSE;
    army_man_1_notice_hot_seat_player2=FALSE;
    FRAME;
        WHILE(health>0);
        army_man_1_can_fire+=1;
        IF(get_dist(id2)<280) army_man_1_notice_player1=TRUE; ELSE army_man_1_notice_player1=FALSE; END
        IF(get_dist(id11)<280) army_man_1_notice_hot_seat_player1=TRUE; ELSE army_man_1_notice_hot_seat_player1=FALSE; END
        IF(get_dist(id12)<280) army_man_1_notice_hot_seat_player2=TRUE; ELSE army_man_1_notice_hot_seat_player2=FALSE; END
        IF(army_man_1_notice_player1==TRUE) angle=get_angle(id2); END
        IF(army_man_1_notice_hot_seat_player1==TRUE) angle=get_angle(id11); END
        IF(army_man_1_notice_hot_seat_player2==TRUE) angle=get_angle(id12); END
        IF(army_man_1_notice_player1==FALSE AND army_man_1_notice_hot_seat_player1==FALSE AND army_man_1_notice_hot_seat_player2==FALSE) angle=march_angle; advance(3); army_man_1_distance_travled+=3; END
        IF(army_man_1_distance_travled>distance_to_travle) march_angle+=180000; army_man_1_distance_travled=0; END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1_high_shell_explosion)) health=0; END
        IF(collision(TYPE player1_missile)) health=0; END
        IF(collision(TYPE player1_anti_tank_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>firing_rate) army_man_bullet(x,y,get_angle(id2)); army_man_1_can_fire=0; END
        IF(collision(TYPE hot_seat_player1_bullet)) health-=1; END
        IF(collision(TYPE hot_seat_player1_shell)) health=0; END
        IF(collision(TYPE hot_seat_player1)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_hot_seat_player1==TRUE AND army_man_1_can_fire>firing_rate) army_man_bullet(x,y,get_angle(id11)); army_man_1_can_fire=0; END
        IF(collision(TYPE hot_seat_player2_bullet)) health-=1; END
        IF(collision(TYPE hot_seat_player2_shell)) health=0; END
        IF(collision(TYPE hot_seat_player2)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_hot_seat_player2==TRUE AND army_man_1_can_fire>firing_rate) army_man_bullet(x,y,get_angle(id12)); army_man_1_can_fire=0; END
        FRAME;
    END
    file=stuff_file;
    graph=0;
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS army_man_2(graph,x,y,health)

PRIVATE
    army_man_1_notice_player1;
    army_man_1_notice_hot_seat_player1;
    army_man_1_notice_hot_seat_player2;
    army_man_1_can_fire;

BEGIN
    ctype=c_scroll;
    z=-40;
    file=stuff_file;
    army_man_1_notice_player1=FALSE;
    army_man_1_notice_hot_seat_player1=FALSE;
    army_man_1_notice_hot_seat_player2=FALSE;
    FRAME;
        WHILE(health>0);
        army_man_1_can_fire+=1;
        IF(get_dist(id2)<280) army_man_1_notice_player1=TRUE; ELSE army_man_1_notice_player1=FALSE; END
        IF(get_dist(id11)<280) army_man_1_notice_hot_seat_player1=TRUE; ELSE army_man_1_notice_hot_seat_player1=FALSE; END
        IF(get_dist(id12)<280) army_man_1_notice_hot_seat_player2=TRUE; ELSE army_man_1_notice_hot_seat_player2=FALSE; END
        IF(army_man_1_notice_player1==TRUE) angle=get_angle(id2); END
        IF(army_man_1_notice_hot_seat_player1==TRUE) angle=get_angle(id11); END
        IF(army_man_1_notice_hot_seat_player2==TRUE) angle=get_angle(id12); END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1_high_shell_explosion)) health=0; END
        IF(collision(TYPE player1_missile)) health=0; END
        IF(collision(TYPE player1_anti_tank_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>20) army_man_missile(x,y,get_angle(id2)); army_man_1_can_fire=0; END
        IF(collision(TYPE hot_seat_player1_bullet)) health-=1; END
        IF(collision(TYPE hot_seat_player1_shell)) health=0; END
        IF(collision(TYPE hot_seat_player1)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_hot_seat_player1==TRUE AND army_man_1_can_fire>20) army_man_missile(x,y,get_angle(id11)); army_man_1_can_fire=0; END
        IF(collision(TYPE hot_seat_player2_bullet)) health-=1; END
        IF(collision(TYPE hot_seat_player2_shell)) health=0; END
        IF(collision(TYPE hot_seat_player2)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_hot_seat_player2==TRUE AND army_man_1_can_fire>20) army_man_missile(x,y,get_angle(id12)); army_man_1_can_fire=0; END
        FRAME;
    END
    file=stuff_file;
    graph=0;
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS army_van_1(graph,x,y,angle,mooving,stop,distance_to_travle,health,turret)

PRIVATE
    distance_travled;
    army_van_1_stop;
    army_van_1_speed;

BEGIN
    ctype=c_scroll;
    z=-48;
    file=stuff_file;
    IF(turret==1) army_turret_1(stuff_file,11,x,y,0); END
    army_van_1_stop=FALSE;
    army_van_1_speed=10;
    FRAME;
        WHILE(health>0);
        IF(mooving==TRUE AND distance_travled<distance_to_travle AND army_van_1_stop==FALSE) advance(army_van_1_speed); distance_travled+=10; END
        IF(get_dist(id2)<150 AND stop==TRUE) army_van_1_stop=TRUE; END
        IF(get_dist(id11)<150 AND stop==TRUE) army_van_1_stop=TRUE; END
        IF(get_dist(id12)<150 AND stop==TRUE) army_van_1_stop=TRUE; END
        IF(collision(TYPE player1) OR collision(TYPE hot_seat_player1) OR collision(TYPE hot_seat_player2)) army_van_1_speed=0; ELSE army_van_1_speed=10; END
        IF(collision(TYPE player1_bullet)) health-=1; END
        IF(collision(TYPE player1_shell)) health-=20; END
        IF(collision(TYPE player1_high_shell_explosion)) health-=20; END
        IF(collision(TYPE hot_seat_player1_bullet)) health-=1; END
        IF(collision(TYPE hot_seat_player1_shell)) health-=20; END
        IF(collision(TYPE hot_seat_player2_bullet)) health-=1; END
        IF(collision(TYPE hot_seat_player2_shell)) health-=20; END
        IF(collision(TYPE player1_missile)) health-=30; END
        IF(collision(TYPE player1_anti_tank_shell)) health=0; END
        IF(x<terrain_minx-300) signal(id,s_kill); END
        IF(x>terrain_maxx+300) signal(id,s_kill); END
        IF(y<terrain_miny-300) signal(id,s_kill); END
        IF(y>terrain_maxy+300) signal(id,s_kill); END
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    blown_up_thing(stuff_file,59,x,y,angle);
    END
    IF(player1_levle==23) player1_levle_position-=1; END
END

//-----------------------------------------------------------------------------

PROCESS army_helicopter(graph,angle,x,y,health)

PRIVATE
    distance_traveled;
    army_helicopter_can_fire;

BEGIN
    ctype=c_scroll;
    z=-170;
    file=stuff_file;
    helicopter_blade(health);
    helicopter_shadow1(health);
    FRAME;
        WHILE(health>0);
        advance(8);
        distance_traveled+=8;
        army_helicopter_can_fire+=1;
        IF(distance_traveled>800) angle+=rand(80000,100000); distance_traveled=0; END
        IF(get_dist(id2)<300) sound(s_helicopter,volume,frequency); END
        IF(get_dist(id2)<250 AND army_helicopter_can_fire>30) army_man_missile(x,y,get_angle(id2)); army_helicopter_can_fire=0; END
        IF(collision(TYPE player1_anti_aircraft_missile)) health=0; END
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS helicopter_blade(health)

BEGIN
    ctype=c_scroll;
    z=-171;
    file=stuff_file;
    graph=201;
    helicopter_shadow2(health);
    FRAME;
        WHILE(health>0);
        x=father.x;
        y=father.y;
        angle+=10000;
        FRAME(40);
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS helicopter_shadow2(health)

BEGIN
    ctype=c_scroll;
    z=-169;
    file=stuff_file;
    graph=203;
    flags=4;
    FRAME;
        WHILE(health>0);
        x=father.x-40;
        y=father.y-40;
        angle=father.angle;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS helicopter_shadow1(health)

BEGIN
    ctype=c_scroll;
    z=-169;
    file=stuff_file;
    graph=202;
    flags=4;
    FRAME;
        WHILE(health>0);
        x=father.x-50;
        y=father.y-50;
        angle=father.angle;
        FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS army_turret_1(file,graph,x,y,angle)

PRIVATE
    army_turret_1_can_fire;

BEGIN
    ctype=c_scroll;
    z=-48;
    LOOP
        x=father.x;
        y=father.y;
        army_turret_1_can_fire+=1;
        IF(get_dist(id11)<get_dist(id12)) angle=get_angle(id11); END
        IF(get_dist(id12)<get_dist(id11)) angle=get_angle(id12); END
        IF(get_dist(id2)<get_dist(id11)) angle=get_angle(id2); END
        IF(army_turret_1_can_fire>3 AND get_dist(id11)<280) army_man_bullet(x,y,angle); army_turret_1_can_fire=0; END
        IF(army_turret_1_can_fire>3 AND get_dist(id12)<280) army_man_bullet(x,y,angle); army_turret_1_can_fire=0; END
        IF(army_turret_1_can_fire>3 AND get_dist(id2)<280) army_man_bullet(x,y,angle); army_turret_1_can_fire=0; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS army_turret_2(x,y,angle)

PRIVATE
    army_turret_2_can_fire;

BEGIN
    ctype=c_scroll;
    z=-48;
    file=stuff_file;
    graph=12;
    LOOP
        x=father.x;
        y=father.y;
        army_turret_2_can_fire+=1;
        IF(get_dist(id11)<get_dist(id12)) angle=get_angle(id11); END
        IF(get_dist(id12)<get_dist(id11)) angle=get_angle(id12); END
        IF(get_dist(id2)<get_dist(id11)) angle=get_angle(id2); END
        IF(army_turret_2_can_fire>30 AND get_dist(id11)<280) army_shell(x,y,angle); army_turret_2_can_fire=0; END
        IF(army_turret_2_can_fire>30 AND get_dist(id12)<280) army_shell(x,y,angle); army_turret_2_can_fire=0; END
        IF(army_turret_2_can_fire>30 AND get_dist(id2)<280) army_shell(x,y,angle); army_turret_2_can_fire=0; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS army_turret_base(x,y,angle,armour)

BEGIN
    file=stuff_file;
    graph=40;
    ctype=c_scroll;
    z=-48;
    army_turret_2(x,y,angle);
    FRAME;
        WHILE(armour>0);
        IF(collision(TYPE player1_bullet)) armour-=1; END
        IF(collision(TYPE player1_shell)) armour-=20; END
        IF(collision(TYPE player1_high_shell_explosion)) armour-=20; END
        IF(collision(TYPE hot_seat_player1_bullet)) armour-=1; END
        IF(collision(TYPE hot_seat_player1_shell)) armour-=20; END
        IF(collision(TYPE hot_seat_player2_bullet)) armour-=1; END
        IF(collision(TYPE hot_seat_player2_shell)) armour-=20; END
        IF(collision(TYPE player1_missile)) armour-=30; END
        IF(collision(TYPE player1_anti_tank_shell)) armour=0; END
        FRAME;
    END
    signal(son,s_kill);
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    blown_up_thing(stuff_file,59,x,y,angle);
    END
END

//-----------------------------------------------------------------------------

PROCESS civilian1(origonal,graph,x,y,distance_to_travle,angle)

PRIVATE
    civilian_1_distance_travled;
    civilian_1_notice_player1;
    civilian_1_notice_hot_seat_player1;
    civilian_1_notice_hot_seat_player2;
    civilian_1_alive;
    civilian_anomation;
    new_civilian_1;

BEGIN
    ctype=c_scroll;
    z=-40;
    file=stuff_file;
    civilian_1_notice_player1=FALSE;
    civilian_1_notice_hot_seat_player1=FALSE;
    civilian_1_notice_hot_seat_player2=FALSE;
    civilian_1_alive=TRUE;
    FRAME;
        WHILE(civilian_1_alive==TRUE);
        civilian_anomation+=1;
        angle+=rand(-10000,10000);
        IF(civilian_anomation>3 AND graph<origonal+7) graph+=1; civilian_anomation=0; END
        IF(graph==origonal+7) graph=origonal; END
        IF(get_dist(id2)<150) civilian_1_notice_player1=TRUE; END
        IF(get_dist(id2)>150) civilian_1_notice_player1=FALSE; END
        IF(get_dist(id11)<150) civilian_1_notice_hot_seat_player1=TRUE; END
        IF(get_dist(id11)>150) civilian_1_notice_hot_seat_player1=FALSE; END
        IF(get_dist(id12)<150) civilian_1_notice_hot_seat_player2=TRUE; END
        IF(get_dist(id12)>150) civilian_1_notice_hot_seat_player2=FALSE; END
        IF(NOT collision(TYPE missionbigobject) AND NOT collision(TYPE bigobject) AND NOT collision(TYPE barbed_wire_fence) AND NOT collision(TYPE army_van_1) AND civilian_1_notice_player1==TRUE) angle=get_angle(id2)-180000; advance(5); END
        IF(NOT collision(TYPE missionbigobject) AND NOT collision(TYPE bigobject) AND NOT collision(TYPE barbed_wire_fence) AND NOT collision(TYPE army_van_1) AND civilian_1_notice_hot_seat_player1==TRUE) angle=get_angle(id11)-180000; advance(5); END
        IF(NOT collision(TYPE missionbigobject) AND NOT collision(TYPE bigobject) AND NOT collision(TYPE barbed_wire_fence) AND NOT collision(TYPE army_van_1) AND civilian_1_notice_hot_seat_player2==TRUE) angle=get_angle(id12)-180000; advance(5); END
        IF(civilian_1_notice_player1==FALSE AND civilian_1_notice_hot_seat_player1==FALSE AND civilian_1_notice_hot_seat_player2==FALSE) angle=angle; advance(3); civilian_1_distance_travled+=3; END
        IF(civilian_1_distance_travled>distance_to_travle) angle+=180000; civilian_1_distance_travled=0; END
        IF(collision(TYPE player1_anti_tank_shell)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1_bullet)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1_shell)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1_high_shell_explosion)) civilian_1_alive=FALSE; END
        IF(collision(TYPE player1)) civilian_1_alive=FALSE; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE player1_flail)) civilian_1_alive=FALSE; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE army_man_1)) angle+=135000; END
        IF(collision(TYPE bigobject)) angle-=135000; END
        IF(collision(TYPE missionbigobject)) angle+=135000; END
        IF(collision(TYPE smallobject)) angle+=135000; END
        IF(collision(TYPE army_turret_base)) angle+=135000; END
        IF(collision(TYPE army_van_1)) angle+=135000; END
        IF(collision(TYPE barbed_wire_fence)) angle+=135000; END
        IF(collision(TYPE hot_seat_player1_bullet)) civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player1_shell)) civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player1)) civilian_1_alive=FALSE; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE hot_seat_player2_bullet)) civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player2_shell)) civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player2)) civilian_1_alive=FALSE; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE player1_missile)) civilian_1_alive=FALSE; END
        FRAME;
    END
    file=stuff_file;
    graph=0;
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS levle5_spy(origonal,graph,x,y)

PRIVATE
    spy_alive;
    get_in_tank;
    spy_anomation;

BEGIN
    ctype=c_scroll;
    z=-40;
    file=stuff_file;
    spy_alive=TRUE;
    get_in_tank=FALSE;
    FRAME;
        WHILE(spy_alive==TRUE);
        mission1_point_x=x;
        mission1_point_y=y;
        IF(get_in_tank==FALSE) angle+=rand(0,20000); END
        IF(get_in_tank==TRUE) spy_anomation+=1; END
        IF(spy_anomation>3 AND graph<origonal+7) graph+=1; spy_anomation=0; END
        IF(graph==origonal+7) graph=origonal; END
        IF(get_dist(id2)<10) player1_levle_position=0; signal(id,s_kill); END
        IF(id2.x>95 AND id2.x<280 AND id2.y>1350) get_in_tank=TRUE; angle=get_angle(id2); advance(5); END
        IF(collision(TYPE player1_anti_tank_shell)) spy_alive=FALSE; spy_dead=TRUE; END
        IF(collision(TYPE player1_bullet)) spy_alive=FALSE; spy_dead=TRUE;  END
        IF(collision(TYPE player1_shell)) spy_alive=FALSE; spy_dead=TRUE;  END
        IF(collision(TYPE player1_high_shell_explosion)) spy_alive=FALSE; spy_dead=TRUE; END
        IF(collision(TYPE player1_missile)) spy_alive=FALSE; spy_dead=TRUE;  END
        FRAME;
    END
    file=stuff_file;
    graph=0;
    splat(x,y);
END

//-----------------------------------------------------------------------------

PROCESS bigobject(file,graph,x,y,angle)

BEGIN
    ctype=c_scroll;
    z=-150;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS missionbigobject(file,graph,x,y,angle,armour)

BEGIN
    ctype=c_scroll;
    z=-150;
    FRAME;
    WHILE(armour>0);
        IF(collision(TYPE player1_shell)) armour-=20; END
        IF(collision(TYPE player1_high_shell_explosion)) armour-=20; END
        IF(collision(TYPE player1_missile)) armour-=20; END
        IF(collision(TYPE player1_anti_tank_shell)) armour=-100; END
        FRAME;
    END
    IF(player1_levle==21 AND graph==13) player1_levle_position=0; blown_up_thing(scenery_file,102,x,y,angle); END
    IF(player1_levle==25 AND graph==10) player1_levle_position-=1; blown_up_thing(scenery_file,100,x,y,angle); END
    IF(player1_levle==27 AND graph==50) player1_levle_position-=1; blown_up_thing(scenery_file,101,x,y,angle); END
    IF(player1_levle==31 AND graph==60) player1_levle_position-=1; blown_up_thing(scenery_file,101,x,y,angle); END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS smallobject(file,graph,x,y,angle)

BEGIN
    ctype=c_scroll;
    z=-150;
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS highobject(file,graph,x,y,angle,armour)

BEGIN
    ctype=c_scroll;
    z=-140;
    FRAME;
    WHILE(armour>0);
        IF(player1_levle_position<2 AND player1_levle==25) armour=0; END
        FRAME;
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS road(file,graph,x,y,angle)

BEGIN
    ctype=c_scroll;
    z=-10;
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS hill(file,graph,x,y,angle)

BEGIN
    ctype=c_scroll;
    z=-15;
    flags=4;
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS barbed_wire_fence(x,y,angle,barbed_wire_armour)

BEGIN
    ctype=c_scroll;
    file=scenery_file;
    graph=20;
    z=-45;
    FRAME;
    WHILE (barbed_wire_armour>0);
        IF(collision(TYPE player1)) barbed_wire_armour-=10; END
        IF(collision(TYPE player1_flail)) barbed_wire_armour-=10; END
        IF(collision(TYPE hot_seat_player1)) barbed_wire_armour-=10; END
        IF(collision(TYPE hot_seat_player2)) barbed_wire_armour-=10; END
        IF(collision(TYPE player1_missile)) barbed_wire_armour=0; END
        FRAME;
    END
    WHILE (barbed_wire_armour<1);
        file=scenery_file;
        graph=22;
        z=-10;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS splat(x,y);

BEGIN
    ctype=c_scroll;
    z=-30;
    file=stuff_file;
    graph=90;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS blown_up_thing(file,graph,x,y,angle);

BEGIN
    ctype=c_scroll;
    z=-38;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_bullet(x,y,angle)

PRIVATE
    player1_bullet_distance_travled;

BEGIN
    sound(s_gun1,volume,frequency);
    ctype=c_scroll;
    z=-60;
    file=guns_file;
    graph=10;
    FRAME;
    WHILE(player1_bullet_distance_travled<600);
    advance(20);
    player1_bullet_distance_travled+=20;
    IF(collision(TYPE bigobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE missionbigobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE barbed_wire_fence)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_man_1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE civilian1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_van_1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) player1_bullet_distance_travled=600; END
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_shell(x,y,angle)

PRIVATE
    player1_shell_distance_travled;

BEGIN
    sound(s_shell,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=20;
    FRAME;
        WHILE(player1_shell_distance_travled<200);
        advance(30);
        player1_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) player1_shell_distance_travled=300; END
        IF(collision(TYPE missionbigobject)) player1_shell_distance_travled=300; END
        IF(collision(TYPE army_man_1)) player1_shell_distance_travled=300; END
        IF(collision(TYPE civilian1)) player1_shell_distance_travled=300; END
        IF(collision(TYPE army_van_1)) player1_shell_distance_travled=600; END
        IF(collision(TYPE army_turret_base)) player1_shell_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_high_shell(x,y,angle)

PRIVATE
    player1_shell_distance_travled;

BEGIN
    sound(s_shell,volume,frequency);
    ctype=c_scroll;
    z=-155;
    file=guns_file;
    graph=20;
    FRAME;
        WHILE(player1_shell_distance_travled<200);
        advance(30);
        player1_shell_distance_travled+=20;
        FRAME(75);
    END
    player1_high_shell_explosion(x,y);
END

//-----------------------------------------------------------------------------

PROCESS player1_high_shell_explosion(x,y)

BEGIN
    ctype=c_scroll;
    z=-160;
    file=guns_file;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_missile(x,y,angle)

PRIVATE
    player1_missile_distance_travled;

BEGIN
    sound(s_missile,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=15;
    FRAME;
        WHILE(player1_missile_distance_travled<600);
        advance(40);
        player1_missile_distance_travled+=40;
        IF(collision(TYPE bigobject)) player1_missile_distance_travled=600; END
        IF(collision(TYPE missionbigobject)) player1_missile_distance_travled=600; END
        IF(collision(TYPE smallobject)) player1_missile_distance_travled=600; END
        IF(collision(TYPE army_man_1)) player1_missile_distance_travled=600; END
        IF(collision(TYPE civilian1)) player1_missile_distance_travled=600; END
        IF(collision(TYPE army_van_1)) player1_missile_distance_travled=600; END
        IF(collision(TYPE barbed_wire_fence)) player1_missile_distance_travled=600; END
        IF(collision(TYPE army_turret_base)) player1_missile_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_anti_aircraft_missile(x,y,angle)

PRIVATE
    player1_missile_distance_travled;

BEGIN
    sound(s_missile,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=15;
    FRAME;
        WHILE(player1_missile_distance_travled<600);
        advance(40);
        player1_missile_distance_travled+=40;
        IF(collision(TYPE army_helicopter)) player1_missile_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_anti_tank_shell(x,y,angle)

PRIVATE
    player1_anti_tank_shell_distance_travled;

BEGIN
    sound(s_shell,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=20;
    FRAME;
        WHILE(player1_anti_tank_shell_distance_travled<200);
        advance(30);
        player1_anti_tank_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) player1_anti_tank_shell_distance_travled=300; END
        IF(collision(TYPE missionbigobject)) player1_anti_tank_shell_distance_travled=300; END
        IF(collision(TYPE civilian1)) player1_anti_tank_shell_distance_travled=300; END
        IF(collision(TYPE army_van_1)) player1_anti_tank_shell_distance_travled=600; END
        IF(collision(TYPE army_turret_base)) player1_anti_tank_shell_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=120 TO 134;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------


PROCESS hot_seat_player1_bullet(x,y,angle)

PRIVATE
    hot_seat_player1_bullet_distance_travled;

BEGIN
    sound(s_gun1,volume,frequency);
    ctype=c_scroll;
    z=-60;
    file=guns_file;
    graph=10;
    FRAME;
    WHILE(hot_seat_player1_bullet_distance_travled<600);
    advance(29);
    hot_seat_player1_bullet_distance_travled+=29;
    IF(collision(TYPE bigobject)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE missionbigobject)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE barbed_wire_fence)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_man_1)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE hot_seat_player2)) hot_seat_player1_bullet_distance_travled=600; hot_seat_player2_armour-=1; END
    IF(collision(TYPE civilian1)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_van_1)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) hot_seat_player1_bullet_distance_travled=600; END
    FRAME(75);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player1_shell(x,y,angle)

PRIVATE
    hot_seat_player1_shell_distance_travled;

BEGIN
    sound(s_shell,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=20;
    FRAME;
        WHILE(hot_seat_player1_shell_distance_travled<200);
        advance(30);
        hot_seat_player1_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) hot_seat_player1_shell_distance_travled=300; END
        IF(collision(TYPE missionbigobject)) hot_seat_player1_shell_distance_travled=300; END
        IF(collision(TYPE army_man_1)) hot_seat_player1_shell_distance_travled=300; END
        IF(collision(TYPE hot_seat_player2)) hot_seat_player1_shell_distance_travled=300; hot_seat_player2_armour-=20; END
        IF(collision(TYPE civilian1)) hot_seat_player1_shell_distance_travled=300; END
        IF(collision(TYPE army_van_1)) hot_seat_player1_shell_distance_travled=600; END
        IF(collision(TYPE army_turret_base)) hot_seat_player1_shell_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player2_bullet(x,y,angle)

PRIVATE
    hot_seat_player2_bullet_distance_travled;

BEGIN
    sound(s_gun1,volume,frequency);
    ctype=c_scroll;
    z=-60;
    file=guns_file;
    graph=10;
    FRAME;
    WHILE(hot_seat_player2_bullet_distance_travled<600);
    advance(29);
    hot_seat_player2_bullet_distance_travled+=29;
    IF(collision(TYPE bigobject)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE missionbigobject)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE barbed_wire_fence)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE army_man_1)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE hot_seat_player1)) hot_seat_player2_bullet_distance_travled=600; hot_seat_player1_armour-=1; END
    IF(collision(TYPE civilian1)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE army_van_1)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) hot_seat_player2_bullet_distance_travled=600; END
    FRAME(75);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player2_shell(x,y,angle)

PRIVATE
    hot_seat_player2_shell_distance_travled;

BEGIN
    sound(s_shell,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=20;
    FRAME;
        WHILE(hot_seat_player2_shell_distance_travled<200);
        advance(30);
        hot_seat_player2_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) hot_seat_player2_shell_distance_travled=300; END
        IF(collision(TYPE missionbigobject)) hot_seat_player2_shell_distance_travled=300; END
        IF(collision(TYPE army_man_1)) hot_seat_player2_shell_distance_travled=300; END
        IF(collision(TYPE hot_seat_player1)) hot_seat_player2_shell_distance_travled=300; hot_seat_player1_armour-=20; END
        IF(collision(TYPE civilian1)) hot_seat_player2_shell_distance_travled=300; END
        IF(collision(TYPE army_van_1)) hot_seat_player2_shell_distance_travled=600; END
        IF(collision(TYPE army_turret_base)) hot_seat_player2_shell_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_man_bullet(x,y,angle)

PRIVATE
    army_man_bullet_distance_travled;

BEGIN
    sound(s_gun1,volume,frequency);
    ctype=c_scroll;
    z=-60;
    file=guns_file;
    graph=11;
    FRAME;
    WHILE(army_man_bullet_distance_travled<600);
    advance(29);
    army_man_bullet_distance_travled+=29;
    IF(collision(TYPE bigobject)) army_man_bullet_distance_travled=600; END
    IF(collision(TYPE missionbigobject)) army_man_bullet_distance_travled=600; END
    IF(collision(TYPE player1)) army_man_bullet_distance_travled=600; player1_C_armour-=1; END
    IF(collision(TYPE barbed_wire_fence)) army_man_bullet_distance_travled=600; END
    IF(collision(TYPE hot_seat_player1)) army_man_bullet_distance_travled=600; hot_seat_player1_armour-=1; END
    IF(collision(TYPE hot_seat_player2)) army_man_bullet_distance_travled=600; hot_seat_player2_armour-=1; END
    IF(collision(TYPE army_van_1)) army_man_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) army_man_bullet_distance_travled=600; END
    FRAME(75);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_man_missile(x,y,angle)

PRIVATE
    army_missile_distance_travled;

BEGIN
    sound(s_missile,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=15;
    FRAME;
        WHILE(army_missile_distance_travled<600);
        advance(40);
        army_missile_distance_travled+=40;
        IF(collision(TYPE player1)) army_missile_distance_travled=600; player1_C_armour-=15; END
        IF(collision(TYPE hot_seat_player1))  army_missile_distance_travled=600; hot_seat_player1_armour-=15; END
        IF(collision(TYPE hot_seat_player2))  army_missile_distance_travled=600; hot_seat_player2_armour-=15; END
        IF(collision(TYPE army_van_1))  army_missile_distance_travled=600; END
        IF(collision(TYPE army_turret_base))  army_missile_distance_travled=600; END
        IF(collision(TYPE bigobject)) army_missile_distance_travled=600; END
        IF(collision(TYPE missionbigobject)) army_missile_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS army_shell(x,y,angle)

PRIVATE
    army_shell_distance_travled;

BEGIN
    sound(s_shell,volume,frequency);
    ctype=c_scroll;
    z=-70;
    file=guns_file;
    graph=20;
    FRAME;
        WHILE(army_shell_distance_travled<200);
        advance(30);
        army_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) army_shell_distance_travled=300; END
        IF(collision(TYPE missionbigobject)) army_shell_distance_travled=300; END
        IF(collision(TYPE player1)) army_shell_distance_travled=600; player1_C_armour-=15; END
        IF(collision(TYPE hot_seat_player1)) army_shell_distance_travled=600; hot_seat_player1_armour-=15; END
        IF(collision(TYPE hot_seat_player2)) army_shell_distance_travled=600; hot_seat_player2_armour-=15; END
        IF(collision(TYPE army_van_1)) army_shell_distance_travled=600; END
        FRAME(75);
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS land_mine(x,y)

PRIVATE
    land_mine_active;

BEGIN
    land_mine_active=TRUE;
    ctype=c_scroll;
    z=-35;
    file=stuff_file;
    graph=30;
    FRAME;
    WHILE(land_mine_active==TRUE);
        IF(collision(TYPE player1)) land_mine_active=FALSE; player1_C_armour-=10; END
        IF(collision(TYPE player1_flail)) land_mine_active=FALSE; END
        IF(collision(TYPE hot_seat_player1)) land_mine_active=FALSE; hot_seat_player1_armour-=10; END
        IF(collision(TYPE hot_seat_player2)) land_mine_active=FALSE; hot_seat_player1_armour-=10; END
    FRAME;
    END
    z=-160;
    sound(s_explosion1,volume,frequency);
    FILE=guns_file;
    FROM graph=100 TO 114;
    FRAME(50);
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

PROCESS robo_title();

BEGIN
    mouse.file=rmain_file;
    mouse.graph=0;
    volume=50;
    load_pal("fpg\og\rmain.fpg");
    set_mode(m640x480);
    set_fps(24,24);
    player_health=100;
    player_level=0;
    rain();
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=1;
    x=320;
    y=240;
    write(rtitle_font,320,240,4,"ROBO - MARINES");
    write(rsmall_font,320,452,4,"OWEN GAMES (c) 2001");
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

PROCESS robo_options();

BEGIN
    rain();
    mouse.file=rmain_file;
    mouse.graph=20;
    mouse.z=-512;
    screen=0;
    new_screen=0;
    file=rmain_file;
    graph=1;
    x=320;
    y=240;
    write(rtitle_font,320,100,4,"ROBO - MARINES");
    write(rmain_font,320,180,4,"NEW GAME");
    write(rmain_font,320,220,4,"LOAD GAME");
    write(rmain_font,320,260,4,"SETTINGS");
    write(rmain_font,320,300,4,"BACK");
    write(rsmall_font,320,452,4,"OWEN GAMES (c) 2001");
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
        IF(key(_esc) OR (mouse.left AND mouse.y>280 AND mouse.y<320)) new_screen=1; END
        FRAME;
    END
    volume=100;
    clear_screen();
    signal(TYPE rain,s_kill);
    delete_text(all_text);
    stop_sound(all_sound);
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
        IF(key(_esc) OR mouse.right) new_screen=605; END
        IF(key(_space) OR key(_enter) OR mouse.left) new_screen=605; END
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
            write(rtitle_font,320,50,4,"GAME");
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
        IF(key(_esc) OR mouse.right) new_screen=605; END
        IF(player_enemy_killed>5 OR level_cheat==TRUE)
            IF(key(_space) OR (mouse.left AND mouse.x<320 AND mouse.y>380))
                IF(player_level==1) new_screen=612; END
                IF(player_level==2) new_screen=613; END
                IF(player_level==3) new_screen=614; END
                IF(player_level==4 AND player_cheater==FALSE)
                    player_level=0;
                    save("dat\og\001.dat",&player_level,1);
                    save("dat\og\011.dat",&player_cheater,1);
                    new_screen=605;
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
                    IF(player_cheater==FALSE) new_screen=605; END
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
        IF(key(_esc)) new_screen=605; END
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
        IF(key(_esc)) new_screen=605; END
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
        IF(key(_esc)) new_screen=605; END
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
        IF(key(_esc)) new_screen=605; END
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
    level_cheat=FALSE;
    LOOP
    FRAME;
    IF(game_cheats==TRUE);
        IF(key(_control) AND key(_2)) chaingun_ammo+=10; info_text=2; player_cheater=TRUE; END
        IF(key(_control) AND key(_3)) flamer_ammo+=10; info_text=3; player_cheater=TRUE;  END
        IF(key(_control) AND key(_4)) missile_ammo+=10; info_text=4; player_cheater=TRUE;  END
        IF(key(_control) AND key(_0)) player_health=100; info_text=10; player_cheater=TRUE;  END
        IF(key(_control) AND key(_8)) player_invincible=TRUE; player_cheater=TRUE;  END
        IF(key(_control) AND key(_9)) new_screen=609; level_cheat=TRUE; player_cheater=TRUE;  END
        IF(key(_control) AND key(_up)) id5.x+=100; player_cheater=TRUE;  END
    END
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
