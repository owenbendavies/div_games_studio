
//-----------------------------------------------------------------------------------------------
//
//  TITLE       Cyber - Genoids
//  AUTHOR      Owen Davies
//  COPYRITE    Owen Games (c) 2004
//
//-----------------------------------------------------------------------------------------------

PROGRAM cyber_genoids;

CONST
    levle1_enemys=29;
    player_speed=47;

GLOBAL
    enemy1_body[]=16,19,18,17,16,15,14,13,12,11,10,9,8,7,22,21,20;
    enemy1_walk01[]=4,-51,79,51,23;
    enemy1_walk02[]=4,-52,80,52,24;
    enemy1_walk03[]=4,-53,81,53,25;
    enemy1_walk04[]=4,-54,82,54,26;
    enemy1_walk05[]=4,-55,83,55,27;
    enemy1_walk06[]=4,-56,84,56,28;
    enemy1_walk07[]=4,-57,85,57,29;
    enemy1_walk08[]=4,-58,86,58,30;
    enemy1_walk09[]=4,-59,87,59,31;
    enemy1_walk10[]=4,-60,88,60,32;
    enemy1_walk11[]=4,-61,89,61,33;
    enemy1_walk12[]=4,-62,90,62,34;
    enemy1_walk13[]=4,-63,91,63,35;
    enemy1_walk14[]=4,-64,92,64,36;
    enemy1_walk15[]=4,-65,93,65,37;
    enemy1_walk16[]=4,-66,94,66,38;
    enemy1_walk17[]=4,-67,95,67,39;
    enemy1_walk18[]=4,-68,96,68,40;
    enemy1_walk19[]=4,-69,97,69,41;
    enemy1_walk20[]=4,-70,98,70,42;
    enemy1_walk21[]=4,-71,99,71,43;
    enemy1_walk22[]=4,-72,100,72,44;
    enemy1_walk23[]=4,-73,101,73,45;
    enemy1_walk24[]=4,-74,102,74,46;
    enemy1_walk25[]=4,-75,103,75,47;
    enemy1_walk26[]=4,-76,104,76,48;
    enemy1_walk27[]=4,-77,105,77,49;
    enemy1_walk28[]=4,-78,106,78,50;

    assault_riffle[]=16,201,202,203,204,205,206,207,208,209,-208,-207,-206,-205,-204,-203,-202;
    pulse_riffle[]=16,210,211,212,213,214,215,216,217,218,-217,-216,-215,-214,-213,-212,-211;
    sniper_riffle[]=16,220,221,222,223,224,225,226,227,228,-227,-226,-225,-224,-223,-222,-221;
    shotgun[]=16,229,230,231,232,233,234,235,236,237,-236,-235,-234,-233,-232,-231,-230,-229;

    jump_jet[]=2,50,-50;

    main_file;
    player_file;
    effects_file;
    explosion_file;

    enemy1_file;

    scenery_file;
    levle_world;

    main_font;
    red_font;
    black_font;
    small_font;

    id_film_camera;

    id_player;
    id_sniper_camera;
    id_mission_camera;

    number_of_enemys;

    number_of_bullet_holes;

    game_loaded;

    STRUCT cyber_genoids_game[0]
        volume,
        grass,
        blood_levle,
        no_times_on_game,
        ever_saved,
        film_subtitels,
    END

    STRUCT player_data[0]
        levle,
        x,
        y,
        angle,
        walking,
        crouching,
        z,
        camera_height,
        health,          shooting,
        weapon,
        ammo1a,
        ammo1b,
        ammo2a,
        ammo3a,
        ammo4a,
        outside,
        night_vission,
        night_vission_timer,
        sector,
        scope,
        mission_point,
        levle_time,
        shots_fired,
        shots_hit;
    END

    STRUCT mission_points[8]
        z,
        angle1,
        angle2,
        zangle;
    END

    mission_texts[]="","TURN OFF THE ENERGY CRYSTAL","UNLOCK THE OUTER DOOR","SNIPE THE SENTINAL","BREAK INTO THE MAIN BLOCK","GET INTO THE CONTROL CENTRE","SIGNAL A JUMP JET","ESCAPE IN THE JUMP JET";

    STRUCT enemy_data[50]
        x,
        y,
        z,
        angle,
        health,
        notice_player,
        x1,
        y1,
        x2,
        y2;
    END

    STRUCT levle_data[1]
        door1_open,
        door2_open,
        door3_open,
        door4_open,
        door5_open,
        door6_open,
        door7_open,
        door8_open,
        door9_open,
        door10_open,
        door11_open,
        door12_open,
        pickup1,
        pickup2,
        pickup3,
        pickup5,
        pickup6,
        pickup7,
        pickup8,
        pickup9,
        pickup10,
        pannel1,
        pannel2,
        pannel3,
        pannel4,
        lift2,
        key1;
        key1_x;
        key1_y;
    END

    pause_mouse_x;
    pause_mouse_y;

    music_wav;
    rain_wav;
    thunder_wav;
    bullet_wav;
    shotgun_wav;
    launcher_wav;
    explosion_wav;

    music_channel;
    rain_channel;
    thunder_channel;
    player_shot_channel;
    explosion_channel;
    enemy_shot_channel;

    game_screen;

    film_camera=FALSE;

    owen="bdf948ao39fj390";

PRIVATE

    main_timer;
    main_timer2;

    STRING game_over_text="";
    game_over_text_letter;

    blood_levle_text;
    grass_levle_text;
    game_saved_text;
    film_text;

BEGIN
    ignore_error(156);
    draw_z=-255;
    cyber_genoids_game[0].volume=250;
    cyber_genoids_game[0].blood_levle=3;
    cyber_genoids_game[0].grass=1;

    load_pal("pal\cg\palette.pal");

    set_mode(m800x600);
    set_fps(30,30);

    main_font=load_fnt("fnt\cg\main.fnt");

    red_font=load_fnt("fnt\cg\red.fnt");
    black_font=load_fnt("fnt\cg\black.fnt");
    small_font=load_fnt("fnt\cg\small.fnt");

    decode_file("fpg\cg\main.fpg",owen);

    main_file=load_fpg("fpg\cg\main.fpg");

    music_wav=load_wav("wav\music.wav",1);
    rain_wav=load_wav("wav\rain.wav",1);
    thunder_wav=load_wav("wav\thunder.wav",0);
    bullet_wav=load_wav("wav\bullet.wav",0);
    shotgun_wav=load_wav("wav\shotgun.wav",0);
    launcher_wav=load_wav("wav\launcher.wav",0);
    explosion_wav=load_wav("wav\explos.wav",0);

    load("dat\cg\info.dat",& cyber_genoids_game);
    cyber_genoids_game[0].no_times_on_game+=1;
    save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game));
    IF(cyber_genoids_game[0].no_times_on_game==1) game_screen=22; END
    IF(cyber_genoids_game[0].no_times_on_game>1) game_screen=1; END
    LOOP

        SWITCH(game_screen)

            CASE 1: // Owen Games

//                write_int(0,10,10,0,& cyber_genoids_game[0].no_times_on_game);
//                write_int(0,10,20,0,& cyber_genoids_game[0].ever_saved);
                put(main_file,2,400,300);
                mouse.file=main_file;
                mouse.graph=1;
                LOOP
