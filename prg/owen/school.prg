
//-----------------------------------------------------------------------------
// TITLE:      SCHOOL GAMES
// AUTHOR:     OWEN DAVIES
// DATE:       9/4/2002
//-----------------------------------------------------------------------------

compiler_options
_extended_conditions;

PROGRAM school_games;

GLOBAL

    worm_betting_cheats=FALSE;
    tank_blast_cheats=FALSE;
    space_blast_cheats=FALSE;
    asteroids_cheats=FALSE;
    znake_cheats=FALSE;
    pong_cheats=FALSE;
    recent_cheat=0;

    s_1;
    s_2;
    s_3;
    s_4;
    s_5;
    s_6;
    s_7;
    s_8;
    s_9;
    s_10;
    s_11;
    s_12;
    s_13;
    s_14;
    s_15;
    s_explosion;

    screen=1;
    new_screen;

    main_file;
    pong_file;
    asteroids_file;
    znake_file;
    worms_file;
    space_file;
    tank_file;
    help_file;

    main_font;
    black_font;
    small_font;

//-----------------------------------------------------------------------------

// SAVE

    ast_high_score=0;
    znake_topscore[]=0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
    times_on_game=0;

//-----------------------------------------------------------------------------

// CHEATS

    player_cheat;

//-----------------------------------------------------------------------------

    start_text[]=
        "G O   T O   w w w . g e o c i t i e s . c o m / o b d u k   F O R   M O R E   G A M E S   A N D   C H E A T S",
        "L O O K   O U T   M O R E  G A M E S ,   C O M I N G   S O O N",
        "T H E R E   A R E   5   W A Y S   F O R   W O R M S   T O   D I E   I N   W O R M   B E T T I N G",
        "O W E N   G A M E S   W A S   C R E A T E D   B Y   O W E N   D A V I E S",
        "N E W   V E R S I O N S   A N D   N E W   G A M E S   W I L L   B E   M A D E",
        "H A V E   F U N ! ! !",
        "W O R M   B E T T I N G   C H E A T S   A R E   O N",
        "T A N K   B L A S T   C H E A T S   A R E   O N",
        "S P A C E   B L A S T   C H E A T S   A R E   O N",
        "A S T E R O I D   C H E A T S   A R E   O N",
        "Z N A K E   C H E A T S   A R E   O N",
        "P O N G   C H E A T S   A R E   O N";


    pong_set_points[]="INFINITY","10 POINTS","20 POINTS","30 POINTS","40 POINTS","50 POINTS";
    pong_set_points_game;
    pong_players;
    raquet1;
    raquet2;
    raquet3;
    raquet4;
    pong_player1_score;
    pong_player2_score;
    pong_player3_score;
    pong_player4_score;
    number_of_balls;
    pong_ball2;

    ast_cheats=FALSE;
    sheild_time;
    ast_score=0;
    ast_levle=1;
    ast_destroyed=0;
    sheilds;

    name1;
    name2;
    name3;
    name4;
    name5;
    name6;
    name7;
    name8;
    name9;
    name10;
    name11;
    name12;
    name13;
    name14;
    letters[]="",0,"1","2","3","4","5","6","7","8","9","0","-","+","","","Q","W","E","R","T","Y","U","I","O","P","[","]","","","A","S","D","F","G","H","J","K","L",";","'","","","#","Z","X","C","V","B","N","M",",",".","/","","","","";
    znake_set_points[]="INFINITY","100 POINTS","200 POINTS","300 POINTS","400 POINTS","500 POINTS";
    znake_set_points_game;
    players;
    znake_worm1_length=8;
    znake_apples=0;
    znake_special_1s=0;
    znake_special_2s=0;
    znake_special_3s=0;
    znake_special_4s=0;
    znake_score1=0;
    znake_worm2_length=8;
    znake_score2=0;

    lightening_hit;
    lightening_x;
    lightening_y;
    worm1_lightening;
    worm2_lightening;
    worm3_lightening;
    worm4_lightening;
    worm5_lightening;
    hole_x;
    hole_y;
    worm1_hole;
    worm2_hole;
    worm3_hole;
    worm4_hole;
    worm5_hole;
    man_trap_x;
    man_trap_y;
    man_trap_close;
    comet_killed;
    comet_hit;
    comet_x;
    comet_y;
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
    worm_start_timer;
    worm1_death;
    worm2_death;
    worm3_death;
    worm4_death;
    worm5_death;
    worm1_man_trap;
    worm2_man_trap;
    worm3_man_trap;
    worm4_man_trap;
    worm5_man_trap;

    id1;
    id2;
    id3;
    space_ship1_explosion;
    space_ship2_explosion;
    space_fortress_explosion;
    space_player1_health;
    space_player2_health;
    space_fortress_health;
    space_player_winner;

    tank_scenery;
    terrain_minx;
    terrain_maxx;
    terrain_miny;
    terrain_maxy;
    starting_point1_x;
    starting_point1_y;
    starting_point1_a;
    starting_point2_x;
    starting_point2_y;
    starting_point2_a;
    id11;
    hot_seat_player1_speed;
    hot_seat_player1_max_speed;
    hot_seat_player1_min_speed;
    hot_seat_player1_armour;
    hot_seat_player1_game_over;
    id12;
    hot_seat_player2_speed;
    hot_seat_player2_max_speed;
    hot_seat_player2_min_speed;
    hot_seat_player2_armour;
    hot_seat_player2_game_over;

    id21;
    id22;

BEGIN
//    save("dat\sg\1.dat",&ast_high_score,1);
//    save("dat\sg\2.dat",&znake_topscore,15);
//    save("dat\sg\3.dat",&times_on_game,1);
    load("dat\sg\3.dat",&times_on_game);
    times_on_game+=1;
    save("dat\sg\3.dat",&times_on_game,1);

    set_mode(m800x600);

    main_file=load_fpg("fpg\sg\main.fpg");
    pong_file=load_fpg("fpg\sg\pong.fpg");
    asteroids_file=load_fpg("fpg\sg\ast.fpg");
    znake_file=load_fpg("fpg\sg\znake.fpg");
    worms_file=load_fpg("fpg\sg\worms.fpg");
    space_file=load_fpg("fpg\sg\space.fpg");
    tank_file=load_fpg("fpg\sg\tank.fpg");
    help_file=load_fpg("fpg\sg\help.fpg");

    load_pal("fpg\sg\main.fpg");

    main_font=load_fnt("fnt\sg\main.fnt");
    black_font=load_fnt("fnt\sg\black.fnt");
    small_font=load_fnt("fnt\sg\small.fnt");

    s_explosion=load_pcm("pcm\sg\ex.pcm",0);
    s_1=load_pcm("pcm\sg\1.pcm",1);
    s_2=load_pcm("pcm\sg\2.pcm",1);
    s_3=load_pcm("pcm\sg\3.pcm",1);
    s_4=load_pcm("pcm\sg\4.pcm",1);
    s_5=load_pcm("pcm\sg\5.pcm",0);
    s_6=load_pcm("pcm\sg\6.pcm",0);
    s_7=load_pcm("pcm\sg\7.pcm",1);
    s_8=load_pcm("pcm\sg\8.pcm",0);
    s_9=load_pcm("pcm\sg\9.pcm",0);
    s_10=load_pcm("pcm\sg\10.pcm",0);
    s_11=load_pcm("pcm\sg\11.pcm",0);
    s_12=load_pcm("pcm\sg\12.pcm",0);
    s_13=load_pcm("pcm\sg\13.pcm",0);
    s_14=load_pcm("pcm\sg\14.pcm",0);
    s_15=load_pcm("pcm\sg\15.pcm",1);

    internet_background();
    pause();

        LOOP
        SWITCH (screen);
            CASE 1: owen_games(); END
            CASE 2: games(); END
            CASE 3: controls(); END
            CASE 10: pong_start(); END
            CASE 11: pong_2players(); END
            CASE 12: pong_4players(); END
            CASE 13: pong_winner(); END
            CASE 20: asteroids(); END
            CASE 30: znake_start(); END
            CASE 31: znake_1player(); END
            CASE 32: znake_2player(); END
            CASE 33: znake_winner(); END
            CASE 40: worm_betting(); END
            CASE 41: race(); END
            CASE 42: worm_winner(); END
            CASE 70: space_blast(); END
            CASE 71: space_blast_winner(); END
            CASE 80: tank_blast_game(); END
            CASE 81: tank_blast(); END
            CASE 82: tank_blast_winner(); END
            CASE 199: credits(); END
            CASE 200: exit("OWEN GAMES (c) 2002",0); END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS internet_background();

BEGIN
    define_region(1,175,120,430,430);
    define_region(2,2,120,780,430);
    define_region(3,2,200,780,200);
    define_region(4,2,120,386,430);
    define_region(5,394,120,388,430);
    file=main_file;
    graph=1;
    x=400;
    y=300;
    z=-255;
    LOOP
    IF(new_screen==199) z=-257; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS internet_background_bar(x,y);

BEGIN
    file=main_file;
    graph=9;
    z=-249;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS new_game(flashing_graph,x,y);

PRIVATE
    flashing_timer;

