
//-----------------------------------------------------------------------------
// TITLE:      TANK BLAST ARMEGEDDON
// AUTHOR:     OWEN DAVIES
// DATE:       2002
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------
//
//  10 scrolls
//
//  1       terrain
//
//-----------------------------------------------------------------------------
//
//  31 regions
//
//  1       film box 1
//  2       film box 2
//  3       film box 3
//  4       left bar
//  5       center bar
//  6       right bar
//
//-----------------------------------------------------------------------------
//
//  z
//
//  512     scroll
//
//  256     M7 windows
//
//  0       graphics
//
//  -256    text
//
//  -512    mouse
//
//-----------------------------------------------------------------------------
//
//  10 Mode 7
//
//  1 Map
//
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROGRAM tank_blast_armeggedon;

GLOBAL

//-----------------------------------------------------------------------------
//  @ Program Pre-Sets
//-----------------------------------------------------------------------------

    screen=1;
    new_screen;

    channel1;
    channel2;

    main_file;
    photo_file;
    map_file;
    film_file;
    game_file;
    scenrey_file;

    white_font;
    red_font;
    green_font;

    s_1;
    s_2;
    s_3;
    s_4;
    s_5;
    s_6;
    s_7;
    s_explosion;

    first_text[]="THE YEAR IS 2046,","AND THE WORLD IS DIVIDED INTO 4 GREAT POWERS.","THE UNITED STATES OF NEW AMERICA (USNA),","EUROPE,","THE UNITED MOSLEM NATIONS,","AND THE UNITED SOVIET STATES OF NEW RUSSIA (USSNR).","AND THEN THERE IS BRITAIN!","WAR HAS BROKEN OUT IN THE WHOLE WORLD","AFTER GENERAL ARVIN OF THE USNA DECLARED WAR ON EUROPE.","KING HENRY HAS DECLARED THAT BRITAIN SHALL FIGHT TO THE DEATH","TO BRING PEACE TO THE WORLD BEFORE NUCLEAR ARMAGEDDON WIPES OUT EVERYTHING.","YOU ARE A SECRET 3 MAN OPERATION CODE NAMED TANK BLAST.","YOUR MISSION IS TO SINGLE HANDEDLY PENETRATE","THE USNA'S EAST COAST AND SEIZE THEIR NUCLEAR ARSENAL.","THEN YOU MUST STOP GENERAL ARVIN'S FASCIST REGIME.","THIS WILL NOT BE EASY","BUT FOR THE SAKE OF THE WORLD YOU MUST SUCCEED.","LONG LIVE THE KING";
    first_text_timer[]=8,17,27,30,36,52,59,66,79,89,102,115,123,135,144,149,160,168;
    time_line_text[]="","2015","ALL OF EUROPE UNITES","","2016","BRITISH GOVERNMENT MAKES A PLEDGE TO","JOIN THE NEW EUROPE BUT QUEEN","ELIZABETH REFUSES AND DISSOLVES","PARLIAMENT","","2020","WILLIAM CROWNED KING WILLIAM III.","","2025","WHOLE OF AMERICA UNITES TO FORM THE","USNA (UNITED STATES OF NEW AMERICA","","2029","RUSSIA AND THE FORMER EASTERN BLOCK","CONTRIES UNITE TO FORM THE USSNR","(UNITED SOVIOT STATES OF NEW RUSSIA)","","2030","GENERAL ARVIN BECOMES SECRETARY OF","DEFENCE OF THE USNA. PRINCE HENRY","IS BORN","","2032","USNA INCREASES ITS NUCLEAR ARSENAL,","USSNR AND EUROPE INCREASE THEIR","NUCLEAR CAPACITY IN RESPONSE","","2033","SOTHERN COUNTRIES SEE THREAT OF","NUCLEAR WAR AND FORM THE","UNITED MOSLEM NATIONS","","2038","USNA DEVELOPS A NEW SUPER NUKE","","2041","TANK BLAST PROJECT IS STARTED","IN RESPONSE OF THE USNA'S SUPER","NUKE.","","2043","USNA PRESIDENT AND KING WILLIAM III","ARE ASSASSINATED BY A SHADOW","WARRIOR, BELIEVED TO BE UNDER ORDERS","OF GENERAL ARVIN. PRINCE HENRY IX",
                     "BECOMES KING AND ARVIN IS DECLARED","ACTING PRESIDENT OF THE USNA","","2044","ARVIN DECLARES WAR ON EUROPE","","2045","USNA TESTS NEW NUKE ON","AUSTRALASIA AND WIPES OUT ENTIRE","CONTINENT. ALL OF THE 4 SUPER POWERS","DECLARE WAR ON EACH OTHER. NUCLEAR","ARMEGEDDON BEGINS. BRITAIN SETS OUT","TO STOP IT","","2046","TANK BLAST PROJECT IS EXECUTED";
    film_text_timer1=0;
    film_box1_graphs[]=0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18;
    film_box2_graphs[]=0,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38;
    film_box3_graphs[]=0,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58;

    mission1_map_you[]=3,1335,485;
    mission1_map_britain[]=10;
    mission1_map_usna[]=20,1320,520,1320,570,1280,600,1290,650,1220,540,1180,620;
    mission1_map_ussnr[]=30;
    mission1_map_umn[]=40;
    mission1_map_europe[]=50;

//-----------------------------------------------------------------------------
//  @ Game Pre-Sets
//-----------------------------------------------------------------------------

    left_bar_open;
    center_bar_open;
    right_bar_open;

    random_terrain;
    terrain_minx;
    terrain_maxx;
    terrain_miny;
    terrain_maxy;

//-----------------------------------------------------------------------------
//  @ Save Pre-Sets
//-----------------------------------------------------------------------------

    programe_save[]=256,256;
    levle_save[]=;
    starting_point_1_x;
    starting_point_1_y;
    starting_point_1_a;

//-----------------------------------------------------------------------------
//  @ Program
//-----------------------------------------------------------------------------

BEGIN
    set_mode(m800x600);
    set_fps(24,100);

    load_pal("pal\tb2\pal.pal");

    white_font=load_fnt("fnt\tb2\white.fnt");
    red_font=load_fnt("fnt\tb2\red.fnt");
    green_font=load_fnt("fnt\tb2\green.fnt");

    main_file=load_fpg("fpg\tb2\main.fpg");

    LOOP
        SWITCH (screen);
            CASE 1: owen_games(); END
            CASE 2: film(); END
            CASE 3: time_line(); END
            CASE 4: load_campaign(); END
            CASE 5: menu1(); END
            CASE 6: menu2(); END
            CASE 7: menu3(); END
            CASE 8: menu4(); END
            CASE 9: menu5(); END
            CASE 10: load_scermish(); END
            CASE 19: credits(); END
            CASE 20: exit("OWEN GAMES (c) 2002",0); END
            CASE 101: mission1(); END
            CASE 102: levle1(); END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @ Menu
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
    text_pause=write(red_font,400,300,4,"PAUSED");
    FRAME;
    REPEAT
        UNTIL (key(_f1));
        delete_text(text_pause);
        WHILE (key(_f1));
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS title(graph,x,finaly);

BEGIN
    file=main_file;
    z=-258;
    IF(finaly==70) y=-250; END
    IF(finaly==580) y=900; END
    LOOP
    IF(finaly==70 AND y<70) y+=10; END
    IF(finaly==580 AND y>580) y-=10; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS owen_games();

PRIVATE
    explosion=FALSE;
    explosion_speed=0;

BEGIN
    s_explosion=load_pcm("pcm\tb2\ex.pcm",0);
    s_1=load_pcm("pcm\tb2\1.pcm",1);
    screen=0;
    new_screen=0;
    mouse.file=main_file;
    mouse.graph=10;
    channel1=sound(s_1,programe_save[0],256);
    fade_on();
    file=main_file;
    graph=20;
    x=400;
    y=300;
        WHILE(new_screen==0);
        IF(mouse.left)
            WHILE(mouse.left)
            FRAME;
            END
        explosion=TRUE; channel2=sound(s_explosion,programe_save[1],256); END
        IF(explosion_speed>0 AND explosion==TRUE AND graph<30) graph+=1; explosion_speed=0; END
        IF(explosion==TRUE AND graph<30) explosion_speed+=1; END
        IF(graph=>30) new_screen=2; END
        FRAME;
    END
    fade_off();
    unload_pcm(s_explosion);
    unload_pcm(s_1);
    delete_text(all_text);
    clear_screen();
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS film();

PRIVATE;
    film_text_timer2=0;
    first_text_number=0;
    film_text;
    change_in_volume=0;
    new_sound=FALSE;

BEGIN
    film_file=load_fpg("fpg\tb2\film.fpg");
    s_4=load_pcm("pcm\tb2\4.pcm",1);
    s_6=load_pcm("pcm\tb2\6.pcm",0);
    s_5=load_pcm("pcm\tb2\5.pcm",1);

    film_text_timer1=0;
    define_region(1,79,37,260,180);
    define_region(2,511,37,210,150);
    define_region(3,339,383,260,180);
    screen=0;
    new_screen=0;
    mouse.file=main_file;
    mouse.graph=0;
    fade_on();
    channel1=sound(s_4,programe_save[0]-50,256);
    channel2=sound(s_6,programe_save[0],256);
    film_text=write(white_font,400,300,4,first_text[first_text_number]);
    film_box1();
    film_box2();
    film_box3();
        WHILE(new_screen==0);
        film_text_timer2+=1;
        IF(film_text_timer1==164)
            stop_sound(channel1);
            channel1=sound(s_5,programe_save[0],256);
            new_sound=TRUE;
        END
        IF(film_text_timer2=>10) film_text_timer2=0;
            IF(film_text_timer1==first_text_timer[first_text_number] AND first_text_number<17)
                delete_text(film_text);
                first_text_number+=1;
                film_text=write(white_font,400,300,4,first_text[first_text_number]);
            END
            IF(film_text_timer1==first_text_timer[first_text_number] AND first_text_number=>17)
                new_screen=5;
            END
            film_text_timer1+=1;
        END
        IF(mouse.left) new_screen=5; END
        FRAME;
    END
    fade_off();
    delete_text(all_text);
    clear_screen();
    signal(TYPE film_box1,s_kill);
    signal(TYPE film_box2,s_kill);
    signal(TYPE film_box3,s_kill);
    signal(TYPE film_box_shadow,s_kill);
    unload_fpg(film_file);
    unload_pcm(s_4);
    unload_pcm(s_6);
    IF(new_sound==FALSE);
    stop_sound(all_sound);
    channel1=sound(s_5,programe_save[0],256);
    END
    photo_file=load_fpg("fpg\tb2\photos.fpg");
    title(1,400,70);
    title(2,400,580);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS film_box1();