//                    IF(key(_F1)) cyber_genoids_game[0].no_times_on_game=0; cyber_genoids_game[0].volume=250; cyber_genoids_game[0].blood_levle=3; cyber_genoids_game[0].grass=1; cyber_genoids_game[0].film_subtitels=TRUE; save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END
//                    IF(key(_F2)) cyber_genoids_game[0].ever_saved=FALSE; save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); save("dat\cg\levle.dat",& levle_data,sizeof(levle_data)); save("dat\cg\player.dat",& player_data,sizeof(player_data)); save("dat\cg\enemy.dat",& enemy_data,sizeof(enemy_data)); END
                    IF(key(_esc)) WHILE(key(_esc)) FRAME; END game_screen=2; BREAK; END
                    IF(mouse.left OR key(_space) OR key(_enter)) WHILE(mouse.left OR key(_space) OR key(_enter)) FRAME; END game_screen=2; BREAK; END
                FRAME;
                END
                mouse.graph=0;
                clear_screen();
            END

            CASE 2: // Div Games
                put(main_file,4,400,225);
                put(main_file,3,400,475);
                mouse.file=main_file;
                mouse.graph=1;
                LOOP
                    IF(key(_esc)) WHILE(key(_esc)) FRAME; END game_screen=3; BREAK; END
                    IF(mouse.left OR key(_space) OR key(_enter)) WHILE(mouse.left OR key(_space) OR key(_enter)) FRAME; END game_screen=3; BREAK; END
                FRAME;
                END
                mouse.graph=0;
                clear_screen();
            END

            CASE 3: // Main Menu
                mouse.graph=1;
                write(main_font,400,100,4,"CYBER-GENOIDS");
                write(main_font,400,105,4,"___________________");
                write(main_font,400,250,4,"NEW GAME");
                write(main_font,400,255,4,"_____________");
                IF(cyber_genoids_game[0].ever_saved==TRUE) write(main_font,400,300,4,"LOAD GAME"); ELSE write(black_font,400,300,4,"LOAD GAME"); END
                write(main_font,400,350,4,"OPTIONS");
                write(main_font,400,400,4,"EXIT");
                write(small_font,400,555,4,"Version (1.2)");
                write(red_font,400,575,4,"Owen Games (c) 2003");

                IF(scroll[0].y1==0) start_scroll(0,main_file,50,5,0,15); END
                LOOP
                    IF(key(_esc)) WHILE(key(_esc)) scroll.y1-=1; FRAME; END game_screen=19; BREAK; END
                    IF(mouse.left AND mouse.y>225 AND mouse.y<275) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_screen=101; BREAK; END
                    IF(cyber_genoids_game[0].ever_saved==TRUE AND mouse.left AND mouse.y>275 AND mouse.y<325) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_loaded=TRUE; load("dat\cg\levle.dat",& levle_data); load("dat\cg\player.dat",& player_data); load("dat\cg\enemy.dat",& enemy_data); IF(player_data[0].levle==0) game_screen=100; END IF(player_data[0].levle==1) game_screen=101; END BREAK; END
                    IF(mouse.left AND mouse.y>325 AND mouse.y<375) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_screen=4; BREAK; END
                    IF(mouse.left AND mouse.y>375 AND mouse.y<425) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_screen=19; BREAK; END
                    scroll.y1-=1;
                FRAME;
                END
                IF(game_screen<>4) stop_scroll(0); END
                delete_text(all_text);
                mouse.graph=0;
            END

            CASE 4: // Options
                mouse.graph=1;
                write(main_font,400,100,4,"CYBER-GENOIDS");
                write(main_font,400,105,4,"___________________");
                IF(cyber_genoids_game[0].blood_levle==1) blood_levle_text=write(main_font,400,300,4,"NO BLOOD"); END
                IF(cyber_genoids_game[0].blood_levle==2) blood_levle_text=write(main_font,400,300,4,"GREEN BLOOD"); END
                IF(cyber_genoids_game[0].blood_levle==3) blood_levle_text=write(main_font,400,300,4,"RED BLOOD"); END
                IF(cyber_genoids_game[0].grass==0) grass_levle_text=write(main_font,400,250,4,"LOW SCENERY & EFFECTS (765 MHz -)"); END
                IF(cyber_genoids_game[0].grass==1) grass_levle_text=write(main_font,400,250,4,"MEDIUM SCENERY & EFFECTS (765 MHz - 1.2 GHz)"); END
                IF(cyber_genoids_game[0].grass==2) grass_levle_text=write(main_font,400,250,4,"HIGH SCENERY & EFFECTS (1.2 GHz +)"); END
                IF(cyber_genoids_game[0].film_subtitels==TRUE) film_text=write(main_font,400,350,4,"FILM SUBTITLES"); END
                IF(cyber_genoids_game[0].film_subtitels==FALSE) film_text=write(main_font,400,350,4,"NO FILM SUBTITLES"); END
                write(main_font,400,400,4,"CONTROLS");
                write(main_font,400,450,4,"BACK");
                write(small_font,400,555,4,"Version (1.2)");
                write(red_font,400,575,4,"Owen Games (c) 2003");


                write(main_font,400,150,4,"VOLUME");
                volume_option(main_file,6,300,145,-250,0,0,0);
                volume_option(main_file,6,498,145,-250,0,1,0);
                volume_option(main_file,7,405,185,-250,0,0,0);
                volume_option(main_file,8,405,185,-250,0,0,2);
                LOOP
                    define_region(2,230,175,cyber_genoids_game[0].volume*14/10,20);
                    IF(cyber_genoids_game[0].volume>0 AND mouse.left AND mouse.x>280 AND mouse.x<320 AND mouse.y>130 AND mouse.y<170) cyber_genoids_game[0].volume-=10; save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END
                    IF(cyber_genoids_game[0].volume<250 AND mouse.left AND mouse.x>490 AND mouse.x<530 AND mouse.y>130 AND mouse.y<170) cyber_genoids_game[0].volume+=10; save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END

                    IF(mouse.left AND mouse.y>225 AND mouse.y<275 AND cyber_genoids_game[0].grass==0) WHILE(mouse.left) scroll.y1-=1; FRAME; END delete_text(grass_levle_text); cyber_genoids_game[0].grass=2; grass_levle_text=write(main_font,400,250,4,"HIGH SCENERY & EFFECTS (1.2 GHz +)"); save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END
                    IF(mouse.left AND mouse.y>225 AND mouse.y<275 AND cyber_genoids_game[0].grass==1) WHILE(mouse.left) scroll.y1-=1; FRAME; END delete_text(grass_levle_text); cyber_genoids_game[0].grass=0; grass_levle_text=write(main_font,400,250,4,"LOW SCENERY & EFFECTS (765 MHz -)"); save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END
                    IF(mouse.left AND mouse.y>225 AND mouse.y<275 AND cyber_genoids_game[0].grass==2) WHILE(mouse.left) scroll.y1-=1; FRAME; END delete_text(grass_levle_text); cyber_genoids_game[0].grass=1; grass_levle_text=write(main_font,400,250,4,"MEDIUM SCENERY & EFFECTS (765 MHz - 1.2 GHz)"); save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END

                    IF(mouse.left AND mouse.y>275 AND mouse.y<325) WHILE(mouse.left) scroll.y1-=1; FRAME; END delete_text(blood_levle_text); cyber_genoids_game[0].blood_levle-=1; IF(cyber_genoids_game[0].blood_levle<1) cyber_genoids_game[0].blood_levle=3; END IF(cyber_genoids_game[0].blood_levle==1) blood_levle_text=write(main_font,400,300,4,"NO BLOOD"); END IF(cyber_genoids_game[0].blood_levle==2) blood_levle_text=write(main_font,400,300,4,"GREEN BLOOD"); END IF(cyber_genoids_game[0].blood_levle==3) blood_levle_text=write(main_font,400,300,4,"RED BLOOD"); END save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); END
                    IF(mouse.left AND mouse.y>325 AND mouse.y<375) WHILE(mouse.left) scroll.y1-=1; FRAME; END delete_text(film_text); IF(cyber_genoids_game[0].film_subtitels==FALSE) cyber_genoids_game[0].film_subtitels=TRUE; film_text=write(main_font,400,350,4,"FILM SUBTITLES"); ELSE cyber_genoids_game[0].film_subtitels=FALSE; film_text=write(main_font,400,350,4,"NO FILM SUBTITLES"); END END
                    IF(mouse.left AND mouse.y>375 AND mouse.y<425) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_screen=5; BREAK; END
                    IF(mouse.left AND mouse.y>425 AND mouse.y<475) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_screen=3; BREAK; END
                    IF(key(_esc)) WHILE(key(_esc)) scroll.y1-=1; FRAME; END game_screen=3; BREAK; END
                    scroll.y1-=1;
                FRAME;
                END
                signal(TYPE volume_option,s_kill);
                delete_text(all_text);
                mouse.graph=0;
            END

            CASE 5: // Controls
                mouse.graph=1;

                write(main_font,400,100,4,"CYBER-GENOIDS");
                write(main_font,400,105,4,"___________________");

                write(red_font,50,140,3,"LOOK");                    write(red_font,300,140,3,"MOUSE");

                write(red_font,50,180,3,"FORWARD");                 write(red_font,300,180,3,"W");
                write(red_font,50,200,3,"BACKWARD");                write(red_font,300,200,3,"S");
                write(red_font,50,220,3,"STRAFE LEFT");             write(red_font,300,220,3,"A");
                write(red_font,50,240,3,"STRAFE RIGHT");            write(red_font,300,240,3,"D");

                write(red_font,50,280,3,"USE");                     write(red_font,300,280,3,"CTRL");

                write(red_font,50,360,3,"FIRST FUNCTION");          write(red_font,300,360,3,"MOUSE 1");

                write(red_font,50,400,3,"ASSAULT RIFLE");           write(red_font,300,400,3,"1");
                write(red_font,50,420,3,"SHOT GUN");                write(red_font,300,420,3,"2");
                write(red_font,50,440,3,"SNIPER RIFLE");            write(red_font,300,440,3,"3");
                write(red_font,50,460,3,"PULSE RIFLE");             write(red_font,300,460,3,"4");

                write(red_font,450,140,3,"JUMP");                   write(red_font,700,140,3,"SPACE");
                write(red_font,450,160,3,"CROUCH");                 write(red_font,700,160,3,"C");

                write(red_font,450,200,3,"SAVE");                   write(red_font,700,200,3,"F 4");
                write(red_font,450,220,3,"PAUSE");                  write(red_font,700,220,3,"F 1");
                write(red_font,450,240,3,"EXIT");                   write(red_font,700,240,3,"ESC");

                write(red_font,450,280,3,"NIGHT VISION");          write(red_font,700,280,3,"N");

                write(red_font,450,360,3,"SECOND FUNCTION");        write(red_font,700,360,3,"MOUSE 2");

                write(red_font,450,400,3,"GRANADE LAUNCHER");       write(red_font,700,400,3,"1");
                write(red_font,450,420,3,"SMALL SPREAD FIRE");      write(red_font,700,420,3,"2");
                write(red_font,450,440,3,"SNIPER ZOOM");            write(red_font,700,440,3,"3");
                write(red_font,450,460,3,"EXPLODE PULSE");          write(red_font,700,460,3,"4");

                write(red_font,50,500,3,"ZOOM IN");                 write(red_font,300,500,3,"MOUSE 2");
                write(red_font,450,500,3,"ZOOM OUT");               write(red_font,700,500,3,"M3 / SHIFT");

                write(main_font,400,540,4,"BACK");

                write(small_font,400,555,4,"Version (1.2)");
                write(red_font,400,575,4,"Owen Games (c) 2003");

                LOOP
                    IF(mouse.left AND mouse.y>515 AND mouse.y<565) WHILE(mouse.left) scroll.y1-=1; FRAME; END game_screen=4; BREAK; END
                    IF(key(_esc)) WHILE(key(_esc)) scroll.y1-=1; FRAME; END game_screen=4; BREAK; END
                    scroll.y1-=1;
                FRAME;
                END
                delete_text(all_text);
                mouse.graph=0;
            END

            CASE 10: // Game Over
                mouse.graph=1;
                game_over_text="";
                write(main_font,315,300,3,game_over_text);
                main_timer=0;
                game_over_text_letter=1;
                fade(100,100,100,4);
                LOOP
                    IF(main_timer<20) main_timer+=1; END
                    IF(main_timer>8);
                        SWITCH (game_over_text_letter);
                            CASE 1: strcat(game_over_text,"G"); END
                            CASE 2: strcat(game_over_text,"A"); END
                            CASE 3: strcat(game_over_text,"M"); END
                            CASE 4: strcat(game_over_text,"E"); END
                            CASE 5: strcat(game_over_text," "); END
                            CASE 6: strcat(game_over_text,"O"); END
                            CASE 7: strcat(game_over_text,"V"); END
                            CASE 8: strcat(game_over_text,"E"); END
                            CASE 9: strcat(game_over_text,"R"); END
                            CASE 10: strcat(game_over_text," ."); END
                            CASE 11: strcat(game_over_text," ."); END
                            CASE 12: strcat(game_over_text," ."); END
                        END
                        game_over_text_letter+=1;
                        main_timer=0;
                    END
                    IF(game_over_text_letter=>12);
                    IF(key(_esc)) WHILE(key(_esc)) FRAME; END game_screen=1; BREAK; END
                    IF(mouse.left OR key(_space) OR key(_enter)) WHILE(mouse.left OR key(_space) OR key(_enter)) FRAME; END game_screen=1; BREAK; END
                    END
                FRAME;
                END
                fade(200,100,100,2);
                WHILE(fading==TRUE)
                    FRAME;
                END
                fade(100,100,100,64);
                delete_text(all_text);
                mouse.graph=0;
            END

            CASE 19: // Credits
                mouse.graph=1;
                put(main_file,4,400,150);
                write(main_font,400,310,4,"CREATED BY");
                write(main_font,400,315,4,"_______________");
                write(main_font,400,340,4,"OWEN DAVIES");
                put(main_file,3,400,475);
                write(red_font,400,575,4,"Owen Games (c) 2003");
                LOOP
                    IF(key(_esc)) WHILE(key(_esc)) FRAME; END game_screen=20; BREAK; END
                    IF(mouse.left OR key(_enter) OR key(_space)) WHILE(mouse.left OR key(_space) OR key(_enter)) FRAME; END game_screen=20; BREAK; END
                FRAME;
                END
                clear_screen();
                delete_text(all_text);
                mouse.graph=0;
            END

            CASE 20: // Exit

                fade_off();
                write(main_font,400,300,4,"LOADING . . . ");
                fade_on();
                WHILE(fading);
                    FRAME;
                END
                encode_file("fpg\cg\main.fpg",owen);
                fade_off();
                WHILE(fading)
                    FRAME;
                END
                delete_text(all_text);
                exit("Owen Games (c) 2003",0);
            END

            CASE 22: // WELCOME
                mouse.graph=1;
                main_timer=0;
                put(main_file,9,400,305);
                LOOP
                    main_timer+=1;
                    IF(main_timer>60 AND key(_esc)) WHILE(key(_esc)) FRAME; END game_screen=1; BREAK; END
                    IF(main_timer>60 AND mouse.left OR key(_space) OR key(_enter)) WHILE(mouse.left OR key(_space) OR key(_enter)) FRAME; END game_screen=1; BREAK; END
                   FRAME;
                END
                clear_screen();
                delete_text(all_text);
                mouse.graph=0;
            END

            CASE 101: // levle 1

                fade_off();
                write(main_font,400,300,4,"LOADING . . . ");
                fade_on();
                WHILE(fading);
                    FRAME;
                END
               decode_file("fpg\cg\player.fpg",owen);
               decode_file("fpg\cg\effects.fpg",owen);
               decode_file("fpg\cg\enemy1.fpg",owen);
               decode_file("fpg\cg\scenery.fpg",owen);
               decode_file("fpg\cg\explos.fpg",owen);
               decode_file("wld\cg\levle1.wld",owen);

                player_file=load_fpg("fpg\cg\player.fpg");
                effects_file=load_fpg("fpg\cg\effects.fpg");
                explosion_file=load_fpg("fpg\cg\explos.fpg");
                enemy1_file=load_fpg("fpg\cg\enemy1.fpg");
                scenery_file=load_fpg("fpg\cg\scenery.fpg");

                levle_world=load_wld("wld\cg\levle1.wld",scenery_file);

                fade_off();
                WHILE(fading)
                    FRAME;
                END
                delete_text(all_text);
                fade_on();

                IF(game_loaded==FALSE)
                    player_data[0].levle=1;
                    player_data[0].x=13200;
                    player_data[0].y=2300;
                    player_data[0].angle=0;
                    player_data[0].walking=FALSE;
                    player_data[0].crouching=FALSE;
                    player_data[0].z=1000;
                    player_data[0].camera_height=330;
                    player_data[0].health=100;
                    player_data[0].shooting=FALSE;
                    player_data[0].weapon=1;
                    player_data[0].ammo1a=100;
                    player_data[0].ammo1b=3;
                    player_data[0].ammo2a=0;
                    player_data[0].ammo3a=0;
                    player_data[0].ammo4a=0;
                    player_data[0].outside=FALSE;
                    player_data[0].night_vission=FALSE;
                    player_data[0].scope=FALSE;
                    player_data[0].mission_point=1;
                    player_data[0].levle_time=0;
                    player_data[0].shots_fired=0;
                    player_data[0].shots_hit=0;
                END

                    mission_points[1].z=500;
                    mission_points[1].angle1=280000;
                    mission_points[1].angle2=320000;
                    mission_points[1].zangle=-50;

                    mission_points[2].z=500;
                    mission_points[2].angle1=0;
                    mission_points[2].angle2=40000;
                    mission_points[2].zangle=-50;

                    mission_points[3].z=1280;
                    mission_points[3].angle1=0;
                    mission_points[3].angle2=40000;
                    mission_points[3].zangle=-100;

                    mission_points[4].z=800;
                    mission_points[4].angle1=300000;
                    mission_points[4].angle2=350000;
                    mission_points[4].zangle=-100;

                    mission_points[5].z=500;
                    mission_points[5].angle1=250000;
                    mission_points[5].angle2=290000;
                    mission_points[5].zangle=-50;

                    mission_points[6].z=500;
                    mission_points[6].angle1=180000;
                    mission_points[6].angle2=220000;
                    mission_points[6].zangle=-50;

                    mission_points[7].z=500;
                    mission_points[7].angle1=250000;
                    mission_points[7].angle2=290000;
                    mission_points[7].zangle=-80;

                    mission_points[8].z=500;
                    mission_points[8].angle1=250000;
                    mission_points[8].angle2=290000;
                    mission_points[8].zangle=-80;

                film_camera=FALSE;
                id_player=player(player_data[0].x,player_data[0].y,player_data[0].angle);
                start_mode8(id_player,1,0);

                id_sniper_camera=sniper_camera();
                define_region(1,1,1,2,2);
                start_mode8(id_sniper_camera,2,1);

                id_mission_camera=mission_camera();
                define_region(4,40,460,160,120);
                start_mode8(id_mission_camera,3,4);

                levle1();

                music_channel=sound(music_wav,cyber_genoids_game[0].volume,256);
                rain_channel=sound(rain_wav,cyber_genoids_game[0].volume,256);

                game_saved_text=write(main_font,400,-50,4,"- - - GAME SAVED - - -");
                main_timer=0;
                main_timer2=0;
                LOOP
                    IF(key(_F4)) WHILE(key(_F4)) FRAME; END move_text(game_saved_text,400,65); main_timer=1; cyber_genoids_game[0].ever_saved=TRUE; save("dat\cg\info.dat",& cyber_genoids_game,sizeof(cyber_genoids_game)); save("dat\cg\levle.dat",& levle_data,sizeof(levle_data)); save("dat\cg\player.dat",& player_data,sizeof(player_data)); save("dat\cg\enemy.dat",& enemy_data,sizeof(enemy_data)); END
                    IF(main_timer=>1) main_timer+=1; IF(main_timer>30) move_text(game_saved_text,400,-50); main_timer=0; END END
                    IF(key(_esc)) WHILE(key(_esc)) FRAME; END game_screen=3; BREAK; END
                    IF(player_data[0].health==-100) game_screen=10; BREAK; END

                    IF(player_data[0].mission_point==8) main_timer2+=1; END
                    IF(main_timer2==50) write(main_font,400,480,4,"PUSH ANY KEY TO CONTINUE"); END
                    IF(main_timer2>50 AND player_data[0].mission_point==8 AND (mouse.left OR mouse.right OR scan_code>0)); game_screen=3; BREAK; END
                FRAME;
                END

                game_loaded=FALSE;
                IF(player_data[0].health>0) fade(100,100,100,64); END

                signal(TYPE levle1,s_kill);
                signal(TYPE pause,s_kill);
                signal(TYPE player,s_kill);
                signal(TYPE sniper_camera,s_kill);
                signal(TYPE sniper_edge,s_kill);
                signal(TYPE sniper,s_kill);
                signal(TYPE player_weapon,s_kill);
                signal(TYPE player_bar,s_kill);
                signal(TYPE icons,s_kill);
                signal(TYPE night_vission,s_kill);
                signal(TYPE rain_drop,s_kill);
                signal(TYPE player_weapon_flash,s_kill);
                signal(TYPE cross_head,s_kill);
                signal(TYPE enemy1,s_kill);
                signal(TYPE gun_flash,s_kill);
                signal(TYPE m8_text,s_kill);
                signal(TYPE shadow,s_kill);
                signal(TYPE player_bullet,s_kill);
                signal(TYPE player_zap,s_kill);
                signal(TYPE player_granade,s_kill);
                signal(TYPE player_shot,s_kill);
                signal(TYPE player_sniper_bullet,s_kill);
                signal(TYPE enemy_bullet,s_kill);
                signal(TYPE bullet_hole,s_kill);
                signal(TYPE enemy_blood,s_kill);
                signal(TYPE liquid,s_kill);
                signal(TYPE lasser_beam,s_kill);
                signal(TYPE grass,s_kill);
                signal(TYPE m8_to_screen,s_kill);
                signal(TYPE pickup,s_kill);
                signal(TYPE mission_camera,s_kill);
                signal(TYPE key_icon,s_kill);
                signal(TYPE ship,s_kill);
                signal(TYPE spark,s_kill);

                stop_mode8(1);
                stop_mode8(2);
                clear_screen();
                delete_draw(all_drawing);

                stop_sound(all_sound);

                delete_text(all_text);

                IF(player_data[0].health>0)
                    fade_off();
                    write(main_font,400,300,4,"LOADING . . . ");
                    fade_on();
                    WHILE(fading);
                        FRAME;
                    END
                END
                unload_fpg(player_file);
                unload_fpg(effects_file);
                unload_fpg(explosion_file);
                unload_fpg(scenery_file);
                unload_fpg(enemy1_file);
                encode_file("fpg\cg\scenery.fpg",owen);
                encode_file("fpg\cg\explos.fpg",owen);
                encode_file("wld\cg\effects.fpg",owen);
                encode_file("wld\cg\player.fpg",owen);
                encode_file("wld\cg\enemy1.fpg",owen);
                encode_file("wld\cg\levle1.wld",owen);
                IF(player_data[0].health>0)
                    fade_off();
                    WHILE(fading)
                        FRAME;
                    END
                END
                delete_text(all_text);
                IF(player_data[0].health>0) fade_on(); END
            END

        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS volume_option(file,graph,x,y,z,angle,flags,region);