BEGIN
    file=main_file;
    graph=0;
    z=-249;
    flashing_timer=1;
    LOOP
    flashing_timer+=1;
    IF(flashing_timer<=5) graph=0; END
    IF(flashing_timer=>6) graph=flashing_graph; END
    IF(flashing_timer>10) flashing_timer=1; END
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
    text_pause=write(main_font,391,300,4,"PAUSED");
    FRAME;
    REPEAT
        UNTIL (key(_f1));
        delete_text(text_pause);
        WHILE (key(_f1));
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS owen_games();

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    set_fps(18,18);
    screen=0;
    new_screen=0;
    start_scroll(0,main_file,2,0,2,15);
    write(main_font,391,334,4,"OWEN GAMES (c) 2002");
    mouse.file=main_file;
    mouse.graph=5;
    sound(s_1,256,256);
    write(small_font,391,95,1,"Y o u   H a v e   B e e n   O n   O w e n   G a m e s            T i m e s");
    write_int(small_font,465,95,0,& times_on_game);
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(key(_esc) OR mouse.left OR key(_space) OR key(_enter)) new_screen=2; END
        FRAME;
    END
    stop_sound(all_sound);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS games();

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    screen=0;
    new_screen=0;
    write(main_font,391,214,4,"WORM BETTING");
    write(main_font,391,244,4,"TANK BLAST");
    write(main_font,391,274,4,"SPACE BLAST");
    write(main_font,391,304,4,"ASTEROIDS");
    write(main_font,391,334,4,"ZNAKE");
    write(main_font,391,364,4,"PONG");
    write(main_font,391,394,4,"CONTROLS");
    write(main_font,391,424,4,"EXIT");
    IF(recent_cheat==0) write(small_font,391,95,1,start_text[rand(0,5)]); END
    IF(recent_cheat>0) write(small_font,391,95,1,start_text[recent_cheat+5]); END
    IF(times_on_game==1)
        new_game(15,200,214);
        new_game(15,200,244);
        new_game(15,200,274);
        new_game(15,200,304);
        new_game(15,200,334);
        new_game(15,200,364);

        new_game(15,600,214);
        new_game(15,600,244);
        new_game(15,600,274);
        new_game(15,600,304);
        new_game(15,600,334);
        new_game(15,600,364);
    END
    IF(times_on_game==2)
        new_game(19,200,214);
        new_game(17,200,244);
        new_game(17,200,274);
        new_game(16,200,304);
        new_game(16,200,334);
        new_game(17,200,364);

        new_game(19,600,214);
        new_game(17,600,244);
        new_game(17,600,274);
        new_game(16,600,304);
        new_game(17,600,334);
        new_game(18,600,364);
    END
    sound(s_2,256,256);
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(mouse.left AND mouse.y>204 AND mouse.y<234) new_screen=40; END
        IF(mouse.left AND mouse.y>234 AND mouse.y<254) new_screen=80; END
        IF(mouse.left AND mouse.y>264 AND mouse.y<284) new_screen=70; END
        IF(mouse.left AND mouse.y>294 AND mouse.y<314) new_screen=20; END
        IF(mouse.left AND mouse.y>324 AND mouse.y<344) new_screen=30; END
        IF(mouse.left AND mouse.y>354 AND mouse.y<374) new_screen=10; END
        IF(mouse.left AND mouse.y>384 AND mouse.y<404) new_screen=3; END
        IF(mouse.left AND mouse.y>414 AND mouse.y<434) new_screen=199; END
        IF(key(_esc)) new_screen=199; END
        FRAME;
    END
    signal(TYPE new_game,s_kill);
    stop_sound(all_sound);
    signal(TYPE box,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS controls();

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    start_scroll(0,main_file,2,0,2,15);
    screen=0;
    new_screen=0;
    sound(s_1,256,256);
    file=help_file;
    graph=6;
    x=400;
    y=334;
    write(main_font,400,92,1,"CLICK TO SEE NEXT PAGE");
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(mouse.right AND graph==6) worm_betting_cheats=TRUE; recent_cheat=1; new_screen=1; END
        IF(mouse.right AND graph==5) tank_blast_cheats=TRUE; recent_cheat=2; new_screen=1; END
        IF(mouse.right AND graph==4) space_blast_cheats=TRUE; recent_cheat=3; new_screen=1; END
        IF(mouse.right AND graph==3) asteroids_cheats=TRUE; recent_cheat=4; new_screen=1; END
        IF(mouse.right AND graph==2) znake_cheats=TRUE; recent_cheat=5; new_screen=1; END
        IF(mouse.right AND graph==1) pong_cheats=TRUE; recent_cheat=6; new_screen=1; END
        IF(mouse.left)
            WHILE(mouse.left==1);
            scroll[0].y0-=2;
            FRAME;
            END
            graph-=1;
        END
        IF(graph<1) graph=6; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE box,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------


PROCESS credits();

PRIVATE;
    scroll_text;
    credits_text1;
    credits_text2;
    credits_text3;
    credits_text4;
    credits_text5;
    credits_text6;
    credits_text7;
    credits_text8;
    credits_text9;
    credits_text10;
    credits_text11;
    credits_text12;
    credits_text13;
    credits_text14;
    credits_text15;
    credits_text16;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
   scroll_text=500;
    screen=0;
    new_screen=0;
    sound(s_1,256,256);

    credits_text1=write(main_font,391,80+scroll_text,4,"CREATED BY OWEN DAVIES");
    credits_text2=write(main_font,391,140+scroll_text,4,"DESIGNERS");
    credits_text3=write(main_font,391,145+scroll_text,4,"_____________");
    credits_text4=write(main_font,391,180+scroll_text,4,"OWEN DAVIES");
    credits_text5=write(main_font,391,200+scroll_text,4,"PAUL BYRNE");
    credits_text6=write(main_font,391,220+scroll_text,4,"PATRICK DAVIES");
    credits_text7=write(main_font,391,280+scroll_text,4,"CODE WRITER");
    credits_text8=write(main_font,391,285+scroll_text,4,"_______________");
    credits_text9=write(main_font,391,320+scroll_text,4,"OWEN DAVIES");
    credits_text10=write(main_font,391,380+scroll_text,4,"GRAPHIC DESIGNERS");
    credits_text11=write(main_font,391,385+scroll_text,4,"_____________________");
    credits_text12=write(main_font,391,420+scroll_text,4,"OWEN DAVIES");
    credits_text13=write(main_font,391,440+scroll_text,4,"PATRICK DAVIES");
    credits_text14=write(main_font,391,500+scroll_text,4,"HAMMER TECHNOLOGIES (c) 1998");
    credits_text15=write(main_font,391,520+scroll_text,4,"DIV GAMES STUDIO (c) 1998");
    credits_text16=write(main_font,391,540+scroll_text,4,"OWEN GAMES (c) 2002");

    start_scroll(0,main_file,2,0,2,15);
    mouse.file=main_file;
    mouse.graph=5;
        WHILE (new_screen==0);
        IF(scroll_text>-500) scroll_text-=2; END
        move_text(credits_text1,391,80+scroll_text);
        move_text(credits_text2,391,140+scroll_text);
        move_text(credits_text3,391,145+scroll_text);
        move_text(credits_text4,391,180+scroll_text);
        move_text(credits_text5,391,200+scroll_text);
        move_text(credits_text6,391,220+scroll_text);
        move_text(credits_text7,391,280+scroll_text);
        move_text(credits_text8,391,285+scroll_text);
        move_text(credits_text9,391,320+scroll_text);
        move_text(credits_text10,391,380+scroll_text);
        move_text(credits_text11,391,385+scroll_text);
        move_text(credits_text12,391,420+scroll_text);
        move_text(credits_text13,391,440+scroll_text);
        move_text(credits_text14,391,500+scroll_text);
        move_text(credits_text15,391,520+scroll_text);
        move_text(credits_text16,391,540+scroll_text);
        scroll[0].y0-=2;
        IF(mouse.left OR key(_space) OR key(_enter)) new_screen=200; END
        IF(key(_esc)) new_screen=200; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE internet_background_bar,s_kill);
    signal(TYPE internet_background,s_kill);
    clear_screen();
    signal(TYPE box,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS box(file,graph,x,y,z,region,flashing);

PRIVATE;
    flash_time;
    flash_on;

BEGIN
    flash_time=0;
    flash_on=FALSE;
    LOOP
    IF(flashing==TRUE) flash_time+=1; END
    IF(flash_on==FALSE AND flash_time=>6) graph+=1; flash_on=TRUE; flash_time=0; END
    IF(flash_on==TRUE AND flash_time=>6) graph-=1; flash_on=FALSE; flash_time=0; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------
// @
//-----------------------------------------------------------------------------

PROCESS pong_start();

PRIVATE
    points_text;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    sound(s_1,256,256);
    player_cheat=0;
    pong_ball2=FALSE;
    pong_players=0;
    pong_set_points_game=0;
    pong_player1_score=0;
    pong_player2_score=0;
    pong_player3_score=0;
    pong_player4_score=0;
    screen=0;
    new_screen=0;
    start_scroll(0,main_file,2,0,2,15);
    start_scroll(1,main_file,10,0,1,15);
    scroll[0].z=512;
    scroll[1].z=511;
    mouse.file=main_file;
    mouse.graph=5;
    write(main_font,391,284,4,"2 PLAYERS");
    write(main_font,391,304,4,"4 PLAYERS");
    internet_background_bar(172,335);
    internet_background_bar(608,335);
    write(main_font,391,364,4,"PLAY FOR");
    points_text=write(main_font,391,384,4,pong_set_points[pong_set_points_game]);
    box(main_file,13,391,294,-100,1,FALSE);
    box(main_file,13,391,374,-100,1,FALSE);
        WHILE (new_screen==0);
        IF(key(_control) AND key(_1) AND pong_cheats==TRUE) player_cheat=1; END
        IF(key(_control) AND key(_2) AND pong_cheats==TRUE) player_cheat=2; END
        IF(key(_control) AND key(_3) AND pong_cheats==TRUE) player_cheat=3; END
        IF(key(_control) AND key(_4) AND pong_cheats==TRUE) player_cheat=4; END
        scroll[0].y0-=2;
        scroll[1].x0+=2;
        IF(mouse.left AND mouse.y>274 AND mouse.y<294) new_screen=11; END
        IF(mouse.left AND mouse.y>294 AND mouse.y<314) new_screen=12; END
        IF(mouse.left AND mouse.y>344 AND mouse.y<404)
            WHILE(mouse.left==1);
                FRAME;
            END
            pong_set_points_game+=1;
            IF(pong_set_points_game>5) pong_set_points_game=0; END
            delete_text(points_text);
            points_text=write(main_font,391,384,4,pong_set_points[pong_set_points_game]);
        END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE box,s_kill);
    stop_scroll(0);
    stop_scroll(1);
    signal(TYPE internet_background_bar,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS pong_2players();

BEGIN
    screen=0;
    new_screen=0;
    pong_players=2;
    start_scroll(0,main_file,2,0,2,15);
    start_scroll(1,main_file,10,0,1,15);
    mouse.graph=0;
    internet_background_bar(172,335);
    internet_background_bar(608,335);
    pong_ball_2players(390,334,0,0);
    number_of_balls=1;
    raquet1=pong_raquet_2players(185,334,_q,_a);
    raquet2=pong_raquet_2players(595,334,_up,_down);
    write(main_font,87,180,4,"PLAYER 2");
    write_int(main_font,87,210,4,& pong_player2_score);
    write(main_font,700,180,4,"PLAYER 1");
    write_int(main_font,700,210,4,& pong_player1_score);
    sound(s_3,256,256);
    sound(s_4,256,256);
    random();
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        scroll[1].x0+=2;
        IF(key(_esc)) new_screen=1; END
        IF(pong_set_points_game==1 AND (pong_player1_score=>10 OR pong_player2_score=>10)) new_screen=13; END
        IF(pong_set_points_game==2 AND (pong_player1_score=>20 OR pong_player2_score=>20)) new_screen=13; END
        IF(pong_set_points_game==3 AND (pong_player1_score=>30 OR pong_player2_score=>30)) new_screen=13; END
        IF(pong_set_points_game==4 AND (pong_player1_score=>40 OR pong_player2_score=>40)) new_screen=13; END
        IF(pong_set_points_game==5 AND (pong_player1_score=>50 OR pong_player2_score=>50)) new_screen=13; END
        FRAME;
    END
    stop_sound(all_sound);
    stop_scroll(0);
    stop_scroll(1);
    signal(TYPE random,s_kill);
    signal(TYPE internet_background_bar,s_kill);
    signal(TYPE pong_ball_2players,s_kill);
    signal(TYPE pong_ball2_2players,s_kill);
    signal(TYPE pong_asteroid,s_kill);
    signal(TYPE pong_raquet_2players,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS pong_4players();

BEGIN
    screen=0;
    new_screen=0;
    pong_players=4;
    start_scroll(0,main_file,2,0,2,15);
    start_scroll(1,main_file,10,0,1,15);
    mouse.graph=0;
    sound(s_3,256,256);
    sound(s_4,256,256);
    random();
    internet_background_bar(172,335);
    internet_background_bar(608,335);
    number_of_balls=1;
    raquet1=pong_raquet_2players(185,334,_q,_a);
    raquet2=pong_raquet_2players(595,334,_up,_down);
    raquet3=pong_raquet_4players(390,130,_o,_p);
    raquet4=pong_raquet_4players(390,540,_home,_pgup);
    pong_ball_2players(390,334,0,0);
    write(main_font,87,180,4,"PLAYER 2");
    write_int(main_font,87,210,4,& pong_player2_score);
    write(main_font,700,180,4,"PLAYER 1");
    write_int(main_font,700,210,4,& pong_player1_score);
    write(main_font,87,410,4,"PLAYER 3");
    write_int(main_font,87,440,4,& pong_player3_score);
    write(main_font,700,410,4,"PLAYER 4");
    write_int(main_font,700,440,4,& pong_player4_score);
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        scroll[1].x0+=2;
        IF(key(_esc)) new_screen=1; END

        IF(pong_set_points_game==1 AND (
            (pong_player1_score=>10 AND(pong_player1_score>pong_player2_score AND pong_player1_score>pong_player3_score AND pong_player1_score>pong_player4_score)) OR
            (pong_player2_score=>10 AND(pong_player2_score>pong_player1_score AND pong_player2_score>pong_player3_score AND pong_player2_score>pong_player4_score)) OR
            (pong_player3_score=>10 AND(pong_player3_score>pong_player1_score AND pong_player3_score>pong_player2_score AND pong_player3_score>pong_player4_score)) OR
            (pong_player4_score=>10 AND(pong_player4_score>pong_player1_score AND pong_player4_score>pong_player2_score AND pong_player4_score>pong_player3_score))))
            new_screen=13; END

        IF(pong_set_points_game==2 AND (
            (pong_player1_score=>20 AND(pong_player1_score>pong_player2_score AND pong_player1_score>pong_player3_score AND pong_player1_score>pong_player4_score)) OR
            (pong_player2_score=>20 AND(pong_player2_score>pong_player1_score AND pong_player2_score>pong_player3_score AND pong_player2_score>pong_player4_score)) OR
            (pong_player3_score=>20 AND(pong_player3_score>pong_player1_score AND pong_player3_score>pong_player2_score AND pong_player3_score>pong_player4_score)) OR
            (pong_player4_score=>20 AND(pong_player4_score>pong_player1_score AND pong_player4_score>pong_player2_score AND pong_player4_score>pong_player3_score))))
            new_screen=13; END

        IF(pong_set_points_game==3 AND (
            (pong_player1_score=>30 AND(pong_player1_score>pong_player2_score AND pong_player1_score>pong_player3_score AND pong_player1_score>pong_player4_score)) OR
            (pong_player2_score=>30 AND(pong_player2_score>pong_player1_score AND pong_player2_score>pong_player3_score AND pong_player2_score>pong_player4_score)) OR
            (pong_player3_score=>30 AND(pong_player3_score>pong_player1_score AND pong_player3_score>pong_player2_score AND pong_player3_score>pong_player4_score)) OR
            (pong_player4_score=>30 AND(pong_player4_score>pong_player1_score AND pong_player4_score>pong_player2_score AND pong_player4_score>pong_player3_score))))
            new_screen=13; END

        IF(pong_set_points_game==4 AND (
            (pong_player1_score=>40 AND(pong_player1_score>pong_player2_score AND pong_player1_score>pong_player3_score AND pong_player1_score>pong_player4_score)) OR
            (pong_player2_score=>40 AND(pong_player2_score>pong_player1_score AND pong_player2_score>pong_player3_score AND pong_player2_score>pong_player4_score)) OR
            (pong_player3_score=>40 AND(pong_player3_score>pong_player1_score AND pong_player3_score>pong_player2_score AND pong_player3_score>pong_player4_score)) OR
            (pong_player4_score=>40 AND(pong_player4_score>pong_player1_score AND pong_player4_score>pong_player2_score AND pong_player4_score>pong_player3_score))))
            new_screen=13; END

        IF(pong_set_points_game==5 AND (
            (pong_player1_score=>50 AND(pong_player1_score>pong_player2_score AND pong_player1_score>pong_player3_score AND pong_player1_score>pong_player4_score)) OR
            (pong_player2_score=>50 AND(pong_player2_score>pong_player1_score AND pong_player2_score>pong_player3_score AND pong_player2_score>pong_player4_score)) OR
            (pong_player3_score=>50 AND(pong_player3_score>pong_player1_score AND pong_player3_score>pong_player2_score AND pong_player3_score>pong_player4_score)) OR
            (pong_player4_score=>50 AND(pong_player4_score>pong_player1_score AND pong_player4_score>pong_player2_score AND pong_player4_score>pong_player3_score))))
            new_screen=13; END

        FRAME;
    END
    stop_sound(all_sound);
    stop_scroll(0);
    stop_scroll(1);
    signal(TYPE random,s_kill);
    signal(TYPE internet_background_bar,s_kill);
    signal(TYPE pong_ball_2players,s_kill);
    signal(TYPE pong_ball2_2players,s_kill);
    signal(TYPE pong_asteroid,s_kill);
    signal(TYPE pong_raquet_2players,s_kill);
    signal(TYPE pong_raquet_4players,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS pong_winner();

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    screen=0;
    new_screen=0;
    start_scroll(0,main_file,2,0,2,15);
    start_scroll(1,main_file,10,0,1,15);
    scroll[0].z=512;
    scroll[1].z=511;
    mouse.file=main_file;
    mouse.graph=5;
    sound(s_2,256,256);
    IF(pong_players==2)
        IF(pong_player1_score>pong_player2_score) write(main_font,391,334,4,"PLAYER 1 WINS"); END
        IF(pong_player2_score>pong_player1_score) write(main_font,391,334,4,"PLAYER 2 WINS"); END
    END
    IF(pong_players==4)
        IF((pong_player1_score>pong_player2_score) AND (pong_player1_score>pong_player3_score) AND (pong_player1_score>pong_player4_score)) write(main_font,391,334,4,"PLAYER 1 WINS"); END
        IF((pong_player2_score>pong_player1_score) AND (pong_player2_score>pong_player3_score) AND (pong_player2_score>pong_player4_score)) write(main_font,391,334,4,"PLAYER 2 WINS"); END
        IF((pong_player3_score>pong_player1_score) AND (pong_player3_score>pong_player1_score) AND (pong_player3_score>pong_player4_score)) write(main_font,391,334,4,"PLAYER 3 WINS"); END
        IF((pong_player4_score>pong_player1_score) AND (pong_player4_score>pong_player1_score) AND (pong_player4_score>pong_player3_score)) write(main_font,391,334,4,"PLAYER 4 WINS"); END
    END
    internet_background_bar(172,335);
    internet_background_bar(608,335);
    box(main_file,13,391,334,-100,1,TRUE);
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        scroll[1].x0+=2;
        IF(mouse.left) new_screen=1; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE box,s_kill);
    stop_scroll(0);
    stop_scroll(1);
    signal(TYPE internet_background_bar,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS pong_ball_2players(x,y,ix,iy);

PRIVATE;
    ixrandom;
    iyrandom;
    random_corner;
    missed_ball;

BEGIN
    file=pong_file;
    graph=20;
    region=1;
    ixrandom=rand(1,2);
    iyrandom=rand(1,2);
    random_corner=rand(1,4);
    IF(random_corner==1) x+=rand(10,80); END
    IF(random_corner==2) x-=rand(10,80); END
    IF(random_corner==3) y+=rand(10,80); END
    IF(random_corner==4) y-=rand(10,80); END
    IF(ixrandom==1) ix=1;
        ELSE
        ix=-1;
    END
    IF(iyrandom==1) iy=1;
        ELSE
        iy=-1;
    END
    REPEAT
        FRAME(20);
            IF(rand(0,600)==0)
                flags=4; END
            IF(rand(0,200)==0)
                flags=0; END
        IF(collision(TYPE pong_asteroid))
            ix=-ix; sound(s_5,256,256); END
        IF (pong_players==2 AND (y<125 or y>545))
            iy=-iy;  sound(s_5,256,256);
        END
        IF(pong_players==2)
            IF ((x==192 and abs(y-raquet1.y)<44) or
               (x==587 and abs(y-raquet2.y)<44))
                ix=-ix; sound(s_5,256,256);
            END
        END
        IF(pong_players==4)
            IF ((x==192 and abs(y-raquet1.y)<44) or
               (x==587 and abs(y-raquet2.y)<44))
                ix=-ix;  sound(s_5,256,256);
            END
            IF ((y==137 and abs(x-raquet3.x)<44) or
               (y==533 and abs(x-raquet4.x)<44))
                iy=-iy; sound(s_5,256,256);
            END
        END
        IF(pong_players==2)
            IF(x<175) missed_ball=TRUE; pong_player1_score+=1; END
            IF(x>605) missed_ball=TRUE; pong_player2_score+=1; END
        END
        IF(pong_players==4)
            IF(x<175) missed_ball=TRUE; pong_player1_score+=1; pong_player3_score+=1; pong_player4_score+=1; END
            IF(x>605) missed_ball=TRUE; pong_player2_score+=1; pong_player3_score+=1; pong_player4_score+=1; END
            IF(y<120) missed_ball=TRUE; pong_player1_score+=1; pong_player2_score+=1; pong_player4_score+=1; END
            IF(y>550) missed_ball=TRUE; pong_player1_score+=1; pong_player2_score+=1; pong_player3_score+=1; END
        END
        x=x+ix;
        y=y+iy;
        IF(rand(0,200)==0)
            size=100;
        END
        IF(rand(0,800)==0)
            size=50;
        END
    UNTIL (out_region(id,1) OR missed_ball==TRUE)
    number_of_balls-=1;
    IF(number_of_balls<1)
        pong_ball_2players(390,334,0,0);
        number_of_balls+=1;
        END
END

//-----------------------------------------------------------------------------

PROCESS pong_ball2_2players(x,y,ix,iy);

PRIVATE;
    ixrandom;
    iyrandom;
    random_corner;
    missed_ball;

BEGIN
    file=pong_file;
    graph=19;
    region=1;
    ixrandom=rand(1,2);
    iyrandom=rand(1,2);
    random_corner=rand(1,4);
    IF(random_corner==1) x+=rand(10,80); END
    IF(random_corner==2) x-=rand(10,80); END
    IF(random_corner==3) y+=rand(10,80); END
    IF(random_corner==4) y-=rand(10,80); END
    IF(ixrandom==1) ix=1;
        ELSE
        ix=-1;
    END
    IF(iyrandom==1) iy=1;
        ELSE
        iy=-1;
    END
    REPEAT
        FRAME(20);
            IF(rand(0,600)==0)
                flags=4; END
            IF(rand(0,200)==0)
                flags=0; END
        IF(collision(TYPE pong_asteroid))
            ix=-ix;  sound(s_5,256,256);END
        IF (pong_players==2 AND (y<125 or y>545))
            iy=-iy; sound(s_5,256,256);
        END
        IF(pong_players==2)
            IF ((x==192 and abs(y-raquet1.y)<44) or
               (x==587 and abs(y-raquet2.y)<44))
                ix=-ix; sound(s_5,256,256);
            END
        END
        IF(pong_players==4)
            IF ((x==192 and abs(y-raquet1.y)<44) or
               (x==587 and abs(y-raquet2.y)<44))
                ix=-ix; sound(s_5,256,256);
            END
            IF ((y==137 and abs(x-raquet3.x)<44) or
               (y==533 and abs(x-raquet4.x)<44))
                iy=-iy;  sound(s_5,256,256);
            END
        END
        IF(pong_players==2)
            IF(x<175) missed_ball=TRUE; pong_player1_score+=2; END
            IF(x>605) missed_ball=TRUE; pong_player2_score+=2; END
        END
        IF(pong_players==4)
            IF(x<175) missed_ball=TRUE; pong_player1_score+=2; pong_player3_score+=2; pong_player4_score+=2; END
            IF(x>605) missed_ball=TRUE; pong_player2_score+=2; pong_player3_score+=2; pong_player4_score+=2; END
            IF(y<120) missed_ball=TRUE; pong_player1_score+=2; pong_player2_score+=2; pong_player4_score+=2; END
            IF(y>550) missed_ball=TRUE; pong_player1_score+=2; pong_player2_score+=2; pong_player3_score+=2; END
        END
        x=x+ix;
        y=y+iy;
    UNTIL (out_region(id,1) OR missed_ball==TRUE)
    pong_ball2=FALSE;
END

//-----------------------------------------------------------------------------

PROCESS pong_asteroid();

PRIVATE;
    random1;
    random2;

BEGIN
    random1=0;
    random2=0;
    file=asteroids_file;
    graph=21;

    IF(pong_players==2)
        x=rand(280,500);
        random1=rand(1,2);
        IF(random1==1) y=20; END
        IF(random1==2) y=650; END
    END

    IF(pong_players==4)
        random2=rand(1,2);
        IF(random2==1)
            x=rand(280,500);
            random1=rand(1,2);
            IF(random1==1) y=20; END
            IF(random1==2) y=650; END
        END
        IF(random2==2)
            y=rand(270,410);
            random1=rand(1,2);
            IF(random1==1) x=75; END
            IF(random1==2) x=705; END
        END
    END

    z=10;
    region=1;
        WHILE(y<590)
        IF(pong_players==2)
            IF(random1==1) y+=rand(2,5); END
            IF(random1==2) y-=rand(2,5); END
            x+=(rand(0,10));
            x-=(rand(0,10));
        END
        IF(pong_players==4)
            IF(random2==1)
                IF(random1==1) y+=rand(2,5); END
                IF(random1==2) y-=rand(2,5); END
                x+=(rand(0,10));
                x-=(rand(0,10));
            END
            IF(random2==2)
                IF(random1==1) x+=rand(2,5); END
                IF(random1==2) x-=rand(2,5); END
                y+=(rand(0,10));
                y-=(rand(0,10));
             END
        END
        graph+=1;
        IF(graph>39) graph=21; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS random();

BEGIN;
    LOOP;
            IF(number_of_balls<6 AND rand(0,300)==0)
                pong_ball_2players(390,334,0,0);
                number_of_balls+=1;
            END
            IF(pong_ball2==FALSE AND rand(0,200)==0)
                    pong_ball2_2players(390,334,0,0);
                    pong_ball2=TRUE;
            END
            IF(rand(0,100)==0)
                pong_asteroid();
            END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS pong_raquet_2players(x,y,up,down)

PRIVATE
    reverse;
    spin;
BEGIN
    file=pong_file;
    graph=11;
    reverse=FALSE;
    spin=FALSE;
    pong_ball2=FALSE;
    region=1;
    LOOP
        FRAME;
            IF(player_cheat==1 AND up==_up)
                graph=12;
            END
            IF(player_cheat==2 AND up==_q)
                graph=12;
            END
            IF(player_cheat==1 AND up==_q)
                flags=4;
                graph=10;
                reverse=TRUE;
                spin=TRUE;
            END
            IF(player_cheat==2 AND up==_up)
                flags=4;
                graph=10;
                reverse=TRUE;
                spin=TRUE;
            END
            IF(player_cheat==3 OR player_cheat==4)
                flags=4;
                graph=10;
                reverse=TRUE;
                spin=TRUE;
            END
            IF(player_cheat==0)
            IF(rand(0,400)==0)
                flags=4; END
            IF(rand(0,200)==0)
                flags=0; END
            IF(rand(0,200)==0)
                graph=10; END
            IF(rand(0,400)==0)
                graph=12; END
            IF(rand(0,200)==0)
                graph=11; END
            IF(rand(0,600)==0)
                reverse=TRUE; END
            IF(rand(0,200)==0)
                reverse=FALSE; END
            IF(rand(0,500)==0)
                spin=TRUE; END
            IF(rand(0,200)==0)
                spin=FALSE; angle=0; END
            END
            IF(spin==TRUE) angle+=40000; END
            IF(reverse==FALSE)
                IF (key(up) and y>120)
                    y=y-12;
                END
                IF (key(down) and y<549)
                    y=y+12;
                END
            END
            IF(reverse==TRUE)
                IF (key(up) and y<549)
                    y=y+12;
                END
                IF (key(down) and y>120)
                    y=y-12;
                END
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS pong_raquet_4players(x,y,left,right)

PRIVATE
    reverse;
    spin;
BEGIN
    file=pong_file;
    graph=11;
    reverse=FALSE;
    spin=FALSE;
    pong_ball2=FALSE;
    region=1;
    angle=90000;
    LOOP
        FRAME;
            IF(player_cheat==3 AND left==_o)
                graph=12;
            END
            IF(player_cheat==4 AND left==_home)
                graph=12;
            END
            IF(player_cheat==3 AND left==_home)
                flags=4;
                graph=10;
                reverse=TRUE;
                spin=TRUE;
            END
            IF(player_cheat==4 AND left==_o)
                flags=4;
                graph=10;
                reverse=TRUE;
                spin=TRUE;
            END
            IF(player_cheat==1 OR player_cheat==2)
                flags=4;
                graph=10;
                reverse=TRUE;
                spin=TRUE;
            END
            IF(player_cheat==0)
            IF(rand(0,400)==0)
                flags=4; END
            IF(rand(0,200)==0)
                flags=0; END
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
            IF(rand(0,500)==0)
                spin=TRUE; END
            IF(rand(0,200)==0)
                spin=FALSE; angle=90000; END
            END
            IF(spin==TRUE) angle+=40000; END
            IF(reverse==FALSE)
                IF (key(left) and x>175)
                    x=x-12;
                END
                IF (key(right) and x<600)
                    x=x+12;
                END
            END
            IF(reverse==TRUE)
                IF (key(left) and x<600)
                    x=x+12;
                END
                IF (key(right) and x>175)
                    x=x-12;
                END
        END
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS asteroids();

PRIVATE
    ast_levle_text1;
    ast_levle_text2;

BEGIN
    ast_levle=1;
    ast_destroyed=0;
    screen=0;
    new_screen=0;
    mouse.graph=0;

    sound(s_3,256,256);
    sound(s_4,256,256);


    start_scroll(0,main_file,10,0,2,15);
    ast_ship(391,334,41);

    load("dat\sg\1.dat",&ast_high_score);
    write(main_font,150,92,2,"SCORE = ");
    write_int(main_font,170,92,0,OFFSET ast_score);
    ast_levle_text1=write(main_font,400,92,2,"LEVLE = ");
    ast_levle_text2=write_int(main_font,420,92,0,& ast_levle);
    write(main_font,650,92,2,"TOP SCORE = ");
    write_int(main_font,670,92,0,OFFSET ast_high_score);
    sheilds=FALSE;
    ast_asteroid1();
            WHILE (new_screen==0);
            IF(key(_control) AND key(_tab) AND asteroids_cheats==TRUE) ast_cheats=TRUE; END
            IF(ast_levle==10)
                delete_text(ast_levle_text1);
                delete_text(ast_levle_text2);
                write(main_font,380,92,1,"WELL DONE TOP LEVLE !");
            END
            scroll[0].y0-=2;
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
    stop_sound(all_sound);
    ast_score=0;
    signal(TYPE ast_ship,s_kill);
    signal(TYPE ast_shot,s_kill);
    signal(TYPE ast_asteroid1,s_kill);
    signal(TYPE ast_asteroid2,s_kill);
    signal(TYPE sheild_bar,s_kill);
    signal(TYPE ast_new_coordinates,s_kill);
    signal(TYPE sheild_token,s_kill);
    signal(TYPE player_sheilds,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    screen=new_screen;

END

//-----------------------------------------------------------------------------

PROCESS ast_ship(x,y,graph)

PRIVATE
    fire_shot;
    sheild;
    sheild_sound;

BEGIN
    file=asteroids_file;
    sheild=FALSE;
    region=2;
    player_sheilds();
    LOOP
        fire_shot+=1;
        IF (key(_left)) angle=angle+10000; END
        IF (key(_right)) angle=angle-10000; END
        IF (key(_up)) advance(8); END
        IF (key(_down)) advance(-5); END
        IF (fire_shot>7 AND (key(_control) OR key(_space))) sound(s_6,256,256); ast_shot(x,y,angle); fire_shot=0; END
        ast_new_coordinates();
        IF(sheilds==FALSE AND collision(TYPE ast_asteroid1)) BREAK; END
        IF(sheilds==FALSE AND collision(TYPE ast_asteroid2)) BREAK; END
        IF(collision(TYPE sheild_token)) sheild_sound=sound(s_1,256,256); sheilds=TRUE; END
        IF(sheilds==FALSE) stop_sound(sheild_sound); END
        FRAME;
    END
    sound(s_explosion,256,256);
    FROM graph=100 TO 114; FRAME; END
    ast_ship(391,334,41);
    IF(ast_score>ast_high_score) ast_high_score=ast_score;
    save("dat\sg\1.dat",&ast_high_score,1); END
    signal(TYPE ast_asteroid1,s_kill);
    signal(TYPE ast_asteroid2,s_kill);
    size=50;
    ast_levle=1;
    ast_destroyed=0;
    ast_asteroid1();
    ast_score=0;
END

//-----------------------------------------------------------------------------

PROCESS ast_shot(x,y,angle)

BEGIN
    region=2;
    file=asteroids_file;
    advance(24); graph=42;
        LOOP
        IF(out_region(id,0)==TRUE or collision(TYPE ast_asteroid1) OR collision(TYPE ast_asteroid2)); BREAK; END
        advance(16);
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS ast_asteroid1()
PRIVATE
    number_of_mini;
    flight_angle;

BEGIN
    region=2;
    file=asteroids_file;
    graph=1;
    x=0; y=0;
    IF(ast_levle==1) angle=-45000; END
    IF(ast_levle>1) flight_angle=rand(1,4);
        IF(flight_angle==1) angle=rand(10000,80000); END
        IF(flight_angle==2) angle=rand(100000,170000); END
        IF(flight_angle==3) angle=rand(190000,260000); END
        IF(flight_angle==4) angle=rand(280000,350000); END
    END
        LOOP
            graph=graph+1;
            IF (graph==+20) graph=1; END
            advance(4);
            IF (collision (TYPE ast_shot)) BREAK; END
            ast_new_coordinates();
            FRAME;
        END
        sound(s_explosion,256,256);
        IF(rand(1,6)==1) sheild_token(x,y); END
        ast_score=ast_score+10;
        size=80;
        number_of_mini=rand(1,8);
        ast_destroyed+=1;

        IF(ast_destroyed==1) ast_levle=2; ast_asteroid1(); END
        IF(ast_destroyed==3) ast_levle=3; ast_asteroid1();  END
        IF(ast_destroyed==6) ast_levle=4; ast_asteroid1();  END
        IF(ast_destroyed==10) ast_levle=5; ast_asteroid1();  END
        IF(ast_destroyed==15) ast_levle=6; ast_asteroid1();  END
        IF(ast_destroyed==21) ast_levle=7; ast_asteroid1();  END
        IF(ast_destroyed==28) ast_levle=8; ast_asteroid1();  END
        IF(ast_destroyed==36) ast_levle=9; ast_asteroid1();  END
        IF(ast_destroyed==45) ast_levle=10; ast_asteroid1();  END

        ast_asteroid1();

        IF(number_of_mini==1);
        END
        IF(number_of_mini==2);
            ast_asteroid2(x,y,rand(0,360000));
        END
        IF(number_of_mini=>3 AND number_of_mini<=7);
            ast_asteroid2(x,y,rand(0,360000));
            ast_asteroid2(x,y,rand(0,360000));
        END
        IF(number_of_mini==8);
            ast_asteroid2(x,y,rand(0,360000));
            ast_asteroid2(x,y,rand(0,360000));
            ast_asteroid2(x,y,rand(0,360000));
        END
        z=-10;
        FROM graph=100 TO 114;
            FRAME;
        END
END

//-----------------------------------------------------------------------------

PROCESS ast_asteroid2(x,y,angle)
BEGIN
    region=2;
    file=asteroids_file;
    graph=1;
    size=60;
        LOOP
            graph=graph+1;
            IF (graph==20) graph=1; END
            advance(4);
            IF (collision (TYPE ast_shot)) BREAK; END
            ast_new_coordinates();
            FRAME;
        END
        sound(s_explosion,256,256);
        ast_score=ast_score+5;
        size=50;
        z=-10;
        FROM graph=100 TO 114; FRAME;
        END
END

//-----------------------------------------------------------------------------

PROCESS sheild_token(x,y)
BEGIN
    region=2;
    file=asteroids_file;
    graph=89;
    flags=4;
    angle=rand(0,360000);
    WHILE (sheilds==FALSE);
    advance(2);
            ast_new_coordinates();
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS ast_new_coordinates()
BEGIN
    IF (father.x<-18) father.x=800; END
    IF (father.x>800) father.x=-18; END
    IF (father.y<100) father.y=600; END
    IF (father.y>600) father.y=100; END
END

//-----------------------------------------------------------------------------

PROCESS player_sheilds();

BEGIN
    sheild_time=0;
    file=asteroids_file;
    graph=0;
    x=father.x;
    y=father.y;
    flags=4;
    z=-10;
    define_region(6,1,555,sheild_time*3,16);
    sheild_bar();
    LOOP
    x=father.x;
    y=father.y;
    define_region(6,1,555,sheild_time*3,16);

    IF(ast_cheats==FALSE);
    IF(sheilds==FALSE) graph=0; sheild_time=0; END
    IF(sheilds==TRUE AND sheild_time<1) sheild_time=192; END
    IF(sheilds==TRUE) graph=90; sheild_time-=1; END
    IF(sheild_time<=1) sheilds=FALSE; sheild_time=0; END
    END
    IF(ast_cheats==TRUE);
    sheilds=TRUE;
    graph=90;
    sheild_time=192;
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS sheild_bar();

BEGIN
    file=asteroids_file;
    graph=91;
    x=289;
    y=563;
    z=-257;
    region=6;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS znake_start();

PRIVATE
    points_text;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    sound(s_1,256,256);
    set_fps(12,12);
    znake_set_points_game=0;
    screen=0;
    new_screen=0;
    start_scroll(0,main_file,10,0,2,15);
    mouse.file=main_file;
    mouse.graph=5;
    write(main_font,391,284,4,"1 PLAYER");
    write(main_font,391,304,4,"2 PLAYERS");
    write(main_font,391,364,4,"PLAY FOR");
    points_text=write(main_font,391,384,4,znake_set_points[znake_set_points_game]);
    box(main_file,13,391,294,-100,2,FALSE);
    box(main_file,13,391,374,-100,2,FALSE);
    load("dat\sg\2.dat",&znake_topscore);
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(mouse.left AND mouse.y>274 AND mouse.y<294) new_screen=31; END
        IF(mouse.left AND mouse.y>294 AND mouse.y<314) new_screen=32; END
        IF(mouse.left AND mouse.y>344 AND mouse.y<404)
            WHILE(mouse.left==1);
                FRAME;
            END
            znake_set_points_game+=1;
            IF(znake_set_points_game>5) znake_set_points_game=0; END
            delete_text(points_text);
            points_text=write(main_font,391,384,4,znake_set_points[znake_set_points_game]);
        END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE box,s_kill);
    znake_worm1_length=8;
    znake_score1=0;
    stop_scroll(0);
        signal(TYPE small_worm_head1,s_kill);
        signal(TYPE small_worm_segment1,s_kill);
        signal(TYPE small_apple,s_kill);
        signal(TYPE small_special_1,s_kill);
        signal(TYPE small_special_2,s_kill);
        signal(TYPE small_special_3,s_kill);
        signal(TYPE small_explosion,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS znake_winner();

PRIVATE
    name_type;

BEGIN
    name_type=1;
    screen=0;
    new_screen=0;
    start_scroll(0,main_file,10,0,2,15);
    mouse.file=main_file;
    mouse.graph=5;
    sound(s_2,256,256);

    IF (players==1)
        write(main_font,391,324,4,"NEW HIGH SCORE");
        write(main_font,391,344,4,"TYPE IN NAME");
    delete_text(name1);
    delete_text(name2);
    delete_text(name3);
    delete_text(name4);
    delete_text(name5);
    delete_text(name6);
    delete_text(name7);
    delete_text(name8);
    delete_text(name9);
    delete_text(name10);
    delete_text(name11);
    delete_text(name12);
    delete_text(name13);
    delete_text(name14);
    znake_topscore[1]=0;
    znake_topscore[2]=0;
    znake_topscore[3]=0;
    znake_topscore[4]=0;
    znake_topscore[5]=0;
    znake_topscore[6]=0;
    znake_topscore[7]=0;
    znake_topscore[8]=0;
    znake_topscore[9]=0;
    znake_topscore[10]=0;
    znake_topscore[11]=0;
    znake_topscore[12]=0;
    znake_topscore[13]=0;
    znake_topscore[14]=0;
    END

    IF(players==2);
    IF(znake_score1>znake_score2) write(main_font,391,334,4,"PLAYER 1 WINS"); END
    IF(znake_score2>znake_score1) write(main_font,391,334,4,"PLAYER 2 WINS"); END
    END

    box(main_file,13,391,334,-100,2,TRUE);

        WHILE (new_screen==0);

    IF(players==1)
    IF(name_type<15 AND (
        (scan_code>=2 AND scan_code<=13) OR
        (scan_code>=16 AND scan_code<=27) OR
        (scan_code>=30 AND scan_code<=40) OR
        (scan_code>=43 AND scan_code<=53) OR
        (scan_code==57)))
        znake_topscore[name_type]=scan_code;
            IF(name_type==1) delete_text(name1); name1=write(main_font,350,92,0,letters[znake_topscore[1]]); END
            IF(name_type==2) delete_text(name2); name2=write(main_font,370,92,0,letters[znake_topscore[2]]); END
            IF(name_type==3) delete_text(name3); name3=write(main_font,390,92,0,letters[znake_topscore[3]]); END
            IF(name_type==4) delete_text(name4); name4=write(main_font,410,92,0,letters[znake_topscore[4]]); END
            IF(name_type==5) delete_text(name5); name5=write(main_font,430,92,0,letters[znake_topscore[5]]); END
            IF(name_type==6) delete_text(name6); name6=write(main_font,450,92,0,letters[znake_topscore[6]]); END
            IF(name_type==7) delete_text(name7); name7=write(main_font,470,92,0,letters[znake_topscore[7]]); END
            IF(name_type==8) delete_text(name8); name8=write(main_font,490,92,0,letters[znake_topscore[8]]); END
            IF(name_type==9) delete_text(name9); name9=write(main_font,510,92,0,letters[znake_topscore[9]]); END
            IF(name_type==10) delete_text(name10); name10=write(main_font,530,92,0,letters[znake_topscore[10]]); END
            IF(name_type==11) delete_text(name11); name11=write(main_font,550,92,0,letters[znake_topscore[11]]); END
            IF(name_type==12) delete_text(name12); name12=write(main_font,570,92,0,letters[znake_topscore[12]]); END
            IF(name_type==13) delete_text(name13); name13=write(main_font,590,92,0,letters[znake_topscore[13]]); END
            IF(name_type==14) delete_text(name14); name14=write(main_font,610,92,0,letters[znake_topscore[14]]); END
            name_type+=1;
        END
        IF(key(_backspace) AND name_type>1);
            IF(name_type==2) delete_text(name1); znake_topscore[1]=0; END
            IF(name_type==3) delete_text(name2); znake_topscore[2]=0; END
            IF(name_type==4) delete_text(name3); znake_topscore[3]=0; END
            IF(name_type==5) delete_text(name4); znake_topscore[4]=0; END
            IF(name_type==6) delete_text(name5); znake_topscore[5]=0; END
            IF(name_type==7) delete_text(name6); znake_topscore[6]=0; END
            IF(name_type==8) delete_text(name7); znake_topscore[7]=0; END
            IF(name_type==9) delete_text(name8); znake_topscore[8]=0; END
            IF(name_type==10) delete_text(name9); znake_topscore[9]=0; END
            IF(name_type==11) delete_text(name10); znake_topscore[10]=0; END
            IF(name_type==12) delete_text(name11); znake_topscore[11]=0; END
            IF(name_type==13) delete_text(name12); znake_topscore[12]=0; END
            IF(name_type==14) delete_text(name13); znake_topscore[13]=0; END
            IF(name_type==15) delete_text(name14); znake_topscore[14]=0; END
            name_type-=1;
        END
        scroll[0].y0-=2;
        IF(mouse.left AND name_type>1) new_screen=1; END
        IF(key(_esc) AND name_type>1) new_screen=1; END
    END
    IF(players==2)
        scroll[0].y0-=2;
        IF(mouse.left) new_screen=1; END
        IF(key(_esc)) new_screen=1; END
    END
        FRAME;
    END
    IF(players==1); save("dat\sg\2.dat",&znake_topscore,15); END
    stop_sound(all_sound);
    znake_score1=0;
    znake_score2=0;
    signal(TYPE box,s_kill);
    stop_scroll(0);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS znake_1player();

BEGIN
    screen=0;
    new_screen=0;
    znake_apples=0;
    znake_special_1s=0;
    znake_special_2s=0;
    znake_special_3s=0;
    znake_special_4s=0;
    write(main_font,120,92,0,"YOUR SCORE = ");
    write_int(main_font,250,92,0,&znake_score1);
    name1=write(main_font,350,92,0,letters[znake_topscore[1]]);
    name2=write(main_font,370,92,0,letters[znake_topscore[2]]);
    name3=write(main_font,390,92,0,letters[znake_topscore[3]]);
    name4=write(main_font,410,92,0,letters[znake_topscore[4]]);
    name5=write(main_font,430,92,0,letters[znake_topscore[5]]);
    name6=write(main_font,450,92,0,letters[znake_topscore[6]]);
    name7=write(main_font,470,92,0,letters[znake_topscore[7]]);
    name8=write(main_font,490,92,0,letters[znake_topscore[8]]);
    name9=write(main_font,510,92,0,letters[znake_topscore[9]]);
    name10=write(main_font,530,92,0,letters[znake_topscore[10]]);
    name11=write(main_font,550,92,0,letters[znake_topscore[11]]);
    name12=write(main_font,570,92,0,letters[znake_topscore[12]]);
    name13=write(main_font,590,92,0,letters[znake_topscore[13]]);
    name14=write(main_font,610,92,0,letters[znake_topscore[14]]);
    write_int(main_font,640,92,0,&znake_topscore);
    small_worm_head1(16,192,16,0);
    start_scroll(0,main_file,10,0,2,15);
    mouse.graph=0;
    players=1;
    sound(s_3,256,256);
    sound(s_4,256,256);
        WHILE (new_screen==0);
            IF(znake_set_points_game==1 AND znake_score1=>100) new_screen=1; END
            IF(znake_set_points_game==2 AND znake_score1=>200) new_screen=1; END
            IF(znake_set_points_game==3 AND znake_score1=>300) new_screen=1; END
            IF(znake_set_points_game==4 AND znake_score1=>400) new_screen=1; END
            IF(znake_set_points_game==5 AND znake_score1=>500) new_screen=1; END

            scroll[0].y0-=2;
            IF(key(_control) AND key(_1) AND znake_cheats==TRUE);
                small_apple(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,32)==0 and znake_apples<10)
                small_apple(rand(1,48)*16,rand(8,33)*16);
                znake_apples++;
            END
            IF(key(_control) AND key(_2) AND znake_cheats==TRUE);
                small_special_1(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,128)==0 and znake_special_1s<5)
                small_special_1(rand(1,48)*16,rand(8,33)*16);
                znake_special_1s++;
            END
            IF(key(_control) AND key(_3) AND znake_cheats==TRUE);
                small_special_2(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,150)==0 and znake_special_2s<3)
                small_special_2(rand(1,48)*16,rand(8,33)*16);
                znake_special_2s++;
            END
            IF(key(_control) AND key(_4) AND znake_cheats==TRUE);
                small_special_3(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,150)==0 AND znake_special_3s<3)
                small_special_3(rand(1,48)*16,rand(8,33)*16);
                znake_special_3s++;
            END
            IF(key(_control) AND key(_5) AND znake_cheats==TRUE);
                small_special_4(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,200)==0 AND znake_special_4s<3)
                small_special_4(rand(1,48)*16,rand(8,33)*16);
                znake_special_4s++;
            END
            IF(znake_apples==0)
                small_apple(rand(1,48)*16,rand(8,33)*16);
                znake_apples++;
            END
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
    stop_sound(all_sound);
    znake_worm1_length=8;
    stop_scroll(0);
        signal(TYPE small_worm_head1,s_kill);
        signal(TYPE small_worm_segment1,s_kill);
        signal(TYPE small_apple,s_kill);
        signal(TYPE small_special_1,s_kill);
        signal(TYPE small_special_2,s_kill);
        signal(TYPE small_special_3,s_kill);
        signal(TYPE small_special_4,s_kill);
        signal(TYPE small_explosion,s_kill);
    IF (new_screen<>33)
        delete_text(all_text);
    END
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS znake_2player();