PRIVATE
    film_box1_graph=0;

BEGIN
    file=film_file;
    graph=film_box1_graphs[film_box1_graph];
    x=209;
    y=127;
    region=1;
    film_box_shadow();
    LOOP
    IF(film_text_timer1==first_text_timer[film_box1_graph] AND film_box1_graph<17)
        film_box1_graph+=1;
        graph=film_box1_graphs[film_box1_graph];
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS film_box2();

PRIVATE
    film_box2_graph=0;

BEGIN
    file=film_file;
    graph=film_box2_graphs[film_box2_graph];
    x=616;
    y=112;
    region=2;
    film_box_shadow();
    LOOP
    IF(film_text_timer1==first_text_timer[film_box2_graph]+2 AND film_box2_graph<17)
        film_box2_graph+=1;
        graph=film_box2_graphs[film_box2_graph];
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS film_box3();

PRIVATE
    film_box3_graph=0;

BEGIN
    file=film_file;
    graph=film_box3_graphs[film_box3_graph];
    x=469;
    y=473;
    region=3;
    film_box_shadow();
    LOOP
    IF(film_text_timer1==first_text_timer[film_box3_graph]+4 AND film_box3_graph<17)
        film_box3_graph+=1;
        graph=film_box3_graphs[film_box3_graph];
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS film_box_shadow();

PRIVATE
    random_movement;

BEGIN
    file=father.file;
    graph=father.graph;
    x=father.x+random_movement;
    y=father.y+random_movement;
    region=father.region;
    flags=4;
    z=-10;
    LOOP
    random_movement=rand(-1,1);
    graph=father.graph;
    x=father.x+random_movement;
    y=father.y+random_movement;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS menu1();

PRIVATE
    menu1_option=0;
    menu1_text1;
    menu1_text2;
    menu1_text3;
    menu1_text4;
    menu1_text5;
    menu1_text_position=10;