BEGIN
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS levle1();

PRIVATE
    info_text;
    mission_text;
    xmission;

    player_x_health;

    levle_loop;
    fog1=0;
    fog2=700;

    door1_sector=14;
    door1_floor=2000;
    door1_x=7700;
    door1_y=15800;
    door1_timer=0;
    door1_height=0;

    door2_sector=18;
    door2_floor=2000;
    door2_x=5300;
    door2_y=15800;
    door2_timer=0;
    door2_height=0;

    door3_sector=22;
    door3_floor=2000;
    door3_x=4500;
    door3_y=15400;
    door3_timer=0;
    door3_height=0;

    door4_sector=27;
    door4_floor=2000;
    door4_x=8400;
    door4_y=15400;
    door4_timer=0;
    door4_height=0;

    door5_sector1=42;
    door5_sector2=43;
    door5_floor=2000;
    door5_x=12300;
    door5_y=16700;
    door5_timer=0;
    door5_height=0;

    door6_sector=94;
    door6_floor=2512;
    door6_x=15000;
    door6_y=19770;
    door6_timer=0;
    door6_height=0;

    door7_sector=107;
    door7_floor=2000;
    door7_x=14200;
    door7_y=14650;
    door7_height=0;
    door7_timer=0;
    lift1_sector=98;
    lift1_floor=2000;
    lift1_height=640;

    door8_sector=111;
    door8_floor=2000;
    door8_x=5300;
    door8_y=18880;
    door8_timer=0;
    door8_height=0;

    door9_sector=115;
    door9_floor=2000;
    door9_x=8450;
    door9_y=19700;
    door9_timer=0;
    door9_height=0;

    door10_sector=119;
    door10_floor=2000;
    door10_x=8450;
    door10_y=21300;
    door10_timer=0;
    door10_height=0;

    door11_sector1=134;
    door11_sector2=135;
    door11_sector3=136;
    door11_sector4=137;
    door11_sector5=128;
    door11_floor=2000;
    door11_x=9860;
    door11_y=18200;
    door11_timer=0;
    door11_height=512;

    door12_sector=359;
    door12_floor=2512;
    door12_x=16500;
    door12_y=22000;
    door12_timer=0;
    door12_height=0;

    pannel1_x=5000;
    pannel1_y=21600;

    pannel2_x=9000;
    pannel2_y=16800;

    pannel3_x=14500;
    pannel3_y=21600;

    pannel4_x=16800;
    pannel4_y=20064;

    enemy_counter;
    enemy_killed;
    enemy_wounded;
    levle_mins;
    levle_secs;
    accuracy;

    lift2_sector=317;
    lift2_floor=2000;
    lift2_x=12300;
    lift2_y=18500;
    lift2_height=600;