BEGIN
    znake_score1=0;
    znake_score2=0;
    screen=0;
    new_screen=0;
    znake_apples=0;
    znake_special_1s=0;
    znake_special_2s=0;
    znake_special_3s=0;
    znake_special_4s=0;
    write(main_font,100,92,0,"PLAYER  1's  SCORE = ");
    write_int(main_font,300,92,0,&znake_score1);
    write(main_font,500,92,0,"PLAYER  2's  SCORE = ");
    write_int(main_font,700,92,0,&znake_score2);
    small_worm_head1(16,192,16,0);
    small_worm_head2(768,192,-16,0);
    start_scroll(0,main_file,10,0,2,15);
    mouse.graph=0;
    players=2;
    sound(s_3,256,256);
    sound(s_4,256,256);
        WHILE (new_screen==0);
            IF(znake_set_points_game==1 AND (znake_score1=>100 OR znake_score2=>100) AND znake_score1<>znake_score2) new_screen=33; END
            IF(znake_set_points_game==2 AND (znake_score1=>200 OR znake_score2=>200) AND znake_score1<>znake_score2) new_screen=33; END
            IF(znake_set_points_game==3 AND (znake_score1=>300 OR znake_score2=>300) AND znake_score1<>znake_score2) new_screen=33; END
            IF(znake_set_points_game==4 AND (znake_score1=>400 OR znake_score2=>400) AND znake_score1<>znake_score2) new_screen=33; END
            IF(znake_set_points_game==5 AND (znake_score1=>500 OR znake_score2=>500) AND znake_score1<>znake_score2) new_screen=33; END

            scroll[0].y0-=2;
            IF(key(_control) AND key(_1) AND znake_cheats==TRUE);
                small_apple(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,32)==0 and znake_apples<10)
                small_apple(rand(1,48)*16,rand(8,33)*16);
                znake_apples++;
            END
            IF(key(_control) AND key(_2) AND znake_cheats==TRUE);
                small_special_1(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,128)==0 and znake_special_1s<5)
                small_special_1(rand(1,48)*16,rand(8,33)*16);
                znake_special_1s++;
            END
            IF(key(_control) AND key(_3) AND znake_cheats==TRUE);
                small_special_2(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,150)==0 and znake_special_2s<3)
                small_special_2(rand(1,48)*16,rand(8,33)*16);
                znake_special_2s++;
            END
            IF(key(_control) AND key(_4) AND znake_cheats==TRUE);
                small_special_3(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,150)==0 AND znake_special_3s<3)
                small_special_3(rand(1,48)*16,rand(8,33)*16);
                znake_special_3s++;
            END
            IF(key(_control) AND key(_5) AND znake_cheats==TRUE);
                small_special_4(rand(1,48)*16,rand(8,33)*16);
            END
            IF (rand(0,200)==0 AND znake_special_4s<3)
                small_special_4(rand(1,48)*16,rand(8,33)*16);
                znake_special_4s++;
            END
            IF(znake_apples==0)
                small_apple(rand(1,48)*16,rand(8,33)*16);
                znake_apples++;
            END
            IF(key(_esc)) new_screen=1; END
            FRAME;
        END
    stop_sound(all_sound);
    znake_worm1_length=8;
    znake_worm2_length=8;
    stop_scroll(0);
        signal(TYPE small_worm_head1,s_kill);
        signal(TYPE small_worm_head2,s_kill);
        signal(TYPE small_worm_segment1,s_kill);
        signal(TYPE small_worm_segment2,s_kill);
        signal(TYPE small_apple,s_kill);
        signal(TYPE small_special_1,s_kill);
        signal(TYPE small_special_2,s_kill);
        signal(TYPE small_special_3,s_kill);
        signal(TYPE small_special_4,s_kill);
        signal(TYPE small_explosion,s_kill);
    delete_text(all_text);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS small_worm_head1(x,y,ix,iy)