BEGIN
    mouse.file=main_file;
    mouse.graph=10;
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    menu1_text1=write(white_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
    menu1_text2=write(white_font,200+menu1_text_position,270+20,3,"SCERMISH");
    menu1_text3=write(white_font,200+menu1_text_position,300+20,3,"HOT SEAT");
    menu1_text4=write(white_font,200+menu1_text_position,330+20,3,"OPTIONS");
    menu1_text5=write(white_font,200+menu1_text_position,360+20,3,"EXIT");
    fade_on();
        WHILE(new_screen==0 OR menu1_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(menu1_text_position>0 AND new_screen<>0)
        menu1_text_position-=10;
        move_text(menu1_text1,200+menu1_text_position,240+20);
        move_text(menu1_text2,200+menu1_text_position,270+20);
        move_text(menu1_text3,200+menu1_text_position,300+20);
        move_text(menu1_text4,200+menu1_text_position,330+20);
        move_text(menu1_text5,200+menu1_text_position,360+20);
        END
        IF(menu1_text_position<230 AND new_screen==0)
        menu1_text_position+=10;
        move_text(menu1_text1,200+menu1_text_position,240+20);
        move_text(menu1_text2,200+menu1_text_position,270+20);
        move_text(menu1_text3,200+menu1_text_position,300+20);
        move_text(menu1_text4,200+menu1_text_position,330+20);
        move_text(menu1_text5,200+menu1_text_position,360+20);
        END
        IF(mouse.left AND mouse.y>225+20 AND mouse.y<255+20) new_screen=6; END
        IF(mouse.y>225+20 AND mouse.y<255+20 AND menu1_option<>1);
        menu1_option=1;
        delete_text(menu1_text1);
        delete_text(menu1_text2);
        delete_text(menu1_text3);
        delete_text(menu1_text4);
        delete_text(menu1_text5);
        menu1_text1=write(red_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
        menu1_text2=write(white_font,200+menu1_text_position,270+20,3,"SCERMISH");
        menu1_text3=write(white_font,200+menu1_text_position,300+20,3,"HOT SEAT");
        menu1_text4=write(white_font,200+menu1_text_position,330+20,3,"OPTIONS");
        menu1_text5=write(white_font,200+menu1_text_position,360+20,3,"EXIT");
        graph=1;
        END
        IF(mouse.left AND mouse.y>255+20 AND mouse.y<285+20) new_screen=7; END
        IF(mouse.y>255+20 AND mouse.y<285+20 AND menu1_option<>2);
        menu1_option=2;
        delete_text(menu1_text1);
        delete_text(menu1_text2);
        delete_text(menu1_text3);
        delete_text(menu1_text4);
        delete_text(menu1_text5);
        menu1_text1=write(white_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
        menu1_text2=write(red_font,200+menu1_text_position,270+20,3,"SCERMISH");
        menu1_text3=write(white_font,200+menu1_text_position,300+20,3,"HOT SEAT");
        menu1_text4=write(white_font,200+menu1_text_position,330+20,3,"OPTIONS");
        menu1_text5=write(white_font,200+menu1_text_position,360+20,3,"EXIT");
        graph=2;
        END
        IF(mouse.left AND mouse.y>285+20 AND mouse.y<315+20) new_screen=8; END
        IF(mouse.y>285+20 AND mouse.y<315+20 AND menu1_option<>3);
        menu1_option=3;
        delete_text(menu1_text1);
        delete_text(menu1_text2);
        delete_text(menu1_text3);
        delete_text(menu1_text4);
        delete_text(menu1_text5);
        menu1_text1=write(white_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
        menu1_text2=write(white_font,200+menu1_text_position,270+20,3,"SCERMISH");
        menu1_text3=write(red_font,200+menu1_text_position,300+20,3,"HOT SEAT");
        menu1_text4=write(white_font,200+menu1_text_position,330+20,3,"OPTIONS");
        menu1_text5=write(white_font,200+menu1_text_position,360+20,3,"EXIT");
        graph=3;
        END
        IF(mouse.left AND mouse.y>315+20 AND mouse.y<345+20) new_screen=9; END
        IF(mouse.y>315+20 AND mouse.y<345+20 AND menu1_option<>4);
        menu1_option=4;
        delete_text(menu1_text1);
        delete_text(menu1_text2);
        delete_text(menu1_text3);
        delete_text(menu1_text4);
        delete_text(menu1_text5);
        menu1_text1=write(white_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
        menu1_text2=write(white_font,200+menu1_text_position,270+20,3,"SCERMISH");
        menu1_text3=write(white_font,200+menu1_text_position,300+20,3,"HOT SEAT");
        menu1_text4=write(red_font,200+menu1_text_position,330+20,3,"OPTIONS");
        menu1_text5=write(white_font,200+menu1_text_position,360+20,3,"EXIT");
        graph=4;
        END
        IF(mouse.left AND mouse.y>345+20 AND mouse.y<375+20); new_screen=19; END
        IF(mouse.y>345+20 AND mouse.y<375+20 AND menu1_option<>5);
        menu1_option=5;
        delete_text(menu1_text1);
        delete_text(menu1_text2);
        delete_text(menu1_text3);
        delete_text(menu1_text4);
        delete_text(menu1_text5);
        menu1_text1=write(white_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
        menu1_text2=write(white_font,200+menu1_text_position,270+20,3,"SCERMISH");
        menu1_text3=write(white_font,200+menu1_text_position,300+20,3,"HOT SEAT");
        menu1_text4=write(white_font,200+menu1_text_position,330+20,3,"OPTIONS");
        menu1_text5=write(red_font,200+menu1_text_position,360+20,3,"EXIT");
        graph=7;
        END
        IF(mouse.y<225+20 OR mouse.y>375+20);
        menu1_option=0;
        delete_text(menu1_text1);
        delete_text(menu1_text2);
        delete_text(menu1_text3);
        delete_text(menu1_text4);
        delete_text(menu1_text5);
        menu1_text1=write(white_font,200+menu1_text_position,240+20,3,"CAMPAIGN");
        menu1_text2=write(white_font,200+menu1_text_position,270+20,3,"SCERMISH");
        menu1_text3=write(white_font,200+menu1_text_position,300+20,3,"HOT SEAT");
        menu1_text4=write(white_font,200+menu1_text_position,330+20,3,"OPTIONS");
        menu1_text5=write(white_font,200+menu1_text_position,360+20,3,"EXIT");
        graph=1;
        END
        FRAME;
    END
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS menu2();

PRIVATE
    menu2_option=0;
    menu2_text1;
    menu2_text2;
    menu2_text3;
    menu2_text4;
    menu2_text5;
    menu2_text_position=10;
    volume_changing;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    menu2_text4=write(white_font,200+menu2_text_position,255+20,3,"1 PLAYER");
    menu2_text5=write(white_font,200+menu2_text_position,258+20,3,"_________");
    menu2_text1=write(white_font,200+menu2_text_position,285+20,3,"NEW CAMPAIGN");
    menu2_text2=write(white_font,200+menu2_text_position,315+20,3,"LOAD CAMPAIGN");
    menu2_text3=write(white_font,200+menu2_text_position,345+20,3,"BACK");
        WHILE(new_screen==0 OR menu2_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(menu2_text_position>0 AND new_screen<>0)
        menu2_text_position-=10;
        IF(new_screen==101);
        volume_changing+=10;
        change_sound(channel1,programe_save[0]-volume_changing,256);
        change_sound(channel2,programe_save[0]-volume_changing,256);
        END
        move_text(menu2_text1,200+menu2_text_position,285+20);
        move_text(menu2_text2,200+menu2_text_position,315+20);
        move_text(menu2_text3,200+menu2_text_position,345+20);
        move_text(menu2_text4,200+menu2_text_position,255+20);
        move_text(menu2_text5,200+menu2_text_position,258+20);
        END
        IF(menu2_text_position<230 AND new_screen==0)
        menu2_text_position+=10;
        move_text(menu2_text1,200+menu2_text_position,285+20);
        move_text(menu2_text2,200+menu2_text_position,315+20);
        move_text(menu2_text3,200+menu2_text_position,345+20);
        move_text(menu2_text4,200+menu2_text_position,255+20);
        move_text(menu2_text5,200+menu2_text_position,258+20);
        END
        IF(mouse.left AND mouse.y>270+20 AND mouse.y<300+20) new_screen=101; END
        IF(mouse.y>270+20 AND mouse.y<300+20 AND menu2_option<>1);
        menu2_option=1;
        delete_text(menu2_text1);
        delete_text(menu2_text2);
        delete_text(menu2_text3);
        menu2_text1=write(red_font,200+menu2_text_position,285+20,3,"NEW CAMPAIGN");
        menu2_text2=write(white_font,200+menu2_text_position,315+20,3,"LOAD CAMPAIGN");
        menu2_text3=write(white_font,200+menu2_text_position,345+20,3,"BACK");
        graph=6;
        END
        IF(mouse.left AND mouse.y>300+20 AND mouse.y<330+20) new_screen=4; END
        IF(mouse.y>300+20 AND mouse.y<330+20 AND menu2_option<>2);
        menu2_option=2;
        delete_text(menu2_text1);
        delete_text(menu2_text2);
        delete_text(menu2_text3);
        menu2_text1=write(white_font,200+menu2_text_position,285+20,3,"NEW CAMPAIGN");
        menu2_text2=write(red_font,200+menu2_text_position,315+20,3,"LOAD CAMPAIGN");
        menu2_text3=write(white_font,200+menu2_text_position,345+20,3,"BACK");
        graph=5;
        END
        IF(mouse.left AND mouse.y>330+20 AND mouse.y<360+20) new_screen=5; END
        IF(mouse.y>330+20 AND mouse.y<360+20 AND menu2_option<>3);
        menu2_option=3;
        delete_text(menu2_text1);
        delete_text(menu2_text2);
        delete_text(menu2_text3);
        menu2_text1=write(white_font,200+menu2_text_position,285+20,3,"NEW CAMPAIGN");
        menu2_text2=write(white_font,200+menu2_text_position,315+20,3,"LOAD CAMPAIGN");
        menu2_text3=write(red_font,200+menu2_text_position,345+20,3,"BACK");
        graph=7;
        END
        IF(mouse.y<270+20 OR mouse.y>360+20);
        menu2_option=0;
        delete_text(menu2_text1);
        delete_text(menu2_text2);
        delete_text(menu2_text3);
        menu2_text1=write(white_font,200+menu2_text_position,285+20,3,"NEW CAMPAIGN");
        menu2_text2=write(white_font,200+menu2_text_position,315+20,3,"LOAD CAMPAIGN");
        menu2_text3=write(white_font,200+menu2_text_position,345+20,3,"BACK");
        graph=6;
        END
        FRAME;
    END
    delete_text(all_text);
    IF(new_screen==101)
        fade_off();
        clear_screen();
        stop_sound(all_sound);
        change_sound(channel1,programe_save[0],256);
        change_sound(channel2,programe_save[0],256);
        signal(TYPE title,s_kill);
        unload_fpg(photo_file);
        unload_pcm(s_5);
    END
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS load_campaign();

PRIVATE
    load_campaign_option=0;
    load_campaign_text1;
    load_campaign_text2;
    load_campaign_text3;
    load_campaign_text4;
    load_campaign_text5;
    load_campaign_text6;
    load_campaign_text7;
    load_campaign_text8;
    load_campaign_text9;
    load_campaign_text10;
    load_campaign_text11;
    load_campaign_text_position=10;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
    load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
    load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
    load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
    load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
    load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
    load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
    load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
    load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
    load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
    load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        WHILE(new_screen==0 OR load_campaign_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(load_campaign_text_position>0 AND new_screen<>0)
        load_campaign_text_position-=10;
        move_text(load_campaign_text1,200+load_campaign_text_position,20+150);
        move_text(load_campaign_text2,200+load_campaign_text_position,20+180);
        move_text(load_campaign_text3,200+load_campaign_text_position,20+210);
        move_text(load_campaign_text4,200+load_campaign_text_position,20+240);
        move_text(load_campaign_text5,200+load_campaign_text_position,20+270);
        move_text(load_campaign_text6,200+load_campaign_text_position,20+300);
        move_text(load_campaign_text7,200+load_campaign_text_position,20+330);
        move_text(load_campaign_text8,200+load_campaign_text_position,20+360);
        move_text(load_campaign_text9,200+load_campaign_text_position,20+390);
        move_text(load_campaign_text10,200+load_campaign_text_position,20+420);
        move_text(load_campaign_text11,200+load_campaign_text_position,20+450);
        END
        IF(load_campaign_text_position<230 AND new_screen==0)
        load_campaign_text_position+=10;
        move_text(load_campaign_text1,200+load_campaign_text_position,20+150);
        move_text(load_campaign_text2,200+load_campaign_text_position,20+180);
        move_text(load_campaign_text3,200+load_campaign_text_position,20+210);
        move_text(load_campaign_text4,200+load_campaign_text_position,20+240);
        move_text(load_campaign_text5,200+load_campaign_text_position,20+270);
        move_text(load_campaign_text6,200+load_campaign_text_position,20+300);
        move_text(load_campaign_text7,200+load_campaign_text_position,20+330);
        move_text(load_campaign_text8,200+load_campaign_text_position,20+360);
        move_text(load_campaign_text9,200+load_campaign_text_position,20+390);
        move_text(load_campaign_text10,200+load_campaign_text_position,20+420);
        move_text(load_campaign_text11,200+load_campaign_text_position,20+450);
        END
        IF(mouse.y>135+20 AND mouse.y<165+20 AND load_campaign_option<>1);
        load_campaign_option=1;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(red_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=1;
        END
        IF(mouse.y>165+20 AND mouse.y<195+20 AND load_campaign_option<>2);
        load_campaign_option=2;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(red_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=2;
        END
        IF(mouse.y>195+20 AND mouse.y<225+20 AND load_campaign_option<>3);
        load_campaign_option=3;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(red_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=3;
        END
        IF(mouse.y>225+20 AND mouse.y<255+20 AND load_campaign_option<>4);
        load_campaign_option=4;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(red_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=4;
        END
        IF(mouse.y>255+20 AND mouse.y<285+20 AND load_campaign_option<>5);
        load_campaign_option=5;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(red_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=5;
        END
        IF(mouse.y>285+20 AND mouse.y<315+20 AND load_campaign_option<>6);
        load_campaign_option=6;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(red_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=6;
        END
        IF(mouse.y>315+20 AND mouse.y<345+20 AND load_campaign_option<>7);
        load_campaign_option=7;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(red_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=1;
        END
        IF(mouse.y>345+20 AND mouse.y<375+20 AND load_campaign_option<>8);
        load_campaign_option=8;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(red_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=2;
        END
        IF(mouse.y>375+20 AND mouse.y<405+20 AND load_campaign_option<>9);
        load_campaign_option=9;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(red_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=3;
        END
        IF(mouse.y>405+20 AND mouse.y<435+20 AND load_campaign_option<>10);
        load_campaign_option=10;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(red_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=4;
        END
        IF(mouse.left AND mouse.y>435+20 AND mouse.y<465+20) new_screen=6; END
        IF(mouse.y>435+20 AND mouse.y<465+20 AND load_campaign_option<>11);
        load_campaign_option=11;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(red_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=5;
        END
        IF(mouse.y<135+20 OR mouse.y>465+20);
        load_campaign_option=0;
        delete_text(load_campaign_text1);
        delete_text(load_campaign_text2);
        delete_text(load_campaign_text3);
        delete_text(load_campaign_text4);
        delete_text(load_campaign_text5);
        delete_text(load_campaign_text6);
        delete_text(load_campaign_text7);
        delete_text(load_campaign_text8);
        delete_text(load_campaign_text9);
        delete_text(load_campaign_text10);
        delete_text(load_campaign_text11);
        load_campaign_text1=write(white_font,200+load_campaign_text_position,20+150,3,"LOAD CAMPAIGN FILE 1");
        load_campaign_text2=write(white_font,200+load_campaign_text_position,20+180,3,"LOAD CAMPAIGN FILE 2");
        load_campaign_text3=write(white_font,200+load_campaign_text_position,20+210,3,"LOAD CAMPAIGN FILE 3");
        load_campaign_text4=write(white_font,200+load_campaign_text_position,20+240,3,"LOAD CAMPAIGN FILE 4");
        load_campaign_text5=write(white_font,200+load_campaign_text_position,20+270,3,"LOAD CAMPAIGN FILE 5");
        load_campaign_text6=write(white_font,200+load_campaign_text_position,20+300,3,"LOAD CAMPAIGN FILE 6");
        load_campaign_text7=write(white_font,200+load_campaign_text_position,20+330,3,"LOAD CAMPAIGN FILE 7");
        load_campaign_text8=write(white_font,200+load_campaign_text_position,20+360,3,"LOAD CAMPAIGN FILE 8");
        load_campaign_text9=write(white_font,200+load_campaign_text_position,20+390,3,"LOAD CAMPAIGN FILE 9");
        load_campaign_text10=write(white_font,200+load_campaign_text_position,20+420,3,"LOAD CAMPAIGN FILE 10");
        load_campaign_text11=write(white_font,200+load_campaign_text_position,20+450,3,"BACK");
        graph=7;
        END
        FRAME;
    END
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS menu3();

PRIVATE
    menu3_option=0;
    menu3_text1;
    menu3_text2;
    menu3_text3;
    menu3_text4;
    menu3_text5;
    menu3_text_position=10;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    menu3_text1=write(white_font,200+menu3_text_position,255+20,3,"1 PLAYER");
    menu3_text5=write(white_font,200+menu3_text_position,258+20,3,"_________");
    menu3_text2=write(white_font,200+menu3_text_position,285+20,3,"NEW SCERMISH");
    menu3_text3=write(white_font,200+menu3_text_position,315+20,3,"LOAD SCERMISH");
    menu3_text4=write(white_font,200+menu3_text_position,345+20,3,"BACK");
        WHILE(new_screen==0 OR menu3_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(menu3_text_position>0 AND new_screen<>0)
        menu3_text_position-=10;
        move_text(menu3_text1,200+menu3_text_position,255+20);
        move_text(menu3_text5,200+menu3_text_position,258+20);
        move_text(menu3_text2,200+menu3_text_position,285+20);
        move_text(menu3_text3,200+menu3_text_position,315+20);
        move_text(menu3_text4,200+menu3_text_position,345+20);
        END
        IF(menu3_text_position<230 AND new_screen==0)
        menu3_text_position+=10;
        move_text(menu3_text1,200+menu3_text_position,255+20);
        move_text(menu3_text5,200+menu3_text_position,258+20);
        move_text(menu3_text2,200+menu3_text_position,285+20);
        move_text(menu3_text3,200+menu3_text_position,315+20);
        move_text(menu3_text4,200+menu3_text_position,345+20);
        END
        IF(mouse.y>270+20 AND mouse.y<300+20 AND menu3_option<>1);
        menu3_option=1;
        delete_text(menu3_text2);
        delete_text(menu3_text3);
        delete_text(menu3_text4);
        menu3_text2=write(red_font,200+menu3_text_position,285+20,3,"NEW SCERMISH");
        menu3_text3=write(white_font,200+menu3_text_position,315+20,3,"LOAD SCERMISH");
        menu3_text4=write(white_font,200+menu3_text_position,345+20,3,"BACK");
        graph=2;
        END
        IF(mouse.left AND mouse.y>300+20 AND mouse.y<330+20) new_screen=10; END
        IF(mouse.y>300+20 AND mouse.y<330+20 AND menu3_option<>2);
        menu3_option=2;
        delete_text(menu3_text2);
        delete_text(menu3_text3);
        delete_text(menu3_text4);
        menu3_text2=write(white_font,200+menu3_text_position,285+20,3,"NEW SCERMISH");
        menu3_text3=write(red_font,200+menu3_text_position,315+20,3,"LOAD SCERMISH");
        menu3_text4=write(white_font,200+menu3_text_position,345+20,3,"BACK");
        graph=3;
        END
        IF(mouse.left AND mouse.y>330+20 AND mouse.y<360+20) new_screen=5; END
        IF(mouse.y>330+20 AND mouse.y<360+20 AND menu3_option<>3);
        menu3_option=3;
        delete_text(menu3_text2);
        delete_text(menu3_text3);
        delete_text(menu3_text4);
        menu3_text2=write(white_font,200+menu3_text_position,285+20,3,"NEW SCERMISH");
        menu3_text3=write(white_font,200+menu3_text_position,315+20,3,"LOAD SCERMISH");
        menu3_text4=write(red_font,200+menu3_text_position,345+20,3,"BACK");
        graph=7;
        END
        IF(mouse.y<270+20 OR mouse.y>360+20);
        menu3_option=0;
        delete_text(menu3_text2);
        delete_text(menu3_text3);
        delete_text(menu3_text4);
        menu3_text2=write(white_font,200+menu3_text_position,285+20,3,"NEW SCERMISH");
        menu3_text3=write(white_font,200+menu3_text_position,315+20,3,"LOAD SCERMISH");
        menu3_text4=write(white_font,200+menu3_text_position,345+20,3,"BACK");
        graph=2;
        END
        FRAME;
    END
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS load_scermish();

PRIVATE
    load_scermish_option=0;
    load_scermish_text1;
    load_scermish_text2;
    load_scermish_text3;
    load_scermish_text4;
    load_scermish_text5;
    load_scermish_text6;
    load_scermish_text7;
    load_scermish_text8;
    load_scermish_text9;
    load_scermish_text10;
    load_scermish_text11;
    load_scermish_text_position=10;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
    load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
    load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
    load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
    load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
    load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
    load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
    load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
    load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
    load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
    load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        WHILE(new_screen==0 OR load_scermish_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(load_scermish_text_position>0 AND new_screen<>0)
        load_scermish_text_position-=10;
        move_text(load_scermish_text1,200+load_scermish_text_position,20+150);
        move_text(load_scermish_text2,200+load_scermish_text_position,20+180);
        move_text(load_scermish_text3,200+load_scermish_text_position,20+210);
        move_text(load_scermish_text4,200+load_scermish_text_position,20+240);
        move_text(load_scermish_text5,200+load_scermish_text_position,20+270);
        move_text(load_scermish_text6,200+load_scermish_text_position,20+300);
        move_text(load_scermish_text7,200+load_scermish_text_position,20+330);
        move_text(load_scermish_text8,200+load_scermish_text_position,20+360);
        move_text(load_scermish_text9,200+load_scermish_text_position,20+390);
        move_text(load_scermish_text10,200+load_scermish_text_position,20+420);
        move_text(load_scermish_text11,200+load_scermish_text_position,20+450);
        END
        IF(load_scermish_text_position<230 AND new_screen==0)
        load_scermish_text_position+=10;
        move_text(load_scermish_text1,200+load_scermish_text_position,20+150);
        move_text(load_scermish_text2,200+load_scermish_text_position,20+180);
        move_text(load_scermish_text3,200+load_scermish_text_position,20+210);
        move_text(load_scermish_text4,200+load_scermish_text_position,20+240);
        move_text(load_scermish_text5,200+load_scermish_text_position,20+270);
        move_text(load_scermish_text6,200+load_scermish_text_position,20+300);
        move_text(load_scermish_text7,200+load_scermish_text_position,20+330);
        move_text(load_scermish_text8,200+load_scermish_text_position,20+360);
        move_text(load_scermish_text9,200+load_scermish_text_position,20+390);
        move_text(load_scermish_text10,200+load_scermish_text_position,20+420);
        move_text(load_scermish_text11,200+load_scermish_text_position,20+450);
        END
        IF(mouse.y>135+20 AND mouse.y<165+20 AND load_scermish_option<>1);
        load_scermish_option=1;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(red_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=1;
        END
        IF(mouse.y>165+20 AND mouse.y<195+20 AND load_scermish_option<>2);
        load_scermish_option=2;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(red_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=2;
        END
        IF(mouse.y>195+20 AND mouse.y<225+20 AND load_scermish_option<>3);
        load_scermish_option=3;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(red_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=3;
        END
        IF(mouse.y>225+20 AND mouse.y<255+20 AND load_scermish_option<>4);
        load_scermish_option=4;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(red_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=4;
        END
        IF(mouse.y>255+20 AND mouse.y<285+20 AND load_scermish_option<>5);
        load_scermish_option=5;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(red_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=5;
        END
        IF(mouse.y>285+20 AND mouse.y<315+20 AND load_scermish_option<>6);
        load_scermish_option=6;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(red_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=6;
        END
        IF(mouse.y>315+20 AND mouse.y<345+20 AND load_scermish_option<>7);
        load_scermish_option=7;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(red_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=1;
        END
        IF(mouse.y>345+20 AND mouse.y<375+20 AND load_scermish_option<>8);
        load_scermish_option=8;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(red_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=2;
        END
        IF(mouse.y>375+20 AND mouse.y<405+20 AND load_scermish_option<>9);
        load_scermish_option=9;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(red_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=3;
        END
        IF(mouse.y>405+20 AND mouse.y<435+20 AND load_scermish_option<>10);
        load_scermish_option=10;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(red_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=4;
        END
        IF(mouse.left AND mouse.y>435+20 AND mouse.y<465+20) new_screen=7; END
        IF(mouse.y>435+20 AND mouse.y<465+20 AND load_scermish_option<>11);
        load_scermish_option=11;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(red_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=5;
        END
        IF(mouse.y<135+20 OR mouse.y>465+20);
        load_scermish_option=0;
        delete_text(load_scermish_text1);
        delete_text(load_scermish_text2);
        delete_text(load_scermish_text3);
        delete_text(load_scermish_text4);
        delete_text(load_scermish_text5);
        delete_text(load_scermish_text6);
        delete_text(load_scermish_text7);
        delete_text(load_scermish_text8);
        delete_text(load_scermish_text9);
        delete_text(load_scermish_text10);
        delete_text(load_scermish_text11);
        load_scermish_text1=write(white_font,200+load_scermish_text_position,20+150,3,"LOAD SCERMISH FILE 1");
        load_scermish_text2=write(white_font,200+load_scermish_text_position,20+180,3,"LOAD SCERMISH FILE 2");
        load_scermish_text3=write(white_font,200+load_scermish_text_position,20+210,3,"LOAD SCERMISH FILE 3");
        load_scermish_text4=write(white_font,200+load_scermish_text_position,20+240,3,"LOAD SCERMISH FILE 4");
        load_scermish_text5=write(white_font,200+load_scermish_text_position,20+270,3,"LOAD SCERMISH FILE 5");
        load_scermish_text6=write(white_font,200+load_scermish_text_position,20+300,3,"LOAD SCERMISH FILE 6");
        load_scermish_text7=write(white_font,200+load_scermish_text_position,20+330,3,"LOAD SCERMISH FILE 7");
        load_scermish_text8=write(white_font,200+load_scermish_text_position,20+360,3,"LOAD SCERMISH FILE 8");
        load_scermish_text9=write(white_font,200+load_scermish_text_position,20+390,3,"LOAD SCERMISH FILE 9");
        load_scermish_text10=write(white_font,200+load_scermish_text_position,20+420,3,"LOAD SCERMISH FILE 10");
        load_scermish_text11=write(white_font,200+load_scermish_text_position,20+450,3,"BACK");
        graph=7;
        END
        FRAME;
    END
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS menu4();

PRIVATE
    menu4_option=0;
    menu4_text1;
    menu4_text2;
    menu4_text3;
    menu4_text4;
    menu4_text5;
    menu4_text_position=10;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    menu4_text1=write(white_font,200+menu4_text_position,255+20,3,"2 PLAYERS");
    menu4_text5=write(white_font,200+menu4_text_position,258+20,3,"__________");
    menu4_text2=write(white_font,200+menu4_text_position,285+20,3,"DEATH MATCH");
    menu4_text3=write(white_font,200+menu4_text_position,315+20,3,"CAPTURE THE FLAG");
    menu4_text4=write(white_font,200+menu4_text_position,345+20,3,"BACK");
        WHILE(new_screen==0 OR menu4_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(menu4_text_position>0 AND new_screen<>0)
        menu4_text_position-=10;
        move_text(menu4_text1,200+menu4_text_position,255+20);
        move_text(menu4_text5,200+menu4_text_position,258+20);
        move_text(menu4_text2,200+menu4_text_position,285+20);
        move_text(menu4_text3,200+menu4_text_position,315+20);
        move_text(menu4_text4,200+menu4_text_position,345+20);
        END
        IF(menu4_text_position<230 AND new_screen==0)
        menu4_text_position+=10;
        move_text(menu4_text1,200+menu4_text_position,255+20);
        move_text(menu4_text5,200+menu4_text_position,258+20);
        move_text(menu4_text2,200+menu4_text_position,285+20);
        move_text(menu4_text3,200+menu4_text_position,315+20);
        move_text(menu4_text4,200+menu4_text_position,345+20);
        END
        IF(mouse.y>270+20 AND mouse.y<300+20 AND menu4_option<>1);
        menu4_option=1;
        delete_text(menu4_text2);
        delete_text(menu4_text3);
        delete_text(menu4_text4);
        menu4_text2=write(red_font,200+menu4_text_position,285+20,3,"DEATH MATCH");
        menu4_text3=write(white_font,200+menu4_text_position,315+20,3,"CAPTURE THE FLAG");
        menu4_text4=write(white_font,200+menu4_text_position,345+20,3,"BACK");
        graph=3;
        END
        IF(mouse.y>300+20 AND mouse.y<330+20 AND menu4_option<>2);
        menu4_option=2;
        delete_text(menu4_text2);
        delete_text(menu4_text3);
        delete_text(menu4_text4);
        menu4_text2=write(white_font,200+menu4_text_position,285+20,3,"DEATH MATCH");
        menu4_text3=write(red_font,200+menu4_text_position,315+20,3,"CAPTURE THE FLAG");
        menu4_text4=write(white_font,200+menu4_text_position,345+20,3,"BACK");
        graph=6;
        END
        IF(mouse.left AND mouse.y>330+20 AND mouse.y<360+20) new_screen=5; END
        IF(mouse.y>330+20 AND mouse.y<360+20 AND menu4_option<>3);
        menu4_option=3;
        delete_text(menu4_text2);
        delete_text(menu4_text3);
        delete_text(menu4_text4);
        menu4_text2=write(white_font,200+menu4_text_position,285+20,3,"DEATH MATCH");
        menu4_text3=write(white_font,200+menu4_text_position,315+20,3,"CAPTURE THE FLAG");
        menu4_text4=write(red_font,200+menu4_text_position,345+20,3,"BACK");
        graph=7;
        END
        IF(mouse.y<270+20 OR mouse.y>360+20);
        menu4_option=0;
        delete_text(menu4_text2);
        delete_text(menu4_text3);
        delete_text(menu4_text4);
        menu4_text2=write(white_font,200+menu4_text_position,285+20,3,"DEATH MATCH");
        menu4_text3=write(white_font,200+menu4_text_position,315+20,3,"CAPTURE THE FLAG");
        menu4_text4=write(white_font,200+menu4_text_position,345+20,3,"BACK");
        graph=3;
        END
        FRAME;
    END
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS menu5();

PRIVATE
    menu5_option=0;
    menu5_text1;
    menu5_text2;
    menu5_text3;
    menu5_text_position=10;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    menu5_text3=write(white_font,200+menu5_text_position,270+20,3,"TIME LINE");
    menu5_text1=write(white_font,200+menu5_text_position,300+20,3,"VEIW FILM");
    menu5_text2=write(white_font,200+menu5_text_position,330+20,3,"BACK");
        WHILE(new_screen==0 OR menu5_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(menu5_text_position>0 AND new_screen<>0)
        menu5_text_position-=10;
        move_text(menu5_text3,200+menu5_text_position,270+20);
        move_text(menu5_text1,200+menu5_text_position,300+20);
        move_text(menu5_text2,200+menu5_text_position,330+20);
        END
        IF(menu5_text_position<230 AND new_screen==0)
        menu5_text_position+=10;
        move_text(menu5_text3,200+menu5_text_position,270+20);
        move_text(menu5_text1,200+menu5_text_position,300+20);
        move_text(menu5_text2,200+menu5_text_position,330+20);
        END
        IF(mouse.left AND mouse.y>255+20 AND mouse.y<285+20) new_screen=3; END
        IF(mouse.y>255+20 AND mouse.y<285+20 AND menu5_option<>1);
        menu5_option=1;
        delete_text(menu5_text1);
        delete_text(menu5_text2);
        delete_text(menu5_text3);
        menu5_text3=write(red_font,200+menu5_text_position,270+20,3,"TIME LINE");
        menu5_text1=write(white_font,200+menu5_text_position,300+20,3,"FILM");
        menu5_text2=write(white_font,200+menu5_text_position,330+20,3,"BACK");
        graph=3;
        END
        IF(mouse.left AND mouse.y>285+20 AND mouse.y<315+20) new_screen=2; END
        IF(mouse.y>285+20 AND mouse.y<315+20 AND menu5_option<>2);
        menu5_option=2;
        delete_text(menu5_text1);
        delete_text(menu5_text2);
        delete_text(menu5_text3);
        menu5_text3=write(white_font,200+menu5_text_position,270+20,3,"TIME LINE");
        menu5_text1=write(red_font,200+menu5_text_position,300+20,3,"FILM");
        menu5_text2=write(white_font,200+menu5_text_position,330+20,3,"BACK");
        graph=3;
        END
        IF(mouse.left AND mouse.y>315+20 AND mouse.y<345+20) new_screen=5; END
        IF(mouse.y>315+20 AND mouse.y<345+20 AND menu5_option<>3);
        menu5_option=3;
        delete_text(menu5_text1);
        delete_text(menu5_text2);
        delete_text(menu5_text3);
        menu5_text3=write(white_font,200+menu5_text_position,270+20,3,"TIME LINE");
        menu5_text1=write(white_font,200+menu5_text_position,300+20,3,"FILM");
        menu5_text2=write(red_font,200+menu5_text_position,330+20,3,"BACK");
        graph=7;
        END
        IF(mouse.y<255+20 OR mouse.y>345+20);
        menu5_option=0;
        delete_text(menu5_text1);
        delete_text(menu5_text2);
        delete_text(menu5_text3);
        menu5_text3=write(white_font,200+menu5_text_position,270+20,3,"TIME LINE");
        menu5_text1=write(white_font,200+menu5_text_position,300+20,3,"FILM");
        menu5_text2=write(white_font,200+menu5_text_position,330+20,3,"BACK");
        graph=3;
        END
        FRAME;
    END
    delete_text(all_text);
    IF(new_screen==2)
        fade_off();
        clear_screen();
        stop_sound(all_sound);
        signal(TYPE title,s_kill);
        unload_fpg(photo_file);
        unload_pcm(s_5);
    END
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS time_line();

PRIVATE
    time_line_text1; time_line_text2; time_line_text3; time_line_text4; time_line_text5; time_line_text6; time_line_text7; time_line_text8; time_line_text9; time_line_text10;
    time_line_text11; time_line_text12; time_line_text13; time_line_text14; time_line_text15; time_line_text16; time_line_text17; time_line_text18; time_line_text19; time_line_text20;
    time_line_text21; time_line_text22; time_line_text23; time_line_text24; time_line_text25; time_line_text26; time_line_text27; time_line_text28; time_line_text29; time_line_text30;
    time_line_text31; time_line_text32; time_line_text33; time_line_text34; time_line_text35; time_line_text36; time_line_text37; time_line_text38; time_line_text39; time_line_text40;
    time_line_text41; time_line_text42; time_line_text43; time_line_text44; time_line_text45; time_line_text46; time_line_text47; time_line_text48; time_line_text49; time_line_text50;
    time_line_text51; time_line_text52; time_line_text53; time_line_text54; time_line_text55; time_line_text56; time_line_text57; time_line_text58; time_line_text59; time_line_text60;
    time_line_text61; time_line_text62; time_line_text63; time_line_text64; time_line_text65;

    time_line_textx_position=10;
    time_line_texty_position=10;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=1;
    x=200;
    y=300;
    z=-257;
    time_line_black(3,-257);
    time_line_black(4,0);
    fade(100,100,100,64);

    time_line_text1=write(white_font,0+time_line_textx_position,160+time_line_texty_position,3,time_line_text[1]);
    time_line_text2=write(white_font,0+time_line_textx_position,180+time_line_texty_position,3,time_line_text[2]);
    time_line_text3=write(white_font,0+time_line_textx_position,200+time_line_texty_position,3,time_line_text[3]);
    time_line_text4=write(white_font,0+time_line_textx_position,220+time_line_texty_position,3,time_line_text[4]);
    time_line_text5=write(white_font,0+time_line_textx_position,240+time_line_texty_position,3,time_line_text[5]);
    time_line_text6=write(white_font,0+time_line_textx_position,260+time_line_texty_position,3,time_line_text[6]);
    time_line_text7=write(white_font,0+time_line_textx_position,280+time_line_texty_position,3,time_line_text[7]);
    time_line_text8=write(white_font,0+time_line_textx_position,300+time_line_texty_position,3,time_line_text[8]);
    time_line_text9=write(white_font,0+time_line_textx_position,320+time_line_texty_position,3,time_line_text[9]);
    time_line_text10=write(white_font,0+time_line_textx_position,340+time_line_texty_position,3,time_line_text[10]);

    time_line_text11=write(white_font,0+time_line_textx_position,360+time_line_texty_position,3,time_line_text[11]);
    time_line_text12=write(white_font,0+time_line_textx_position,380+time_line_texty_position,3,time_line_text[12]);
    time_line_text13=write(white_font,0+time_line_textx_position,400+time_line_texty_position,3,time_line_text[13]);
    time_line_text14=write(white_font,0+time_line_textx_position,420+time_line_texty_position,3,time_line_text[14]);
    time_line_text15=write(white_font,0+time_line_textx_position,440+time_line_texty_position,3,time_line_text[15]);
    time_line_text16=write(white_font,0+time_line_textx_position,460+time_line_texty_position,3,time_line_text[16]);
    time_line_text17=write(white_font,0+time_line_textx_position,480+time_line_texty_position,3,time_line_text[17]);
    time_line_text18=write(white_font,0+time_line_textx_position,500+time_line_texty_position,3,time_line_text[18]);
    time_line_text19=write(white_font,0+time_line_textx_position,520+time_line_texty_position,3,time_line_text[19]);
    time_line_text20=write(white_font,0+time_line_textx_position,540+time_line_texty_position,3,time_line_text[20]);

    time_line_text21=write(white_font,0+time_line_textx_position,560+time_line_texty_position,3,time_line_text[21]);
    time_line_text22=write(white_font,0+time_line_textx_position,580+time_line_texty_position,3,time_line_text[22]);
    time_line_text23=write(white_font,0+time_line_textx_position,600+time_line_texty_position,3,time_line_text[23]);
    time_line_text24=write(white_font,0+time_line_textx_position,620+time_line_texty_position,3,time_line_text[24]);
    time_line_text25=write(white_font,0+time_line_textx_position,640+time_line_texty_position,3,time_line_text[25]);
    time_line_text26=write(white_font,0+time_line_textx_position,660+time_line_texty_position,3,time_line_text[26]);
    time_line_text27=write(white_font,0+time_line_textx_position,680+time_line_texty_position,3,time_line_text[27]);
    time_line_text28=write(white_font,0+time_line_textx_position,700+time_line_texty_position,3,time_line_text[28]);
    time_line_text29=write(white_font,0+time_line_textx_position,720+time_line_texty_position,3,time_line_text[29]);
    time_line_text30=write(white_font,0+time_line_textx_position,740+time_line_texty_position,3,time_line_text[30]);

    time_line_text31=write(white_font,0+time_line_textx_position,760+time_line_texty_position,3,time_line_text[31]);
    time_line_text32=write(white_font,0+time_line_textx_position,780+time_line_texty_position,3,time_line_text[32]);
    time_line_text33=write(white_font,0+time_line_textx_position,800+time_line_texty_position,3,time_line_text[33]);
    time_line_text34=write(white_font,0+time_line_textx_position,820+time_line_texty_position,3,time_line_text[34]);
    time_line_text35=write(white_font,0+time_line_textx_position,840+time_line_texty_position,3,time_line_text[35]);
    time_line_text36=write(white_font,0+time_line_textx_position,860+time_line_texty_position,3,time_line_text[36]);
    time_line_text37=write(white_font,0+time_line_textx_position,880+time_line_texty_position,3,time_line_text[37]);
    time_line_text38=write(white_font,0+time_line_textx_position,900+time_line_texty_position,3,time_line_text[38]);
    time_line_text39=write(white_font,0+time_line_textx_position,920+time_line_texty_position,3,time_line_text[39]);
    time_line_text40=write(white_font,0+time_line_textx_position,940+time_line_texty_position,3,time_line_text[40]);

    time_line_text41=write(white_font,0+time_line_textx_position,960+time_line_texty_position,3,time_line_text[41]);
    time_line_text42=write(white_font,0+time_line_textx_position,980+time_line_texty_position,3,time_line_text[42]);
    time_line_text43=write(white_font,0+time_line_textx_position,1000+time_line_texty_position,3,time_line_text[43]);
    time_line_text44=write(white_font,0+time_line_textx_position,1020+time_line_texty_position,3,time_line_text[44]);
    time_line_text45=write(white_font,0+time_line_textx_position,1040+time_line_texty_position,3,time_line_text[45]);
    time_line_text46=write(white_font,0+time_line_textx_position,1060+time_line_texty_position,3,time_line_text[46]);
    time_line_text47=write(white_font,0+time_line_textx_position,1080+time_line_texty_position,3,time_line_text[47]);
    time_line_text48=write(white_font,0+time_line_textx_position,1100+time_line_texty_position,3,time_line_text[48]);
    time_line_text49=write(white_font,0+time_line_textx_position,1120+time_line_texty_position,3,time_line_text[49]);
    time_line_text50=write(white_font,0+time_line_textx_position,1140+time_line_texty_position,3,time_line_text[50]);

    time_line_text51=write(white_font,0+time_line_textx_position,1160+time_line_texty_position,3,time_line_text[51]);
    time_line_text52=write(white_font,0+time_line_textx_position,1180+time_line_texty_position,3,time_line_text[52]);
    time_line_text53=write(white_font,0+time_line_textx_position,1200+time_line_texty_position,3,time_line_text[53]);
    time_line_text54=write(white_font,0+time_line_textx_position,1220+time_line_texty_position,3,time_line_text[54]);
    time_line_text55=write(white_font,0+time_line_textx_position,1240+time_line_texty_position,3,time_line_text[55]);
    time_line_text56=write(white_font,0+time_line_textx_position,1260+time_line_texty_position,3,time_line_text[56]);
    time_line_text57=write(white_font,0+time_line_textx_position,1280+time_line_texty_position,3,time_line_text[57]);
    time_line_text58=write(white_font,0+time_line_textx_position,1300+time_line_texty_position,3,time_line_text[58]);
    time_line_text59=write(white_font,0+time_line_textx_position,1320+time_line_texty_position,3,time_line_text[59]);
    time_line_text60=write(white_font,0+time_line_textx_position,1340+time_line_texty_position,3,time_line_text[60]);

    time_line_text61=write(white_font,0+time_line_textx_position,1360+time_line_texty_position,3,time_line_text[61]);
    time_line_text62=write(white_font,0+time_line_textx_position,1380+time_line_texty_position,3,time_line_text[62]);
    time_line_text63=write(white_font,0+time_line_textx_position,1400+time_line_texty_position,3,time_line_text[63]);
    time_line_text64=write(white_font,0+time_line_textx_position,1420+time_line_texty_position,3,time_line_text[64]);
    time_line_text65=write(white_font,0+time_line_textx_position,1440+time_line_texty_position,3,time_line_text[65]);

        WHILE(new_screen==0 OR time_line_textx_position>0);
        IF(time_line_texty_position<=-1320) new_screen=9; END
        IF((time_line_textx_position>0 AND new_screen<>0) OR (time_line_textx_position<430 AND new_screen==0) OR (key(_up) AND time_line_texty_position<10) OR key(_down) AND time_line_texty_position>-1400)
            IF(time_line_textx_position>0 AND new_screen<>0) time_line_textx_position-=10; END
            IF(time_line_textx_position<430 AND new_screen==0) time_line_textx_position+=10; END
            IF(key(_up) AND time_line_texty_position<10); time_line_texty_position+=5; END
            IF(key(_down) AND time_line_texty_position>=-1320); time_line_texty_position-=5; END

            move_text(time_line_text1,0+time_line_textx_position,160+time_line_texty_position);
            move_text(time_line_text2,0+time_line_textx_position,180+time_line_texty_position);
            move_text(time_line_text3,0+time_line_textx_position,200+time_line_texty_position);
            move_text(time_line_text4,0+time_line_textx_position,220+time_line_texty_position);
            move_text(time_line_text5,0+time_line_textx_position,240+time_line_texty_position);
            move_text(time_line_text6,0+time_line_textx_position,260+time_line_texty_position);
            move_text(time_line_text7,0+time_line_textx_position,280+time_line_texty_position);
            move_text(time_line_text8,0+time_line_textx_position,300+time_line_texty_position);
            move_text(time_line_text9,0+time_line_textx_position,320+time_line_texty_position);
            move_text(time_line_text10,0+time_line_textx_position,340+time_line_texty_position);

            move_text(time_line_text11,0+time_line_textx_position,360+time_line_texty_position);
            move_text(time_line_text12,0+time_line_textx_position,380+time_line_texty_position);
            move_text(time_line_text13,0+time_line_textx_position,400+time_line_texty_position);
            move_text(time_line_text14,0+time_line_textx_position,420+time_line_texty_position);
            move_text(time_line_text15,0+time_line_textx_position,440+time_line_texty_position);
            move_text(time_line_text16,0+time_line_textx_position,460+time_line_texty_position);
            move_text(time_line_text17,0+time_line_textx_position,480+time_line_texty_position);
            move_text(time_line_text18,0+time_line_textx_position,500+time_line_texty_position);
            move_text(time_line_text19,0+time_line_textx_position,520+time_line_texty_position);
            move_text(time_line_text20,0+time_line_textx_position,540+time_line_texty_position);

            move_text(time_line_text21,0+time_line_textx_position,560+time_line_texty_position);
            move_text(time_line_text22,0+time_line_textx_position,580+time_line_texty_position);
            move_text(time_line_text23,0+time_line_textx_position,600+time_line_texty_position);
            move_text(time_line_text24,0+time_line_textx_position,620+time_line_texty_position);
            move_text(time_line_text25,0+time_line_textx_position,640+time_line_texty_position);
            move_text(time_line_text26,0+time_line_textx_position,660+time_line_texty_position);
            move_text(time_line_text27,0+time_line_textx_position,680+time_line_texty_position);
            move_text(time_line_text28,0+time_line_textx_position,700+time_line_texty_position);
            move_text(time_line_text29,0+time_line_textx_position,720+time_line_texty_position);
            move_text(time_line_text30,0+time_line_textx_position,740+time_line_texty_position);

            move_text(time_line_text31,0+time_line_textx_position,760+time_line_texty_position);
            move_text(time_line_text32,0+time_line_textx_position,780+time_line_texty_position);
            move_text(time_line_text33,0+time_line_textx_position,800+time_line_texty_position);
            move_text(time_line_text34,0+time_line_textx_position,820+time_line_texty_position);
            move_text(time_line_text35,0+time_line_textx_position,840+time_line_texty_position);
            move_text(time_line_text36,0+time_line_textx_position,860+time_line_texty_position);
            move_text(time_line_text37,0+time_line_textx_position,880+time_line_texty_position);
            move_text(time_line_text38,0+time_line_textx_position,900+time_line_texty_position);
            move_text(time_line_text39,0+time_line_textx_position,920+time_line_texty_position);
            move_text(time_line_text40,0+time_line_textx_position,940+time_line_texty_position);

            move_text(time_line_text41,0+time_line_textx_position,960+time_line_texty_position);
            move_text(time_line_text42,0+time_line_textx_position,980+time_line_texty_position);
            move_text(time_line_text43,0+time_line_textx_position,1000+time_line_texty_position);
            move_text(time_line_text44,0+time_line_textx_position,1020+time_line_texty_position);
            move_text(time_line_text45,0+time_line_textx_position,1040+time_line_texty_position);
            move_text(time_line_text46,0+time_line_textx_position,1060+time_line_texty_position);
            move_text(time_line_text47,0+time_line_textx_position,1080+time_line_texty_position);
            move_text(time_line_text48,0+time_line_textx_position,1100+time_line_texty_position);
            move_text(time_line_text49,0+time_line_textx_position,1120+time_line_texty_position);
            move_text(time_line_text50,0+time_line_textx_position,1140+time_line_texty_position);

            move_text(time_line_text51,0+time_line_textx_position,1160+time_line_texty_position);
            move_text(time_line_text52,0+time_line_textx_position,1180+time_line_texty_position);
            move_text(time_line_text53,0+time_line_textx_position,1200+time_line_texty_position);
            move_text(time_line_text54,0+time_line_textx_position,1220+time_line_texty_position);
            move_text(time_line_text55,0+time_line_textx_position,1240+time_line_texty_position);
            move_text(time_line_text56,0+time_line_textx_position,1260+time_line_texty_position);
            move_text(time_line_text57,0+time_line_textx_position,1280+time_line_texty_position);
            move_text(time_line_text58,0+time_line_textx_position,1300+time_line_texty_position);
            move_text(time_line_text59,0+time_line_textx_position,1320+time_line_texty_position);
            move_text(time_line_text60,0+time_line_textx_position,1340+time_line_texty_position);

            move_text(time_line_text61,0+time_line_textx_position,1360+time_line_texty_position);
            move_text(time_line_text62,0+time_line_textx_position,1380+time_line_texty_position);
            move_text(time_line_text63,0+time_line_textx_position,1400+time_line_texty_position);
            move_text(time_line_text64,0+time_line_textx_position,1420+time_line_texty_position);
            move_text(time_line_text65,0+time_line_textx_position,1440+time_line_texty_position);

        END

        IF(mouse.left) new_screen=9; END
        FRAME;
    END
    signal(TYPE time_line_black,s_kill);
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS time_line_black(graph,z);

BEGIN
    file=main_file;
    x=600;
    y=300;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS credits();

PRIVATE
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
    credits_text_position=10;
    volume_changing;

BEGIN
    screen=0;
    new_screen=0;
    file=photo_file;
    graph=7;
    x=200;
    y=300;
    z=-257;
    credits_text1=write(white_font,0+credits_text_position,140+20+20,3,"CREATED BY OWEN DAVIES");
    credits_text2=write(white_font,0+credits_text_position,180+20+20,3,"' ROCK IS DEAD '  MARILYN MANSON");
    credits_text3=write(white_font,0+credits_text_position,200+20+20,3,"NOTHING/INTERSCOPE RECORDS (P) 1998");
    credits_text4=write(white_font,0+credits_text_position,240+20+20,3,"' SPYBREAK! '  PROPELLERHEADS");
    credits_text5=write(white_font,0+credits_text_position,260+20+20,3,"PROPELLERHEADS (P) 1998");
    credits_text6=write(white_font,0+credits_text_position,300+20+20,3,"' CLUBBED TO DEATH '  ROB D");
    credits_text7=write(white_font,0+credits_text_position,320+20+20,3,"A&M RECORDS LIMITED (P) 1995");
    credits_text8=write(white_font,0+credits_text_position,360+20+20,3,"' WAKE UP '  RAGE AGAINST THE MACHINE");
    credits_text9=write(white_font,0+credits_text_position,380+20+20,3,"SONY MUSIC ENTERTAINMENT INC (P) 1992");
    credits_text10=write(white_font,0+credits_text_position,420+20+20,3,"HAMMER TECHNOLOGIES (c) 1998");
    credits_text11=write(white_font,0+credits_text_position,440+20+20,3,"DIV GAMES STUDIO (c) 1998");
    credits_text12=write(white_font,0+credits_text_position,460+20+20,3,"OWEN GAMES (c) 2002");

        WHILE(new_screen==0 OR credits_text_position>0);
        fade(rand(0,200),rand(0,200),rand(0,200),5);
        IF(mouse.left) new_screen=20; END
        IF(credits_text_position>0 AND new_screen<>0)
        volume_changing+=10;
        change_sound(channel1,programe_save[0]-volume_changing,256);
        change_sound(channel2,programe_save[0]-volume_changing,256);
        credits_text_position-=10;
        move_text(credits_text1,0+credits_text_position,140+20);
        move_text(credits_text2,0+credits_text_position,180+20);
        move_text(credits_text3,0+credits_text_position,200+20);
        move_text(credits_text4,0+credits_text_position,240+20);
        move_text(credits_text5,0+credits_text_position,260+20);
        move_text(credits_text6,0+credits_text_position,300+20);
        move_text(credits_text7,0+credits_text_position,320+20);
        move_text(credits_text8,0+credits_text_position,360+20);
        move_text(credits_text9,0+credits_text_position,380+20);
        move_text(credits_text10,0+credits_text_position,420+20);
        move_text(credits_text11,0+credits_text_position,440+20);
        move_text(credits_text12,0+credits_text_position,460+20);
        END
        IF(credits_text_position<430 AND new_screen==0)
        credits_text_position+=10;
        move_text(credits_text1,0+credits_text_position,140+20);
        move_text(credits_text2,0+credits_text_position,180+20);
        move_text(credits_text3,0+credits_text_position,200+20);
        move_text(credits_text4,0+credits_text_position,240+20);
        move_text(credits_text5,0+credits_text_position,260+20);
        move_text(credits_text6,0+credits_text_position,300+20);
        move_text(credits_text7,0+credits_text_position,320+20);
        move_text(credits_text8,0+credits_text_position,360+20);
        move_text(credits_text9,0+credits_text_position,380+20);
        move_text(credits_text10,0+credits_text_position,420+20);
        move_text(credits_text11,0+credits_text_position,440+20);
        move_text(credits_text12,0+credits_text_position,460+20);
        END
        FRAME;
    END
    fade_off();
    signal(TYPE title,s_kill);
    delete_text(all_text);
    stop_sound(all_sound);
    clear_screen();
    screen=new_screen;
END

//-----------------------------------------------------------------------------
//  @ Missions
//-----------------------------------------------------------------------------

PROCESS mission1();

PRIVATE
    mission1_text[]="MISSION 1","YOU ARE CURRENTLY IN THE SOUTH OF ENGLAND","IN TIDWORTH ARMY BASE.","YOU WILL NEED TO PRACTICE WITH THE NEW TANK BLAST","YOU WILL NOT HAVE MUCH TIME","AS THE USNA HAS ALLREADY LANDED ON THE WEST COAST OF EUROPE","YOU ARE THE WORLDS LAST HOPE";
    mission1_text_timer[]=0,7,13,20,24,37,0;
    mission1_map_timer[]=0,70,130,200,240,370,420,0;
    mission1_map_x[]=1335,1335,1335,1335,1330,1330,1330,1330;
    mission1_map_y[]=485,485,485,485,600,600,600,600;
    mission1_map_height[]=2800,500,500,500,500,500,2800,2800;
    mission1_map_distance[]=2000,150,150,150,250,250,2200,2200;
    mission1_map_angle[]=90000,90000,270000,450000,360000,360000,450000,450000;

    camera_position=0;
    mission1_text_number=1;
    mission1_text_position;
    mission1_timer1=0;
    mission1_timer2=0;
    mission1_timer=0;

BEGIN
    s_3=load_pcm("pcm\tb2\3.pcm",1);
    s_7=load_pcm("pcm\tb2\7.pcm",0);
    map_file=load_fpg("fpg\tb2\map.fpg");
    screen=0;
    new_screen=0;
    mouse.file=main_file;
    mouse.graph=10;
    sound(s_3,programe_save[0],256);
    sound(s_7,programe_save[0],256);
    map_black();
    write(white_font,400,40,4,mission1_text[0]);
    mission1_text_position=write(white_font,400,560,4,mission1_text[mission1_text_number]);
    m7[1].camera=id;
    m7[1].height=mission1_map_height[camera_position];
    m7[1].distance=mission1_map_distance[camera_position];
    m7[1].color=33;
    start_mode7(1,map_file,1,0,0,0);
    x=mission1_map_x[camera_position];
    y=mission1_map_y[camera_position];
    angle=mission1_map_angle[camera_position];
    map_flags_you(1);
        fade_on();
        WHILE(new_screen==0);
        mission1_timer+=1;
        IF(mission1_timer==mission1_map_timer[camera_position+1]) camera_position+=1; END
        IF(mission1_timer=>mission1_map_timer[camera_position] AND mission1_timer<mission1_map_timer[camera_position+1])
            x-=((mission1_map_x[camera_position]-mission1_map_x[camera_position+1])/(mission1_map_timer[camera_position+1]-mission1_map_timer[camera_position]));
            y-=((mission1_map_y[camera_position]-mission1_map_y[camera_position+1])/(mission1_map_timer[camera_position+1]-mission1_map_timer[camera_position]));
            m7[1].height-=((mission1_map_height[camera_position]-mission1_map_height[camera_position+1])/(mission1_map_timer[camera_position+1]-mission1_map_timer[camera_position]));
            m7[1].distance-=((mission1_map_distance[camera_position]-mission1_map_distance[camera_position+1])/(mission1_map_timer[camera_position+1]-mission1_map_timer[camera_position]));
            angle+=((mission1_map_angle[camera_position]-mission1_map_angle[camera_position+1])/(mission1_map_timer[camera_position+1]-mission1_map_timer[camera_position]));
        END
        mission1_timer1+=1;
        IF(mission1_timer1=>10) mission1_timer1=0; mission1_timer2+=1;
            IF(mission1_timer2==mission1_text_timer[mission1_text_number])
                delete_text(mission1_text_position);
                mission1_text_number+=1;
                mission1_text_position=write(white_font,400,560,4,mission1_text[mission1_text_number]);
            END
            IF(mission1_timer2==20)
                map_flags_usna(1);
                map_flags_usna(2);
                map_flags_usna(3);
                map_flags_usna(4);
                map_flags_usna(5);
                map_flags_usna(6);
            END
        END
        IF(mouse.left)
            WHILE(mouse.left)
            FRAME;
            END
            new_screen=102;
        END
        FRAME;
    END
    fade_off();
    delete_text(all_text);
    signal(TYPE map_black,s_kill);
    signal(TYPE map_flags_britain,s_kill);
    signal(TYPE map_flags_usna,s_kill);
    signal(TYPE map_flags_ussnr,s_kill);
    signal(TYPE map_flags_umn,s_kill);
    signal(TYPE map_flags_europe,s_kill);
    signal(TYPE map_flags_you,s_kill);
    stop_mode7(1);
    clear_screen();
    unload_fpg(map_file);
    unload_pcm(s_3);
    unload_pcm(s_7);
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS map_black();

BEGIN
    file=map_file;
    graph=2;
    x=400;
    y=300;
    z=-250;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS map_flags_you(number);

BEGIN
    file=map_file;
    graph=3;
    x=mission1_map_you[(number*2)-1];
    y=mission1_map_you[number*2];
    ctype=c_m7;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS map_flags_britain(number);

BEGIN
    file=map_file;
    graph=10;
    x=mission1_map_britain[(number*2)-1];
    y=mission1_map_britain[number*2];
    ctype=c_m7;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS map_flags_usna(number);

BEGIN
    file=map_file;
    graph=20;
    x=mission1_map_usna[(number*2)-1];
    y=mission1_map_usna[number*2];
    ctype=c_m7;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS map_flags_ussnr(number);

BEGIN
    file=map_file;
    graph=30;
    x=mission1_map_ussnr[(number*2)-1];
    y=mission1_map_ussnr[number*2];
    ctype=c_m7;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS map_flags_umn(number);

BEGIN
    file=map_file;
    graph=40;
    x=mission1_map_umn[(number*2)-1];
    y=mission1_map_umn[number*2];
    ctype=c_m7;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS map_flags_europe(number);

BEGIN
    file=map_file;
    graph=50;
    x=mission1_map_europe[(number*2)-1];
    y=mission1_map_europe[number*2];
    ctype=c_m7;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
// @ Kill
//-----------------------------------------------------------------------------

PROCESS kill();

BEGIN
    stop_scroll(1);
    signal(TYPE left_bar,s_kill);
    signal(TYPE center_bar,s_kill);
    signal(TYPE right_bar,s_kill);
    signal(TYPE pause,s_kill);
END

//-----------------------------------------------------------------------------
// @ Levles
//-----------------------------------------------------------------------------

PROCESS levle1();

BEGIN
    game_file=load_fpg("fpg\tb2\game.fpg");
    scenrey_file=load_fpg("fpg\tb2\scenery.fpg");
    s_2=load_pcm("pcm\tb2\2.pcm",1);
    sound(s_2,programe_save[0],256);
    mouse.x=0;
    mouse.y=0;
    screen=0;
    new_screen=0;
    levle1_map();
    fade_on();
        WHILE (new_screen==0);
        IF(key(_esc)) new_screen=1; END
        FRAME;
    END
    fade_off();
    stop_sound(all_sound);
    clear_screen();
    delete_text(all_text);
    signal(TYPE levle1_map,s_kill);
    kill();
    signal(TYPE kill,s_kill);
    unload_fpg(game_file);
    unload_fpg(scenrey_file);
    unload_pcm(s_2);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS levle1_map();

BEGIN
    random_terrain=rand(1,3);
    terrain_minx=0;
    terrain_maxx=2000;
    terrain_miny=0;
    terrain_maxy=2000;
    starting_point_1_x=1000;
    starting_point_1_y=1800;
    starting_point_1_a=90000;
    start_scroll(1,scenrey_file,random_terrain,0,0,15);
    left_bar();
    center_bar();
    right_bar();
    pause();
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------
//  @
//-----------------------------------------------------------------------------

PROCESS left_bar();

PRIVATE;
    region4_height;
    left_bar_text_1;

BEGIN
    left_bar_open=FALSE;
    region4_height=35;
    define_region(4,30,30,150,region4_height);
    file=game_file;
    graph=2;
    x=105;
    y=300;
    region=4;
    IF(left_bar_open==TRUE);
        left_bar_text_1=write(green_font,105,525,4,"EXIT");
    END
    write(green_font,105,47,4,"OPTIONS");
    LOOP
        IF(left_bar_open==TRUE AND region4_height<540)
            region4_height=540; define_region(4,30,30,150,region4_height);
            left_bar_text_1=write(green_font,105,525,4,"EXIT");
        END
        IF(left_bar_open==FALSE AND region4_height>35)
            region4_height=35; define_region(4,30,30,150,region4_height);
            delete_text(left_bar_text_1);
        END
        IF(left_bar_open==TRUE AND mouse.left AND mouse.x> 29 AND mouse.x<180 AND mouse.y>29 AND mouse.y<65) left_bar_open=FALSE; WHILE(mouse.left); FRAME; END END
        IF(left_bar_open==FALSE AND mouse.left AND mouse.x> 29 AND mouse.x<180 AND mouse.y>29 AND mouse.y<65) left_bar_open=TRUE; WHILE(mouse.left); FRAME; END END
        IF(mouse.left AND left_bar_open==TRUE AND mouse.x>29 AND mouse.x<180 AND mouse.y>515 AND mouse.y<535) new_screen=1; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS center_bar();

PRIVATE;
    region5_height;

BEGIN
    center_bar_open=FALSE;
    region5_height=35;
    define_region(5,200,30,410,region5_height);
    file=game_file;
    graph=1;
    x=405;
    y=300;
    region=5;
    write(green_font,405,47,4,"MISSION");
    LOOP
        IF(center_bar_open==TRUE AND region5_height<540) region5_height=540; define_region(5,200,30,410,region5_height); END
        IF(center_bar_open==FALSE AND region5_height>35) region5_height=35; define_region(5,200,30,410,region5_height); END
        IF(center_bar_open==TRUE AND mouse.left AND mouse.x> 199 AND mouse.x<610 AND mouse.y>29 AND mouse.y<65) center_bar_open=FALSE; WHILE(mouse.left); FRAME; END END
        IF(center_bar_open==FALSE AND mouse.left AND mouse.x> 199 AND mouse.x<610 AND mouse.y>29 AND mouse.y<65) center_bar_open=TRUE; WHILE(mouse.left); FRAME; END END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS right_bar();

PRIVATE;
    region6_height;
    right_bar_text_1;
    right_bar_text_2;
    right_bar_text_3;
    right_bar_text_4;
    right_bar_text_5;
    right_bar_text_6;
    right_bar_text_7;
    right_bar_text_8;
    right_bar_text_9;
    right_bar_text_10;

BEGIN
    right_bar_open=FALSE;
    region6_height=35;
    define_region(6,630,30,150,region6_height);
    file=game_file;
    graph=2;
    x=705;
    y=300;
    region=6;
    write(green_font,705,47,4,"PLAYER");
    IF(right_bar_open==TRUE);
        right_bar_text_1=write(green_font,670,300,3,"WEAPON 1");
        right_bar_text_2=write(green_font,670,325,3,"WEAPON 2");
        right_bar_text_3=write(green_font,670,350,3,"WEAPON 3");
        right_bar_text_4=write(green_font,670,375,3,"WEAPON 4");
        right_bar_text_5=write(green_font,670,400,3,"WEAPON 5");
        right_bar_text_6=write(green_font,670,425,3,"WEAPON 6");
        right_bar_text_7=write(green_font,670,450,3,"WEAPON 7");
        right_bar_text_8=write(green_font,670,475,3,"WEAPON 8");
        right_bar_text_9=write(green_font,670,500,3,"WEAPON 9");
        right_bar_text_10=write(green_font,670,525,3,"WEAPON 10");
    END
    LOOP
        IF(right_bar_open==TRUE AND region6_height<540)
            region6_height=540; define_region(6,630,30,150,region6_height);
            right_bar_text_1=write(green_font,670,300,3,"WEAPON 1");
            right_bar_text_2=write(green_font,670,325,3,"WEAPON 2");
            right_bar_text_3=write(green_font,670,350,3,"WEAPON 3");
            right_bar_text_4=write(green_font,670,375,3,"WEAPON 4");
            right_bar_text_5=write(green_font,670,400,3,"WEAPON 5");
            right_bar_text_6=write(green_font,670,425,3,"WEAPON 6");
            right_bar_text_7=write(green_font,670,450,3,"WEAPON 7");
            right_bar_text_8=write(green_font,670,475,3,"WEAPON 8");
            right_bar_text_9=write(green_font,670,500,3,"WEAPON 9");
            right_bar_text_10=write(green_font,670,525,3,"WEAPON 10");
        END
        IF(right_bar_open==FALSE AND region6_height>35)
            region6_height=35; define_region(6,630,30,150,region6_height);
            delete_text(right_bar_text_1);
            delete_text(right_bar_text_2);
            delete_text(right_bar_text_3);
            delete_text(right_bar_text_4);
            delete_text(right_bar_text_5);
            delete_text(right_bar_text_6);
            delete_text(right_bar_text_7);
            delete_text(right_bar_text_8);
            delete_text(right_bar_text_9);
            delete_text(right_bar_text_10);
        END
        IF(right_bar_open==TRUE AND mouse.left AND mouse.x> 629 AND mouse.x<780 AND mouse.y>29 AND mouse.y<65) right_bar_open=FALSE; WHILE(mouse.left); FRAME; END END
        IF(right_bar_open==FALSE AND mouse.left AND mouse.x> 629 AND mouse.x<780 AND mouse.y>29 AND mouse.y<65) right_bar_open=TRUE; WHILE(mouse.left); FRAME; END END
        FRAME;
    END
END

//-----------------------------------------------------------------------------