BEGIN

    info_text=write(0,0,0,0,"");

    file=player_file;
    IF(game_loaded==FALSE) graph=0; ELSE IF(player_data[0].night_vission==TRUE) graph=50; END END
    z=-253;
    x=400;
    y=300;
    player_x_health=player_data[0].health;

    pause();
    define_region(3,0,(600-(player_data[0].night_vission_timer/2)),14,(player_data[0].night_vission_timer/2));
    night_vission();

    number_of_bullet_holes=0;

    lasser_beam(225,1);
    lasser_beam(220,2);
    lasser_beam(220,3);
    lasser_beam(220,4);
    lasser_beam(220,5);
    lasser_beam(220,6);
    lasser_beam(220,7);
    lasser_beam(220,8);
    lasser_beam(220,9);
    lasser_beam(220,10);
    lasser_beam(220,11);
    lasser_beam(220,12);

    liquid(292);
    liquid(303);
    liquid(304);

    ship();

    IF(cyber_genoids_game[0].grass==1);
        FROM levle_loop=1 TO 50; grass(16000+rand(-1300,1300),15200+rand(-1200,1200)); END
        FROM levle_loop=1 TO 60; grass(5500+rand(-2560,2560),13500+rand(-890,890)); END
        FROM levle_loop=1 TO 10; grass(8910+rand(-410,410),14390+rand(-450,450)); END
    END

    IF(cyber_genoids_game[0].grass==2);
        FROM levle_loop=1 TO 80; grass(16000+rand(-1300,1300),15200+rand(-1200,1200)); END
        FROM levle_loop=1 TO 100; grass(5500+rand(-2560,2560),13750+rand(-890,890)); END
        FROM levle_loop=1 TO 15; grass(8910+rand(-410,410),14390+rand(-450,450)); END
    END

    number_of_enemys=levle1_enemys;

    IF(game_loaded==FALSE)
        player_data[0].night_vission_timer=1200;

        enemy_counter=1;
        WHILE(enemy_counter<=22)
            enemy1(enemy_counter,100); enemy_data[enemy_counter].notice_player=FALSE;
            enemy_counter+=1;
        END

        WHILE(enemy_counter<=levle1_enemys);
            enemy_data[enemy_counter].health=100; enemy_data[enemy_counter].notice_player=FALSE; enemy_data[enemy_counter].x=0; enemy_data[enemy_counter].y=0;
            enemy_counter+=1;
        END

        levle_data[1].door1_open=FALSE;
        levle_data[1].door2_open=FALSE;
        levle_data[1].door3_open=FALSE;
        levle_data[1].door4_open=FALSE;
        levle_data[1].door5_open=FALSE;
        levle_data[1].door6_open=FALSE;
        levle_data[1].door7_open=FALSE;
        levle_data[1].door8_open=FALSE;
        levle_data[1].door9_open=FALSE;
        levle_data[1].door10_open=FALSE;
        levle_data[1].door11_open=FALSE;
        levle_data[1].door12_open=FALSE;

        levle_data[1].pickup1=FALSE;
        levle_data[1].pickup2=FALSE;
        levle_data[1].pickup3=FALSE;
        levle_data[1].pickup5=FALSE;
        levle_data[1].pickup6=FALSE;
        levle_data[1].pickup7=FALSE;
        levle_data[1].pickup8=FALSE;
        levle_data[1].pickup9=FALSE;
        levle_data[1].pickup10=FALSE;

        levle_data[1].pannel1=FALSE;
        levle_data[1].pannel2=FALSE;
        levle_data[1].pannel3=FALSE;
        levle_data[1].pannel4=FALSE;

        levle_data[1].lift2=FALSE;

        levle_data[1].key1=FALSE;
        levle_data[1].key1_x=0;
        levle_data[1].key1_y=0;

        ELSE
        enemy_counter=1;
        WHILE(enemy_counter<=22);
            enemy1(enemy_counter,enemy_data[enemy_counter].health);
            enemy_counter+=1;
        END

        IF(player_data[0].mission_point=>7)
            enemy_counter=23;
            WHILE(enemy_counter<=levle1_enemys);
                enemy1(enemy_counter,enemy_data[enemy_counter].health);
                enemy_counter+=1;
            END
        END

        IF(levle_data[1].door1_open==TRUE) door1_height=512; set_sector_height(door1_sector,door1_floor,door1_floor+door1_height); END
        IF(levle_data[1].door2_open==TRUE) door2_height=512; set_sector_height(door2_sector,door2_floor,door2_floor+door2_height); END
        IF(levle_data[1].door3_open==TRUE) door3_height=512; set_sector_height(door3_sector,door3_floor,door3_floor+door3_height); END
        IF(levle_data[1].door4_open==TRUE) door4_height=512; set_sector_height(door4_sector,door4_floor,door4_floor+door4_height); END
        IF(levle_data[1].door5_open==TRUE) door5_height=768; set_sector_height(door5_sector1,door5_floor,door5_floor+door5_height); set_sector_height(door5_sector2,door5_floor,door5_floor+door5_height);  END
        IF(levle_data[1].door6_open==TRUE) door6_height=512; set_sector_height(door6_sector,door6_floor,door6_floor+door6_height); END
        IF(levle_data[1].door7_open==TRUE) door7_height=512; lift1_height=0; set_sector_height(door7_sector,door7_floor,door7_floor+door7_height); set_sector_height(lift1_sector,lift1_floor+lift1_height,3280); END
        IF(levle_data[1].door8_open==TRUE) door8_height=512; set_sector_height(door8_sector,door8_floor,door8_floor+door8_height); END
        IF(levle_data[1].door9_open==TRUE) door9_height=512; set_sector_height(door9_sector,door9_floor,door9_floor+door9_height); END
        IF(levle_data[1].door10_open==TRUE) door10_height=512; set_sector_height(door10_sector,door10_floor,door10_floor+door10_height); END
        IF(levle_data[1].door11_open==TRUE) door11_height=0; set_sector_height(door11_sector1,door11_floor+door11_height,3280); set_sector_height(door11_sector2,door11_floor+door11_height,3280);  set_sector_height(door11_sector3,door11_floor+door11_height,3280);  set_sector_height(door11_sector4,door11_floor+door11_height,3280);  set_sector_height(door11_sector5,door11_floor+door11_height,3280);  END
        IF(levle_data[1].door12_open==TRUE) door12_height=512; set_sector_height(door12_sector,door12_floor,door12_floor+door12_height); END

        IF(levle_data[1].lift2==TRUE) lift2_height=0; set_sector_height(lift2_sector,lift2_floor-lift2_height,3280); END

        IF(player_data[0].mission_point=>2) set_wall_texture(1139,15,13); set_wall_texture(1138,15,13); set_wall_texture(1137,15,13); set_wall_texture(1136,15,13); set_wall_texture(1135,15,13); set_wall_texture(168,15,13); set_wall_texture(2543,15,13); set_wall_texture(183,15,13); set_wall_texture(186,15,13); set_wall_texture(187,15,13); set_wall_texture(774,15,13); set_wall_texture(1782,15,13); END

        IF(levle_data[1].pannel4==TRUE) set_sector_height(340,2512,3152); set_sector_height(341,2512,3152); set_sector_height(342,2512,3152); set_sector_height(343,2512,3152); set_sector_height(344,2512,3152); END

    END

    IF(levle_data[1].pickup1==FALSE) pickup(1,2); END
    IF(levle_data[1].pickup2==FALSE) pickup(2,3); END
    IF(levle_data[1].pickup3==FALSE) pickup(3,10); ELSE set_sector_height(265,2200,-1); set_sector_texture(265,50,-1,-1); END
    IF(levle_data[1].key1==FALSE AND levle_data[1].key1_x>0 AND levle_data[1].key1_y>0) pickup(4,20); END
    IF(levle_data[1].pickup5==FALSE) pickup(5,10); ELSE set_sector_height(400,2050,-1); set_sector_texture(400,30,-1,-1); END
    IF(levle_data[1].pickup6==FALSE) pickup(6,1); END
    IF(levle_data[1].pickup7==FALSE) pickup(7,10); ELSE set_sector_height(65,2000,-1); set_sector_texture(65,95,-1,-1); END
    IF(levle_data[1].pickup8==FALSE) pickup(8,10); ELSE set_sector_height(354,2512,-1); set_sector_texture(354,95,-1,-1); END
    IF(levle_data[1].pickup9==FALSE) pickup(9,4); END
    IF(levle_data[1].pickup10==FALSE) pickup(10,1); END

    mission_text=write(main_font,400,550,4,mission_texts[player_data[0].mission_point]);

    set_fog(fog1,fog2);
    fade(80,80,80,64);
    xmission=player_data[0].mission_point;

    LOOP
        xmission=player_data[0].mission_point;
        IF(cyber_genoids_game[0].grass==1 OR cyber_genoids_game[0].grass==2)
        rain_drop();
        rain_drop();
        END

        IF(key(_n) AND player_data[0].night_vission==FALSE AND player_data[0].night_vission_timer>0) WHILE(key(_n)) FRAME; END player_data[0].night_vission=TRUE; graph=50; END
        IF(player_data[0].night_vission==TRUE AND player_data[0].night_vission_timer>0) player_data[0].night_vission_timer-=4; END
        IF(player_data[0].night_vission==FALSE AND player_data[0].night_vission_timer<1200) player_data[0].night_vission_timer+=3; END
        IF(player_data[0].night_vission==TRUE AND player_data[0].night_vission_timer=<0) player_data[0].night_vission=FALSE; graph=0; END
        IF(player_data[0].night_vission==TRUE AND key(_n)) WHILE(key(_n)) FRAME; END player_data[0].night_vission=FALSE; graph=0; END
        IF(player_data[0].night_vission_timer<0) player_data[0].night_vission_timer=0; END
        IF(player_data[0].night_vission_timer>1200) player_data[0].night_vission_timer=1200; END
        define_region(3,0,(600-(player_data[0].night_vission_timer/2)),14,(player_data[0].night_vission_timer/2));

        IF(player_data[0].health>0)
            IF(player_data[0].night_vission==FALSE)
                fade(80,80,80,3);
                IF(player_x_health>player_data[0].health) fade(140,80,80,64); END
                IF(player_x_health<player_data[0].health) fade(80,80,140,64); END
                IF(player_data[0].outside==TRUE AND rand(1,60)==1) stop_sound(thunder_channel); thunder_channel=sound(thunder_wav,cyber_genoids_game[0].volume,256); fade(150,150,150,64); END
            ELSE
                fade(0,110,0,2);
                IF(player_x_health>player_data[0].health) fade(110,80,80,64); END
                IF(player_x_health<player_data[0].health) fade(80,80,140,64); END
                IF(player_data[0].outside==TRUE AND rand(1,60)==1) stop_sound(thunder_channel); thunder_channel=sound(thunder_wav,cyber_genoids_game[0].volume,256); fade(0,150,0,64); END
            END
        END

        IF(fget_dist(id_player.x,id_player.y,door1_x,door1_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door1_open==TRUE) levle_data[1].door1_open=FALSE; ELSE; levle_data[1].door1_open=TRUE; END END IF(levle_data[1].door1_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door2_x,door2_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door2_open==TRUE) levle_data[1].door2_open=FALSE; ELSE; levle_data[1].door2_open=TRUE; END END IF(levle_data[1].door2_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door3_x,door3_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door3_open==TRUE) levle_data[1].door3_open=FALSE; ELSE; levle_data[1].door3_open=TRUE; END END IF(levle_data[1].door3_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door4_x,door4_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door4_open==TRUE) levle_data[1].door4_open=FALSE; ELSE; IF(player_data[0].mission_point=>3) levle_data[1].door4_open=TRUE; END END END IF(levle_data[1].door4_open==TRUE) delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); ELSE IF(player_data[0].mission_point=>3) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"DOOR LOCKED"); END END ELSE
        IF(fget_dist(id_player.x,id_player.y,door5_x,door5_y)<700) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door5_open==TRUE) levle_data[1].door5_open=FALSE; ELSE; IF(player_data[0].mission_point=>4) levle_data[1].door5_open=TRUE; END END END IF(levle_data[1].door5_open==TRUE) delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); ELSE IF(player_data[0].mission_point=>4) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"DOOR LOCKED FROM INSIDE"); END END ELSE
        IF(fget_dist(id_player.x,id_player.y,door6_x,door6_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door6_open==TRUE) levle_data[1].door6_open=FALSE; ELSE; IF(levle_data[1].key1==TRUE) levle_data[1].door6_open=TRUE; END END END IF(levle_data[1].door6_open==TRUE) delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); ELSE IF(levle_data[1].key1==TRUE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"KEY CARD NEEDED"); END  END ELSE
        IF(fget_dist(id_player.x,id_player.y,door7_x,door7_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door7_open==TRUE) levle_data[1].door7_open=FALSE; ELSE; levle_data[1].door7_open=TRUE; END END IF(levle_data[1].door7_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR & LIFT DOWN?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR & LIFT UP?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door8_x,door8_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door8_open==TRUE) levle_data[1].door8_open=FALSE; ELSE; levle_data[1].door8_open=TRUE; END END IF(levle_data[1].door8_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door9_x,door9_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door9_open==TRUE) levle_data[1].door9_open=FALSE; ELSE; levle_data[1].door9_open=TRUE; END END IF(levle_data[1].door9_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door10_x,door10_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door10_open==TRUE) levle_data[1].door10_open=FALSE; ELSE; levle_data[1].door10_open=TRUE; END END IF(levle_data[1].door10_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,door11_x,door11_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door11_open==TRUE) levle_data[1].door11_open=FALSE; ELSE; IF(player_data[0].mission_point=>7); levle_data[1].door11_open=TRUE; END END END IF(levle_data[1].door11_open==TRUE) delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); ELSE IF(player_data[0].mission_point=>7) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE  delete_text(info_text); info_text=write(main_font,400,100,4,"KEY CARD NEEDED"); END END ELSE
        IF(fget_dist(id_player.x,id_player.y,door12_x,door12_y)<500) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].door12_open==TRUE) levle_data[1].door12_open=FALSE; ELSE; levle_data[1].door12_open=TRUE; END END IF(levle_data[1].door12_open==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN DOOR?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE DOOR?"); END ELSE

        IF(player_data[0].sector==261) delete_text(info_text); info_text=write(main_font,400,100,4,"DOOR LOCKED"); ELSE
        IF(fget_dist(id_player.x,id_player.y,lift2_x,lift2_y)<1000) info_text=write(main_font,400,100,4,"LIFT NOT OPERATED FROM HEAR"); ELSE

        IF(fget_dist(id_player.x,id_player.y,pannel1_x,pannel1_y)<350) IF(key(_control) AND levle_data[1].pannel1==FALSE) WHILE(key(_control)) FRAME; END player_data[0].mission_point=2; levle_data[1].pannel1=TRUE; set_wall_texture(1139,15,13); set_wall_texture(1138,15,13); set_wall_texture(1137,15,13); set_wall_texture(1136,15,13); set_wall_texture(1135,15,13); set_wall_texture(168,15,13); set_wall_texture(2543,15,13); set_wall_texture(183,15,13); set_wall_texture(186,15,13); set_wall_texture(187,15,13); set_wall_texture(774,15,13); set_wall_texture(1782,15,13);  END IF(levle_data[1].pannel1==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"TURN OFF ENERGY CELL?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"ENERGY CELL OFF"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,pannel2_x,pannel2_y)<400) IF(key(_control) AND levle_data[1].pannel2==FALSE AND player_data[0].mission_point=>2) WHILE(key(_control)) FRAME; END player_data[0].mission_point=3; levle_data[1].pannel2=TRUE; END IF(levle_data[1].pannel2==FALSE) delete_text(info_text); IF(player_data[0].mission_point<2) info_text=write(main_font,400,100,4,"ENERGY CRYSTAL ACTIVE"); ELSE info_text=write(main_font,400,100,4,"UNLOCK DOOR?"); END ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"DOOR UNLOCKED"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,pannel3_x,pannel3_y)<400) IF(key(_control) AND levle_data[1].pannel3==FALSE) WHILE(key(_control)) FRAME; END player_data[0].mission_point=7; enemy_counter=23; WHILE(enemy_counter<=levle1_enemys); enemy1(enemy_counter,100); enemy_counter+=1; END levle_data[1].pannel3=TRUE; END IF(levle_data[1].pannel3==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"SIGNAL A JUMP JET?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"JUMP JET SIGNALED"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,pannel4_x,pannel4_y)<400) IF(key(_control)) WHILE(key(_control)) FRAME; END IF(levle_data[1].pannel4==TRUE) levle_data[1].pannel4=FALSE; set_sector_height(340,2542,3122); set_sector_height(341,2542,3122); set_sector_height(342,2542,3122); set_sector_height(343,2542,3122); set_sector_height(344,2542,3122); ELSE levle_data[1].pannel4=TRUE; set_sector_height(340,2512,3152); set_sector_height(341,2512,3152); set_sector_height(342,2512,3152); set_sector_height(343,2512,3152); set_sector_height(344,2512,3152); END END IF(levle_data[1].pannel4==FALSE) delete_text(info_text); info_text=write(main_font,400,100,4,"OPEN CELL?"); ELSE delete_text(info_text); info_text=write(main_font,400,100,4,"CLOSE CELL?"); END ELSE
        IF(fget_dist(id_player.x,id_player.y,14520,22788)<200) delete_text(info_text); info_text=write(main_font,400,100,4,"GO BACK AND VOTE FOR THIS GAME"); ELSE
        IF(fget_dist(id_player.x,id_player.y,11370,16920)<200) delete_text(info_text); info_text=write(main_font,400,100,4,"DOOR UNLOCKED"); ELSE

        IF(player_data[0].levle==1 AND player_data[0].y>20000 AND player_data[0].y<22000 AND player_data[0].x>17200) delete_text(info_text); info_text=write(main_font,400,100,4,"DON'T JUMP!"); ELSE

        delete_text(info_text); info_text=write(0,0,0,0,"");
        END END END END END END END END END END END END END END END END END END END END END

        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door1_x,door1_y)<500) levle_data[1].door1_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door2_x,door2_y)<500) levle_data[1].door2_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door3_x,door3_y)<500) levle_data[1].door3_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door4_x,door4_y)<500 AND player_data[0].mission_point=>3) levle_data[1].door4_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door5_x,door5_y)<700) levle_data[1].door5_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door6_x,door6_y)<500 AND levle_data[1].key1==TRUE) levle_data[1].door6_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door8_x,door8_y)<500) levle_data[1].door8_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door9_x,door9_y)<500) levle_data[1].door9_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door10_x,door10_y)<500) levle_data[1].door10_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door11_x,door11_y)<500 AND player_data[0].mission_point=>7) levle_data[1].door11_open=TRUE; END
        IF(enemy_data[enemy_counter].notice_player==TRUE AND fget_dist(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,door12_x,door12_y)<500) levle_data[1].door12_open=TRUE; END
        enemy_counter+=1;
        END

        IF(levle_data[1].door1_open==TRUE AND door1_height<512) door1_height+=20; set_sector_height(door1_sector,door1_floor,door1_floor+door1_height); END
        IF(levle_data[1].door1_open==FALSE AND door1_height>0 AND player_data[0].sector<>door1_sector) door1_height-=20; set_sector_height(door1_sector,door1_floor,door1_floor+door1_height); END
        IF(levle_data[1].door1_open==TRUE) door1_timer+=1; END IF(door1_timer>140) levle_data[1].door1_open=FALSE; door1_timer=0; END

        IF(levle_data[1].door2_open==TRUE AND door2_height<512) door2_height+=20; set_sector_height(door2_sector,door2_floor,door2_floor+door2_height); END
        IF(levle_data[1].door2_open==FALSE AND door2_height>0 AND player_data[0].sector<>door2_sector) door2_height-=20; set_sector_height(door2_sector,door2_floor,door2_floor+door2_height); END
        IF(levle_data[1].door2_open==TRUE) door2_timer+=1; END IF(door2_timer>140) levle_data[1].door2_open=FALSE; door2_timer=0; END

        IF(levle_data[1].door3_open==TRUE AND door3_height<512) door3_height+=20; set_sector_height(door3_sector,door3_floor,door3_floor+door3_height); END
        IF(levle_data[1].door3_open==FALSE AND door3_height>0 AND player_data[0].sector<>door3_sector) door3_height-=20; set_sector_height(door3_sector,door3_floor,door3_floor+door3_height); END
        IF(levle_data[1].door3_open==TRUE) door3_timer+=1; END IF(door3_timer>140) levle_data[1].door3_open=FALSE; door3_timer=0; END

        IF(levle_data[1].door4_open==TRUE AND door4_height<512) door4_height+=20; set_sector_height(door4_sector,door4_floor,door4_floor+door4_height); END
        IF(levle_data[1].door4_open==FALSE AND door4_height>0 AND player_data[0].sector<>door4_sector) door4_height-=20; set_sector_height(door4_sector,door4_floor,door4_floor+door4_height); END
        IF(levle_data[1].door4_open==TRUE) door4_timer+=1; END IF(door4_timer>140) levle_data[1].door4_open=FALSE; door4_timer=0; END

        IF(levle_data[1].door5_open==TRUE AND player_data[0].mission_point<5) player_data[0].mission_point=5; END
        IF(levle_data[1].door5_open==TRUE AND door5_height<768) door5_height+=20; set_sector_height(door5_sector1,door5_floor,door5_floor+door5_height); set_sector_height(door5_sector2,door5_floor,door5_floor+door5_height);  END
        IF(levle_data[1].door5_open==FALSE AND door5_height>0 AND player_data[0].sector<>door5_sector1 AND player_data[0].sector<>door5_sector2) door5_height-=20; set_sector_height(door5_sector1,door5_floor,door5_floor+door5_height);  set_sector_height(door5_sector2,door5_floor,door5_floor+door5_height); END
        IF(levle_data[1].door5_open==TRUE) door5_timer+=1; END IF(door5_timer>140) levle_data[1].door5_open=FALSE; door5_timer=0; END

        IF(levle_data[1].door6_open==TRUE) IF(player_data[0].mission_point<6) player_data[0].mission_point=6; END END
        IF(levle_data[1].door6_open==TRUE AND door6_height<512) door6_height+=20; set_sector_height(door6_sector,door6_floor,door6_floor+door6_height); END
        IF(levle_data[1].door6_open==FALSE AND door6_height>0 AND player_data[0].sector<>door6_sector) door6_height-=20; set_sector_height(door6_sector,door6_floor,door6_floor+door6_height); END
        IF(levle_data[1].door6_open==TRUE) door6_timer+=1; END IF(door6_timer>140) levle_data[1].door6_open=FALSE; door6_timer=0; END

        IF(levle_data[1].door7_open==TRUE AND door7_height<512) door7_height+=20; set_sector_height(door7_sector,door7_floor,door7_floor+door7_height); END
        IF(levle_data[1].door7_open==FALSE AND door7_height>0 AND player_data[0].sector<>door7_sector) door7_height-=20; set_sector_height(door7_sector,door7_floor,door7_floor+door7_height); END
        IF(levle_data[1].door7_open==TRUE AND lift1_height>0 AND player_data[0].sector<>door7_sector) lift1_height-=15; set_sector_height(lift1_sector,lift1_floor+lift1_height,3280); END
        IF(levle_data[1].door7_open==FALSE AND lift1_height<740) lift1_height+=15; set_sector_height(lift1_sector,lift1_floor+lift1_height,3280); END
        IF(levle_data[1].door7_open==TRUE) door7_timer+=1; END IF(door7_timer>140) levle_data[1].door7_open=FALSE; door7_timer=0; END

        IF(levle_data[1].door8_open==TRUE AND door8_height<512) door8_height+=20; set_sector_height(door8_sector,door8_floor,door8_floor+door8_height); END
        IF(levle_data[1].door8_open==FALSE AND door8_height>0 AND player_data[0].sector<>door8_sector) door8_height-=20; set_sector_height(door8_sector,door8_floor,door8_floor+door8_height); END
        IF(levle_data[1].door8_open==TRUE) door8_timer+=1; END IF(door8_timer>140) levle_data[1].door8_open=FALSE; door8_timer=0; END

        IF(levle_data[1].door9_open==TRUE AND door9_height<512) door9_height+=20; set_sector_height(door9_sector,door9_floor,door9_floor+door9_height); END
        IF(levle_data[1].door9_open==FALSE AND door9_height>0 AND player_data[0].sector<>door9_sector) door9_height-=20; set_sector_height(door9_sector,door9_floor,door9_floor+door9_height); END
        IF(levle_data[1].door9_open==TRUE) door9_timer+=1; END IF(door9_timer>140) levle_data[1].door9_open=FALSE; door9_timer=0; END

        IF(levle_data[1].door10_open==TRUE AND door10_height<512) door10_height+=20; set_sector_height(door10_sector,door10_floor,door10_floor+door10_height); END
        IF(levle_data[1].door10_open==FALSE AND door10_height>0 AND player_data[0].sector<>door10_sector) door10_height-=20; set_sector_height(door10_sector,door10_floor,door10_floor+door10_height); END
        IF(levle_data[1].door10_open==TRUE) door10_timer+=1; END IF(door10_timer>140) levle_data[1].door10_open=FALSE; door10_timer=0; END

        IF(levle_data[1].door11_open==TRUE AND door11_height>0 AND player_data[0].sector<>door11_sector1 AND player_data[0].sector<>door11_sector2) door11_height-=20; set_sector_height(door11_sector1,door11_floor+door11_height,3280); set_sector_height(door11_sector2,door11_floor+door11_height,3280);  set_sector_height(door11_sector3,door11_floor+door11_height,3280);  set_sector_height(door11_sector4,door11_floor+door11_height,3280);  set_sector_height(door11_sector5,door11_floor+door11_height,3280);   END
        IF(levle_data[1].door11_open==FALSE AND door11_height<512) door11_height+=20; set_sector_height(door11_sector1,door11_floor+door11_height,3280); set_sector_height(door11_sector2,door11_floor+door11_height,3280);  set_sector_height(door11_sector3,door11_floor+door11_height,3280);  set_sector_height(door11_sector4,door11_floor+door11_height,3280);  set_sector_height(door11_sector5,door11_floor+door11_height,3280);   END
        IF(levle_data[1].door11_open==TRUE) door11_timer+=1; END IF(door11_timer>140) levle_data[1].door11_open=FALSE; door11_timer=0; END

        IF(levle_data[1].door12_open==TRUE AND door12_height<512) door12_height+=20; set_sector_height(door12_sector,door12_floor,door12_floor+door12_height); END
        IF(levle_data[1].door12_open==FALSE AND door12_height>0 AND player_data[0].sector<>door12_sector) door12_height-=20; set_sector_height(door12_sector,door12_floor,door12_floor+door12_height); END
        IF(levle_data[1].door12_open==TRUE) door12_timer+=1; END IF(door12_timer>140) levle_data[1].door12_open=FALSE; door12_timer=0; END

        IF(player_data[0].mission_point=>5) levle_data[1].lift2=TRUE; END
        IF(levle_data[1].lift2==TRUE AND lift2_height>0) lift2_height-=10; set_sector_height(lift2_sector,lift2_floor-lift2_height,3280); END
        player_x_health=player_data[0].health;

        IF(rand(1,10)==1) set_sector_texture(346,-1,-1,12); set_sector_texture(354,-1,-1,12); set_wall_texture(955,-1,12); set_wall_texture(406,-1,12); set_wall_texture(407,-1,12); set_wall_texture(408,-1,12); set_wall_texture(409,-1,12); set_wall_texture(576,-1,12); set_wall_texture(2117,-1,12); set_wall_texture(2118,-1,12); set_wall_texture(2119,-1,12); set_wall_texture(2120,-1,12); set_wall_texture(2121,-1,12); set_wall_texture(2122,-1,12); set_wall_texture(2123,-1,12); set_wall_texture(2124,-1,12); set_wall_texture(2125,-1,12); set_wall_texture(2126,-1,12); set_wall_texture(2127,-1,12); set_wall_texture(2128,-1,12); set_wall_texture(2178,-1,12); set_wall_texture(597,-1,12); set_wall_texture(601,-1,12); END
        IF(rand(1,10)==2) set_sector_texture(346,-1,-1,15); set_sector_texture(354,-1,-1,15); set_wall_texture(955,-1,15); set_wall_texture(406,-1,15); set_wall_texture(407,-1,15); set_wall_texture(408,-1,15); set_wall_texture(409,-1,15); set_wall_texture(576,-1,15); set_wall_texture(2117,-1,15); set_wall_texture(2118,-1,15); set_wall_texture(2119,-1,15); set_wall_texture(2120,-1,15); set_wall_texture(2121,-1,15); set_wall_texture(2122,-1,15); set_wall_texture(2123,-1,15); set_wall_texture(2124,-1,15); set_wall_texture(2125,-1,15); set_wall_texture(2126,-1,15); set_wall_texture(2127,-1,15); set_wall_texture(2128,-1,15); set_wall_texture(2178,-1,15); set_wall_texture(597,-1,15); set_wall_texture(601,-1,15); END

        IF(enemy_data[12].health=<0 AND player_data[0].mission_point==3) player_data[0].mission_point=4; END

        IF(player_data[0].x>9350 AND player_data[0].x<10600 AND player_data[0].y>20200 AND player_data[0].mission_point<8);

            film_camera=TRUE;
            delete_text(all_text);
            stop_mode8(2);
            stop_mode8(3);
            define_region(1,1,1,2,2);

            signal(TYPE pause,s_kill);
            signal(TYPE sniper_camera,s_kill);
            signal(TYPE sniper_edge,s_kill);
            signal(TYPE sniper,s_kill);
            signal(TYPE player_weapon,s_kill);
            signal(TYPE player_bar,s_kill);
            signal(TYPE icons,s_kill);
            signal(TYPE night_vission,s_kill);
            signal(TYPE mission_camera,s_kill);
            signal(TYPE player_weapon_flash,s_kill);
            signal(TYPE cross_head,s_kill);
            signal(TYPE m8_text,s_kill);
            signal(TYPE pickup,s_kill);
            signal(TYPE key_icon,s_kill);

            file=main_file;
            graph=51;
            z=-250;
            x=400;
            y=300;

            player_data[0].mission_point=8;

            write(main_font,400,120,4,"LEVEL COMPLETE");
            write(main_font,400,125,4,"____________________");

            enemy_counter=1;
            enemy_killed=0;
            WHILE(enemy_counter<=number_of_enemys)
                IF(enemy_data[enemy_counter].health=<0) enemy_killed+=1; END
                enemy_counter+=1;
            END

            enemy_counter=1;
            enemy_wounded=0;
            WHILE(enemy_counter<=number_of_enemys)
                IF(enemy_data[enemy_counter].health<100) enemy_wounded+=1; END
                enemy_counter+=1;
            END

            levle_mins=player_data[0].levle_time/60;
            levle_secs=player_data[0].levle_time-(levle_mins*60);

            write(red_font,200,160,4,"NUMBER OF ENEMY KILLED");
            write_int(red_font,160,180,5,& enemy_killed);
            write(red_font,200,180,4,"OUT OF");
            write_int(red_font,240,180,3,& number_of_enemys);

            write(red_font,200,220,4,"NUMBER OF ENEMY WOUNDED");
            write_int(red_font,160,240,5,& enemy_wounded);
            write(red_font,200,240,4,"OUT OF");
            write_int(red_font,240,240,3,& number_of_enemys);

            write(red_font,600,160,4,"NUMBER OF SHOTS FIRED");
            write_int(red_font,600,180,4,& player_data[0].shots_fired);

            accuracy=((player_data[0].shots_hit*100)/player_data[0].shots_fired);
            write(red_font,600,220,4,"SHOOTING ACCURACY");
            write_int(red_font,602,240,5,& accuracy);
            write(red_font,610,240,3,"%");

            write(red_font,400,420,4,"TIME TAKEN");
            write_int(red_font,390,440,5,& levle_mins);
            write(red_font,400,438,4,":");
            IF(levle_secs<10)
                write(red_font,410,440,3,"0");
                write_int(red_font,426,440,3,& levle_secs);
                ELSE
                write_int(red_font,410,440,3,& levle_secs);
            END
            BREAK;
        END

        IF(player_data[0].mission_point<8 AND xmission<>player_data[0].mission_point) delete_text(mission_text); mission_text=write(main_font,400,550,4,mission_texts[player_data[0].mission_point]); END
        FRAME;
    END
    LOOP
            rain_drop();
            rain_drop();

        fade(80,80,80,3);
        IF(player_data[0].outside==TRUE AND rand(1,60)==1) stop_sound(thunder_channel); thunder_channel=sound(thunder_wav,cyber_genoids_game[0].volume,256); fade(150,150,150,64); END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS mission_camera();