PRIVATE
    apple_id;
    special_1_id;
    special_2_id;
    special_3_id;
    special_4_id;

BEGIN
    file=znake_file;
    graph=21;
    small_worm_segment1(128,priority+1);
    REPEAT
        FRAME;
        IF (key(_right)) ix=16; iy=0; graph=21; END
        IF (key(_left)) ix=-16; iy=0; graph=22; END
        IF (key(_down)) ix=0; iy=16; graph=24; END
        IF (key(_up)) ix=0; iy=-16; graph=23; END
        IF (apple_id=collision(TYPE small_apple))
            sound(s_5,256,256);
            signal(apple_id,s_kill);
            znake_apples--;
            znake_worm1_length+=4;
            znake_score1+=10;
        END
        IF (special_1_id=collision(TYPE small_special_1))
            signal(special_1_id,s_kill);
            sound(s_5,256,256);
            znake_special_1s--;
            znake_worm1_length+=4;
            znake_score1+=20;
        END
        IF (special_2_id=collision(TYPE small_special_2))
            signal(special_2_id,s_kill);
            sound(s_5,256,256);
            znake_special_2s--;
            znake_worm1_length+=4;
            znake_score1+=50;
        END
        IF (special_3_id=collision(TYPE small_special_3))
            signal(special_3_id,s_kill);
            sound(s_5,256,256);
            small_explosion(x,y);
            znake_special_3s--;
            znake_worm1_length-=4;
        END
        IF (special_4_id=collision(TYPE small_special_4))
            signal(special_4_id,s_kill);
            sound(s_5,256,256);
            znake_special_4s--;
            znake_worm1_length+=4;
            znake_score1-=30;
        END
        IF(znake_worm1_length<0)
            znake_worm1_length=0;
        END
        x=x+ix;
        y=y+iy;
    UNTIL (out_region(id,2) or collision(type small_worm_segment1) OR collision(type small_worm_segment2) OR x>768);
    IF (players==2 OR znake_score1<=znake_topscore)
        znake_score1=0;
        signal(son,s_kill_tree);
        znake_worm1_length=8;
        small_worm_head1(16,192,16,0);
    END
    IF (players==1 AND znake_score1>znake_topscore)
        znake_topscore=znake_score1;
        new_screen=33;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_worm_head2(x,y,ix,iy)

