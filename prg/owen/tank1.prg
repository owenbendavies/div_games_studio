
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

    screen=501;
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

    id2;
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

//-----------------------------------------------------------------------------

BEGIN

    set_mode(m640x480);
    set_fps(16,16);

    volume=256;
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

    main_file=load_fpg("fpg\og\tmain.fpg");
    stuff_file=load_fpg("fpg\og\tstuff.fpg");
    scenery_file=load_fpg("fpg\og\tscen.fpg");
    guns_file=load_fpg("fpg\og\tguns.fpg");
    game_file=load_fpg("fpg\og\tgame.fpg");
    photo_file=load_fpg("fpg\og\tphotos.fpg");

    LOOP
        SWITCH (screen);
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
        END
        FRAME;
    END
END

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
//  @TANK BLAST
//-----------------------------------------------------------------------------

PROCESS tank_owen_games();

BEGIN
    load_pal("fpg\og\tmain.fpg");
    set_mode(m640x480);
    frames_per_second=24;
    set_fps(frames_per_second,frames_per_second);
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
        IF(key(_esc) OR mouse.left AND mouse.y>320 AND mouse.y<360) exit("OWEN GAMES (c) 2002",0); END
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
        IF(mouse.left AND mouse.y>145 AND mouse.y<190) load("dat\og\1levle.dat",&player1_levle); load("dat\og\1xspeed.dat",&player1_max_speed); load("dat\og\1nspeed.dat",&player1_min_speed); load("dat\og\1armour.dat",&player1_armour); load("dat\og\1w1.dat",&player1_weapon1); load("dat\og\1w2.dat",&player1_weapon2); load("dat\og\1w3.dat",&player1_weapon3); load("dat\og\1w4.dat",&player1_weapon4); load("dat\og\1w5.dat",&player1_weapon5); load("dat\og\1w6.dat",&player1_weapon6); load("dat\og\1w7.dat",&player1_weapon7); load("dat\og\1w8.dat",&player1_weapon8); load("dat\og\1w9.dat",&player1_weapon9); load("dat\og\1w10.dat",&player1_weapon10); load("dat\og\1flails.dat",&player1_flails); load("dat\og\1double.dat",&player1_double_machine_guns); IF(player1_levle>0) new_screen=player1_levle+500; END END
        IF(mouse.left AND mouse.y>190 AND mouse.y<235) load("dat\og\2levle.dat",&player1_levle); load("dat\og\2xspeed.dat",&player1_max_speed); load("dat\og\2nspeed.dat",&player1_min_speed); load("dat\og\2armour.dat",&player1_armour); load("dat\og\2w1.dat",&player1_weapon1); load("dat\og\2w2.dat",&player1_weapon2); load("dat\og\2w3.dat",&player1_weapon3); load("dat\og\2w4.dat",&player1_weapon4); load("dat\og\2w5.dat",&player1_weapon5); load("dat\og\2w6.dat",&player1_weapon6); load("dat\og\2w7.dat",&player1_weapon7); load("dat\og\2w8.dat",&player1_weapon8); load("dat\og\2w9.dat",&player1_weapon9); load("dat\og\2w10.dat",&player1_weapon10); load("dat\og\2flails.dat",&player1_flails); load("dat\og\2double.dat",&player1_double_machine_guns); IF(player1_levle>0) new_screen=player1_levle+500; END  END
        IF(mouse.left AND mouse.y>235 AND mouse.y<280) load("dat\og\3levle.dat",&player1_levle); load("dat\og\3xspeed.dat",&player1_max_speed); load("dat\og\3nspeed.dat",&player1_min_speed); load("dat\og\3armour.dat",&player1_armour); load("dat\og\3w1.dat",&player1_weapon1); load("dat\og\3w2.dat",&player1_weapon2); load("dat\og\3w3.dat",&player1_weapon3); load("dat\og\3w4.dat",&player1_weapon4); load("dat\og\3w5.dat",&player1_weapon5); load("dat\og\3w6.dat",&player1_weapon6); load("dat\og\3w7.dat",&player1_weapon7); load("dat\og\3w8.dat",&player1_weapon8); load("dat\og\3w9.dat",&player1_weapon9); load("dat\og\3w10.dat",&player1_weapon10); load("dat\og\3flails.dat",&player1_flails); load("dat\og\3double.dat",&player1_double_machine_guns); IF(player1_levle>0) new_screen=player1_levle+500; END  END
        IF(mouse.left AND mouse.y>280 AND mouse.y<325) load("dat\og\4levle.dat",&player1_levle); load("dat\og\4xspeed.dat",&player1_max_speed); load("dat\og\4nspeed.dat",&player1_min_speed); load("dat\og\4armour.dat",&player1_armour); load("dat\og\4w1.dat",&player1_weapon1); load("dat\og\4w2.dat",&player1_weapon2); load("dat\og\4w3.dat",&player1_weapon3); load("dat\og\4w4.dat",&player1_weapon4); load("dat\og\4w5.dat",&player1_weapon5); load("dat\og\4w6.dat",&player1_weapon6); load("dat\og\4w7.dat",&player1_weapon7); load("dat\og\4w8.dat",&player1_weapon8); load("dat\og\4w9.dat",&player1_weapon9); load("dat\og\4w10.dat",&player1_weapon10); load("dat\og\4flails.dat",&player1_flails); load("dat\og\4double.dat",&player1_double_machine_guns); IF(player1_levle>0) new_screen=player1_levle+500; END  END
        IF(mouse.left AND mouse.y>325 AND mouse.y<370) load("dat\og\5levle.dat",&player1_levle); load("dat\og\5xspeed.dat",&player1_max_speed); load("dat\og\5nspeed.dat",&player1_min_speed); load("dat\og\5armour.dat",&player1_armour); load("dat\og\5w1.dat",&player1_weapon1); load("dat\og\5w2.dat",&player1_weapon2); load("dat\og\5w3.dat",&player1_weapon3); load("dat\og\5w4.dat",&player1_weapon4); load("dat\og\5w5.dat",&player1_weapon5); load("dat\og\5w6.dat",&player1_weapon6); load("dat\og\5w7.dat",&player1_weapon7); load("dat\og\5w8.dat",&player1_weapon8); load("dat\og\5w9.dat",&player1_weapon9); load("dat\og\5w10.dat",&player1_weapon10); load("dat\og\5flails.dat",&player1_flails); load("dat\og\5double.dat",&player1_double_machine_guns); IF(player1_levle>0) new_screen=player1_levle+500; END  END
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
        IF(i_can_fire_bullet>4 AND key(_control))
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
        IF(collision(TYPE player1_bullet)) health-=3; END
        IF(collision(TYPE player1_shell)) health=0; END
        IF(collision(TYPE player1_high_shell_explosion)) health=0; END
        IF(collision(TYPE player1_missile)) health=0; END
        IF(collision(TYPE player1_anti_tank_shell)) health=0; END
        IF(collision(TYPE player1)) health=0; sound(s_aaah,volume,frequency); END
        IF(collision(TYPE player1_flail)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_player1==TRUE AND army_man_1_can_fire>firing_rate) army_man_bullet(x,y,get_angle(id2)); army_man_1_can_fire=0; END
        IF(collision(TYPE hot_seat_player1_bullet)) health-=3; END
        IF(collision(TYPE hot_seat_player1_shell)) health=0; END
        IF(collision(TYPE hot_seat_player1)) health=0; sound(s_aaah,volume,frequency); END
        IF(army_man_1_notice_hot_seat_player1==TRUE AND army_man_1_can_fire>firing_rate) army_man_bullet(x,y,get_angle(id11)); army_man_1_can_fire=0; END
        IF(collision(TYPE hot_seat_player2_bullet)) health-=3; END
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
    advance(2);
    player1_bullet_distance_travled+=2;
    IF(collision(TYPE bigobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE missionbigobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE barbed_wire_fence)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_man_1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE civilian1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_van_1)) player1_bullet_distance_travled=600; END
    IF(collision(TYPE army_turret_base)) player1_bullet_distance_travled=600; END
    FRAME(10);
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