PRIVATE
    camera_turn;
    znumber;
BEGIN
    ctype=c_m8;
    radius=10;
    camera_turn=0;
    go_to_flag(50+player_data[0].mission_point);
    angle=mission_points[player_data[0].mission_point].angle1;
    znumber=player_data[0].mission_point;
    LOOP
        IF(player_data[0].mission_point<>znumber) angle=mission_points[player_data[0].mission_point].angle1; znumber=player_data[0].mission_point; END
        go_to_flag(50+player_data[0].mission_point);
        m8[3].angle=mission_points[player_data[0].mission_point].zangle;
        height=mission_points[player_data[0].mission_point].z;
        m8[3].height=height;
        IF(camera_turn==0 AND angle<mission_points[player_data[0].mission_point].angle2) angle+=700; END
        IF(camera_turn==0 AND angle=>mission_points[player_data[0].mission_point].angle2) camera_turn=1; END
        IF(camera_turn==1 AND angle>mission_points[player_data[0].mission_point].angle1) angle-=700; END
        IF(camera_turn==1 AND angle=<mission_points[player_data[0].mission_point].angle1) camera_turn=0; END
        znumber=player_data[0].mission_point;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS night_vission();

BEGIN
    file=effects_file;
    graph=6;
    x=6;
    y=300;
    z=-254;
    region=3;
    flags=4;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS pause();

PRIVATE
    text_pause1;
    text_pause2;

BEGIN
    LOOP
    WHILE (NOT key(_f1));
        FRAME;
    END
    text_pause1=write(main_font,400,290,4,"PAUSED");
    text_pause2=write(red_font,400,320,4,"PUSH   F 1   TO CONTINUE");
    WHILE (key(_f1));
        mouse.x=pause_mouse_x;
        mouse.y=pause_mouse_y;
        FRAME;
    END
    FRAME;
    REPEAT
        mouse.x=pause_mouse_x;
        mouse.y=pause_mouse_y;
        UNTIL (key(_f1));
        delete_text(text_pause1);
        delete_text(text_pause2);
        WHILE (key(_f1));
        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player(x,y,angle);

PRIVATE
    floor_height;
    roof_height;
    floor_texture;
    roof_texture;
    room_luminosity;

    xmouse_x;
    xmouse_y;
    bullet;
    jump;
    x_x;
    x_y;
    enemy_counter;
    levle_timer;
BEGIN

    ctype=c_m8;
    height=330;
    m8[1].height=330;
    radius=100;
    m8_step=64;

    xmouse_x=mouse.x;
    xmouse_y=mouse.y;

    player_weapon();

    IF(game_loaded==FALSE) go_to_flag(1); END
    levle_timer=0;
    LOOP
        IF(film_camera==FALSE);
            levle_timer+=1;
            IF(levle_timer==30) player_data[0].levle_time+=1; levle_timer=0; END
            IF(player_data[0].health<=0) BREAK; END

            IF(mouse.x<100 OR mouse.x>700) mouse.x=400; xmouse_x=400; END
            IF(mouse.y<100 OR mouse.y>500) mouse.y=300; xmouse_y=300; END
            angle+=(xmouse_x-mouse.x)*250;
            m8[1].angle+=(xmouse_y-mouse.y);
            xmouse_x=mouse.x;
            xmouse_y=mouse.y;

            IF(key(_c)) player_data[0].crouching=TRUE; ELSE IF(roof_height-floor_height>256) player_data[0].crouching=FALSE; END END
            IF(roof_height-floor_height<=256) player_data[0].crouching=TRUE; END
            IF(player_data[0].crouching==TRUE AND m8[1].height>330/2) m8[1].height-=15; height-=15; END
            IF(player_data[0].crouching==FALSE AND m8[1].height<330 AND roof_height-floor_height>256) m8[1].height+=15; height+=15; END

            IF(key(_space) AND z<=(floor_height+10) AND jump==0 AND player_data[0].crouching==FALSE) jump=1; END
            IF(jump>0) z+=50; jump+=1; IF(jump>8) jump=0; END END

            IF(key(_w)) IF(player_data[0].crouching==FALSE) advance(player_speed); ELSE advance(player_speed/2); END player_data[0].walking=TRUE; END
            IF(key(_s)) IF(player_data[0].crouching==FALSE) advance(-player_speed/2); ELSE advance(-player_speed/4); END player_data[0].walking=TRUE; END
            IF(key(_a)) IF(player_data[0].crouching==FALSE) xadvance(angle+90000,player_speed/2); ELSE xadvance(angle+90000,player_speed/4); END player_data[0].walking=TRUE; END
            IF(key(_d)) IF(player_data[0].crouching==FALSE) xadvance(angle-90000,player_speed/2); ELSE xadvance(angle-90000,player_speed/4); END player_data[0].walking=TRUE; END

            IF(NOT key(_w) AND NOT key(_a) AND NOT key(_s) AND NOT key(_d)) player_data[0].walking=FALSE; END

            enemy_counter=1;
            WHILE(enemy_counter<=number_of_enemys)
                IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<250) xadvance(fget_angle(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)+180000,player_speed); END
                enemy_counter+=1;
            END

            IF(player_data[0].levle==1 AND y>22100 AND y<22900 AND x<6150 AND x>6050) x=6150; END
            IF(player_data[0].levle==1 AND y>22100 AND y<22900 AND x>5950 AND x<6050) x=5950; END
            IF(player_data[0].levle==1 AND levle_data[1].pannel4==FALSE AND y>22200 AND y<22800 AND x>15200 AND x<15300) x=15300; END
            IF(player_data[0].levle==1 AND levle_data[1].pannel4==FALSE AND y>22200 AND y<22800 AND x>15100 AND x<15200) x=15100; END
            IF(player_data[0].levle==1 AND y>20000 AND y<22000 AND x>17280) x=17280; END

            get_sector_height(m8_sector,& floor_height,& roof_height);
            IF(z>(floor_height+10)) z-=25; END
            IF(z=<(floor_height+10)) z=floor_height; END

            player_data[0].z=z;
            player_data[0].x=x;
            player_data[0].y=y;
            player_data[0].angle=angle;
            player_data[0].camera_height=m8[1].height;
            player_data[0].sector=m8_sector;

            IF(m8_sector=>0) get_sector_texture(m8_sector,& floor_texture,& roof_texture,& room_luminosity); END
            IF(roof_texture=<0 OR roof_texture>20000) player_data[0].outside=TRUE; ELSE player_data[0].outside=FALSE; END

            pause_mouse_x=mouse.x;
            pause_mouse_y=mouse.y;

            IF(player_data[0].ammo1a>200) player_data[0].ammo1a=200; END
            IF(player_data[0].ammo1b>10) player_data[0].ammo1b=10; END
            IF(player_data[0].ammo2a>20) player_data[0].ammo2a=20; END
            IF(player_data[0].ammo3a>20) player_data[0].ammo3a=20; END
            IF(player_data[0].ammo4a>100) player_data[0].ammo4a=100; END
            IF(player_data[0].health>150) player_data[0].health=150; END

        ELSE

            IF(x<9900) x+=40; END
            IF(x>10000) x-=40; END
            IF(y<20150) y+=40; END
            IF(y>20250) y-=40; END
            IF(angle>321000) angle-=3000; END
            IF(angle<318000) angle+=3000; END
            IF(m8[1].height<330) m8[1].height+=15; height+=15; END
            IF(m8[1].angle<-5) m8[1].angle+=10; END
            IF(m8[1].angle>5) m8[1].angle-=10; END
            player_data[0].night_vission=FALSE;

        END
    FRAME;
    END
    fade(80,80,80,64);
    WHILE(fading==TRUE)
    FRAME;
    END
    signal(TYPE cross_head,s_kill);
    signal(TYPE player_bar,s_kill);
    signal(TYPE player_weapon,s_kill);
    signal(TYPE icons,s_kill);
    signal(TYPE sniper_camera,s_kill);
    signal(TYPE sniper_edge,s_kill);
    signal(TYPE sniper,s_kill);
    define_region(1,1,1,2,2);
    delete_text(all_text);
    fade(200,0,0,2);
    WHILE(fading==TRUE);
        IF(m8[1].height>30)
            m8[1].height-=10;
            height-=10;
        END
        FRAME;
    END
    player_data[0].health=-100;