PRIVATE
    apple_id;
    special_1_id;
    special_2_id;
    special_3_id;
    special_4_id;

BEGIN
    file=znake_file;
    graph=12;
    small_worm_segment2(128,priority+1);
    REPEAT
        FRAME;
        IF (key(_t)) ix=16; iy=0; graph=11; END
        IF (key(_r)) ix=-16; iy=0; graph=12; END
        IF (key(_a)) ix=0; iy=16; graph=14; END
        IF (key(_q)) ix=0; iy=-16; graph=13; END
        IF (apple_id=collision(TYPE small_apple))
            signal(apple_id,s_kill);
            sound(s_5,256,256);
            znake_apples--;
            znake_worm2_length+=4;
            znake_score2+=10;
        END
        IF (special_1_id=collision(TYPE small_special_1))
            signal(special_1_id,s_kill);
            znake_special_1s--;
            sound(s_5,256,256);
            znake_worm2_length+=4;
            znake_score2+=20;
        END
        IF (special_2_id=collision(TYPE small_special_2))
            signal(special_2_id,s_kill);
            znake_special_2s--;
            znake_worm2_length+=4;
            sound(s_5,256,256);
            znake_score2+=50;
        END
        IF (special_3_id=collision(TYPE small_special_3))
            signal(special_3_id,s_kill);
            small_explosion(x,y);
            znake_special_3s--;
            sound(s_5,256,256);
            znake_worm2_length-=4;
        END
        IF (special_4_id=collision(TYPE small_special_4))
            signal(special_4_id,s_kill);
            znake_special_4s--;
            znake_worm2_length+=4;
            sound(s_5,256,256);
            znake_score2-=30;
        END
        IF(znake_worm2_length<0)
            znake_worm2_length=0;
        END
        x=x+ix;
        y=y+iy;
    UNTIL (out_region(id,2) or collision(type small_worm_segment1) OR collision(type small_worm_segment2) OR x>768);
    znake_score2=0;
    znake_worm2_length=8;
    signal(son,s_kill_tree);
    small_worm_head2(768,192,-16,0);
END

//-----------------------------------------------------------------------------

PROCESS small_explosion(x,y)

BEGIN
        sound(s_explosion,256,256);
        file=asteroids_file;
        size=80;
        z=0;
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS small_worm_segment1(n,priority)

BEGIN
    file=znake_file;
    IF (n>0) small_worm_segment1(n-1,priority+1); END
    LOOP
        IF (priority<znake_worm1_length)
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

PROCESS small_worm_segment2(n,priority)

BEGIN
    file=znake_file;
    IF (n>0) small_worm_segment2(n-1,priority+1); END
    LOOP
        IF (priority<znake_worm2_length)
            graph=10;
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
    graph=20;
    LOOP FRAME; END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS worms_worm_background();

BEGIN
    start_scroll(0,worms_file,5,0,3,15);
    start_scroll(1,main_file,2,0,2,15);
    scroll[0].z=511;
    scroll[0].y0=400;
    LOOP
        scroll[0].x0-=10;
        scroll[1].y0-=2;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm_betting();

PRIVATE;
    player1_betted;
    player2_betted;
    player3_betted;
    player4_betted;
    player5_betted;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    sound(s_7,256,256);
    screen=0;
    new_screen=0;
    worm_players=1;
    player1_worm=0;
    player2_worm=0;
    player3_worm=0;
    player4_worm=0;
    player5_worm=0;
    player1_betted=FALSE;
    player2_betted=FALSE;
    player3_betted=FALSE;
    player4_betted=FALSE;
    player5_betted=FALSE;
    mouse.file=main_file;
    mouse.graph=5;
    write(main_font,400,160,4,"BEGIN RACE");
    write(main_font,240,430,3,"DASHER");
    write(main_font,240,450,3,"WORMWIND");
    write(main_font,240,470,3,"I DUNNO");
    write(main_font,240,490,3,"RAZOR");
    write(main_font,240,510,3,"THUNDER");
    write(main_font,440,430,3,"PLAYER");
    write(main_font,440,450,3,"PLAYER");
    write(main_font,440,470,3,"PLAYER");
    write(main_font,440,490,3,"PLAYER");
    write(main_font,440,510,3,"PLAYER");
    write_int(main_font,560,430,3,& player1_worm);
    write_int(main_font,560,450,3,& player2_worm);
    write_int(main_font,560,470,3,& player3_worm);
    write_int(main_font,560,490,3,& player4_worm);
    write_int(main_font,560,510,3,& player5_worm);
    worms_worm_background();
    worm_card(400,300);
        WHILE (new_screen==0);
        IF(mouse.y<250 AND mouse.left) new_screen=41; END
        IF(player1_worm>5) player1_worm=1; END
        IF(player2_worm>5) player2_worm=1; END
        IF(player3_worm>5) player3_worm=1; END
        IF(player4_worm>5) player4_worm=1; END
        IF(player5_worm>5) player5_worm=1; END
        IF(player1_betted==FALSE AND mouse.y>420 AND mouse.y<440 AND mouse.left) player1_worm=worm_players; player1_betted=TRUE; worm_players+=1; END
        IF(player2_betted==FALSE AND mouse.y>440 AND mouse.y<460 AND mouse.left) player2_worm=worm_players; player2_betted=TRUE; worm_players+=1; END
        IF(player3_betted==FALSE AND mouse.y>460 AND mouse.y<480 AND mouse.left) player3_worm=worm_players; player3_betted=TRUE; worm_players+=1; END
        IF(player4_betted==FALSE AND mouse.y>480 AND mouse.y<500 AND mouse.left) player4_worm=worm_players; player4_betted=TRUE; worm_players+=1; END
        IF(player5_betted==FALSE AND mouse.y>500 AND mouse.y<520 AND mouse.left) player5_worm=worm_players; player5_betted=TRUE; worm_players+=1; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE worms_worm_background,s_kill);
    signal(TYPE worm_card,s_kill);
    stop_scroll(0);
    stop_scroll(1);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS race();

PRIVATE;
    worm_graph;
    camera_move;
    camera2_move;
    worm_positions;
    worm_start_text;
    worm_start_timer_text;
    trap;

BEGIN
    sound(s_7,256,256);
    lightening_x=0;
    lightening_y=0;
    worm1_lightening=FALSE;
    worm2_lightening=FALSE;
    worm3_lightening=FALSE;
    worm4_lightening=FALSE;
    worm5_lightening=FALSE;
    hole_x=0;
    hole_y=0;
    worm1_hole=FALSE;
    worm2_hole=FALSE;
    worm3_hole=FALSE;
    worm4_hole=FALSE;
    worm5_hole=FALSE;
    man_trap_x=0;
    man_trap_y=0;
    man_trap_close=FALSE;
    comet_killed=FALSE;
    comet_hit=FALSE;
    comet_x=0;
    comet_y=0;
    worm1_death=FALSE;
    worm2_death=FALSE;
    worm3_death=FALSE;
    worm4_death=FALSE;
    worm5_death=FALSE;
    worm1_man_trap=FALSE;
    worm2_man_trap=FALSE;
    worm3_man_trap=FALSE;
    worm4_man_trap=FALSE;
    worm5_man_trap=FALSE;

    trap=rand(1,6);
    IF(trap==2) worms_land_mine(); END
    IF(trap==3) worms_comet(); END
    IF(trap==4) man_trap1(); END
    IF(trap==5) worms_hole(); END
    IF(trap==6) worms_lightening(); END
    worm_start_timer=300;
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
    mouse.graph=0;
    screen=0;
    new_screen=0;
    start_scroll(0,worms_file,1,0,2,15);
    scroll[0].y0=435;
    worm1();
    worm2();
    worm3();
    worm4();
    worm5();
    camera_move=FALSE;
    camera2_move=TRUE;
    worm_positions=1;
    worm_start_timer_text=write_int(main_font,400,300,4,& worm_start_text);
    box(main_file,11,400,300,-100,2,TRUE);
        WHILE (new_screen==0);
        IF(worm_start_timer>0) worm_start_timer-=8; END
        IF(worm_start_timer>200) worm_start_text=3; END
        IF(worm_start_timer<201 AND worm_start_timer>100) worm_start_text=2; END
        IF(worm_start_timer>0 AND worm_start_timer<101) worm_start_text=1; END
        IF(worm_start_timer<1) delete_text(worm_start_timer_text); signal(TYPE box,s_kill); END
        IF(worm_start_timer<1 AND camera_move==TRUE AND camera2_move==TRUE) scroll[0].x0+=8; END
        IF(worm1_pos>320 OR worm2_pos>320 OR worm3_pos>320 OR worm4_pos>320 OR worm5_pos>320) camera_move=TRUE; END
        IF(worm1_pos>1100 OR worm2_pos>1100 OR worm3_pos>1100 OR worm4_pos>1100 OR worm5_pos>1100) camera2_move=FALSE; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_pos>1550) new_screen=42; END
        IF(worm1_death==TRUE AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_pos>1550) new_screen=42; END
        IF(worm1_pos>1550 AND worm2_death==TRUE AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_pos>1550) new_screen=42; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_death==TRUE AND worm4_pos>1550 AND worm5_pos>1550) new_screen=42; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_death==TRUE AND worm5_pos>1550) new_screen=42; END
        IF(worm1_pos>1550 AND worm2_pos>1550 AND worm3_pos>1550 AND worm4_pos>1550 AND worm5_death==TRUE) new_screen=42; END
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
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    stop_scroll(0);
    signal(TYPE box,s_kill);
    signal(TYPE worms_hole,s_kill);
    signal(TYPE worms_comet,s_kill);
    signal(TYPE man_trap1,s_kill);
    signal(TYPE man_trap2,s_kill);
    signal(TYPE worms_land_mine,s_kill);
    signal(TYPE worm1,s_kill);
    signal(TYPE worm2,s_kill);
    signal(TYPE worm3,s_kill);
    signal(TYPE worm4,s_kill);
    signal(TYPE worm5,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS worm_winner();

PRIVATE;
    worm_graph;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    sound(s_7,256,256);
    screen=0;
    new_screen=0;
    mouse.file=main_file;
    mouse.graph=5;
    IF(worm1_fin_pos==1) write(main_font,400,150,4,"DASHER WINS"); worm_podium_winner(10,395,330,1);
        IF(player1_worm==1) write(main_font,400,185,4,"PLAYER 1 WINS"); END
        IF(player1_worm==2) write(main_font,400,185,4,"PLAYER 2 WINS"); END
        IF(player1_worm==3) write(main_font,400,185,4,"PLAYER 3 WINS"); END
        IF(player1_worm==4) write(main_font,400,185,4,"PLAYER 4 WINS"); END
        IF(player1_worm==5) write(main_font,400,185,4,"PLAYER 5 WINS"); END
    END
    IF(worm2_fin_pos==1) write(main_font,400,150,4,"WORMWIND WINS"); worm_podium_winner(20,395,330,1);
        IF(player2_worm==1) write(main_font,400,185,4,"PLAYER 1 WINS"); END
        IF(player2_worm==2) write(main_font,400,185,4,"PLAYER 2 WINS"); END
        IF(player2_worm==3) write(main_font,400,185,4,"PLAYER 3 WINS"); END
        IF(player2_worm==4) write(main_font,400,185,4,"PLAYER 4 WINS"); END
        IF(player2_worm==5) write(main_font,400,185,4,"PLAYER 5 WINS"); END
    END
    IF(worm3_fin_pos==1) write(main_font,400,150,4,"I DUNNO WINS"); worm_podium_winner(30,395,330,1);
        IF(player3_worm==1) write(main_font,400,185,4,"PLAYER 1 WINS"); END
        IF(player3_worm==2) write(main_font,400,185,4,"PLAYER 2 WINS"); END
        IF(player3_worm==3) write(main_font,400,185,4,"PLAYER 3 WINS"); END
        IF(player3_worm==4) write(main_font,400,185,4,"PLAYER 4 WINS"); END
        IF(player3_worm==5) write(main_font,400,185,4,"PLAYER 5 WINS"); END
    END
    IF(worm4_fin_pos==1) write(main_font,400,150,4,"RAZOR WINS"); worm_podium_winner(40,395,330,1);
        IF(player4_worm==1) write(main_font,400,185,4,"PLAYER 1 WINS"); END
        IF(player4_worm==2) write(main_font,400,185,4,"PLAYER 2 WINS"); END
        IF(player4_worm==3) write(main_font,400,185,4,"PLAYER 3 WINS"); END
        IF(player4_worm==4) write(main_font,400,185,4,"PLAYER 4 WINS"); END
        IF(player4_worm==5) write(main_font,400,185,4,"PLAYER 5 WINS"); END
    END
    IF(worm5_fin_pos==1) write(main_font,400,150,4,"THUNDER WINS"); worm_podium_winner(50,395,330,1);
        IF(player5_worm==1) write(main_font,400,185,4,"PLAYER 1 WINS"); END
        IF(player5_worm==2) write(main_font,400,185,4,"PLAYER 2 WINS"); END
        IF(player5_worm==3) write(main_font,400,185,4,"PLAYER 3 WINS"); END
        IF(player5_worm==4) write(main_font,400,185,4,"PLAYER 4 WINS"); END
        IF(player5_worm==5) write(main_font,400,185,4,"PLAYER 5 WINS"); END
    END
    IF(worm1_fin_pos==2) worm_podium_winner(10,318,346,0); END
    IF(worm2_fin_pos==2) worm_podium_winner(20,318,346,0); END
    IF(worm3_fin_pos==2) worm_podium_winner(30,318,346,0); END
    IF(worm4_fin_pos==2) worm_podium_winner(40,318,346,0); END
    IF(worm5_fin_pos==2) worm_podium_winner(50,318,346,0); END
    IF(worm1_fin_pos==3) worm_podium_winner(10,482,362,1); END
    IF(worm2_fin_pos==3) worm_podium_winner(20,482,362,1); END
    IF(worm3_fin_pos==3) worm_podium_winner(30,482,362,1); END
    IF(worm4_fin_pos==3) worm_podium_winner(40,482,362,1); END
    IF(worm5_fin_pos==3) worm_podium_winner(50,482,362,1); END
    IF(worm1_fin_pos==4) worm_podium_winner(10,232,378,0); END
    IF(worm2_fin_pos==4) worm_podium_winner(20,232,378,0); END
    IF(worm3_fin_pos==4) worm_podium_winner(30,232,378,0); END
    IF(worm4_fin_pos==4) worm_podium_winner(40,232,378,0); END
    IF(worm5_fin_pos==4) worm_podium_winner(50,232,378,0); END
    IF(worm1_fin_pos==5) worm_podium_winner(10,565,394,1); END
    IF(worm2_fin_pos==5) worm_podium_winner(20,565,394,1); END
    IF(worm3_fin_pos==5) worm_podium_winner(30,565,394,1); END
    IF(worm4_fin_pos==5) worm_podium_winner(40,565,394,1); END
    IF(worm5_fin_pos==5) worm_podium_winner(50,565,394,1); END

    IF(worm1_fin_pos==0) worm_podium_grave_stone(); write(main_font,400,220,4,"DASHER IS PLAYING HIS GOLDEN HARP"); END
    IF(worm2_fin_pos==0) worm_podium_grave_stone(); write(main_font,400,220,4,"WORMWIND POPPED HIS CLOGS"); END
    IF(worm3_fin_pos==0) worm_podium_grave_stone(); write(main_font,400,220,4,"I DUNNO KICKED THE BUCKET"); END
    IF(worm4_fin_pos==0) worm_podium_grave_stone(); write(main_font,400,220,4,"R.I.P RAZOR"); END
    IF(worm5_fin_pos==0) worm_podium_grave_stone(); write(main_font,400,220,4,"STRUCK BY LIGHTNING"); END

    start_scroll(0,worms_file,61,0,2,15);
    file=worms_file;
    graph=60;
    x=392;
    y=401;
        WHILE (new_screen==0);
        scroll[0].x0-=2;
        IF(key(_space) OR mouse.left) new_screen=40; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    stop_scroll(0);
    signal(TYPE worm_podium_winner,s_kill);
    signal(TYPE worm_podium_grave_stone,s_kill);
    signal(TYPE worms_worm_background,s_kill);
    stop_sound(all_sound);
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
    x=555;
    y=376;
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
    ctype=c_scroll;
    region=2;
    worm1_death=FALSE;
    worm1_graph=0;
    file=worms_file;
    graph=10;
    x=60;
    y=490;
    flags=1;
    WHILE(worm1_death==false);
        worm1_pos=x;
        worm1_graph+=1;
        IF(worm_start_timer<1)
            IF(x<=comet_x OR comet_y<>490)
            x+=rand(1,15); END
        END
        IF(worm1_graph>1) graph+=1; worm1_graph=0; END
        IF(graph>13) graph=10; END
        IF(collision(TYPE worms_land_mine)) worm1_death=TRUE; END
        IF(x=>man_trap_x AND man_trap_y-15==490) man_trap_close=TRUE; worm1_death=TRUE; worm1_man_trap=TRUE; END
        IF(x>comet_x AND comet_y==490) comet_hit=TRUE; END
        IF(comet_y==490 AND comet_killed==TRUE) worm1_death=TRUE; END
        IF(x=>hole_x AND hole_y==490-7) worm1_hole=TRUE; worm1_death=TRUE; END
        IF(x=>lightening_x AND lightening_y==490) lightening_hit=TRUE; worm1_lightening=TRUE; worm1_death=TRUE; END
        IF(key(_l_shift) AND key(_1) AND worm_betting_cheats==TRUE) x+=5; END
        FRAME;
    END
    IF(worm1_hole==TRUE) sound(s_10,256,256); END
    WHILE(worm1_hole==TRUE AND size>0);
    size-=10;
    FRAME;
    END
    WHILE(worm1_man_trap==TRUE);
    FRAME;
    END
    WHILE(worm1_lightening==TRUE);
    graph=76;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm2();

PRIVATE
    worm2_graph;

BEGIN
    ctype=c_scroll;
    region=2;
    worm2_death=FALSE;
    worm2_graph=0;
    file=worms_file;
    graph=20;
    x=60;
    y=570;
    flags=1;
    WHILE(worm2_death==false);
        worm2_pos=x;
        worm2_graph+=1;
        IF(worm_start_timer<1)
            IF(x<=comet_x OR comet_y<>570)
            x+=rand(1,15); END
        END
        IF(worm2_graph>1) graph+=1; worm2_graph=0; END
        IF(graph>23) graph=20; END
        IF(collision(TYPE worms_land_mine)) worm2_death=TRUE; END
        IF(x>comet_x AND comet_y==570) comet_hit=TRUE; END
        IF(comet_y==570 AND comet_killed==TRUE) worm2_death=TRUE; END
        IF(x=>man_trap_x AND man_trap_y-15==570) man_trap_close=TRUE; worm2_death=TRUE; worm2_man_trap=TRUE; END
        IF(x=>hole_x AND hole_y==570-6) worm2_hole=TRUE; worm2_death=TRUE; END
        IF(x=>lightening_x AND lightening_y==570) lightening_hit=TRUE; worm2_lightening=TRUE; worm2_death=TRUE; END
        IF(key(_l_shift) AND key(_2) AND worm_betting_cheats==TRUE) x+=5; END
         FRAME;
    END
    IF(worm2_hole==TRUE) sound(s_10,256,256); END
    WHILE(worm2_hole==TRUE AND size>0);
    size-=10;
    FRAME;
    END
    WHILE(worm2_man_trap==TRUE);
    FRAME;
    END
    WHILE(worm2_lightening==TRUE);
    graph=76;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm3();

PRIVATE
    worm3_graph;

BEGIN
    ctype=c_scroll;
    region=2;
    worm3_death=FALSE;
    worm3_graph=0;
    file=worms_file;
    graph=30;
    x=60;
    y=650;
    flags=1;
    WHILE(worm3_death==false);
        worm3_pos=x;
        worm3_graph+=1;
        IF(worm_start_timer<1)
            IF(x<=comet_x OR comet_y<>650)
            x+=rand(1,15); END
        END
        IF(worm3_graph>1) graph+=1; worm3_graph=0; END
        IF(graph>33) graph=30; END
        IF(collision(TYPE worms_land_mine)) worm3_death=TRUE; END
        IF(x>comet_x AND comet_y==650) comet_hit=TRUE; END
        IF(comet_y==650 AND comet_killed==TRUE) worm3_death=TRUE; END
        IF(x=>man_trap_x AND man_trap_y-15==650) man_trap_close=TRUE; worm3_death=TRUE; worm3_man_trap=TRUE; END
        IF(x=>hole_x AND hole_y==650-5) worm3_hole=TRUE; worm3_death=TRUE; END
        IF(x=>lightening_x AND lightening_y==650) lightening_hit=TRUE; worm3_lightening=TRUE; worm3_death=TRUE; END
        IF(key(_l_shift) AND key(_3) AND worm_betting_cheats==TRUE) x+=5; END
          FRAME;
    END
    IF(worm3_hole==TRUE) sound(s_10,256,256); END
    WHILE(worm3_hole==TRUE AND size>0);
    size-=10;
    FRAME;
    END
    WHILE(worm3_man_trap==TRUE);
    FRAME;
    END
    WHILE(worm3_lightening==TRUE);
    graph=76;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm4();

PRIVATE
    worm4_graph;

BEGIN
    ctype=c_scroll;
    region=2;
    worm4_death=FALSE;
    worm4_graph=0;
    file=worms_file;
    graph=40;
    x=60;
    y=730;
    flags=1;
    WHILE(worm4_death==false);
        worm4_pos=x;
        worm4_graph+=1;
        IF(worm_start_timer<1)
            IF(x<=comet_x OR comet_y<>730)
            x+=rand(1,15); END
        END
        IF(worm4_graph>1) graph+=1; worm4_graph=0; END
        IF(graph>43) graph=40; END
        IF(collision(TYPE worms_land_mine)) worm4_death=TRUE; END
        IF(x>comet_x AND comet_y==730) comet_hit=TRUE; END
        IF(comet_y==730 AND comet_killed==TRUE) worm4_death=TRUE; END
        IF(x=>man_trap_x AND man_trap_y-15==730) man_trap_close=TRUE; worm4_death=TRUE; worm4_man_trap=TRUE; END
        IF(x=>hole_x AND hole_y==730-4) worm4_hole=TRUE; worm4_death=TRUE; END
        IF(x=>lightening_x AND lightening_y==730) lightening_hit=TRUE; worm4_lightening=TRUE; worm4_death=TRUE; END
        IF(key(_l_shift) AND key(_4) AND worm_betting_cheats==TRUE) x+=5; END
          FRAME;
    END
    IF(worm4_hole==TRUE) sound(s_10,256,256); END
    WHILE(worm4_hole==TRUE AND size>0);
    size-=10;
    FRAME;
    END
    WHILE(worm4_man_trap==TRUE);
    FRAME;
    END
    WHILE(worm4_lightening==TRUE);
    graph=76;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worm5();

PRIVATE
    worm5_graph;

BEGIN
    ctype=c_scroll;
    region=2;
    worm5_death=FALSE;
    worm5_graph=0;
    file=worms_file;
    graph=50;
    x=60;
    y=810;
    flags=1;
    WHILE(worm5_death==false);
        worm5_pos=x;
        worm5_graph+=1;
        IF(worm_start_timer<1)
            IF(x<=comet_x OR comet_y<>810)
            x+=rand(1,15); END
        END
        IF(worm5_graph>1) graph+=1; worm5_graph=0; END
        IF(graph>53) graph=50; END
        IF(collision(TYPE worms_land_mine)) worm5_death=TRUE; END
        IF(x>comet_x AND comet_y==810) comet_hit=TRUE; END
        IF(comet_y==810 AND comet_killed==TRUE) worm5_death=TRUE; END
        IF(x=>man_trap_x AND man_trap_y-15==810) man_trap_close=TRUE; worm5_death=TRUE; worm5_man_trap=TRUE; END
        IF(x=>hole_x AND hole_y==810-3) worm5_hole=TRUE; worm5_death=TRUE; END
        IF(x=>lightening_x AND lightening_y==810) lightening_hit=TRUE; worm5_lightening=TRUE; worm5_death=TRUE; END
        IF(key(_l_shift) AND key(_5) AND worm_betting_cheats==TRUE) x+=5; END
          FRAME;
    END
    IF(worm5_hole==TRUE) sound(s_10,256,256); END
    WHILE(worm5_hole==TRUE AND size>0);
    size-=10;
    FRAME;
    END
    WHILE(worm5_man_trap==TRUE);
    FRAME;
    END
    WHILE(worm5_lightening==TRUE);
    graph=76;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worms_land_mine();

PRIVATE
    land_mine_lane;
    land_mine_explosion;

BEGIN
    ctype=c_scroll;
    land_mine_explosion=FALSE;
    file=worms_file;
    graph=70;
    x=rand(500,1200);
    land_mine_lane=rand(1,5);
    IF(land_mine_lane==1) y=490; END
    IF(land_mine_lane==2) y=570; END
    IF(land_mine_lane==3) y=650; END
    IF(land_mine_lane==4) y=730; END
    IF(land_mine_lane==5) y=810; END
    WHILE(land_mine_explosion==FALSE);
        IF(collision(TYPE worm1)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm2)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm3)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm4)) land_mine_explosion=TRUE; END
        IF(collision(TYPE worm5)) land_mine_explosion=TRUE; END
        FRAME;
    END
        sound(s_explosion,256,256);
        size=80;
        z=0;
        file=asteroids_file;
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worms_comet();

PRIVATE
    comet_lane;
    land_mine_explosion;

BEGIN
    ctype=c_scroll;
    file=worms_file;
    graph=71;
    flags=4;
    size=0;
    x=rand(500,1200);
    z=-250;
    comet_lane=rand(1,5);
    IF(comet_lane==1) y=490; END
    IF(comet_lane==2) y=570; END
    IF(comet_lane==3) y=650; END
    IF(comet_lane==4) y=730; END
    IF(comet_lane==5) y=810; END
    comet_x=x;
    comet_y=y;
    comet_hit=FALSE;
    comet_killed=FALSE;
        WHILE(comet_hit==FALSE);
        FRAME;
        END
        sound(s_10,256,256);
        WHILE(size<140);
        size+=10;
        FRAME;
        END
        sound(s_8,256,256);

        LOOP
        comet_killed=TRUE;
        flags=0;
        file=asteroids_file;
        graph=6;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS man_trap1();