END

//-----------------------------------------------------------------------------------------------

PROCESS sniper_camera();

PRIVATE
    floor_height,
    roof_height;
    zoom_range;
BEGIN
    ctype=c_m8;
    m8_step=0;
    radius=50;

    sniper_edge();
    sniper();

    zoom_range=0;
    LOOP
        x=id_player.x;
        y=id_player.y;
        angle=id_player.angle;
        m8[2].angle=m8[1].angle;
        IF(player_data[0].weapon==3);
            z=(player_data[0].z+player_data[0].camera_height)+((m8[1].angle/5)*(zoom_range/46));
            IF(mouse.right AND zoom_range<9000) zoom_range+=80; END
            IF((mouse.middle OR key(_l_shift)) AND zoom_range>0) zoom_range-=80; END
            IF(player_data[0].scope==FALSE) zoom_range=0; END
            IF(zoom_range<0) zoom_range=0; END
            IF(zoom_range>9000) zoom_range=9000; END
            advance(zoom_range);
            IF(m8_wall>-1) zoom_range-=80; END
            get_sector_height(m8_sector,& floor_height,& roof_height);
            IF(z<(floor_height+60)) zoom_range-=80; END
            IF(z>(roof_height-60)) zoom_range-=80; END
        END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS sniper_edge();

BEGIN
    file=player_file;
    graph=200;
    flags=4;
    z=-30;
    x=400;
    y=300;
    LOOP
    IF(player_data[0].scope==TRUE) IF(graph==0) graph=200; END ELSE IF(graph==200) graph=0; END END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------


PROCESS sniper();

BEGIN
    file=player_file;
    graph=201;
    x=400;
    y=300;
    z=-40;
    LOOP
    IF(player_data[0].scope==TRUE) graph=201; ELSE graph=0; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_weapon();

PRIVATE
    walking_procedure;
    feedback_procedure;
    origonal_x;
    origonal_y;
    number_of_bullets;
    gun_timer;
    weapon_to_be;
    change_to_weapon;
BEGIN
    file=player_file;
    graph=101;
    x=650;
    y=470;
    z=-20;
    origonal_x=x;
    origonal_y=y;

    cross_head();
    player_bar();
    walking_procedure=1;
    weapon_to_be=player_data[0].weapon;
    change_to_weapon=player_data[0].weapon;
    player_data[0].weapon=0;
    LOOP
        IF(key(_1) AND player_data[0].weapon==change_to_weapon AND change_to_weapon==weapon_to_be AND player_data[0].weapon<>1 AND (player_data[0].ammo1a>0 OR player_data[0].ammo1b>0)) x=650; y=470; weapon_to_be=1; END
        IF(key(_2) AND player_data[0].weapon==change_to_weapon AND change_to_weapon==weapon_to_be AND player_data[0].weapon<>2 AND player_data[0].ammo2a>0) x=650; y=470; weapon_to_be=2; END
        IF(key(_3) AND player_data[0].weapon==change_to_weapon AND change_to_weapon==weapon_to_be AND player_data[0].weapon<>3 AND player_data[0].ammo3a>0) x=650; y=470; weapon_to_be=3; END
        IF(key(_4) AND player_data[0].weapon==change_to_weapon AND change_to_weapon==weapon_to_be AND player_data[0].weapon<>4 AND player_data[0].ammo4a>0) x=650; y=470; weapon_to_be=4; END

        player_data[0].shooting=FALSE;

        IF(weapon_to_be==1 AND player_data[0].weapon<>1 AND change_to_weapon==1)
            graph=101;
            define_region(1,1,1,2,2);
            IF(x>650) x-=20; END
            IF(y>470) y-=20; END
            IF(x<=650 AND y<=470) player_data[0].weapon=1; END
        END
        IF(player_data[0].weapon==1 AND change_to_weapon==1 AND weapon_to_be==1)
            IF(mouse.left AND gun_timer==0 AND player_data[0].ammo1a>0) player_data[0].shots_fired+=1; stop_sound(player_shot_channel); player_shot_channel=sound(bullet_wav,cyber_genoids_game[0].volume,256); player_data[0].shooting=TRUE; player_data[0].ammo1a-=1; gun_timer=1; feedback_procedure=1; player_weapon_flash(100); player_bullet(father.x,father.y,(player_data[0].z+player_data[0].camera_height),father.angle,m8[1].angle); END
            IF(mouse.right AND gun_timer==0 AND player_data[0].ammo1b>0) player_data[0].shots_fired+=1; stop_sound(player_shot_channel); player_shot_channel=sound(launcher_wav,cyber_genoids_game[0].volume,256); player_data[0].shooting=TRUE; player_data[0].ammo1b-=1; gun_timer=30; feedback_procedure=3; player_weapon_flash(100); player_granade(father.x,father.y,(player_data[0].z+player_data[0].camera_height),father.angle,m8[1].angle); END
            IF(gun_timer>0 AND gun_timer<30) gun_timer+=1; IF(gun_timer>8) gun_timer=0; END END
            IF(gun_timer=>30) gun_timer+=1; IF(gun_timer>70) gun_timer=0; END END

            IF(feedback_procedure==0)
                IF(y=<origonal_y-25 AND walking_procedure==1) walking_procedure=2; END
                IF(y=>origonal_y-5 AND walking_procedure==2) walking_procedure=1; END

                IF(player_data[0].walking==TRUE AND walking_procedure==1) IF(player_data[0].crouching==FALSE) y-=4; ELSE y-=2; END END
                IF(player_data[0].walking==TRUE AND walking_procedure==2) IF(player_data[0].crouching==FALSE) y+=4; ELSE y+=2; END END
            END

            IF(x=>origonal_x+25 AND feedback_procedure==1) feedback_procedure=2; END
            IF(x=<origonal_x AND feedback_procedure==2) feedback_procedure=0; END
            IF(feedback_procedure==1) x+=10; y+=10; END
            IF(feedback_procedure==2) x-=10; y-=10; END
            IF(x=>origonal_x+25 AND feedback_procedure==3) feedback_procedure=4; END
            IF(x=<origonal_x AND feedback_procedure==4) feedback_procedure=0; END
            IF(feedback_procedure==3) x+=10; y+=10; m8[1].angle+=5; END
            IF(feedback_procedure==4) x-=10; y-=10; m8[1].angle-=5; END
        END
        IF(weapon_to_be<>1 AND player_data[0].weapon==1 AND change_to_weapon==1)
            x+=20; y+=20;
            IF(x>900) change_to_weapon=weapon_to_be; END
        END

        IF(weapon_to_be==2 AND player_data[0].weapon<>2 AND change_to_weapon==2)
            graph=151;
            define_region(1,1,1,2,2);
            IF(x>650) x-=20; END
            IF(x>470) y-=20; END
            IF(x<=650 AND y<=470) player_data[0].weapon=2; END
        END
        IF(player_data[0].weapon==2 AND change_to_weapon==2 AND weapon_to_be==2)
            IF(mouse.left AND gun_timer==0 AND player_data[0].ammo2a>0)   player_data[0].shots_fired+=1; stop_sound(player_shot_channel); player_shot_channel=sound(shotgun_wav,cyber_genoids_game[0].volume,256); player_data[0].shooting=TRUE; player_data[0].ammo2a-=1; gun_timer=1; feedback_procedure=1; FROM number_of_bullets=0 TO 15; player_shot(father.x,father.y,(player_data[0].z+player_data[0].camera_height),(father.angle+rand(-9000,9000)),((m8[1].angle)+rand(-30,30))); END END
            IF(mouse.right AND gun_timer==0 AND player_data[0].ammo2a>1) player_data[0].shots_fired+=1;  stop_sound(player_shot_channel); player_shot_channel=sound(shotgun_wav,cyber_genoids_game[0].volume,256); player_data[0].shooting=TRUE; player_data[0].ammo2a-=2; gun_timer=1; feedback_procedure=1; FROM number_of_bullets=0 TO 10; player_shot(father.x,father.y,(player_data[0].z+player_data[0].camera_height),(father.angle+rand(-3000,3000)),((m8[1].angle)+rand(-10,10))); END END

            IF(gun_timer>0) gun_timer+=1; IF(gun_timer>30) gun_timer=0; END END

            IF(feedback_procedure==0)
                IF(y=<origonal_y-25 AND walking_procedure==1) walking_procedure=2; END
                IF(y=>origonal_y-5 AND walking_procedure==2) walking_procedure=1; END

                IF(player_data[0].walking==TRUE AND walking_procedure==1) IF(player_data[0].crouching==FALSE) y-=4; ELSE y-=2; END END
                IF(player_data[0].walking==TRUE AND walking_procedure==2) IF(player_data[0].crouching==FALSE) y+=4; ELSE y+=2; END END
            END

            IF(x=>origonal_x+100 AND feedback_procedure==1) feedback_procedure=2; END
            IF(x=<origonal_x AND feedback_procedure==2) feedback_procedure=0; END
            IF(feedback_procedure==1) x+=20; y+=10; END
            IF(feedback_procedure==2) x-=20; y-=10; END
        END
        IF(weapon_to_be<>2 AND player_data[0].weapon==2 AND change_to_weapon==2)
            x+=20; y+=20;
            IF(x>900) change_to_weapon=weapon_to_be; END
        END

        IF(weapon_to_be==3 AND player_data[0].weapon<>3 AND change_to_weapon==3)
            graph=0;
            define_region(1,230,130,340,340);
            x=650; y=470;
            player_data[0].scope=TRUE;
            player_data[0].weapon=3;
        END
        IF(player_data[0].weapon==3 AND change_to_weapon==3 AND weapon_to_be==3)
            IF(mouse.left AND gun_timer==0 AND player_data[0].ammo3a>0)  player_data[0].shots_fired+=1; stop_sound(player_shot_channel); player_shot_channel=sound(bullet_wav,cyber_genoids_game[0].volume,256); player_data[0].shooting=TRUE; gun_timer=1; player_data[0].ammo3a-=1; player_sniper_bullet(father.x,father.y,(player_data[0].z+player_data[0].camera_height),father.angle,m8[1].angle); END
            IF(gun_timer>0) gun_timer+=1; IF(gun_timer>50) gun_timer=0; END END
        END
        IF(weapon_to_be<>3 AND player_data[0].weapon==3 AND change_to_weapon==3)
            player_data[0].scope=FALSE;
            x=910; y=730;
            change_to_weapon=weapon_to_be;
        END

        IF(weapon_to_be==4 AND player_data[0].weapon<>4 AND change_to_weapon==4)
            graph=250;
            define_region(1,1,1,2,2);
            IF(x>650) x-=20; END
            IF(y>470) y-=20; END
            IF(x<=650 AND y<=470) player_data[0].weapon=4; END
        END
        IF(player_data[0].weapon==4 AND change_to_weapon==4 AND weapon_to_be==4)
            IF(mouse.left AND gun_timer==0 AND player_data[0].ammo4a>0)  player_data[0].shots_fired+=1; stop_sound(player_shot_channel); player_shot_channel=sound(bullet_wav,cyber_genoids_game[0].volume,256); player_data[0].shooting=TRUE; player_data[0].ammo4a-=1; gun_timer=1; feedback_procedure=1; player_zap(father.x,father.y,(player_data[0].z+player_data[0].camera_height),father.angle,m8[1].angle); END
            IF(gun_timer>0) gun_timer+=1; IF(gun_timer>50) gun_timer=0; END END

            IF(feedback_procedure==0)
                IF(y=<origonal_y-25 AND walking_procedure==1) walking_procedure=2; END
                IF(y=>origonal_y-5 AND walking_procedure==2) walking_procedure=1; END

                IF(player_data[0].walking==TRUE AND walking_procedure==1) IF(player_data[0].crouching==FALSE) y-=4; ELSE y-=2; END END
                IF(player_data[0].walking==TRUE AND walking_procedure==2) IF(player_data[0].crouching==FALSE) y+=4; ELSE y+=2; END END
            END

            IF(x=>origonal_x+25 AND feedback_procedure==1) feedback_procedure=2; END
            IF(x=<origonal_x AND feedback_procedure==2) feedback_procedure=0; END
            IF(feedback_procedure==1) x+=10; y+=10; END
            IF(feedback_procedure==2) x-=10; y-=10; END
        END
        IF(weapon_to_be<>4 AND player_data[0].weapon==4 AND change_to_weapon==4)
            x+=20; y+=20;
            IF(x>900) change_to_weapon=weapon_to_be; END
        END

    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_bar();

BEGIN
    write_int(main_font,400,40,4,& player_data[0].health);
    write_int(red_font,75,60,4,& player_data[0].ammo1a);
    write(red_font,100,60,4,":");
    write_int(red_font,125,60,4,& player_data[0].ammo1b);
    icons(effects_file,201,100,30);
    write_int(red_font,250,60,4,& player_data[0].ammo2a);
    icons(effects_file,220,550,30);
    write_int(red_font,550,60,4,& player_data[0].ammo3a);
    icons(effects_file,229,250,30);
    write_int(red_font,700,60,4,& player_data[0].ammo4a);
    icons(effects_file,210,700,30);
    key_icon(effects_file,30,90,150);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS icons(file,graph,x,y);

PRIVATE
    origonal_graph;

BEGIN
    z=-60;
    origonal_graph=graph;
    size=40;
    LOOP
        IF(flags==0) graph+=1; END
        IF(flags==1) graph-=1; END
        IF(graph==origonal_graph+8 OR graph==origonal_graph) IF(flags==0) flags=1; ELSE flags=0; END END
    FRAME(100*4);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS key_icon(file,graph,x,y);

PRIVATE
    origonal_graph;

BEGIN
    z=-60;
    size=35;
    origonal_graph=graph;
    graph=0;
    LOOP
    IF(levle_data[1].key1==TRUE) graph=origonal_graph; ELSE graph=0; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS rain_drop();

BEGIN
    file=effects_file;
    graph=3;
    x=rand(0,800);
    y=-40;
    z=-25;
    WHILE(y<650)
        IF(player_data[0].outside==TRUE) graph=3; ELSE graph=0; END
        y+=20;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_weapon_flash(graph);

PRIVATE
    player_weapon_flash_timer;

BEGIN
    file=player_file;
    flags=4;
    WHILE(player_weapon_flash_timer<2)
        player_weapon_flash_timer+=1;
        x=father.x-80;
        y=father.y-80;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS cross_head();

BEGIN
    file=main_file;
    graph=10;
    x=400;
    y=300;
    z=-50;
    LOOP
    IF(player_data[0].scope==TRUE) graph=0; ELSE graph=10; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy1(number,enemy_data[number].health);

PRIVATE
    floor_height;
    roof_height;
    distance_to_player;
    angle_to_player;
    enemy_gun_timer;
    angle2;
    xhealth;
    zangle;

    notice_square;
    notice_square_x; notice_square_y; notice_square_d;
    notice_square_graph=52;
    notice_square_counter=0;
    notice_opacity;

    cocky;
    xcocky;
    die_of;

    point=1;
    walk;
    enemy_counter;
    can_notice=FALSE;
    move_angle;
    volume_distance;
BEGIN

    IF(enemy_data[number].health=<0) die_of=TRUE; END
    ctype=c_m8;
    radius=120;
    m8_step=64;

    file=enemy1_file;
    graph=0;

    walk=rand(1,27);
    graph=0;
    IF(game_loaded==FALSE OR (enemy_data[number].x==0 AND enemy_data[number].y==0))
        go_to_flag(number+150);
        enemy_data[number].x2=x;
        enemy_data[number].y2=y;
        FRAME;
        go_to_flag(number+100);
        enemy_data[number].x1=x;
        enemy_data[number].y1=y;
        FRAME;
        ELSE
        x=enemy_data[number].x;
        y=enemy_data[number].y;
        angle=enemy_data[number].angle;
    END
    shadow();

    notice_square=draw(2,0,0,0,0,0,0,0);
    xhealth=enemy_data[number].health;

    cocky=rand(800,1500);
    xcocky=cocky;
    LOOP
        IF(die_of==TRUE) BREAK; END
        distance_to_player=get_dist(id_player);
        angle2=get_angle(id_player)-angle;
        IF(angle2<-180000) angle_to_player=angle2+360000; ELSE angle_to_player=angle2; END

        IF(player_data[0].crouching==FALSE) zangle=((player_data[0].z-enemy_data[number].z))/(distance_to_player/20); END
        IF(player_data[0].crouching==TRUE) zangle=((player_data[0].z-enemy_data[number].z)-200)/(distance_to_player/20); END
        move_angle=((player_data[0].z-enemy_data[number].z))/(distance_to_player/20);
        IF(zangle>7) zangle=7; END
        IF(zangle<-7) zangle=-7; END
        IF(move_angle>7) move_angle=7; END
        IF(move_angle<-7) move_angle=-7; END
        IF(move_angle==0) cocky=xcocky; ELSE cocky=xcocky+(move_angle*140); END
        IF(cocky<0) cocky=0; END

        get_sector_height(m8_sector,& floor_height,& roof_height);
        IF(z>(floor_height+10)) z-=25; END
        IF(z<(floor_height+10)) z=floor_height; END

        IF(number<10 AND player_data[0].mission_point=>0) can_notice=TRUE; END
        IF(number=>10 AND number<13 AND player_data[0].mission_point=>3) can_notice=TRUE; END
        IF(number=>13 AND number<20 AND player_data[0].mission_point=>5) can_notice=TRUE; END
        IF(number=>20 AND player_data[0].mission_point=>6) can_notice=TRUE; END

        IF(xhealth<>enemy_data[number].health) player_data[0].shots_hit+=1; enemy_data[number].notice_player=TRUE; END

        IF(can_notice==TRUE);
            IF(number==5) IF(levle_data[1].door2_open==TRUE) enemy_data[number].notice_player=TRUE; END ELSE
            IF(number==7) IF(levle_data[1].door3_open==TRUE) enemy_data[number].notice_player=TRUE; END ELSE
            IF(number==22) IF(levle_data[1].door12_open==TRUE) enemy_data[number].notice_player=TRUE; END ELSE
            IF(number=>13 AND number<=16) IF(player_data[0].mission_point=>5) enemy_data[number].notice_player=TRUE; END ELSE
            IF((distance_to_player<2000 AND angle_to_player>-45000 AND angle_to_player<45000) OR (distance_to_player<500) OR (distance_to_player<2000 AND player_data[0].shooting==TRUE)) enemy_data[number].notice_player=TRUE;
            END END END END END
        END

        IF(enemy_gun_timer>0) enemy_gun_timer+=1; IF(enemy_gun_timer>30) enemy_gun_timer=0; END END

        IF(enemy_data[number].notice_player==FALSE)
            IF(point==1) IF(fget_dist(x,y,enemy_data[number].x2,enemy_data[number].y2)<20) point=2; ELSE angle=fget_angle(x,y,enemy_data[number].x2,enemy_data[number].y2); advance(15); walk+=1; END END
            IF(point==2) IF(fget_dist(x,y,enemy_data[number].x1,enemy_data[number].y1)<20) point=1; ELSE angle=fget_angle(x,y,enemy_data[number].x1,enemy_data[number].y1); advance(15); walk+=1; END END

            ELSE

            angle=get_angle(id_player);

            IF(enemy_gun_timer==0 AND distance_to_player<3000) stop_sound(enemy_shot_channel); volume_distance=(256-(distance_to_player/8))-(256-cyber_genoids_game[0].volume); IF(volume_distance<0) volume_distance=0; END IF(volume_distance>256) volume_distance=256; END enemy_shot_channel=sound(bullet_wav,volume_distance,256); enemy_gun_timer=1; enemy_bullet(x,y,(enemy_data[number].z+300),angle,zangle); gun_flash((enemy_data[number].z+70)); END
            IF(distance_to_player>cocky) advance(20); walk+=1; END
            IF(distance_to_player<((cocky/4)*3)) advance(-20); walk+=1; END

            IF(player_data[0].scope==TRUE) move_draw(notice_square,0,0,0,0,0,0);
                ELSE
                notice_square_counter+=1;
                IF((distance_to_player/350)=<15) notice_opacity=distance_to_player/350; ELSE notice_opacity=15; END
                IF(notice_square_counter>8) notice_square_graph=71; END
                IF(notice_square_counter>16) notice_square_graph=52; notice_square_counter=0; END
                m8_to_screen(x,y,z+170,id_player,1,& notice_square_x,& notice_square_y,& notice_square_d);
                move_draw(notice_square,notice_square_graph,15-notice_opacity,notice_square_x-(notice_square_d*2),notice_square_y-(notice_square_d*4),notice_square_x+(notice_square_d*2),notice_square_y+(notice_square_d*3));
                m8_text(100,notice_square_x,(notice_square_y-((notice_square_d*43)/10)),(notice_square_d*3));
            END
        END

        IF(walk>28) walk=1; END

        SWITCH(walk);
            CASE 01: xgraph=& enemy1_walk01; END
            CASE 02: xgraph=& enemy1_walk02; END
            CASE 03: xgraph=& enemy1_walk03; END
            CASE 04: xgraph=& enemy1_walk04; END
            CASE 05: xgraph=& enemy1_walk05; END
            CASE 06: xgraph=& enemy1_walk06; END
            CASE 07: xgraph=& enemy1_walk07; END
            CASE 08: xgraph=& enemy1_walk08; END
            CASE 09: xgraph=& enemy1_walk09; END
            CASE 10: xgraph=& enemy1_walk10; END
            CASE 11: xgraph=& enemy1_walk11; END
            CASE 12: xgraph=& enemy1_walk12; END
            CASE 13: xgraph=& enemy1_walk13; END
            CASE 14: xgraph=& enemy1_walk14; END
            CASE 15: xgraph=& enemy1_walk15; END
            CASE 16: xgraph=& enemy1_walk16; END
            CASE 17: xgraph=& enemy1_walk17; END
            CASE 18: xgraph=& enemy1_walk18; END
            CASE 19: xgraph=& enemy1_walk19; END
            CASE 20: xgraph=& enemy1_walk20; END
            CASE 21: xgraph=& enemy1_walk21; END
            CASE 22: xgraph=& enemy1_walk22; END
            CASE 23: xgraph=& enemy1_walk23; END
            CASE 24: xgraph=& enemy1_walk24; END
            CASE 25: xgraph=& enemy1_walk25; END
            CASE 26: xgraph=& enemy1_walk26; END
            CASE 27: xgraph=& enemy1_walk27; END
            CASE 28: xgraph=& enemy1_walk28; END
        END

//        enemy_counter=1;
//        WHILE(enemy_counter<=number_of_enemys)
//            IF(number<>enemy_counter AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<300) xadvance(fget_angle(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)+180000,20); END
//            enemy_counter+=1;
//        END

        IF(player_data[0].levle==1 AND y>22100 AND y<22900 AND x<6150 AND x>6050) x=6150; END
        IF(player_data[0].levle==1 AND y>22100 AND y<22900 AND x>5950 AND x<6050) x=5950; END
        IF(player_data[0].levle==1 AND levle_data[1].pannel4==FALSE AND y>22200 AND y<22800 AND x>15200 AND x<15300) x=15300; END
        IF(player_data[0].levle==1 AND levle_data[1].pannel4==FALSE AND y>22200 AND y<22800 AND x>15100 AND x<15200) x=15100; END
        IF(player_data[0].levle==1 AND y>20000 AND y<22000 AND x>17100 AND x<17300) x=17100; END
        IF(player_data[0].levle==1 AND x>5050 AND x<5200 AND y>19360 AND y<20032) x=5050; END
        IF(player_data[0].levle==1 AND x>7600 AND x<7840 AND y>19360 AND y<20032) x=7840; END
        IF(player_data[0].levle==1 AND x>5088 AND x<7840 AND y>19300 AND y<19450) y=19300; END
        IF(player_data[0].levle==1 AND x>5088 AND x<7840 AND y>19900 AND y<20032) y=20032; END
        IF(player_data[0].levle==1 AND x>4000 AND x<4800 AND y>21696 AND y<22176) x=4800; END

        enemy_data[number].x=x;
        enemy_data[number].y=y;
        enemy_data[number].z=z;
        xhealth=enemy_data[number].health;

        IF(enemy_data[number].health<=0) angle=get_angle(id_player); enemy_data[number].angle=angle; BREAK; END
        FRAME;
    END
    delete_draw(notice_square);
    IF(die_of==FALSE)
    xgraph=0;
    graph=1;
    LOOP
    graph+=1;
    IF(graph=>6) BREAK; END
    FRAME((100*13)/10);
    END
    END
    signal(son,s_kill);
    graph=0;
    IF(number==15 AND levle_data[1].key1_x==0 AND levle_data[1].key1_y==0 AND levle_data[1].key1==FALSE)
        levle_data[1].key1_x=x;
        levle_data[1].key1_y=y;
        pickup(4,20);
    END
    xgraph=& enemy1_body;
    LOOP
        get_sector_height(m8_sector,& floor_height,& roof_height);
        IF(z>floor_height) z-=20; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS gun_flash(z)

PRIVATE
    gun_flash_timer;

BEGIN
    ctype=c_m8;
    radius=1;
    file=effects_file;
    graph=20;
    flags=4;
    WHILE(gun_flash_timer<4)
        angle=get_angle(id_player);
        x=father.x;
        y=father.y;
        advance(40);
        xadvance(angle+90000,30);
        gun_flash_timer+=1;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS m8_text(graph,x,y,size);

BEGIN
    file=effects_file;
    z=-255;
    FRAME;
END

//-----------------------------------------------------------------------------------------------

PROCESS shadow();

PRIVATE
    floor_height;
    roof_height;

BEGIN
    ctype=c_m8;
    file=effects_file;
    graph=4;
    flags=4;
    radius=120;
    LOOP
        get_sector_height(m8_sector,& floor_height,& roof_height);
        x=father.x;
        y=father.y;
        z=floor_height;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_bullet(x,y,z,angle2,zangle);

PRIVATE
    xz;
    distance_travled;
    amount_of_blood;

    enemy_counter;
    texture; light;
    not_hit;
BEGIN
    ctype=c_m8;
    radius=1;
    m8_step=0;
    file=effects_file;
    graph=1;
    angle=angle2;
    WHILE(not_hit==FALSE)
        enemy_counter=1;
        z+=(zangle/5);

        advance(54);
        distance_travled+=54;
        IF(m8_wall>-1) get_wall_texture(m8_wall,& texture,& light); IF(texture>0) bullet_hole(x,y,z); END not_hit=TRUE; END
        IF(xz==z AND (zangle/5)<>0) not_hit=TRUE; END
        IF(distance_travled>4500); not_hit=TRUE; END

        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<64 AND z<(enemy_data[enemy_counter].z+390)) IF(cyber_genoids_game[0].grass==1 OR cyber_genoids_game[0].grass==2) FROM amount_of_blood=0 TO 9; enemy_blood(x,y,z,angle); END END enemy_data[enemy_counter].health-=20; not_hit=TRUE; END
            enemy_counter+=1;
        END

        xz=z;
    FRAME(100/4);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_zap(x,y,z,angle2,zangle);

PRIVATE
    distance_travled;
    spark_counter;

    enemy_counter;
    texture; light;
    not_hit;
    amount_of_blood;
BEGIN
    ctype=c_m8;
    radius=5;
    m8_step=0;
    file=effects_file;
    graph=5;
    flags=4;
    angle=angle2;
    z-=50;
    WHILE(not_hit==FALSE);
        enemy_counter=1;
        z+=(zangle/5);
        advance(54);
        distance_travled+=54;
        angle+=rand(-3000,3000);
        z+=rand(-1,1);
        IF(m8_wall>-1) not_hit=TRUE; END
        IF(distance_travled>2500); not_hit=TRUE; END
//        enemy_counter=1;
//        WHILE(enemy_counter=<number_of_enemys);
//            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<300 AND z<(enemy_data[enemy_counter].z+600)) not_hit=TRUE; END
//            enemy_counter+=1;
//        END
        IF(mouse.right) not_hit=TRUE; END
    FRAME;
    END
        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<600 AND z<(enemy_data[enemy_counter].z+600)) IF(cyber_genoids_game[0].grass==1 OR cyber_genoids_game[0].grass==2) FROM amount_of_blood=0 TO 9; enemy_blood(x,y,z,angle); END END enemy_data[enemy_counter].health-=100; END
            enemy_counter+=1;
        END

    FROM spark_counter=0 TO 25; spark(x,y,z); END
    FROM spark_counter=0 TO 25; spark(x,y,z); END
END

//-----------------------------------------------------------------------------------------------

PROCESS spark(x,y,z);

PRIVATE;
    zap_travled;
//    floor_height;
//    roof_height;
    zangle;
    max_dist;
    power;
//    enemy_counter;
//    shit;
//    amount_of_blood;
    not_hit;
    dist;