PRIVATE
    man_trap_lane;

BEGIN
    ctype=c_scroll;
    man_trap_close=FALSE;
    file=worms_file;
    graph=72;
    x=rand(500,1200);
    man_trap_lane=rand(1,5);
    z=10;
    IF(man_trap_lane==1) y=505; END
    IF(man_trap_lane==2) y=585; END
    IF(man_trap_lane==3) y=665; END
    IF(man_trap_lane==4) y=745; END
    IF(man_trap_lane==5) y=825; END
    man_trap_x=x;
    man_trap_y=y;
    WHILE(man_trap_close==FALSE);
        FRAME;
    END

        man_trap2(x,y);
        LOOP
        graph=73;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS man_trap2(x,y);

BEGIN
    sound(s_9,256,256);
    ctype=c_scroll;
    file=worms_file;
    graph=74;
    z=-10;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worms_hole();

PRIVATE
    hole_lane;

BEGIN
    ctype=c_scroll;
    file=worms_file;
    graph=75;
    x=rand(500,1200);
    hole_lane=rand(1,5);
    IF(hole_lane==1) y=490-7; END
    IF(hole_lane==2) y=570-6; END
    IF(hole_lane==3) y=650-5; END
    IF(hole_lane==4) y=730-4; END
    IF(hole_lane==5) y=810-3; END
    hole_x=x;
    hole_y=y;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS worms_lightening();

PRIVATE
    lightening_lane;
    lightening_hiting;

BEGIN
    lightening_hiting=0;
    lightening_hit=FALSE;
    ctype=c_scroll;
    lightening_x=rand(500,1200);
    lightening_lane=rand(1,5);
    IF(lightening_lane==1) lightening_y=490; END
    IF(lightening_lane==2) lightening_y=570; END
    IF(lightening_lane==3) lightening_y=650; END
    IF(lightening_lane==4) lightening_y=730; END
    IF(lightening_lane==5) lightening_y=810; END
    WHILE(lightening_hit==FALSE);
        FRAME;
    END
    sound(s_11,256,256);
    fade(200,200,190,64);
    WHILE(lightening_hiting<4)
    lightening_hiting+=1;
    FRAME;
    END
    fade(100,100,100,64);
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS space_blast();

BEGIN
    space_ship1_explosion=FALSE;
    space_ship2_explosion=FALSE;
    space_fortress_explosion=FALSE;
    space_player1_health=0;
    space_player2_health=0;
    space_fortress_health=0;
    space_player_winner=0;
    screen=0;
    new_screen=0;
    mouse.graph=0;
    internet_background_bar(391,335);
    id1=space_player1(320,480);
    id2=space_player2(320,240);
    start_scroll(2,main_file,10,0,4,15);
    start_scroll(3,main_file,10,0,5,15);
    id3=space_fortress(1000,500);
    sound(s_3,256,256);
    sound(s_4,256,256);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=1; END
        IF(space_player1_health<=0) space_player_winner=2; new_screen=71; END
        IF(space_player2_health<=0) space_player_winner=1; new_screen=71; END
        IF(space_player1_health<=0 AND space_player2_health<=0) space_player_winner=0; new_screen=71; END
        FRAME;
    END
    delete_text(all_text);
    stop_sound(all_sound);
    signal(TYPE internet_background_bar,s_kill);
    stop_scroll(2);
    stop_scroll(3);
    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(id3,s_kill);
    signal(TYPE player1_arrow,s_kill);
    signal(TYPE player2_arrow,s_kill);
    signal(TYPE fortress_arrow,s_kill);
    signal(TYPE torpedo1,s_kill);
    signal(TYPE torpedo2,s_kill);
    signal(TYPE space_player1,s_kill);
    signal(TYPE space_player2,s_kill);
    signal(TYPE space_fortress,s_kill);
    signal(TYPE torpedo_fortress,s_kill);
    signal(TYPE space_explosion,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS space_blast_winner();

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    screen=0;
    new_screen=0;
    mouse.graph=5;
    start_scroll(1,main_file,10,0,2,15);
    IF(space_player_winner==1) write(main_font,391,334,4,"PLAYER 1 WINS"); END
    IF(space_player_winner==2) write(main_font,391,334,4,"PLAYER 2 WINS"); END
    IF(space_player_winner==0) write(main_font,391,334,4,"DRAW"); END
    box(main_file,13,391,334,-100,1,TRUE);
    sound(s_2,256,256);
        WHILE (new_screen==0);
        scroll[1].y0-=2;
        IF(key(_esc)) new_screen=1; END
        IF(mouse.left) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE box,s_kill);
    signal(TYPE internet_background_bar,s_kill);
    stop_scroll(1);
    delete_text(all_text);
    signal(id1,s_kill);
    signal(id2,s_kill);
    signal(id3,s_kill);
    signal(TYPE player1_arrow,s_kill);
    signal(TYPE player2_arrow,s_kill);
    signal(TYPE fortress_arrow,s_kill);
    signal(TYPE torpedo1,s_kill);
    signal(TYPE torpedo2,s_kill);
    signal(TYPE space_player1,s_kill);
    signal(TYPE space_player2,s_kill);
    signal(TYPE space_fortress,s_kill);
    signal(TYPE torpedo_fortress,s_kill);
    signal(TYPE space_explosion,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS space_player1(x,y);

PRIVATE
    fire_torpedo1=0;
    player1_live;
    back;

BEGIN
    player1_arrow();
    fortress_arrow();
    space_player1_health=150;
    player1_live=TRUE;
    ctype=c_scroll;
    scroll[2].camera=id;
    file=space_file;
    graph=1;
    write(main_font,100,92,0,"PLAYER  1's  HEALTH = ");
    write_int(main_font,300,92,0,& space_player1_health);
        WHILE (player1_live==TRUE)
        IF(key(_r_shift) AND key(_plus) AND space_blast_cheats==TRUE) space_player1_health=150; END
        fire_torpedo1+=1;
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END
        IF(key(_up)) advance(10); END
        IF(key(_control) AND fire_torpedo1>12) sound(s_6,256,256); torpedo1(x,y,angle); fire_torpedo1=0; END
        IF(collision(TYPE space_player2)) advance(-25); back=10; space_explosion(50,x,y); space_explosion(50,id2.x,id2.y); space_player1_health-=5; space_player2_health-=10; END
        IF(back>0) back-=1; advance(-5); END
        IF(x<0) x=0; END
        IF(x>1920) x=1920; END
        IF(y<0) y=0; END
        IF(y>1440) y=1440; END
        IF(space_player1_health<1) player1_live=FALSE; END
    FRAME;
    END
    z=0;
    file=asteroids_file;
    sound(s_explosion,256,256);
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_player2(x,y)

PRIVATE
    fire_torpedo2=0;
    player2_live;
    back;

BEGIN
    player2_arrow();
    fortress_arrow();
    space_player2_health=150;
    player2_live=TRUE;
    ctype=c_scroll;
    scroll[3].camera=id;
    file=space_file;
    graph=2;
    write(main_font,500,92,0,"PLAYER  2's  HEALTH = ");
    write_int(main_font,700,92,0,& space_player2_health);
        WHILE (player2_live==TRUE)
        IF(key(_l_shift) AND key(_tab) AND space_blast_cheats==TRUE) space_player2_health=150; END
        fire_torpedo2+=1;
        IF(key(_r)) angle+=5000; END
        IF(key(_t)) angle-=5000; END
        IF(key(_q)) advance(10); END
        IF(key(_space) AND fire_torpedo2>12) sound(s_6,256,256); torpedo2(x,y,angle); fire_torpedo2=0; END
        IF(collision(TYPE space_player1)) advance(-25); back=10;  space_explosion(50,x,y); space_explosion(50,id1.x,id1.y); space_player2_health-=5; space_player1_health-=10; END        IF(x<0) x=0; END
        IF(back>0) back-=1; advance(-5); END
        IF(x>1920) x=1920; END
        IF(y<0) y=0; END
        IF(y>1440) y=1440; END
        IF(space_player2_health<1) player2_live=FALSE; END
        FRAME;
        END
        z=0;
        file=asteroids_file;
        sound(s_explosion,256,256);
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_fortress(x,y)

PRIVATE
    fire_torpedo_fortress=0;
    fortress_live;

BEGIN
    space_fortress_health=150;
    fortress_live=TRUE;
    ctype=c_scroll;
    file=space_file;
    graph=20;
        WHILE(fortress_live==TRUE)
        fire_torpedo_fortress+=1;
        angle+=5000;
        IF(fire_torpedo_fortress>60 AND get_dist(id1)<400) sound(s_6,256,256); torpedo_fortress(x,y,get_angle(id1)); fire_torpedo_fortress=0; END
        IF(fire_torpedo_fortress>60 AND get_dist(id2)<400) sound(s_6,256,256); torpedo_fortress(x,y,get_angle(id2)); fire_torpedo_fortress=0; END
        IF(space_fortress_health<1) fortress_live=FALSE; END
        FRAME;
        END
        signal(TYPE fortress_arrow,s_kill);
        z=0;
        file=asteroids_file;
        size=130;
        sound(s_explosion,256,256);
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS torpedo1(x,y,angle)

PRIVATE
    torpedo_hit1;
    distance1;

BEGIN
    torpedo_hit1=FALSE;
    ctype=c_scroll;
    advance(20);
    file=space_file;
    graph=10;
    z=100;
    FRAME;
        WHILE (torpedo_hit1==FALSE)
        advance(16);
        distance1+=1;
        IF(collision(TYPE space_player2)) torpedo_hit1=TRUE; space_player2_health-=5; END
        IF(collision(TYPE space_fortress)) torpedo_hit1=TRUE; space_fortress_health-=5; END
        IF(x<0) torpedo_hit1=TRUE; END
        IF(x>2000) torpedo_hit1=TRUE; END
        IF(y<0) torpedo_hit1=TRUE; END
        IF(y>1500) torpedo_hit1=TRUE; END
        IF(distance1>25) signal(id,s_kill); END
        FRAME;
        END
        z=0;
        file=asteroids_file;
        size=40;
        sound(s_explosion,256,256);
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS torpedo2(x,y,angle)

PRIVATE
    torpedo_hit2;
    distance2;

BEGIN
    torpedo_hit2=FALSE;
    ctype=c_scroll;
    advance(20);
    file=space_file;
    graph=10;
    z=100;
        WHILE (torpedo_hit2==FALSE)
        advance(16);
        distance2+=1;
        IF(collision(TYPE space_player1)) torpedo_hit2=TRUE; space_player1_health-=5; END
        IF(collision(TYPE space_fortress)) torpedo_hit2=TRUE; space_fortress_health-=5; END
        IF(x<0) torpedo_hit2=TRUE; END
        IF(x>2000) torpedo_hit2=TRUE; END
        IF(y<0) torpedo_hit2=TRUE; END
        IF(y>1500) torpedo_hit2=TRUE; END
        IF(distance2>25) signal(id,s_kill); END
        FRAME;
        END
        z=0;
        file=asteroids_file;
        size=40;
        sound(s_explosion,256,256);
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS torpedo_fortress(x,y,angle)

PRIVATE
    torpedo_fortress_hit;
    distance3;

BEGIN
    torpedo_fortress_hit=FALSE;
    ctype=c_scroll;
    advance(20);
    file=space_file;
    graph=11;
    z=100;
        WHILE (torpedo_fortress_hit==FALSE)
        advance(16);
        distance3+=1;
        IF(collision(TYPE space_player1)) torpedo_fortress_hit=TRUE; space_player1_health-=20; END
        IF(collision(TYPE space_player2)) torpedo_fortress_hit=TRUE; space_player2_health-=20; END
        IF(x<0) torpedo_fortress_hit=TRUE; END
        IF(x>2000) torpedo_fortress_hit=TRUE; END
        IF(y<0) torpedo_fortress_hit=TRUE; END
        IF(y>1500) torpedo_fortress_hit=TRUE; END
        IF(distance3>30) signal(id,s_kill); END
        FRAME;
        END
        z=0;
        file=asteroids_file;
        size=50;
    sound(s_explosion,256,256);
        FROM graph=100 TO 114;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_arrow()

BEGIN
    file=space_file;
    graph=4;
    x=father.x;
    y=father.y;
    z=-250;
    ctype=c_scroll;
    angle=get_angle(id2);
    region=4;
    LOOP
    x=father.x;
    y=father.y;
    angle=get_angle(id2);
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS fortress_arrow()

BEGIN
    file=space_file;
    graph=6;
    x=father.x;
    y=father.y;
    z=-250;
    ctype=c_scroll;
    angle=get_angle(id3);
    LOOP
    x=father.x;
    y=father.y;
    angle=get_angle(id3);
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player2_arrow()

BEGIN
    file=space_file;
    graph=5;
    x=father.x;
    y=father.y;
    z=-250;
    ctype=c_scroll;
    angle=get_angle(id1);
    region=5;
    LOOP
    x=father.x;
    y=father.y;
    angle=get_angle(id1);
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space_explosion(size,x,y)

BEGIN
    ctype=c_scroll;
    file=asteroids_file;
    z=0;
    sound(s_explosion,256,256);
    FROM graph=100 TO 114;
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS tank_blast_game();

PRIVATE
    tank_floor;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    set_fps(12,12);
    screen=0;
    new_screen=0;
    tank_floor=rand(1,2);
    IF(tank_floor==1) tank_scenery=201; END
    IF(tank_floor==2) tank_scenery=202; END
    start_scroll(0,tank_file,tank_scenery,0,2,15);
    write(main_font,391,324,4,"2 PLAYERS");
    write(main_font,391,344,4,"DEATH MATCH");
    box(main_file,13,391,334,-250,1,TRUE);
    internet_background_bar(391,335);
    sound(s_2,256,256);
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(mouse.left) new_screen=81; END
        IF(key(_enter) OR key(_space) OR key(_2)) new_screen=81; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    stop_scroll(0);
    signal(TYPE internet_background_bar,s_kill);
    signal(TYPE box,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS tank_blast();

PRIVATE;
    levle;

BEGIN
    screen=0;
    new_screen=0;
    mouse.graph=0;
    start_scroll(4,tank_file,tank_scenery,0,4,15);
    start_scroll(5,tank_file,tank_scenery,0,5,15);
    internet_background_bar(391,335);
    levle=rand(1,2);
    IF(levle==1) scenery1(); END
    IF(levle==2) scenery2(); END
    id11=hot_seat_player1(starting_point1_x,starting_point1_y,starting_point1_a);
    id12=hot_seat_player2(starting_point2_x,starting_point2_y,starting_point2_a);
    sound(s_3,256,256);
    sound(s_4,256,256);
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=1; END
        IF(hot_seat_player1_game_over==TRUE) new_screen=82; END
        IF(hot_seat_player2_game_over==TRUE) new_screen=82; END
        FRAME;
    END
    stop_sound(all_sound);
    signal(TYPE scenery1,s_kill);
    signal(TYPE scenery2,s_kill);
    signal(TYPE flag1,s_kill);
    signal(TYPE flag2,s_kill);
    signal(TYPE hot_seat_player1_arrow,s_kill);
    signal(TYPE hot_seat_player2_arrow,s_kill);
    signal(TYPE hot_seat_player1,s_kill);
    signal(TYPE hot_seat_player2,s_kill);
    signal(TYPE hot_seat_turret1,s_kill);
    signal(TYPE hot_seat_turret2,s_kill);
    signal(TYPE bigobject,s_kill);
    signal(TYPE smallobject,s_kill);
    signal(TYPE highobject,s_kill);
    signal(TYPE road,s_kill);
    signal(TYPE splat,s_kill);
    signal(TYPE hot_seat_player1_bullet,s_kill);
    signal(TYPE hot_seat_player1_shell,s_kill);
    signal(TYPE hot_seat_player2_bullet,s_kill);
    signal(TYPE hot_seat_player2_shell,s_kill);
    signal(TYPE civilian1,s_kill);

    stop_scroll(4);
    stop_scroll(5);
    signal(TYPE internet_background_bar,s_kill);
    signal(TYPE box,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS tank_blast_winner();

PRIVATE
    tank_floor;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    fade(100,100,100,64);
    screen=0;
    new_screen=0;
    mouse.file=main_file;
    mouse.graph=5;
    start_scroll(0,tank_file,tank_scenery,0,2,15);
    box(main_file,13,391,334,-250,1,TRUE);
    internet_background_bar(391,335);
    sound(s_2,256,256);
    IF(hot_seat_player1_game_over==TRUE AND hot_seat_player2_game_over==FALSE) write(main_font,391,334,4,"PLAYER 2 WINS!"); END
    IF(hot_seat_player1_game_over==FALSE AND hot_seat_player2_game_over==TRUE) write(main_font,391,334,4,"PLAYER 1 WINS!"); END
    IF(hot_seat_player1_game_over==TRUE AND hot_seat_player2_game_over==TRUE) write(main_font,391,334,4,"DRAW!"); END
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(mouse.left) new_screen=1; END
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    stop_sound(all_sound);
    stop_scroll(0);
    signal(TYPE internet_background_bar,s_kill);
    signal(TYPE box,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS scenery1();

BEGIN
    terrain_minx=0;
    terrain_maxx=800;
    terrain_miny=0;
    terrain_maxy=1000;
    starting_point1_x=400;
    starting_point1_y=80;
    starting_point1_a=270000;
    starting_point2_x=400;
    starting_point2_y=920;
    starting_point2_a=90000;
    road(tank_file,240,400,0,90000);
    road(tank_file,240,402,583,90000);
    road(tank_file,240,404,1000,90000);
    civilian1(160,160,300,300,rand(200,500),rand(0,360000));
    civilian1(160,160,680,440,rand(200,500),rand(0,360000));
    civilian1(160,160,400,540,rand(200,500),rand(0,360000));
    civilian1(160,160,490,370,rand(200,500),rand(0,360000));
    civilian1(160,160,150,670,rand(200,500),rand(0,360000));
    civilian1(160,160,480,650,rand(200,500),rand(0,360000));
    bigobject(tank_file,225,170,750,0);
    bigobject(tank_file,225,0,750,0);
    bigobject(tank_file,225,650,750,0);
    bigobject(tank_file,225,800,750,0);
    bigobject(tank_file,225,170,250,0);
    bigobject(tank_file,225,0,250,0);
    bigobject(tank_file,225,650,250,0);
    bigobject(tank_file,225,800,250,0);
    bigobject(tank_file,225,-100,750,0);
    bigobject(tank_file,225,900,750,0);
    bigobject(tank_file,225,-100,250,0);
    bigobject(tank_file,225,900,250,0);
    bigobject(tank_file,210,170,500,0);
    bigobject(tank_file,212,620,580,0);
    bigobject(tank_file,212,860,430,330000);
    flag1();
    flag2();
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS scenery2();

BEGIN
    terrain_minx=0;
    terrain_maxx=1300;
    terrain_miny=0;
    terrain_maxy=1500;
    starting_point1_x=650;
    starting_point1_y=70;
    starting_point1_a=270000;
    starting_point2_x=175;
    starting_point2_y=1450;
    starting_point2_a=45000;
    bigobject(tank_file,225,1300,500,0);
    bigobject(tank_file,225,1000,500,0);
    bigobject(tank_file,225,0,500,0);
    bigobject(tank_file,225,300,500,0);
    bigobject(tank_file,225,925,500,0);
    bigobject(tank_file,225,764,844,0);
    bigobject(tank_file,225,437,637,90000);
    bigobject(tank_file,225,576,844,0);
    bigobject(tank_file,225,437,706,90000);
    bigobject(tank_file,225,276,844,0);
    bigobject(tank_file,225,0,844,0);
    smallobject(tank_file,226,739,525,0);
    smallobject(tank_file,226,478,525,270000);
    smallobject(tank_file,226,875,980,180000);
    smallobject(tank_file,226,875,1300,270000);
    smallobject(tank_file,226,870,1355,180000);
    road(tank_file,241,735,655,180000);
    road(tank_file,241,611,519,135000);
    road(tank_file,240,585,138,90000);
    road(tank_file,240,585,0,90000);
    road(tank_file,240,1132,685,0);
    road(tank_file,240,1300,685,0);
    road(tank_file,240,1096,1000,90000);
    road(tank_file,240,1104,1499,90000);
    road(tank_file,240,782,1102,0);
    road(tank_file,240,276,1103,0);
    road(tank_file,240,0,1104,0);
    bigobject(tank_file,250,200,665,45000);
    bigobject(tank_file,212,200,1300,56000);
    bigobject(tank_file,212,620,1294,57000);
    bigobject(tank_file,212,207,993,59000);
    bigobject(tank_file,212,623,971,59000);
    bigobject(tank_file,212,617,1364,57000);
    flag1();
    flag2();
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS flag1();

BEGIN
    ctype=c_scroll;
    file=tank_file;
    z=-10;
    x=starting_point1_x;
    y=starting_point1_y;
    graph=20;
    LOOP
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS flag2();

BEGIN
    ctype=c_scroll;
    file=tank_file;
    z=-10;
    x=starting_point2_x;
    y=starting_point2_y;
    graph=21;
    LOOP
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS hot_seat_player1_arrow();

BEGIN
    ctype=c_scroll;
    file=space_file;
    graph=5;
    z=-190;
    LOOP
        angle=get_angle(id12);
        x=father.x;
        y=father.y;
    FRAME;
    END
END

//------------------------------------------------------------------------------

PROCESS hot_seat_player2_arrow();

BEGIN
    ctype=c_scroll;
    file=space_file;
    graph=4;
    z=-190;
    LOOP
        angle=get_angle(id11);
        x=father.x;
        y=father.y;
    FRAME;
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
    scroll[4].camera=id;
    z=-50;
    file=tank_file;
    graph=1;
    hot_seat_player1_arrow();
    hot_seat_turret1(angle);
    sound(s_15,256,256);
    write(main_font,100,92,0,"PLAYER  1's  ARMOUR = ");
    write_int(main_font,300,92,0,& hot_seat_player1_armour);
    FRAME;
        WHILE(hot_seat_player1_armour>0);
        IF(key(_0) AND tank_blast_cheats==TRUE) hot_seat_player1_armour=100; END
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
        IF(collision(TYPE hot_seat_player2) OR collision(TYPE bigobject) OR collision(TYPE smallobject));
            IF(hot_seat_player1_speed=>0) hot_seat_player1_speed=-20; ELSE hot_seat_player1_speed=10; END
        END
        IF(x<terrain_minx) x=terrain_minx; END
        IF(x>terrain_maxx) x=terrain_maxx; END
        IF(y<terrain_miny) y=terrain_miny; END
        IF(y>terrain_maxy) y=terrain_maxy; END
        FRAME;
    END
    game_over_timer=15;
    sound(s_explosion,256,256);
    WHILE(game_over_timer>0);
        fade(200,0,0,5);
        z=-160;
        FILE=asteroids_file;
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
    scroll[5].camera=id;
    z=-50;
    file=tank_file;
    graph=1;
    hot_seat_turret2(angle);
    hot_seat_player2_arrow();
    sound(s_15,256,256);
    write(main_font,500,92,0,"PLAYER  2's  ARMOUR = ");
    write_int(main_font,700,92,0,& hot_seat_player2_armour);
    FRAME;
        WHILE(hot_seat_player2_armour>0);
        IF(key(_1) AND tank_blast_cheats==TRUE) hot_seat_player2_armour=100; END
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
        IF(collision(TYPE hot_seat_player1) OR collision(TYPE bigobject) OR collision(TYPE smallobject));
            IF(hot_seat_player2_speed=>0) hot_seat_player2_speed=-20; ELSE hot_seat_player2_speed=10; END
        END
        IF(x<terrain_minx) x=terrain_minx; END
        IF(x>terrain_maxx) x=terrain_maxx; END
        IF(y<terrain_miny) y=terrain_miny; END
        IF(y>terrain_maxy) y=terrain_maxy; END
        FRAME;
    END
    game_over_timer=15;
    sound(s_explosion,256,256);
    WHILE(game_over_timer>0);
        fade(200,0,0,5);
        z=-160;
        FILE=asteroids_file;
        FROM graph=100 TO 114;
        game_over_timer-=1;
        FRAME(50);
    END
    hot_seat_player2_game_over=TRUE;
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
    file=tank_file;
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
        IF(i_can_fire_bullet>1 AND key(_c_backslash)) sound(s_12,256,256); hot_seat_player1_bullet(x,y,angle); i_can_fire_bullet=0; END
        IF(i_can_fire_shell>30 AND key(_r_shift)) sound(s_13,256,256); hot_seat_player1_shell(x,y,angle); i_can_fire_shell=0; advance(-10); END
        FRAME;
    END
    z=-160;
    FILE=asteroids_file;
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
    file=tank_file;
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
        IF(i_can_fire_bullet>1 AND key(_tab)) sound(s_12,256,256);hot_seat_player2_bullet(x,y,angle); i_can_fire_bullet=0; END
        IF(i_can_fire_shell>30 AND key(_space)) sound(s_13,256,256); hot_seat_player2_shell(x,y,angle); i_can_fire_shell=0; advance(-10); END
        FRAME;
    END
    z=-160;
    FILE=asteroids_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
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
    LOOP
    FRAME;
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

PROCESS splat(x,y);

BEGIN
    ctype=c_scroll;
    z=-30;
    file=tank_file;
    graph=90;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player1_bullet(x,y,angle)

PRIVATE
    hot_seat_player1_bullet_distance_travled;

BEGIN
    ctype=c_scroll;
    z=-60;
    file=tank_file;
    graph=11;
    FRAME;
    WHILE(hot_seat_player1_bullet_distance_travled<600);
    advance(29);
    hot_seat_player1_bullet_distance_travled+=29;
    IF(collision(TYPE bigobject)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) hot_seat_player1_bullet_distance_travled=600; END
    IF(collision(TYPE hot_seat_player2)) hot_seat_player1_bullet_distance_travled=600; hot_seat_player2_armour-=1; END
    IF(collision(TYPE civilian1)) hot_seat_player1_bullet_distance_travled=600; END
    FRAME(75);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player1_shell(x,y,angle)

PRIVATE
    hot_seat_player1_shell_distance_travled;

BEGIN
    ctype=c_scroll;
    z=-70;
    file=tank_file;
    graph=12;
    FRAME;
        WHILE(hot_seat_player1_shell_distance_travled<200);
        advance(30);
        hot_seat_player1_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) hot_seat_player1_shell_distance_travled=300; END
        IF(collision(TYPE hot_seat_player2)) hot_seat_player1_shell_distance_travled=300; hot_seat_player2_armour-=20; END
        IF(collision(TYPE civilian1)) hot_seat_player1_shell_distance_travled=300; END
        FRAME(75);
    END
    z=-160;
    file=asteroids_file;
    FROM graph=100 TO 114;
    FRAME(50);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player2_bullet(x,y,angle)

PRIVATE
    hot_seat_player2_bullet_distance_travled;

BEGIN
    ctype=c_scroll;
    z=-60;
    file=tank_file;
    graph=11;
    FRAME;
    WHILE(hot_seat_player2_bullet_distance_travled<600);
    advance(29);
    hot_seat_player2_bullet_distance_travled+=29;
    IF(collision(TYPE bigobject)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE smallobject)) hot_seat_player2_bullet_distance_travled=600; END
    IF(collision(TYPE hot_seat_player1)) hot_seat_player2_bullet_distance_travled=600; hot_seat_player1_armour-=1; END
    IF(collision(TYPE civilian1)) hot_seat_player2_bullet_distance_travled=600; END
    FRAME(75);
    END
END

//-----------------------------------------------------------------------------

PROCESS hot_seat_player2_shell(x,y,angle)

PRIVATE
    hot_seat_player2_shell_distance_travled;

BEGIN
    ctype=c_scroll;
    z=-70;
    file=tank_file;
    graph=12;
    FRAME;
        WHILE(hot_seat_player2_shell_distance_travled<200);
        advance(30);
        hot_seat_player2_shell_distance_travled+=20;
        IF(collision(TYPE bigobject)) hot_seat_player2_shell_distance_travled=300; END
        IF(collision(TYPE hot_seat_player1)) hot_seat_player2_shell_distance_travled=300; hot_seat_player1_armour-=20; END
        IF(collision(TYPE civilian1)) hot_seat_player2_shell_distance_travled=300; END
        FRAME(75);
    END
    z=-160;
    file=asteroids_file;
    FROM graph=100 TO 114;
    FRAME(50);
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
    file=tank_file;
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
        IF(NOT collision(TYPE bigobject) AND civilian_1_notice_player1==TRUE) angle=get_angle(id2)-180000; advance(5); END
        IF(NOT collision(TYPE bigobject) AND civilian_1_notice_hot_seat_player1==TRUE) angle=get_angle(id11)-180000; advance(5); END
        IF(NOT collision(TYPE bigobject) AND civilian_1_notice_hot_seat_player2==TRUE) angle=get_angle(id12)-180000; advance(5); END
        IF(civilian_1_notice_player1==FALSE AND civilian_1_notice_hot_seat_player1==FALSE AND civilian_1_notice_hot_seat_player2==FALSE) angle=angle; advance(3); civilian_1_distance_travled+=3; END
        IF(civilian_1_distance_travled>distance_to_travle) angle+=180000; civilian_1_distance_travled=0; END
        IF(collision(TYPE bigobject)) angle-=135000; END
        IF(collision(TYPE smallobject)) angle+=135000; END
        IF(collision(TYPE hot_seat_player1_bullet)) sound(s_14,256,256); civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player1_shell))  sound(s_14,256,256); civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player1)) sound(s_14,256,256);  civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player2_bullet)) sound(s_14,256,256);  civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player2_shell)) sound(s_14,256,256);  civilian_1_alive=FALSE; END
        IF(collision(TYPE hot_seat_player2))  sound(s_14,256,256); civilian_1_alive=FALSE; END
        FRAME;
    END
    file=tank_file;
    graph=0;
    splat(x,y);
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