BEGIN
    ctype=c_m8;
    file=effects_file;
    graph=7;
    radius=1;
    angle=rand(0,360000);
    zangle=rand(-7,5);
    power=rand(20,30);
    dist=rand(400,600);
    WHILE(not_hit==FALSE);
        advance(power);
        zap_travled+=power;
        z+=zangle;
//        IF(shit==2) get_sector_height(m8_sector,& floor_height,& roof_height);
        IF(m8_wall>-1) not_hit=TRUE; END
//        IF(z<(floor_height+10)) not_hit=TRUE; END
//        IF(z>(roof_height-10)) not_hit=TRUE; END
//        END
        IF(zap_travled>dist); not_hit=TRUE; END
//        shit=2;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_shot(x,y,z,angle2,zangle);

PRIVATE
    xz;
    distance_travled;
    amount_of_blood;

    enemy_counter;
    texture; light;
    not_hit;
BEGIN
    ctype=c_m8;
    radius=1;
    m8_step=0;
    file=effects_file;
    graph=1;
    angle=angle2;

    WHILE(not_hit==FALSE)
        enemy_counter=1;
        z+=(zangle/5);
        advance(54);
        distance_travled+=54;
        IF(m8_wall>-1) get_wall_texture(m8_wall,& texture,& light); IF(texture>0) bullet_hole(x,y,z); END not_hit=TRUE; END
        IF(xz==z AND (zangle/5)<>0) not_hit=TRUE; END
        IF(distance_travled>3000); not_hit=TRUE; END

        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<64 AND z<(enemy_data[enemy_counter].z+390)) IF(cyber_genoids_game[0].grass==1 OR cyber_genoids_game[0].grass==2) FROM amount_of_blood=0 TO 5; enemy_blood(x,y,z,angle); END END enemy_data[enemy_counter].health-=10; not_hit=TRUE; END
            enemy_counter+=1;
        END

        xz=z;
        FRAME(100/4);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_sniper_bullet(x,y,z,angle2,zangle);

PRIVATE
    xz;
    distance_travled;
    amount_of_blood;

    enemy_counter;
    texture; light;
    not_hit;
BEGIN
    ctype=c_m8;
    radius=1;
    m8_step=0;
    file=effects_file;
    graph=1;
    angle=angle2;

    WHILE(not_hit==FALSE)
        enemy_counter=1;
        z+=(zangle/5);
        advance(54);
        distance_travled+=54;
        IF(m8_wall>-1) get_wall_texture(m8_wall,& texture,& light); IF(texture>0) bullet_hole(x,y,z); END not_hit=TRUE; END
        IF(xz==z AND (zangle/5)<>0) not_hit=TRUE; END
        IF(distance_travled>10000); not_hit=TRUE; END

        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<64 AND z<(enemy_data[enemy_counter].z+390)) IF(cyber_genoids_game[0].grass==1 OR cyber_genoids_game[0].grass==2) FROM amount_of_blood=0 TO 30; enemy_blood(x,y,z,angle); END END enemy_data[enemy_counter].health-=100; not_hit=TRUE; END
            enemy_counter+=1;
        END

        xz=z;
    FRAME(100/6);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS player_granade(x,y,z,angle2,zangle);

PRIVATE
    xz;
    distance_travled;
    amount_of_blood;

    enemy_counter;
    texture; light;
    not_hit;
BEGIN
    ctype=c_m8;
    radius=1;
    m8_step=0;
    file=effects_file;
    graph=1;
    angle=angle2;
    WHILE(not_hit==FALSE)
        enemy_counter=1;
        z+=(zangle/5);
        advance(54);
        distance_travled+=54;
        IF(m8_wall>-1) not_hit=TRUE; END
        IF(xz==z AND (zangle/5)<>0) not_hit=TRUE; END
        IF(distance_travled>2000); not_hit=TRUE; END

        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<200 AND z<(enemy_data[enemy_counter].z+390)) not_hit=TRUE; END
            enemy_counter+=1;
        END

        xz=z;
    FRAME(100/4);
    END
    file=explosion_file;
    graph=1;
    z-=200;
    radius=100;
    stop_sound(explosion_channel); explosion_channel=sound(explosion_wav,cyber_genoids_game[0].volume,256);
    WHILE(graph<29)

        enemy_counter=1;
        WHILE(enemy_counter<=number_of_enemys);
            IF(enemy_data[enemy_counter].health>0 AND fget_dist(x,y,enemy_data[enemy_counter].x,enemy_data[enemy_counter].y)<300 AND z<(enemy_data[enemy_counter].z+600)) IF(cyber_genoids_game[0].grass==1 OR cyber_genoids_game[0].grass==2) FROM amount_of_blood=0 TO 40; enemy_blood(enemy_data[enemy_counter].x,enemy_data[enemy_counter].y,enemy_data[enemy_counter].z+200,rand(0,360000)); END END enemy_data[enemy_counter].health-=100; END
            enemy_counter+=1;
        END

        graph+=1;
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy_bullet(x,y,z,angle2,zangle);

PRIVATE
    distance_travled;
    xz;
    incline_z;
    texture; light;
BEGIN
    ctype=c_m8;
    radius=1;
    m8_step=0;
    file=effects_file;
    graph=1;
    angle=angle2;
    advance(50);
    FRAME;
    LOOP
        incline_z=(zangle);
        z+=zangle;
        advance(20);
        distance_travled+=20;
        IF(m8_wall>-1) get_wall_texture(m8_wall,& texture,& light); IF(texture>0) bullet_hole(x,y,z); END BREAK; END
        IF(xz==z AND (incline_z)<>0) BREAK; END
        IF(distance_travled>4000); BREAK; END

        IF(fget_dist(x,y,id_player.x,id_player.y)<64 AND z<(player_data[0].z+player_data[0].camera_height+50)) player_data[0].health-=5; BREAK; END

        xz=z;
    FRAME(100/20);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS bullet_hole(x,y,z);

PRIVATE
    bullet_hole_timer;
    xz;
BEGIN
    ctype=c_m8;
    file=effects_file;
    graph=2;
    number_of_bullet_holes+=1;
    radius=2;
    xz=z;
    LOOP
        bullet_hole_timer+=1;

        IF(cyber_genoids_game[0].grass==0)
            IF(bullet_hole_timer>400) BREAK; END
            IF(number_of_bullet_holes>100); BREAK; END
        END

        IF(cyber_genoids_game[0].grass==1)
            IF(bullet_hole_timer==400) flags=4; END
            IF(bullet_hole_timer>600) BREAK; END
            IF(number_of_bullet_holes>300); BREAK; END
        END

        IF(cyber_genoids_game[0].grass==2)
            IF(bullet_hole_timer==800) flags=4; END
            IF(bullet_hole_timer>1200) BREAK; END
            IF(number_of_bullet_holes>600); BREAK; END
        END
        IF(xz<>z) BREAK; END
        xz=z;
    FRAME;
    END
    number_of_bullet_holes-=1;
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy_blood(x,y,z,angle);

PRIVATE;
    blood_timer;
    xz;
    floor_height;
    roof_height;
    hit_floor;

BEGIN
    ctype=c_m8;
    file=effects_file;
    IF(cyber_genoids_game[0].blood_levle==2) graph=rand(14,16); END
    IF(cyber_genoids_game[0].blood_levle==3) graph=rand(11,13); END
    radius=1;
    angle+=rand(-20000,20000);
    z+=rand(-50,50);
    blood_timer=0;
    flags=4;
    LOOP
        xz=z;
        get_sector_height(m8_sector,& floor_height,& roof_height);
            IF(m8_wall==-1 AND hit_floor==FALSE)
                advance(rand(10,40));
                z-=rand(10,30);
            END
            IF(m8_wall>-1 AND hit_floor==FALSE)
                z-=1;
            END
            IF(hit_floor==TRUE)
                z=floor_height;
            END

        IF(z=<floor_height) hit_floor=TRUE; END
        blood_timer+=1;
        IF(cyber_genoids_game[0].grass==0) BREAK; END
        IF(cyber_genoids_game[0].grass==1 AND blood_timer=>400) BREAK; END
        IF(cyber_genoids_game[0].grass==2 AND blood_timer=>800) BREAK; END

    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS liquid(sector);

PRIVATE
    flow_graph;
    ground_height;
    roof_height;
BEGIN
        flow_graph=200;
        get_sector_height(sector,& ground_height,& roof_height);
        LOOP
        IF(player_data[0].sector==sector AND player_data[0].z=<(ground_height+50)) player_data[0].health-=2; END
        flow_graph+=1;
        IF(flow_graph=>210) flow_graph=200; END;
        set_sector_texture(sector,flow_graph,-1,-1);
        FRAME(100*5);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS lasser_beam(graph,number);

BEGIN
    ctype=c_m8;
    file=scenery_file;
    flags=4;
    go_to_flag(number+600);
    LOOP
    IF(graph==225 OR graph==226) IF(player_data[0].levle==1 AND player_data[0].mission_point>1) BREAK; END flags=rand(5,6); IF(graph==225) graph=226; ELSE graph=225; END IF(player_data[0].levle==1 AND player_data[0].mission_point>1) BREAK; END END
    IF(number=>8) IF(levle_data[1].pannel4==TRUE) graph=0; ELSE graph=220; END END
    FRAME(100*8);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS grass(x,y);

BEGIN
    ctype=c_m8;
    file=scenery_file;
    graph=230;
    z=100;
    radius=50;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS m8_to_screen(x,y,z,cam,number,outx,outy,outd)
PRIVATE
    across;
    up;
    depth;
    dist;
BEGIN
    across=get_distx(90000-cam.angle,(x-cam.x))+get_distx(-cam.angle,(y-cam.y));
    depth=-(get_disty(90000-cam.angle,(x-cam.x))+get_disty(-cam.angle,(y-cam.y)));
    up=-(z-(cam.z+m8[1].height));
    dist=fget_dist(cam.x,cam.y,x,y);

    IF(depth>0)
        ^ outx=400+555*(across*1000/depth)/1000;
        ^ outy=300+555*(up*1000/depth)/1000+600/2*m8[number].angle/128;
        IF(dist>0)
            ^ outd=((50000000/dist)*64)/100000;
        END
    ELSE
        ^ outx=-512;
        ^ outy=-512;
        ^ outd=0;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS pickup(number,item);

PRIVATE
    distance_to_player;
    notice_pickup=FALSE;
    notice_square;
    notice_square_counter=0;
    notice_square_graph;
    notice_square_x;
    notice_square_y;
    notice_square_d;
    notice_opacity;
    notice_type;
    notice_distance;
    floor_height;
    roof_height;
BEGIN
    ctype=c_m8;
    file=effects_file;
    notice_square=draw(2,0,0,0,0,0,0,0);

    IF(item==1) go_to_flag(number+500); xgraph=& assault_riffle; notice_type=120; angle=90000; notice_distance=500; END
    IF(item==2) go_to_flag(number+500); xgraph=& shotgun; notice_type=122; angle=90000; notice_distance=500; END
    IF(item==3) go_to_flag(number+500); xgraph=& sniper_riffle; notice_type=123; angle=90000; notice_distance=500; END
    IF(item==4) go_to_flag(number+500); xgraph=& pulse_riffle; notice_type=121; angle=90000; notice_distance=500; END
    IF(item==10) go_to_flag(number+500); xgraph=0; graph=0; notice_type=123; angle=90000; notice_distance=500; END
    IF(item==20) x=levle_data[1].key1_x; y=levle_data[1].key1_y; xgraph=0; graph=30; notice_type=123; angle=90000; notice_distance=500; END

    IF(item<>10) shadow(); END
        LOOP
        angle+=5000;
        distance_to_player=get_dist(id_player);
        get_sector_height(m8_sector,& floor_height,& roof_height);
        z=floor_height+100;
        IF(distance_to_player<notice_distance) notice_pickup=TRUE; END

        IF(notice_pickup==TRUE AND item<10);
            IF(player_data[0].scope==TRUE) move_draw(notice_square,0,0,0,0,0,0);
                ELSE
                notice_square_counter+=1;
                IF((distance_to_player/200)=<15) notice_opacity=distance_to_player/200; ELSE notice_opacity=15; END
                IF(notice_square_counter>8) notice_square_graph=44; END
                IF(notice_square_counter>16) notice_square_graph=114; notice_square_counter=0; END
                m8_to_screen(x,y,z+170,id_player,1,& notice_square_x,& notice_square_y,& notice_square_d);
                move_draw(notice_square,notice_square_graph,15-notice_opacity,notice_square_x-(notice_square_d*3),notice_square_y-(notice_square_d*2),notice_square_x+(notice_square_d*3),notice_square_y+(notice_square_d*2));
                m8_text(notice_type,notice_square_x,(notice_square_y-((notice_square_d*24)/10)),(notice_square_d*3));
            END
        END

        IF(item==1 AND distance_to_player<200) player_data[0].ammo1a+=50; BREAK; END
        IF(item==2 AND distance_to_player<200) player_data[0].ammo2a+=10; BREAK; END
        IF(item==3 AND distance_to_player<200) player_data[0].ammo3a+=5; BREAK; END
        IF(item==4 AND distance_to_player<200) player_data[0].ammo4a+=5; BREAK; END
        IF(item==10 AND distance_to_player<300) player_data[0].health+=50; BREAK; END
        IF(item==20 AND distance_to_player<200) BREAK; END

        FRAME;
    END
    delete_draw(notice_square);
    signal(son,s_kill);
    IF(number==1) levle_data[1].pickup1=TRUE; END
    IF(number==2) levle_data[1].pickup2=TRUE; END
    IF(number==3) levle_data[1].pickup3=TRUE; set_sector_height(265,2200,2640); set_sector_texture(265,50,-1,-1); END
    IF(number==4) levle_data[1].key1=TRUE; levle_data[1].key1_x=0; levle_data[1].key1_y=0; END
    IF(number==5) levle_data[1].pickup5=TRUE; set_sector_height(400,2050,-1); set_sector_texture(400,30,-1,-1); END
    IF(number==6) levle_data[1].pickup6=TRUE; END
    IF(number==7) levle_data[1].pickup7=TRUE; set_sector_height(65,2000,-1); set_sector_texture(65,95,-1,-1); END
    IF(number==8) levle_data[1].pickup8=TRUE; set_sector_height(354,2512,-1); set_sector_texture(354,95,-1,-1); END
    IF(number==9) levle_data[1].pickup9=TRUE; END
    IF(number==10) levle_data[1].pickup10=TRUE; END
END

//-----------------------------------------------------------------------------------------------

PROCESS ship();

BEGIN
    ctype=c_m8;
    file=effects_file;
    go_to_flag(80);
    angle=270000;
    z=3280;
    WHILE(player_data[0].mission_point<7);
    FRAME;
    END
    xgraph=& jump_jet;
    WHILE(z>2000);
    z-=20;
    FRAME;
    END
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------
