
//-----------------------------------------------------------------------------
// TITLE:      GALACTIC COMMANDER
// AUTHOR:     OWEN DAVIES
// DATE:       OWEN GAMES 2001
//-----------------------------------------------------------------------------

PROGRAM gallactic_commander;

GLOBAL

//-----------------------------------------------------------------------------
// @ programme options
//-----------------------------------------------------------------------------

    screen=1;
    new_screen;

    main_file;
    space_file;
//    film_file;
    fleets_file;

    main_font;
    red_font;
    blue_font;
    yellow_font;

    game_paused;

    music_track[]="","TRACK 1","TRACK 2","TRACK 3","TRACK 4","TRACK 5","TRACK 6";
    channel1;
    channel2;
    channel3;
    s_001;
    s_002;
    s_003;
    s_004;
    s_005;
    s_006;
    s_007;

    space_screen;
    region2_open;
    region3_open;
    region3_used;
    region3_using;
    region4_open;
    player1_planet_number;
    fleet_number;
    scroll_x;
    scroll_y;

//-----------------------------------------------------------------------------
// @ game options
//-----------------------------------------------------------------------------

    letters[]=0,0,"1","2","3","4","5","6","7","8","9","0","-","+","","","Q","W","E","R","T","Y","U","I","O","P","[","]","","","A","S","D","F","G","H","J","K","L",";","'","","","#","Z","X","C","V","B","N","M",",",".","/","","","","";
    messages[]="","EXCLUSIVE DEMO FOR PAUL BYRNE";
    players[]="","PLAYER 1","PLAYER 2","PLAYER 3","PLAYER 4","INFORMATION";
    bullet_point_messages[]=0,101,102,103,104,100;
    planets_building_text[]="NOTHING","FIGHTERS","LANDING SHIPS","DESTROYERS","FIRE SHIPS","CRUISERS","FLAG SHIPS","CARIERS","BATTLE SHIPS","SHEILD SHIPS","DREADNAUTS","SCOUT SHIPS","CARGO SHIPS","SPY SHIPS","FREIGHT SHIPS","POWER PLANTS","FACTORIES","BARRACKS","RESEARCH LABS","SPACE PORTS","SS MISSILE BATTERIES","REPAIR FACILITIES","PD CANNONS","ION FACTORIES","CORE POWER PLANTS","GENETIC LABS","HYPER PORTS","HYPER LAUNCHERS","ION CANNONS","TRACTOR BEAMS","ROBOTIC LABS","ASTEROID BEAMS","MISSILE JAMMERS","TELEPORTERS","ROBO FACTORIES","ATMOSPHERE GENERATOR","FORCE FIELD";
    planets_building_speed[]=0,
    50,45,38,45,32,30,32,25,20,18,
    0,0,0,0,
    38,36,35,32,31,27,34,24,28,26,25,22,19,18,17,16,27,12,14,24,18,10;
    fleets_status[]="IN PORT","TRAVELING IN SPACE","IN SPACE","IN HYPER SPACE","IN BATTLE","SELF REPAIRING","TRAVELING TO PORT";
    move_fleet;
    move_fleet_to_port;

//-----------------------------------------------------------------------------
// @ things to save
//-----------------------------------------------------------------------------

    player1[]=
        2300,           // Year
        5,              // Message 1 Sender
        1,              // Message 1
        0,              // Message 2 Sender
        0,              // Message 2
        0,              // Message 3 Sender
        0,              // Message 3
        0,              // Message 4 Sender
        0,              // Message 4
        0,              // Message 5 Sender
        0,              // Message 5
        0,              // Message 6 Sender
        0,              // Message 6
        TRUE,           // Auto Open
        250,            // Volume
        1,              // Music
        250,            // Effects volume
        FALSE,          // GRID
        0,              // scroll x
        0,              // scroll y
        0,              // game timesed used
        TRUE,           // Region 2 open
        0,              // Name Letter 1
        0,              // Name Letter 2
        0,              // Name Letter 3
        0,              // Name Letter 4
        0,              // Name Letter 5
        0,              // Name Letter 6
        0,              // Name Letter 7
        0,              // Name Letter 8
        0,              // Name Letter 9
        0,              // Name Letter 10
        0,              // Name Letter 11
        0,              // Name Letter 12
        0,              // Name Letter 13
        0,              // Name Letter 14
        0,              // Name Letter 15
        0,              // Name Letter 16
        0,              // Name Letter 17
        0;              // Name Letter 18

    planets[]=
        "EARTH",        // Planet Name
        10,             // Planet Graph
        0,              // Planet x
        0,              // Planet y
        1,              // Owner
        5000,           // Population
        0,              // Planet Building
        0,              // Planet Building Complete /350
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // Power Plants
        0,              // Factorys
        0,              // Barracks
        0,              // Reaserch Labs
        0,              // Space Ports
        0,              // Sam Missiles
        0,              // Repair Facilities
        0,              // PD Cannon
        0,              // Iron Factory
        0,              // Core Power Plant
        0,              // Genetic Reaserch Lab
        0,              // Hyper Port
        0,              // Hyper Launcher
        0,              // Iron Cannon
        0,              // Tractor Beam
        0,              // Robotic Lab
        0,              // Asteroid Beam
        0,              // Missile Jammer
        0,              // Teleporter
        0,              // Robotic Factory
        0,              // Atmosphere Genarator
        0,              // Force Feilds

        "MARSE",        // Planet Name
        20,             // Planet Graph
        -200,            // Planet x
        300,            // Planet y
        3,              // Planet owner
        0,              // Planet population
        0,              // Planet Building
        0,              // Planet Building Complete /350
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // Power Plants
        0,              // Factorys
        0,              // Barracks
        0,              // Reaserch Labs
        0,              // Space Ports
        0,              // Sam Missiles
        0,              // Repair Facilities
        0,              // PD Cannon
        0,              // Iron Factory
        0,              // Core Power Plant
        0,              // Genetic Reaserch Lab
        0,              // Hyper Port
        0,              // Hyper Launcher
        0,              // Iron Cannon
        0,              // Tractor Beam
        0,              // Robotic Lab
        0,              // Asteroid Beam
        0,              // Missile Jammer
        0,              // Teleporter
        0,              // Robotic Factory
        0,              // Atmosphere Genarator
        0,              // Force Feilds

        "SARPER",        // Planet Name
        40,             // Planet Graph
        400,              // Planet x
        -200,              // Planet y
        0,              // Owner
        0,           // Population
        0,              // Planet Building
        0,              // Planet Building Complete /350
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // Power Plants
        0,              // Factorys
        0,              // Barracks
        0,              // Reaserch Labs
        0,              // Space Ports
        0,              // Sam Missiles
        0,              // Repair Facilities
        0,              // PD Cannon
        0,              // Iron Factory
        0,              // Core Power Plant
        0,              // Genetic Reaserch Lab
        0,              // Hyper Port
        0,              // Hyper Launcher
        0,              // Iron Cannon
        0,              // Tractor Beam
        0,              // Robotic Lab
        0,              // Asteroid Beam
        0,              // Missile Jammer
        0,              // Teleporter
        0,              // Robotic Factory
        0,              // Atmosphere Genarator
        0,              // Force Feilds

        "KENKO",        // Planet Name
        10,             // Planet Graph
        200,            // Planet x
        300,            // Planet y
        4,              // Planet owner
        7000,           // Planet population
        0,              // Planet Building
        0,              // Planet Building Complete /350
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // Power Plants
        0,              // Factorys
        0,              // Barracks
        0,              // Reaserch Labs
        0,              // Space Ports
        0,              // Sam Missiles
        0,              // Repair Facilities
        0,              // PD Cannon
        0,              // Iron Factory
        0,              // Core Power Plant
        0,              // Genetic Reaserch Lab
        0,              // Hyper Port
        0,              // Hyper Launcher
        0,              // Iron Cannon
        0,              // Tractor Beam
        0,              // Robotic Lab
        0,              // Asteroid Beam
        0,              // Missile Jammer
        0,              // Teleporter
        0,              // Robotic Factory
        0,              // Atmosphere Genarator
        0;              // Force Feilds

    fleets[]=
        "FLEET 1",      // Fleet Name
        1,              // Graph
        0,              // x
        0,              // y
        0,              // Status
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // FIGHTERS HEALTH
        0,              // LANDING SHIPS HEALTH
        0,              // DESTROYERS HEALTH
        0,              // FIRE SHIPS HEALTH
        0,              // CRUISERS   HEALTH
        0,              // FLAG SHIPS HEALTH
        0,              // CARIERS HEALTH
        0,              // BATTLE SHIPS HEALTH
        0,              // SHEILD SHIPS HEALTH
        0,              // DREADNORTS HEALTH
        0,              // destination x
        0,              // destination y
        0,
        0,
        0,

        "FLEET 2",      // Fleet Name
        1,              // Graph
        0,              // x
        0,              // y
        0,              // Status
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // FIGHTERS HEALTH
        0,              // LANDING SHIPS HEALTH
        0,              // DESTROYERS HEALTH
        0,              // FIRE SHIPS HEALTH
        0,              // CRUISERS   HEALTH
        0,              // FLAG SHIPS HEALTH
        0,              // CARIERS HEALTH
        0,              // BATTLE SHIPS HEALTH
        0,              // SHEILD SHIPS HEALTH
        0,              // DREADNORTS HEALTH
        0,              // destination x
        0,              // destination y
        0,
        0,
        0,

        "FLEET 3",      // Fleet Name
        1,              // Graph
        0,              // x
        0,              // y
        0,              // Status
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // FIGHTERS HEALTH
        0,              // LANDING SHIPS HEALTH
        0,              // DESTROYERS HEALTH
        0,              // FIRE SHIPS HEALTH
        0,              // CRUISERS   HEALTH
        0,              // FLAG SHIPS HEALTH
        0,              // CARIERS HEALTH
        0,              // BATTLE SHIPS HEALTH
        0,              // SHEILD SHIPS HEALTH
        0,              // DREADNORTS HEALTH
        0,              // destination x
        0,              // destination y
        0,
        0,
        0,

        "FLEET 4",      // Fleet Name
        1,              // Graph
        0,              // x
        0,              // y
        0,              // Status
        0,              // FIGHTERS
        0,              // LANDING SHIPS
        0,              // DESTROYERS
        0,              // FIRE SHIPS
        0,              // CRUISERS
        0,              // FLAG SHIPS
        0,              // CARIERS
        0,              // BATTLE SHIPS
        0,              // SHEILD SHIPS
        0,              // DREADNORTS
        0,              // FIGHTERS HEALTH
        0,              // LANDING SHIPS HEALTH
        0,              // DESTROYERS HEALTH
        0,              // FIRE SHIPS HEALTH
        0,              // CRUISERS   HEALTH
        0,              // FLAG SHIPS HEALTH
        0,              // CARIERS HEALTH
        0,              // BATTLE SHIPS HEALTH
        0,              // SHEILD SHIPS HEALTH
        0,              // DREADNORTS HEALTH
        0,              // destination x
        0,              // destination y
        0,
        0,
        0;

//------------------------------------------------------------------------------

BEGIN
    set_mode(m800x600);
    set_fps(18,1);

    load_pal("fpg\GC\main.fpg");

    main_file=load_fpg("fpg\GC\main.fpg");
    space_file=load_fpg("fpg\GC\space.fpg");
//    film_file=load_fpg("fpg\GC\films.fpg");
    fleets_file=load_fpg("fpg\GC\fleets.fpg");

    main_font=load_fnt("fnt\GC\main.fnt");
    red_font=load_fnt("fnt\GC\red.fnt");
    blue_font=load_fnt("fnt\GC\blue.fnt");
    yellow_font=load_fnt("fnt\GC\yellow.fnt");

    s_001=load_pcm("pcm\GC\001.pcm",1);
    s_002=load_pcm("pcm\GC\002.pcm",1);
    s_003=load_pcm("pcm\GC\003.pcm",1);
    s_004=load_pcm("pcm\GC\004.pcm",1);
    s_005=load_pcm("pcm\GC\005.pcm",1);
    s_006=load_pcm("pcm\GC\006.pcm",1);

    s_007=load_pcm("pcm\GC\007.pcm",0);

    LOOP
        SWITCH (screen);
            CASE 1: owen_games(); END
            CASE 2: title(); END
            CASE 7: new_game_name(); END
            CASE 10: main_screen(); END
            CASE 99: credits(); END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS owen_games();

BEGIN
            save("dat/GC/player1.dat",offset player1,sizeof(player1));
            save("dat/GC/planets.dat",offset planets,sizeof(planets));
            save("dat/GC/fleets.dat",offset fleets,sizeof(fleets));
    load("dat/GC/player1.dat",offset player1);
    load("dat/GC/planets.dat",offset planets);
    load("dat/GC/fleets.dat",offset fleets);
    player1[20]+=1;
    sound(s_001,player1[14],256);
    sound(s_002,player1[14],256);
    screen=0;
    new_screen=0;
    file=main_file;
    graph=1;
    x=100;
    y=300;
    z=-257;
    write(main_font,400,300,4,"OWEN GAMES (c) 2002");
    start_scroll(0,main_file,15,0,0,15);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(x<1200) x+=20; END
        IF(key(_esc) OR mouse.left OR key(_space) OR key(_enter)) new_screen=2; END
        FRAME;
    END
    fade_off();
    clear_screen();
    delete_text(all_text);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS title();

BEGIN
    screen=0;
    new_screen=0;
    file=main_file;
    graph=1;
    x=100;
    y=300;
    z=-257;
    write(main_font,400,300,4,"GALACTIC COMMANDER DEMO");
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(x<1200) x+=20; END
        IF(key(_esc) OR mouse.left OR key(_space) OR key(_enter))
            IF(player1[0]>2300) new_screen=10; END
            IF(player1[0]==2300) new_screen=7; END
        END
        FRAME;
    END
    fade(200,200,200,5);
    WHILE(fading==TRUE);
    FRAME;
    END
    stop_scroll(0);
    clear_screen();
    delete_text(all_text);
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS new_game_name();

PRIVATE
    name_type;
    name_text1;
    name_text2;
    name_text3;
    name_text4;
    name_text5;
    name_text6;
    name_text7;
    name_text8;
    name_text9;
    name_text10;
    name_text11;
    name_text12;
    name_text13;
    name_text14;
    name_text15;
    name_text16;
    name_text17;
    name_text18;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    mouse.file=main_file;
    mouse.graph=20;
    sound(s_001,player1[14],256);
    sound(s_002,player1[14],256);
    screen=0;
    new_screen=0;
    file=main_file;
    graph=13;
    x=400;
    y=300;
    z=-250;
    write(red_font,400,250,4,"NEW GAME");
    write(red_font,400,285,4,"TYPE IN YOUR NAME");
    write(red_font,400,350,4,"START NEW GAME");
    start_scroll(0,main_file,15,0,0,15);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF((mouse.left OR key(_esc) OR key(_enter)) AND player1[22]>0) new_screen=10; END
        IF(name_type<18 AND (
        (scan_code>=2 AND scan_code<=13) OR
        (scan_code>=16 AND scan_code<=27) OR
        (scan_code>=30 AND scan_code<=40) OR
        (scan_code>=43 AND scan_code<=53) OR
        (scan_code==57)))
            player1[22+name_type]=scan_code;
            IF(name_type==0) name_text1=write(red_font,244,315,3,letters[player1[22+name_type]]); END
            IF(name_type==1) name_text2=write(red_font,244+18,315,3,letters[player1[22+name_type]]); END
            IF(name_type==2) name_text3=write(red_font,244+36,315,3,letters[player1[22+name_type]]); END
            IF(name_type==3) name_text4=write(red_font,244+54,315,3,letters[player1[22+name_type]]); END
            IF(name_type==4) name_text5=write(red_font,244+72,315,3,letters[player1[22+name_type]]); END
            IF(name_type==5) name_text6=write(red_font,244+90,315,3,letters[player1[22+name_type]]); END
            IF(name_type==6) name_text7=write(red_font,244+108,315,3,letters[player1[22+name_type]]); END
            IF(name_type==7) name_text8=write(red_font,244+126,315,3,letters[player1[22+name_type]]); END
            IF(name_type==8) name_text9=write(red_font,244+144,315,3,letters[player1[22+name_type]]); END
            IF(name_type==9) name_text10=write(red_font,244+162,315,3,letters[player1[22+name_type]]); END
            IF(name_type==10) name_text11=write(red_font,244+180,315,3,letters[player1[22+name_type]]); END
            IF(name_type==11) name_text12=write(red_font,244+198,315,3,letters[player1[22+name_type]]); END
            IF(name_type==12) name_text13=write(red_font,244+216,315,3,letters[player1[22+name_type]]); END
            IF(name_type==13) name_text14=write(red_font,244+234,315,3,letters[player1[22+name_type]]); END
            IF(name_type==14) name_text15=write(red_font,244+252,315,3,letters[player1[22+name_type]]); END
            IF(name_type==15) name_text16=write(red_font,244+270,315,3,letters[player1[22+name_type]]); END
            IF(name_type==16) name_text17=write(red_font,244+288,315,3,letters[player1[22+name_type]]); END
            IF(name_type==17) name_text18=write(red_font,244+306,315,3,letters[player1[22+name_type]]); END
            name_type+=1;
        END
        IF(key(_backspace) AND name_type>0);
            IF(name_type==1) delete_text(name_text1); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==2) delete_text(name_text2); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==3) delete_text(name_text3); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==4) delete_text(name_text4); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==5) delete_text(name_text5); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==6) delete_text(name_text6); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==7) delete_text(name_text7); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==8) delete_text(name_text8); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==9) delete_text(name_text9); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==10) delete_text(name_text10); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==11) delete_text(name_text11); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==12) delete_text(name_text12); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==13) delete_text(name_text13); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==14) delete_text(name_text14); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==15) delete_text(name_text15); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==16) delete_text(name_text16); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==17) delete_text(name_text17); player1[22+name_type-1]=0; name_type-=1; END
            IF(name_type==18) delete_text(name_text18); player1[22+name_type-1]=0; name_type-=1; END
        END
        FRAME;
    END
    fade_off();
    stop_scroll(0);
    clear_screen();
    delete_text(all_text);
    stop_sound(all_sound);
    screen=new_screen;
END

//-----------------------------------------------------------------------------


PROCESS credits();

BEGIN
    let_me_alone();
    sound(s_001,player1[14],256);
    sound(s_002,player1[14],256);
    screen=0;
    new_screen=0;
    write(main_font,400,250,4,"CREATED BY OWEN DAVIES");
    write(main_font,400,275,4,"HAMMER TECHNOLOGIES (c) 1998");
    write(main_font,400,300,4,"DIV GAMES STUDIO (c) 1998");
    write(main_font,400,325,4,"OWEN GAMES (c) 2002");
    start_scroll(0,main_file,15,0,0,15);
    FRAME;
        fade_on();
        WHILE (new_screen==0);
        scroll[0].y0-=2;
        IF(key(_esc) OR mouse.left OR key(_space) OR key(_enter)) new_screen=100; END
        FRAME;
    END
    fade(0,0,0,5);
    WHILE(fading==TRUE);
    FRAME;
    END
    stop_scroll(0);
    clear_screen();
    delete_text(all_text);
    stop_sound(all_sound);
    exit("OWEN GAMES (c) 2002",0);
END

//-----------------------------------------------------------------------------

PROCESS main_screen();

PRIVATE
    region2_height;
    region3_height;
    region4_width;

BEGIN
    screen=0;
    new_screen=0;
    move_fleet=-10;
    move_fleet_to_port=-10;

    mouse.file=main_file;
    mouse.graph=20;

    space_screen=TRUE;
    region2_height=540;
    IF(player1[21]==TRUE); region2_open=TRUE; END
    IF(player1[21]==FALSE); region2_open=FALSE; END
    region3_open=FALSE;
    region3_used=0;
    region3_using=0;
    region3_height=35;
    region4_open=FALSE;
    region4_width=0;

    define_region(1,0,0,800,600);
    define_region(2,30,30,150,region2_height);
    define_region(3,200,30,410,region3_height);
    define_region(4,200,249,region4_width,103);
    define_region(6,630,30,150,35);

    space();
    left_bar();
    right_bar();
    main_bar();

    player1_time();
    music();
    pause();

    fleets_graph(0);
    fleets_graph(30);
    fleets_graph(60);
    fleets_graph(90);

    FRAME;
        fade_on();
        WHILE (new_screen==0);
        IF(region3_open==TRUE AND region3_height==35) region3_height=540; define_region(3,200,30,410,region3_height); END
        IF(region3_open==FALSE AND region3_height==540) region3_height=35; define_region(3,200,30,410,region3_height); END

        IF(region4_open==TRUE AND region4_width==0) region4_width=410; define_region(4,200,249,region4_width,103); END
        IF(region4_open==FALSE AND region4_width==410) region4_width=0; define_region(4,200,249,region4_width,103); END

        IF(region2_open==TRUE AND region2_height==35) region2_height=540; define_region(2,30,30,150,region2_height); scroll[2].z=-90; END
        IF(region2_open==FALSE AND region2_height==540) region2_height=35; define_region(2,30,30,150,region2_height); scroll[2].z=600; END

        IF(player1[21]==TRUE)
            IF(move_fleet==-10 AND move_fleet_to_port==-10 AND region2_height==35) region2_open=TRUE; END
            IF(region2_height==540 AND (move_fleet>-10 OR move_fleet_to_port>-10)) region2_open=FALSE; END
        END

        FRAME;
    END
    fade_off();
    clear_screen();
    delete_text(all_text);
    stop_sound(all_sound);
    stop_scroll(0);
    stop_scroll(1);
    stop_scroll(2);

    signal(TYPE space,s_kill);
    signal(TYPE left_bar,s_kill);
    signal(TYPE main_bar,s_kill);
    signal(TYPE music_volume_bar,s_kill);
    signal(TYPE effects_volume_bar_surround,s_kill);
    signal(TYPE effects_volume_bar,s_kill);
    signal(TYPE pause,s_kill);

    signal(TYPE planets_bar,s_kill);
    signal(TYPE player1_planet_bar,s_kill);
    signal(TYPE asteroids_bar,s_kill);
    signal(TYPE fleet_bar,s_kill);
    signal(TYPE technology_bar,s_kill);
    signal(TYPE enemy_bar,s_kill);
    signal(TYPE log_bar,s_kill);
    signal(TYPE options_bar,s_kill);
    signal(TYPE exit_bar,s_kill);
    signal(TYPE player1_building,s_kill);

    signal(TYPE planets_bullet_point,s_kill);
    signal(TYPE log_bullet_point,s_kill);
    signal(TYPE building_bar,s_kill);
    signal(TYPE player1_planet_arrows,s_kill);
    signal(TYPE options_arrows,s_kill);

    signal(TYPE fleets_graph,s_kill);
    signal(TYPE player_fleet,s_kill);

    signal(TYPE planet,s_kill);
    signal(TYPE player_planet,s_kill);
    signal(TYPE player1_time,s_kill);
    signal(TYPE music,s_kill);
    screen=new_screen;
END

//-----------------------------------------------------------------------------

PROCESS music();

PRIVATE;
    current_sound;

BEGIN
    current_sound=player1[15];
    IF(player1[15]==1) channel1=sound(s_003,player1[14],256);
                       channel2=sound(s_002,player1[14],256);
    END
    IF(player1[15]==2) channel1=sound(s_005,player1[14],256);
                       channel2=sound(s_002,player1[14],256);
    END
    IF(player1[15]==3) channel1=sound(s_006,player1[14],256);
                       channel2=sound(s_002,player1[14],256);
    END
    IF(player1[15]==4) channel1=sound(s_003,player1[14],256);
                       channel2=sound(s_004,player1[14],256);
    END
    IF(player1[15]==5) channel1=sound(s_005,player1[14],256);
                       channel2=sound(s_004,player1[14],256);
    END
    IF(player1[15]==6) channel1=sound(s_006,player1[14],256);
                       channel2=sound(s_004,player1[14],256);
    END
    LOOP
    IF(player1[15]<>current_sound)
        stop_sound(channel1);
        stop_sound(channel2);
        IF(player1[15]==1) channel1=sound(s_003,player1[14],256);
                           channel2=sound(s_002,player1[14],256);
                           current_sound=1;
        END
        IF(player1[15]==2) channel1=sound(s_005,player1[14],256);
                           channel2=sound(s_002,player1[14],256);
                           current_sound=2;
        END
        IF(player1[15]==3) channel1=sound(s_006,player1[14],256);
                           channel2=sound(s_002,player1[14],256);
                           current_sound=3;
        END
        IF(player1[15]==4) channel1=sound(s_003,player1[14],256);
                           channel2=sound(s_004,player1[14],256);
                           current_sound=4;
        END
        IF(player1[15]==5) channel1=sound(s_005,player1[14],256);
                           channel2=sound(s_004,player1[14],256);
                           current_sound=5;
        END
        IF(player1[15]==6) channel1=sound(s_006,player1[14],256);
                           channel2=sound(s_004,player1[14],256);
                           current_sound=6;
        END
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_time();

PRIVATE;
    time;

BEGIN
    time=0;
    player1_building(0);
    player1_building(40);
    player1_building(80);
    player1_building(120);
    LOOP
    time+=1;
    IF(time>40) player1[0]+=1;
        IF(planets[0+6]>0) planets[0+7]+=planets_building_speed[planets[0+6]]
            +(planets[0+18]/10)
            +(planets[0+27]/5);
        END
        IF(planets[40+6]>0) planets[40+7]+=planets_building_speed[planets[40+6]]
            +(planets[40+18]/10)
            +(planets[40+27]/5);
        END
        IF(planets[80+6]>0) planets[80+7]+=planets_building_speed[planets[80+6]]
            +(planets[80+18]/10)
            +(planets[80+27]/5);
        END
        IF(planets[120+6]>0) planets[120+7]+=planets_building_speed[planets[120+6]]
            +(planets[120+18]/10)
            +(planets[120+27]/5);
        END
        time=0;
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_building(planet_number);

BEGIN;
    LOOP
    IF(planets[planet_number+7]=>350)
        IF(planets[planet_number+6]==1) planets[planet_number+8]+=10;  END
        IF(planets[planet_number+6]==2) planets[planet_number+9]+=10;  END
        IF(planets[planet_number+6]==3) planets[planet_number+10]+=10;  END
        IF(planets[planet_number+6]==4) planets[planet_number+11]+=10;  END
        IF(planets[planet_number+6]==5) planets[planet_number+12]+=10;  END
        IF(planets[planet_number+6]==6) planets[planet_number+13]+=10;  END
        IF(planets[planet_number+6]==7) planets[planet_number+14]+=10;  END
        IF(planets[planet_number+6]==8) planets[planet_number+15]+=10;  END
        IF(planets[planet_number+6]==9) planets[planet_number+16]+=10;  END
        IF(planets[planet_number+6]==10) planets[planet_number+17]+=10;  END
        IF(planets[planet_number+6]==11) END
        IF(planets[planet_number+6]==12) END
        IF(planets[planet_number+6]==13) END
        IF(planets[planet_number+6]==14) END
        IF(planets[planet_number+6]==15) planets[planet_number+18]+=10; END
        IF(planets[planet_number+6]==16) planets[planet_number+19]+=10; END
        IF(planets[planet_number+6]==17) planets[planet_number+20]+=10; END
        IF(planets[planet_number+6]==18) planets[planet_number+21]+=10; END
        IF(planets[planet_number+6]==19) planets[planet_number+22]+=10; END
        IF(planets[planet_number+6]==20) planets[planet_number+23]+=10; END
        IF(planets[planet_number+6]==21) planets[planet_number+24]+=10; END
        IF(planets[planet_number+6]==22) planets[planet_number+25]+=10; END
        IF(planets[planet_number+6]==23) planets[planet_number+26]+=10; END
        IF(planets[planet_number+6]==24) planets[planet_number+27]+=10; END
        IF(planets[planet_number+6]==25) planets[planet_number+28]+=10; END
        IF(planets[planet_number+6]==26) planets[planet_number+29]+=10; END
        IF(planets[planet_number+6]==27) planets[planet_number+30]+=10; END
        IF(planets[planet_number+6]==28) planets[planet_number+31]+=10; END
        IF(planets[planet_number+6]==29) planets[planet_number+32]+=10; END
        IF(planets[planet_number+6]==30) planets[planet_number+33]+=10; END
        IF(planets[planet_number+6]==31) planets[planet_number+34]+=10; END
        IF(planets[planet_number+6]==32) planets[planet_number+35]+=10; END
        IF(planets[planet_number+6]==33) planets[planet_number+36]+=10; END
        IF(planets[planet_number+6]==34) planets[planet_number+37]+=10; END
        IF(planets[planet_number+6]==35) planets[planet_number+38]+=10; END
        IF(planets[planet_number+6]==36) planets[planet_number+39]+=10; END
        planets[planet_number+7]=0; planets[planet_number+6]=0;
        IF(player1[13]==TRUE AND region3_using<>11) region3_used=11; region3_using=11; player1_planet_number=planet_number; END
    END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS space();

PRIVATE;
    scroll_grid;
    stop_mouse;

BEGIN
    IF(player1[17]==FALSE) start_scroll(1,space_file,1,2,1,15); scroll_grid=FALSE; END
    IF(player1[17]==TRUE) start_scroll(1,space_file,3,2,1,15); scroll_grid=TRUE; END
    scroll[1].x0=player1[18];
    scroll[1].y0=player1[19];
    scroll_x=-scroll[1].x0;
    scroll_y=-scroll[1].y0;
    planet(0);
    planet(40);
    planet(80);
    planet(120);
    LOOP
        WHILE(stop_mouse<2)
        mouse.x=400;
        mouse.y=300;
        stop_mouse+=1;
        FRAME;
        END
        player1[18]=scroll[1].x0;
        player1[19]=scroll[1].y0;
        IF(player1[17]==FALSE AND scroll_grid==TRUE); stop_scroll(1); start_scroll(1,space_file,1,2,1,15); scroll_grid=FALSE;
        scroll[1].x0=player1[18];
        scroll[1].y0=player1[19];
        END
        IF(player1[17]==TRUE AND scroll_grid==FALSE); stop_scroll(1); start_scroll(1,space_file,3,2,1,15); scroll_grid=TRUE;
        scroll[1].x0=player1[18];
        scroll[1].y0=player1[19];
        END
        IF(space_screen==FALSE AND move_fleet==-10 AND move_fleet_to_port==-10) mouse.graph=20; END
        IF(space_screen==TRUE)
            IF(mouse.x==0 AND mouse.y>1 AND mouse.y<599) scroll[1].x0-=30; mouse.graph=21; END
            IF(mouse.x==799 AND mouse.y>0 AND mouse.y<599) scroll[1].x0+=30; mouse.graph=22; END
            IF(mouse.y==0 AND mouse.x>1 AND mouse.x<799) scroll[1].y0-=30;  mouse.graph=23; END
            IF(mouse.y==599 AND mouse.x>1 AND mouse.x<799) scroll[1].y0+=30; mouse.graph=24; END
            IF(mouse.x==0 AND mouse.y==0) scroll[1].x0-=30; scroll[1].y0-=30; mouse.graph=25; END
            IF(mouse.x==799 AND mouse.y==0) scroll[1].x0+=30; scroll[1].y0-=30; mouse.graph=26; END
            IF(mouse.x==0 AND mouse.y==599) scroll[1].x0-=30; scroll[1].y0+=30; mouse.graph=27; END
            IF(mouse.x==799 AND mouse.y==599) scroll[1].x0+=30; scroll[2].y0+=30; mouse.graph=28; END
            IF(move_fleet==-10 AND move_fleet_to_port==-10 AND mouse.x>5 AND mouse.x<795 AND mouse.y>5 AND mouse.y<595)  mouse.graph=20; END
            IF(move_fleet_to_port=>0 AND mouse.x>5 AND mouse.x<795 AND mouse.y>5 AND mouse.y<595)  mouse.graph=29; END
            IF(move_fleet=>0 AND mouse.x>5 AND mouse.x<795 AND mouse.y>5 AND mouse.y<595)  mouse.graph=29; END
            IF(move_fleet=>0 AND mouse.left AND mouse.x>5 AND mouse.x<795 AND mouse.y>5 AND mouse.y<595)
            WHILE(mouse.left==1);
                FRAME;
            END
            fleets[move_fleet+25]=mouse.x-scroll_x;
            fleets[move_fleet+26]=mouse.y-scroll_y;
            fleets[move_fleet+4]=1;
            channel3=sound(s_007,player1[16],256);
            move_fleet=-10;
            mouse.graph=20; END
        END
        scroll[1].x1-=1;
        scroll[1].y1-=1;
        scroll_x=-scroll[1].x0;
        scroll_y=-scroll[1].y0;
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS left_bar();

PRIVATE
    left_bar_text1;
    left_bar_text2;
    left_bar_text3;
    left_bar_text4;
    left_bar_text5;
    left_bar_text6;
    left_bar_text7;
    left_bar_text8;
    left_bar_text9;
    left_bar_text10;
    left_bar_text11;
    left_bar_text12;
    left_bar_text13;
    left_bar_text14;
    left_bar_text15;
    text_delete;

BEGIN
    region2_open_arrow();
    text_delete=TRUE;
    start_scroll(2,main_file,15,0,2,15);
    scroll[2].z=-90;
    scroll[2].x0=300;
    file=main_file;
    graph=10;
    x=105;
    y=300;
    z=-100;
    region=2;
    write_int(main_font,45,47,3,& player1[0]);
    left_bar_text1=write(main_font,45,80,3,"SPACE");
    left_bar_text2=write(main_font,45,120,3,"HOME PLANET");
    left_bar_text3=write(main_font,45,140,3,"PLANETS");
    left_bar_text4=write(main_font,45,160,3,"ASTEROIDS");
    left_bar_text5=write(main_font,45,200,3,"FLEET 1");
    left_bar_text6=write(main_font,45,220,3,"FLEET 2");
    left_bar_text7=write(main_font,45,240,3,"FLEET 3");
    left_bar_text8=write(main_font,45,260,3,"FLEET 4");
    left_bar_text9=write(main_font,45,300,3,"TECHNOLOGY");
    left_bar_text10=write(main_font,45,340,3,"ENEMY");
    left_bar_text11=write(main_font,45,360,3,"LOG");
    left_bar_text12=write(main_font,45,400,3,"OPTIONS");
    left_bar_text13=write(main_font,45,420,3,"PAUSE");
    left_bar_text14=write(main_font,45,440,3,"SAVE");
    left_bar_text15=write(main_font,45,460,3,"EXIT");
    LOOP
        IF(player1[21]==FALSE AND mouse.left AND mouse.x>146 AND mouse.x<179 AND mouse.y>30 AND mouse.y<64)
        channel3=sound(s_007,player1[16],256);
            WHILE(mouse.left==1);
                FRAME;
            END
        player1[21]=TRUE;
        region2_open=TRUE;
        END
        IF(player1[21]==TRUE AND mouse.left AND mouse.x>146 AND mouse.x<179 AND mouse.y>30 AND mouse.y<64)
        channel3=sound(s_007,player1[16],256);
            WHILE(mouse.left==1);
                FRAME;
            END
        player1[21]=FALSE;
        region2_open=FALSE;
        END
        IF(region2_open==FALSE AND text_delete==TRUE)
            text_delete=FALSE;
            delete_text(left_bar_text1);
            delete_text(left_bar_text2);
            delete_text(left_bar_text3);
            delete_text(left_bar_text4);
            delete_text(left_bar_text5);
            delete_text(left_bar_text6);
            delete_text(left_bar_text7);
            delete_text(left_bar_text8);
            delete_text(left_bar_text9);
            delete_text(left_bar_text10);
            delete_text(left_bar_text11);
            delete_text(left_bar_text12);
            delete_text(left_bar_text13);
            delete_text(left_bar_text14);
            delete_text(left_bar_text15);
        END

        IF(region2_open==TRUE AND text_delete==FALSE)
            text_delete=TRUE;
            left_bar_text1=write(main_font,45,80,3,"SPACE");
            left_bar_text2=write(main_font,45,120,3,"HOME PLANET");
            left_bar_text3=write(main_font,45,140,3,"PLANETS");
            left_bar_text4=write(main_font,45,160,3,"ASTEROIDS");
            left_bar_text5=write(main_font,45,200,3,"FLEET 1");
            left_bar_text6=write(main_font,45,220,3,"FLEET 2");
            left_bar_text7=write(main_font,45,240,3,"FLEET 3");
            left_bar_text8=write(main_font,45,260,3,"FLEET 4");
            left_bar_text9=write(main_font,45,300,3,"TECHNOLOGY");
            left_bar_text10=write(main_font,45,340,3,"ENEMY");
            left_bar_text11=write(main_font,45,360,3,"LOG");
            left_bar_text12=write(main_font,45,400,3,"OPTIONS");
            left_bar_text13=write(main_font,45,420,3,"PAUSE");
            left_bar_text14=write(main_font,45,440,3,"SAVE");
            left_bar_text15=write(main_font,45,460,3,"EXIT");
        END

        scroll[2].y0-=1;
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>70 AND mouse.y<90 AND region3_using<>0)  channel3=sound(s_007,player1[16],256);  region3_open=FALSE; region3_used=0; region3_using=0; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>110 AND mouse.y<130 AND region3_using<>11)  region3_used=11; region3_using=11; player1_planet_number=0;  END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>130 AND mouse.y<150 AND region3_using<>10)  channel3=sound(s_007,player1[16],256);   region3_used=10; region3_using=10; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>150 AND mouse.y<170 AND region3_using<>20)  channel3=sound(s_007,player1[16],256);  region3_used=20; region3_using=20; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>190 AND mouse.y<210 AND region3_using<>30)  region3_used=30; region3_using=30; fleet_number=0; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>210 AND mouse.y<230 AND region3_using<>40)  region3_used=40; region3_using=40; fleet_number=30;  END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>230 AND mouse.y<250 AND region3_using<>50)  region3_used=50; region3_using=50; fleet_number=60;  END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>250 AND mouse.y<270 AND region3_using<>60)  region3_used=60; region3_using=60; fleet_number=90;  END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>290 AND mouse.y<310 AND region3_using<>70)  channel3=sound(s_007,player1[16],256);  region3_used=70; region3_using=70; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>330 AND mouse.y<350 AND region3_using<>80)  channel3=sound(s_007,player1[16],256);  region3_used=80; region3_using=80; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>350 AND mouse.y<370 AND region3_using<>90)  channel3=sound(s_007,player1[16],256);  region3_used=90; region3_using=90; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>390 AND mouse.y<410 AND region3_using<>100)  channel3=sound(s_007,player1[16],256);  region3_used=100; region3_using=100; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>410 AND mouse.y<430) WHILE(mouse.left==1); FRAME; END channel3=sound(s_007,player1[16],256); game_paused=TRUE; END
            IF(region4_open==FALSE AND key(_1)) WHILE(mouse.left==1); FRAME; END channel3=sound(s_007,player1[16],256); game_paused=TRUE; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>430 AND mouse.y<450 AND region3_using<>130)  channel3=sound(s_007,player1[16],256);  region3_used=130; region3_using=130; END
        IF(region2_open==TRUE AND region4_open==FALSE AND mouse.left AND mouse.x>31 AND mouse.x<178 AND mouse.y>450 AND mouse.y<470 AND region3_using<>120)  channel3=sound(s_007,player1[16],256);  region3_used=120; region3_using=120; END
            IF(region4_open==FALSE AND key(_esc) AND region3_using<>120)  channel3=sound(s_007,player1[16],256);  region3_used=120; region3_using=120; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS region2_open_arrow();

BEGIN
    file=main_file;
    IF(region2_open==TRUE) graph=23; END
    IF(region2_open==FALSE) graph=24; END
    z=-110;
    x=157;
    y=43;
    region=2;
    LOOP
    IF(region2_open==TRUE) graph=23; END
    IF(region2_open==FALSE) graph=24; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS right_bar();

BEGIN
    file=main_file;
    graph=12;
    x=705;
    y=47;
    z=-100;
    region=6;
    write(main_font,770,47,5,"SPACE");
    LOOP
        IF(region4_open==FALSE AND mouse.left AND mouse.x>630 AND mouse.x<780 AND mouse.y>30 AND mouse.y<65 AND region3_using<>0)  channel3=sound(s_007,player1[16],256);  region3_open=FALSE; region3_used=0; region3_using=0; END
        FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS pause();

PRIVATE;
    paused;

BEGIN
    region3_used=0;
    file=main_file;
    graph=0;
    x=400;
    y=300;
    z=-510;
    LOOP
    WHILE (game_paused==FALSE);
        FRAME;
    END
    paused=game_paused;
    WHILE (paused==TRUE);
        paused=FALSE;
        FRAME;
    END
    mouse.graph=0;
    graph=16;
    FRAME;
    REPEAT
        UNTIL (key(_space));
        channel3=sound(s_007,player1[16],256);
        game_paused=FALSE;
        paused=FALSE;
        graph=0;
        WHILE (key(_space));
        END
    END
END

//-----------------------------------------------------------------------------

PROCESS main_bar();

PRIVATE
    main_bar_text1;
    main_bar_text2;
    main_bar_text3;
    main_bar_text4;
    main_bar_text5;
    main_bar_text6;
    main_bar_text7;
    main_bar_text8;
    main_bar_text9;
    main_bar_text10;
    main_bar_text11;
    main_bar_text12;
    main_bar_text13;
    main_bar_text14;
    main_bar_text15;
    main_bar_text16;
    main_bar_text17;
    main_bar_text18;
    space_text;

BEGIN
    file=main_file;
    graph=11;
    x=405;
    y=300;
    z=-100;
    region=3;
    space_text=FALSE;
    LOOP
        IF(region3_using==0 AND space_text==FALSE)
            main_bar_text1=write(main_font,244,48,3,letters[player1[22]]);
            main_bar_text2=write(main_font,244+18,48,3,letters[player1[23]]);
            main_bar_text3=write(main_font,244+36,48,3,letters[player1[24]]);
            main_bar_text4=write(main_font,244+54,48,3,letters[player1[25]]);
            main_bar_text5=write(main_font,244+72,48,3,letters[player1[26]]);
            main_bar_text6=write(main_font,244+90,48,3,letters[player1[27]]);
            main_bar_text7=write(main_font,244+108,48,3,letters[player1[28]]);
            main_bar_text8=write(main_font,244+126,48,3,letters[player1[29]]);
            main_bar_text9=write(main_font,244+144,48,3,letters[player1[30]]);
            main_bar_text10=write(main_font,244+162,48,3,letters[player1[31]]);
            main_bar_text11=write(main_font,244+180,48,3,letters[player1[32]]);
            main_bar_text12=write(main_font,244+198,48,3,letters[player1[33]]);
            main_bar_text13=write(main_font,244+216,48,3,letters[player1[34]]);
            main_bar_text14=write(main_font,244+234,48,3,letters[player1[35]]);
            main_bar_text15=write(main_font,244+252,48,3,letters[player1[36]]);
            main_bar_text16=write(main_font,244+270,48,3,letters[player1[37]]);
            main_bar_text17=write(main_font,244+288,48,3,letters[player1[38]]);
            main_bar_text18=write(main_font,244+306,48,3,letters[player1[39]]);
            space_text=TRUE;
        END

        IF(region3_using<>0 AND space_text==TRUE)
            delete_text(main_bar_text1);
            delete_text(main_bar_text2);
            delete_text(main_bar_text3);
            delete_text(main_bar_text4);
            delete_text(main_bar_text5);
            delete_text(main_bar_text6);
            delete_text(main_bar_text7);
            delete_text(main_bar_text8);
            delete_text(main_bar_text9);
            delete_text(main_bar_text10);
            delete_text(main_bar_text11);
            delete_text(main_bar_text12);
            delete_text(main_bar_text13);
            delete_text(main_bar_text14);
            delete_text(main_bar_text15);
            delete_text(main_bar_text16);
            delete_text(main_bar_text17);
            delete_text(main_bar_text18);
            space_text=FALSE;
        END

        IF(region3_open==TRUE) space_screen=FALSE; END
        SWITCH (region3_used);
            CASE 10: planets_bar(); graph=11; END
            CASE 11: player1_planet_bar(player1_planet_number); graph=14;  END
            CASE 20: asteroids_bar(); graph=11;  END
            CASE 30: fleet_bar(); graph=18;  END
            CASE 40: fleet_bar(); graph=18;  END
            CASE 50: fleet_bar(); graph=18;  END
            CASE 60: fleet_bar(); graph=18;  END
            CASE 70: technology_bar(); graph=11;  END
            CASE 80: enemy_bar(); graph=11;  END
            CASE 90: log_bar(); graph=11;  END
            CASE 100: options_bar(); graph=11;  END
            CASE 120: exit_bar(); graph=11;  END
            CASE 130: save_bar(); graph=11;  END
        END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS planets_bar();

PRIVATE
    planets_bar_position;
    planets_bar_text1;
    planets_bar_text2;
    planets_bar_text3;
    planets_bar_text4;
    planets_bar_text5;
    planets_bar_text6;
    planets_bar_text7;
    planets_bar_text8;
    planets_bar_text9;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;
    planets_bar_position=0;

    planets_bar_text1=write(main_font,403,48,4,"PLANETS");
    planets_bullet_point(space_file,planets[planets_bar_position+1],8,230,110);
    planets_bar_text2=write(main_font,265,100,3,planets[planets_bar_position]);
    planets_bar_text3=write(main_font,265,120,3,players[planets[planets_bar_position+4]]);
    planets_bullet_point(space_file,planets[planets_bar_position+40+1],8,230,170);
    planets_bar_text4=write(main_font,265,160,3,planets[planets_bar_position+40]);
    planets_bar_text5=write(main_font,265,180,3,players[planets[planets_bar_position+40+4]]);
    planets_bullet_point(space_file,planets[planets_bar_position+80+1],8,230,230);
    planets_bar_text6=write(main_font,265,220,3,planets[planets_bar_position+80]);
    planets_bar_text7=write(main_font,265,240,3,players[planets[planets_bar_position+80+4]]);
    planets_bullet_point(space_file,planets[planets_bar_position+120+1],8,230,290);
    planets_bar_text8=write(main_font,265,280,3,planets[planets_bar_position+120]);
    planets_bar_text9=write(main_font,265,300,3,players[planets[planets_bar_position+120+4]]);
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==10);
        IF(mouse.left AND mouse.x>209 AND mouse.x<250 AND mouse.y>89 AND mouse.y<130)    channel3=sound(s_007,player1[16],256);  region3_used=0; region3_using=0; region3_open=FALSE; scroll[1].x0=planets[planets_bar_position+0+2]-410; scroll[1].y0=planets[planets_bar_position+0+3]-240; END
        IF(mouse.left AND mouse.x>209 AND mouse.x<250 AND mouse.y>149 AND mouse.y<190)   channel3=sound(s_007,player1[16],256);  region3_used=0; region3_using=0; region3_open=FALSE; scroll[1].x0=planets[planets_bar_position+40+2]-410; scroll[1].y0=planets[planets_bar_position+40+3]-240; END
        IF(mouse.left AND mouse.x>209 AND mouse.x<250 AND mouse.y>209 AND mouse.y<250)   channel3=sound(s_007,player1[16],256);  region3_used=0; region3_using=0; region3_open=FALSE; scroll[1].x0=planets[planets_bar_position+80+2]-410; scroll[1].y0=planets[planets_bar_position+80+3]-240; END
        IF(mouse.left AND mouse.x>209 AND mouse.x<250 AND mouse.y>269 AND mouse.y<310)   channel3=sound(s_007,player1[16],256);  region3_used=0; region3_using=0; region3_open=FALSE; scroll[1].x0=planets[planets_bar_position+120+2]-410; scroll[1].y0=planets[planets_bar_position+120+3]-240; END

        IF(mouse.left AND mouse.x>250 AND mouse.x<550 AND mouse.y>89 AND mouse.y<130)  region3_used=11; region3_using=11; player1_planet_number=0;  END
        IF(mouse.left AND mouse.x>250 AND mouse.x<550 AND mouse.y>149 AND mouse.y<190) region3_used=11; region3_using=11; player1_planet_number=40;  END
        IF(mouse.left AND mouse.x>250 AND mouse.x<550 AND mouse.y>209 AND mouse.y<250) region3_used=11; region3_using=11; player1_planet_number=80;  END
        IF(mouse.left AND mouse.x>250 AND mouse.x<550 AND mouse.y>269 AND mouse.y<310) region3_used=11; region3_using=11; player1_planet_number=120;  END
        FRAME;
    END
    space_screen=TRUE;
    signal(TYPE planets_bullet_point,s_kill);
    delete_text(planets_bar_text1);
    delete_text(planets_bar_text2);
    delete_text(planets_bar_text3);
    delete_text(planets_bar_text4);
    delete_text(planets_bar_text5);
    delete_text(planets_bar_text6);
    delete_text(planets_bar_text7);
    delete_text(planets_bar_text8);
    delete_text(planets_bar_text9);
END

//-----------------------------------------------------------------------------


PROCESS player1_planet_bar(planet_number);

PRIVATE
    planets_bar_text1;
    planets_bar_text2;
    planets_bar_text3;
    planets_bar_text4;
    planets_bar_text5;
    planets_bar_text6;

    planets_bar_veiw;
    planets_bar_veiwing;
    build_height;

    planets_bar_text7;
    planets_bar_text8;
    planets_bar_text9;
    planets_bar_text10;
    planets_bar_text11;
    planets_bar_text12;
    planets_bar_text13;

    planets_bar_text14;
    planets_bar_text15;
    planets_bar_text16;
    planets_bar_text17;
    planets_bar_text18;

    planets_bar_text19;
    planets_bar_text20;
    planets_bar_text21;
    planets_bar_text22;
    planets_bar_text23;
    planets_bar_text24;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    channel3=sound(s_007,player1[16],256);
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    planets_bar_veiw=0;
    planets_bar_veiwing=1;
    build_height=0;

    file=main_file;
    graph=50;
    x=403;
    y=170;
    z=-150;
    region=3;

    planets_bar_text1=write(main_font,403,48,4,planets[planet_number]);
    planets_bar_text2=write_int(main_font,390,80,5,& planets[planet_number+5]);
    planets_bar_text3=write(main_font,394,80,3,"Million People");
    planets_bar_text4=write(main_font,403,100,4,players[planets[planet_number+4]]);
    planets_bar_text5=write(main_font,302,552,4,"BUILD");
    planets_bar_text6=write(main_font,507,552,4,"PLANET");

        IF(build_height<10) planets_bar_text7=write(yellow_font,270,210,3,planets_building_text[build_height+1]);    END
        IF(build_height<10-1) planets_bar_text8=write(yellow_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height<10-2) planets_bar_text9=write(yellow_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height<10-3) planets_bar_text10=write(yellow_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height<10-4) planets_bar_text11=write(yellow_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height<10-5) planets_bar_text19=write(yellow_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height<10-6) planets_bar_text20=write(yellow_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height<10-7) planets_bar_text21=write(yellow_font,270,490,3,planets_building_text[build_height+8]); END
        IF(build_height=>10 AND build_height<=13) planets_bar_text7=write(blue_font,270,210,3,planets_building_text[build_height+1]); END
        IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text8=write(blue_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text9=write(blue_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text10=write(blue_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text11=write(blue_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text19=write(blue_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text20=write(blue_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text21=write(blue_font,270,490,3,planets_building_text[build_height+8]); END
        IF(build_height>13) planets_bar_text7=write(main_font,270,210,3,planets_building_text[build_height+1]); END
        IF(build_height>13-1) planets_bar_text8=write(main_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height>13-2) planets_bar_text9=write(main_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height>13-3) planets_bar_text10=write(main_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height>13-4) planets_bar_text11=write(main_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height>13-5) planets_bar_text19=write(main_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height>13-6) planets_bar_text20=write(main_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height>13-7) planets_bar_text21=write(main_font,270,490,3,planets_building_text[build_height+8]); END

    player1_planet_arrows(23,575,200);
    player1_planet_arrows(24,575,500);
    planets_bar_text12=write(red_font,370,140,5,"BUILDING");
    planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
    building_bar(planet_number);

    planets_bar_text14=write(main_font,555,210,5,"");
    planets_bar_text15=write(main_font,555,250,5,"");
    planets_bar_text16=write(main_font,555,290,5,"");
    planets_bar_text17=write(main_font,555,330,5,"");
    planets_bar_text18=write(main_font,555,370,5,"");
    planets_bar_text22=write(main_font,555,410,5,"");
    planets_bar_text23=write(main_font,555,450,5,"");
    planets_bar_text24=write(main_font,555,490,5,"");

    FRAME;
        WHILE(region3_open==TRUE AND region3_using==11);
        IF(planets_bar_veiwing==1 AND planets[planet_number+6]==0);
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
        END

        IF(build_height<10)
        IF(region4_open==FALSE AND build_height<10 AND planets[planet_number+8+build_height]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>190 AND mouse.y<230 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height);
        END

        IF(region4_open==FALSE AND build_height<10-1 AND  planets[planet_number+8+build_height+1]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>230 AND mouse.y<270 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+1);
        END

        IF(region4_open==FALSE AND build_height<10-2 AND  planets[planet_number+8+build_height+2]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>270 AND mouse.y<310 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+2);
        END

        IF(region4_open==FALSE AND build_height<10-3 AND  planets[planet_number+8+build_height+3]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>310 AND mouse.y<350 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+3);
        END

        IF(region4_open==FALSE AND build_height<10-4 AND  planets[planet_number+8+build_height+4]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>350 AND mouse.y<390 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+4);
        END

        IF(region4_open==FALSE AND build_height<10-5 AND  planets[planet_number+8+build_height+5]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>390 AND mouse.y<430 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+5);
        END

        IF(region4_open==FALSE AND build_height<10-6 AND  planets[planet_number+8+build_height+6]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>430 AND mouse.y<470 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+6);
        END

        IF(region4_open==FALSE AND build_height<10-7 AND  planets[planet_number+8+build_height+7]>0 AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<550 AND mouse.y>470 AND mouse.y<510 AND mouse.left)
        region4_open=TRUE;
        send_ships_to_fleet(planet_number,8+build_height+7);
        END
        END
        IF(region4_open==FALSE AND planets[planet_number+6]<>1+build_height)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>190 AND mouse.y<230 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END
        IF(region4_open==FALSE AND  planets[planet_number+6]<>1+build_height+1)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>230 AND mouse.y<270 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+1;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END
        IF(region4_open==FALSE AND  planets[planet_number+6]<>1+build_height+2)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>270 AND mouse.y<310 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+2;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END
        IF(region4_open==FALSE AND  planets[planet_number+6]<>1+build_height+3)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>310 AND mouse.y<350 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+3;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END
        IF(region4_open==FALSE AND planets[planet_number+6]<>1+build_height+4)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>350 AND mouse.y<390 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+4;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END

        IF(region4_open==FALSE AND planets[planet_number+7]<>1+build_height+5)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>390 AND mouse.y<430 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+5;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END
        IF(region4_open==FALSE AND planets[planet_number+8]<>1+build_height+6)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>430 AND mouse.y<470 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+6;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END
        IF(region4_open==FALSE AND planets[planet_number+9]<>1+build_height+7)
            IF(planets_bar_veiwing==1 AND mouse.x>200 AND mouse.x<550 AND mouse.y>470 AND mouse.y<510 AND mouse.left)
            channel3=sound(s_007,player1[16],256);
            planets[planet_number+6]=1+build_height+7;
            delete_text(planets_bar_text13);
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets[planet_number+7]=0;
            END
        END


        IF(region4_open==FALSE AND build_height>0 AND mouse.x>565 AND mouse.x<585 AND mouse.y>190 AND mouse.y<210 AND mouse.left)
            build_height-=1;
            delete_text(planets_bar_text7);
            delete_text(planets_bar_text8);
            delete_text(planets_bar_text9);
            delete_text(planets_bar_text10);
            delete_text(planets_bar_text11);
            delete_text(planets_bar_text19);
            delete_text(planets_bar_text20);
            delete_text(planets_bar_text21);
            IF(planets_bar_veiwing==2);
                delete_text(planets_bar_text14);
                delete_text(planets_bar_text15);
                delete_text(planets_bar_text16);
                delete_text(planets_bar_text17);
                delete_text(planets_bar_text18);
                delete_text(planets_bar_text22);
                delete_text(planets_bar_text23);
                delete_text(planets_bar_text24);
                    IF(build_height<10) planets_bar_text14=write_int(yellow_font,555,210,5,& planets[planet_number+8+0+build_height]); END
                    IF(build_height<10-1) planets_bar_text15=write_int(yellow_font,555,250,5,& planets[planet_number+8+1+build_height]); END
                    IF(build_height<10-2) planets_bar_text16=write_int(yellow_font,555,290,5,& planets[planet_number+8+2+build_height]); END
                    IF(build_height<10-3) planets_bar_text17=write_int(yellow_font,555,330,5,& planets[planet_number+8+3+build_height]); END
                    IF(build_height<10-4) planets_bar_text18=write_int(yellow_font,555,370,5,& planets[planet_number+8+4+build_height]); END
                    IF(build_height<10-5) planets_bar_text22=write_int(yellow_font,555,410,5,& planets[planet_number+8+5+build_height]); END
                    IF(build_height<10-6) planets_bar_text23=write_int(yellow_font,555,450,5,& planets[planet_number+8+6+build_height]); END
                    IF(build_height<10-7) planets_bar_text24=write_int(yellow_font,555,490,5,& planets[planet_number+8+7+build_height]); END
                    IF(build_height>13) planets_bar_text14=write_int(main_font,555,210,5,& planets[planet_number+8+0+build_height-4]); END
                    IF(build_height>13-1) planets_bar_text15=write_int(main_font,555,250,5,& planets[planet_number+8+1+build_height-4]); END
                    IF(build_height>13-2) planets_bar_text16=write_int(main_font,555,290,5,& planets[planet_number+8+2+build_height-4]); END
                    IF(build_height>13-3) planets_bar_text17=write_int(main_font,555,330,5,& planets[planet_number+8+3+build_height-4]); END
                    IF(build_height>13-4) planets_bar_text18=write_int(main_font,555,370,5,& planets[planet_number+8+4+build_height-4]); END
                    IF(build_height>13-5) planets_bar_text22=write_int(main_font,555,410,5,& planets[planet_number+8+5+build_height-4]); END
                    IF(build_height>13-6) planets_bar_text23=write_int(main_font,555,450,5,& planets[planet_number+8+6+build_height-4]); END
                    IF(build_height>13-7) planets_bar_text24=write_int(main_font,555,490,5,& planets[planet_number+8+7+build_height-4]); END
                    IF(build_height=>10 AND build_height<=13) planets_bar_text14=write(main_font,555,210,5,""); END
                    IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text15=write(main_font,555,250,5,""); END
                    IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text16=write(main_font,555,290,5,""); END
                    IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text17=write(main_font,555,330,5,""); END
                    IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text18=write(main_font,555,370,5,""); END
                    IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text22=write(main_font,555,410,5,""); END
                    IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text23=write(main_font,555,450,5,""); END
                    IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text24=write(main_font,555,490,5,""); END
                    END
                IF(build_height<10) planets_bar_text7=write(yellow_font,270,210,3,planets_building_text[build_height+1]);    END
                IF(build_height<10-1) planets_bar_text8=write(yellow_font,270,250,3,planets_building_text[build_height+2]); END
                IF(build_height<10-2) planets_bar_text9=write(yellow_font,270,290,3,planets_building_text[build_height+3]); END
                IF(build_height<10-3) planets_bar_text10=write(yellow_font,270,330,3,planets_building_text[build_height+4]); END
                IF(build_height<10-4) planets_bar_text11=write(yellow_font,270,370,3,planets_building_text[build_height+5]); END
                IF(build_height<10-5) planets_bar_text19=write(yellow_font,270,410,3,planets_building_text[build_height+6]); END
                IF(build_height<10-6) planets_bar_text20=write(yellow_font,270,450,3,planets_building_text[build_height+7]); END
                IF(build_height<10-7) planets_bar_text21=write(yellow_font,270,490,3,planets_building_text[build_height+8]); END
                IF(build_height=>10 AND build_height<=13) planets_bar_text7=write(blue_font,270,210,3,planets_building_text[build_height+1]); END
                IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text8=write(blue_font,270,250,3,planets_building_text[build_height+2]); END
                IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text9=write(blue_font,270,290,3,planets_building_text[build_height+3]); END
                IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text10=write(blue_font,270,330,3,planets_building_text[build_height+4]); END
                IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text11=write(blue_font,270,370,3,planets_building_text[build_height+5]); END
                IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text19=write(blue_font,270,410,3,planets_building_text[build_height+6]); END
                IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text20=write(blue_font,270,450,3,planets_building_text[build_height+7]); END
                IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text21=write(blue_font,270,490,3,planets_building_text[build_height+8]); END
                IF(build_height>13) planets_bar_text7=write(main_font,270,210,3,planets_building_text[build_height+1]); END
                IF(build_height>13-1) planets_bar_text8=write(main_font,270,250,3,planets_building_text[build_height+2]); END
                IF(build_height>13-2) planets_bar_text9=write(main_font,270,290,3,planets_building_text[build_height+3]); END
                IF(build_height>13-3) planets_bar_text10=write(main_font,270,330,3,planets_building_text[build_height+4]); END
                IF(build_height>13-4) planets_bar_text11=write(main_font,270,370,3,planets_building_text[build_height+5]); END
                IF(build_height>13-5) planets_bar_text19=write(main_font,270,410,3,planets_building_text[build_height+6]); END
                IF(build_height>13-6) planets_bar_text20=write(main_font,270,450,3,planets_building_text[build_height+7]); END
                IF(build_height>13-7) planets_bar_text21=write(main_font,270,490,3,planets_building_text[build_height+8]); END
            END

        IF(region4_open==FALSE AND build_height<28 AND mouse.x>565 AND mouse.x<585 AND mouse.y>490 AND mouse.y<510 AND mouse.left)
            build_height+=1;
            delete_text(planets_bar_text7);
            delete_text(planets_bar_text8);
            delete_text(planets_bar_text9);
            delete_text(planets_bar_text10);
            delete_text(planets_bar_text11);
            delete_text(planets_bar_text19);
            delete_text(planets_bar_text20);
            delete_text(planets_bar_text21);
            IF(planets_bar_veiwing==2);
                delete_text(planets_bar_text14);
                delete_text(planets_bar_text15);
                delete_text(planets_bar_text16);
                delete_text(planets_bar_text17);
                delete_text(planets_bar_text18);
                delete_text(planets_bar_text22);
                delete_text(planets_bar_text23);
                delete_text(planets_bar_text24);
                    IF(build_height<10) planets_bar_text14=write_int(yellow_font,555,210,5,& planets[planet_number+8+0+build_height]); END
                    IF(build_height<10-1) planets_bar_text15=write_int(yellow_font,555,250,5,& planets[planet_number+8+1+build_height]); END
                    IF(build_height<10-2) planets_bar_text16=write_int(yellow_font,555,290,5,& planets[planet_number+8+2+build_height]); END
                    IF(build_height<10-3) planets_bar_text17=write_int(yellow_font,555,330,5,& planets[planet_number+8+3+build_height]); END
                    IF(build_height<10-4) planets_bar_text18=write_int(yellow_font,555,370,5,& planets[planet_number+8+4+build_height]); END
                    IF(build_height<10-5) planets_bar_text22=write_int(yellow_font,555,410,5,& planets[planet_number+8+5+build_height]); END
                    IF(build_height<10-6) planets_bar_text23=write_int(yellow_font,555,450,5,& planets[planet_number+8+6+build_height]); END
                    IF(build_height<10-7) planets_bar_text24=write_int(yellow_font,555,490,5,& planets[planet_number+8+7+build_height]); END
                    IF(build_height>13) planets_bar_text14=write_int(main_font,555,210,5,& planets[planet_number+8+0+build_height-4]); END
                    IF(build_height>13-1) planets_bar_text15=write_int(main_font,555,250,5,& planets[planet_number+8+1+build_height-4]); END
                    IF(build_height>13-2) planets_bar_text16=write_int(main_font,555,290,5,& planets[planet_number+8+2+build_height-4]); END
                    IF(build_height>13-3) planets_bar_text17=write_int(main_font,555,330,5,& planets[planet_number+8+3+build_height-4]); END
                    IF(build_height>13-4) planets_bar_text18=write_int(main_font,555,370,5,& planets[planet_number+8+4+build_height-4]); END
                    IF(build_height>13-5) planets_bar_text22=write_int(main_font,555,410,5,& planets[planet_number+8+5+build_height-4]); END
                    IF(build_height>13-6) planets_bar_text23=write_int(main_font,555,450,5,& planets[planet_number+8+6+build_height-4]); END
                    IF(build_height>13-7) planets_bar_text24=write_int(main_font,555,490,5,& planets[planet_number+8+7+build_height-4]); END
                    IF(build_height=>10 AND build_height<=13) planets_bar_text14=write(main_font,555,210,5,""); END
                    IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text15=write(main_font,555,250,5,""); END
                    IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text16=write(main_font,555,290,5,""); END
                    IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text17=write(main_font,555,330,5,""); END
                    IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text18=write(main_font,555,370,5,""); END
                    IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text22=write(main_font,555,410,5,""); END
                    IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text23=write(main_font,555,450,5,""); END
                    IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text24=write(main_font,555,490,5,""); END
                    END

        IF(build_height<10) planets_bar_text7=write(yellow_font,270,210,3,planets_building_text[build_height+1]);    END
        IF(build_height<10-1) planets_bar_text8=write(yellow_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height<10-2) planets_bar_text9=write(yellow_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height<10-3) planets_bar_text10=write(yellow_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height<10-4) planets_bar_text11=write(yellow_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height<10-5) planets_bar_text19=write(yellow_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height<10-6) planets_bar_text20=write(yellow_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height<10-7) planets_bar_text21=write(yellow_font,270,490,3,planets_building_text[build_height+8]); END
        IF(build_height=>10 AND build_height<=13) planets_bar_text7=write(blue_font,270,210,3,planets_building_text[build_height+1]); END
        IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text8=write(blue_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text9=write(blue_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text10=write(blue_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text11=write(blue_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text19=write(blue_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text20=write(blue_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text21=write(blue_font,270,490,3,planets_building_text[build_height+8]); END
        IF(build_height>13) planets_bar_text7=write(main_font,270,210,3,planets_building_text[build_height+1]); END
        IF(build_height>13-1) planets_bar_text8=write(main_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height>13-2) planets_bar_text9=write(main_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height>13-3) planets_bar_text10=write(main_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height>13-4) planets_bar_text11=write(main_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height>13-5) planets_bar_text19=write(main_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height>13-6) planets_bar_text20=write(main_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height>13-7) planets_bar_text21=write(main_font,270,490,3,planets_building_text[build_height+8]); END

            END

         IF(planets_bar_veiw==1)
            channel3=sound(s_007,player1[16],256);
            planets_bar_veiwing=1;
            graph=50;
            signal(TYPE building_bar,s_kill);
            delete_text(planets_bar_text12);
            delete_text(planets_bar_text13);
            delete_text(planets_bar_text14);
            delete_text(planets_bar_text15);
            delete_text(planets_bar_text16);
            delete_text(planets_bar_text17);
            delete_text(planets_bar_text18);
            delete_text(planets_bar_text22);
            delete_text(planets_bar_text23);
            delete_text(planets_bar_text24);
            planets_bar_text12=write(red_font,370,140,5,"BUILDING");
            planets_bar_text13=write(red_font,374,140,3,planets_building_text[planets[planet_number+6]]);
            planets_bar_text14=write(main_font,555,210,5,"");
            planets_bar_text15=write(main_font,555,250,5,"");
            planets_bar_text16=write(main_font,555,290,5,"");
            planets_bar_text17=write(main_font,555,330,5,"");
            planets_bar_text18=write(main_font,555,370,5,"");
            planets_bar_text22=write(main_font,555,410,5,"");
            planets_bar_text23=write(main_font,555,450,5,"");
            planets_bar_text24=write(main_font,555,490,5,"");
            building_bar(planet_number);
            planets_bar_veiw=0;
        END

        IF(planets_bar_veiw==2)
            delete_text(planets_bar_text7);
            delete_text(planets_bar_text8);
            delete_text(planets_bar_text9);
            delete_text(planets_bar_text10);
            delete_text(planets_bar_text11);
            delete_text(planets_bar_text19);
            delete_text(planets_bar_text20);
            delete_text(planets_bar_text21);

        IF(build_height<10) planets_bar_text7=write(yellow_font,270,210,3,planets_building_text[build_height+1]);    END
        IF(build_height<10-1) planets_bar_text8=write(yellow_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height<10-2) planets_bar_text9=write(yellow_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height<10-3) planets_bar_text10=write(yellow_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height<10-4) planets_bar_text11=write(yellow_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height<10-5) planets_bar_text19=write(yellow_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height<10-6) planets_bar_text20=write(yellow_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height<10-7) planets_bar_text21=write(yellow_font,270,490,3,planets_building_text[build_height+8]); END
        IF(build_height=>10 AND build_height<=13) planets_bar_text7=write(blue_font,270,210,3,planets_building_text[build_height+1]); END
        IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text8=write(blue_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text9=write(blue_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text10=write(blue_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text11=write(blue_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text19=write(blue_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text20=write(blue_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text21=write(blue_font,270,490,3,planets_building_text[build_height+8]); END
        IF(build_height>13) planets_bar_text7=write(main_font,270,210,3,planets_building_text[build_height+1]); END
        IF(build_height>13-1) planets_bar_text8=write(main_font,270,250,3,planets_building_text[build_height+2]); END
        IF(build_height>13-2) planets_bar_text9=write(main_font,270,290,3,planets_building_text[build_height+3]); END
        IF(build_height>13-3) planets_bar_text10=write(main_font,270,330,3,planets_building_text[build_height+4]); END
        IF(build_height>13-4) planets_bar_text11=write(main_font,270,370,3,planets_building_text[build_height+5]); END
        IF(build_height>13-5) planets_bar_text19=write(main_font,270,410,3,planets_building_text[build_height+6]); END
        IF(build_height>13-6) planets_bar_text20=write(main_font,270,450,3,planets_building_text[build_height+7]); END
        IF(build_height>13-7) planets_bar_text21=write(main_font,270,490,3,planets_building_text[build_height+8]); END

            channel3=sound(s_007,player1[16],256);
            planets_bar_veiwing=2;
            graph=0;
            signal(TYPE building_bar,s_kill);
            delete_text(planets_bar_text12);
            delete_text(planets_bar_text13);
            delete_text(planets_bar_text14);
            delete_text(planets_bar_text15);
            delete_text(planets_bar_text16);
            delete_text(planets_bar_text17);
            delete_text(planets_bar_text18);
            delete_text(planets_bar_text22);
            delete_text(planets_bar_text23);
            delete_text(planets_bar_text24);
            planets_bar_text12=write(main_font,403,140,4,"BUILDINGS");
            planets_bar_text13=write(main_font,403,160,4,"PLANET DEFENCE");
                    IF(build_height<10) planets_bar_text14=write_int(yellow_font,555,210,5,& planets[planet_number+8+0+build_height]); END
                    IF(build_height<10-1) planets_bar_text15=write_int(yellow_font,555,250,5,& planets[planet_number+8+1+build_height]); END
                    IF(build_height<10-2) planets_bar_text16=write_int(yellow_font,555,290,5,& planets[planet_number+8+2+build_height]); END
                    IF(build_height<10-3) planets_bar_text17=write_int(yellow_font,555,330,5,& planets[planet_number+8+3+build_height]); END
                    IF(build_height<10-4) planets_bar_text18=write_int(yellow_font,555,370,5,& planets[planet_number+8+4+build_height]); END
                    IF(build_height<10-5) planets_bar_text22=write_int(yellow_font,555,410,5,& planets[planet_number+8+5+build_height]); END
                    IF(build_height<10-6) planets_bar_text23=write_int(yellow_font,555,450,5,& planets[planet_number+8+6+build_height]); END
                    IF(build_height<10-7) planets_bar_text24=write_int(yellow_font,555,490,5,& planets[planet_number+8+7+build_height]); END
                    IF(build_height>13) planets_bar_text14=write_int(main_font,555,210,5,& planets[planet_number+8+0+build_height-4]); END
                    IF(build_height>13-1) planets_bar_text15=write_int(main_font,555,250,5,& planets[planet_number+8+1+build_height-4]); END
                    IF(build_height>13-2) planets_bar_text16=write_int(main_font,555,290,5,& planets[planet_number+8+2+build_height-4]); END
                    IF(build_height>13-3) planets_bar_text17=write_int(main_font,555,330,5,& planets[planet_number+8+3+build_height-4]); END
                    IF(build_height>13-4) planets_bar_text18=write_int(main_font,555,370,5,& planets[planet_number+8+4+build_height-4]); END
                    IF(build_height>13-5) planets_bar_text22=write_int(main_font,555,410,5,& planets[planet_number+8+5+build_height-4]); END
                    IF(build_height>13-6) planets_bar_text23=write_int(main_font,555,450,5,& planets[planet_number+8+6+build_height-4]); END
                    IF(build_height>13-7) planets_bar_text24=write_int(main_font,555,490,5,& planets[planet_number+8+7+build_height-4]); END
                    IF(build_height=>10 AND build_height<=13) planets_bar_text14=write(main_font,555,210,5,""); END
                    IF(build_height=>10-1 AND build_height<=13-1) planets_bar_text15=write(main_font,555,250,5,""); END
                    IF(build_height=>10-2 AND build_height<=13-2) planets_bar_text16=write(main_font,555,290,5,""); END
                    IF(build_height=>10-3 AND build_height<=13-3) planets_bar_text17=write(main_font,555,330,5,""); END
                    IF(build_height=>10-4 AND build_height<=13-4) planets_bar_text18=write(main_font,555,370,5,""); END
                    IF(build_height=>10-5 AND build_height<=13-5) planets_bar_text22=write(main_font,555,410,5,""); END
                    IF(build_height=>10-6 AND build_height<=13-6) planets_bar_text23=write(main_font,555,450,5,""); END
                    IF(build_height=>10-7 AND build_height<=13-7) planets_bar_text24=write(main_font,555,490,5,""); END
            planets_bar_veiw=0;
        END

        IF(region4_open==FALSE AND planets_bar_veiwing==1 AND mouse.x>405 AND mouse.x<609 AND mouse.y>535 AND mouse.y<569 AND mouse.left) planets_bar_veiw=2; END
        IF(region4_open==FALSE AND planets_bar_veiwing==2 AND mouse.x>200 AND mouse.x<405 AND mouse.y>535 AND mouse.y<569 AND mouse.left) planets_bar_veiw=1; END

        FRAME;
    END
    space_screen=TRUE;
    signal(TYPE send_ships_to_fleet,s_kill);
    signal(TYPE building_bar,s_kill);
    signal(TYPE player1_planet_arrows,s_kill);
    delete_text(planets_bar_text1);
    delete_text(planets_bar_text2);
    delete_text(planets_bar_text3);
    delete_text(planets_bar_text4);
    delete_text(planets_bar_text5);
    delete_text(planets_bar_text6);
    delete_text(planets_bar_text7);
    delete_text(planets_bar_text8);
    delete_text(planets_bar_text9);
    delete_text(planets_bar_text10);
    delete_text(planets_bar_text11);
    delete_text(planets_bar_text12);
    delete_text(planets_bar_text13);
    delete_text(planets_bar_text14);
    delete_text(planets_bar_text15);
    delete_text(planets_bar_text16);
    delete_text(planets_bar_text17);
    delete_text(planets_bar_text18);
    delete_text(planets_bar_text19);
    delete_text(planets_bar_text20);
    delete_text(planets_bar_text21);
    delete_text(planets_bar_text22);
    delete_text(planets_bar_text23);
    delete_text(planets_bar_text24);
END

//-----------------------------------------------------------------------------

PROCESS send_ships_to_fleet(planet_number,ships_to_send);

BEGIN
    WHILE(mouse.left);
        FRAME;
    END
    channel3=sound(s_007,player1[16],256);
    file=main_file;
    graph=17;
    x=405;
    y=300;
    z=-510;
    region=4;
    FRAME;
        WHILE(region4_open==TRUE);
            IF(mouse.x>200 AND mouse.x<405 AND mouse.y>283 AND mouse.y<317 AND mouse.left) fleets[0+ships_to_send-3]+=planets[planet_number+ships_to_send]; planets[planet_number+ships_to_send]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256);  END
            IF(mouse.x>200 AND mouse.x<405 AND mouse.y>317 AND mouse.y<351 AND mouse.left) fleets[30+ships_to_send-3]+=planets[planet_number+ships_to_send]; planets[planet_number+ships_to_send]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256); END
            IF(mouse.x>405 AND mouse.x<609 AND mouse.y>283 AND mouse.y<317 AND mouse.left) fleets[60+ships_to_send-3]+=planets[planet_number+ships_to_send]; planets[planet_number+ships_to_send]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256);  END
            IF(mouse.x>405 AND mouse.x<609 AND mouse.y>317 AND mouse.y<351 AND mouse.left) fleets[90+ships_to_send-3]+=planets[planet_number+ships_to_send]; planets[planet_number+ships_to_send]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE;  channel3=sound(s_007,player1[16],256); END
         FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS building_bar(planet_number);

BEGIN
    file=main_file;
    graph=51;
    region=4;
    x=403;
    y=170;
    z=-160;
    LOOP
    define_region(4,228,161,planets[planet_number+7],18);
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player1_planet_arrows(graph,x,y);

BEGIN
    file=main_file;
    z=-160;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS asteroids_bar();

PRIVATE
    asteroids_bar_text1;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    asteroids_bar_text1=write(main_font,403,48,4,"ASTEROIDS");
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==20);
        FRAME;
    END
    space_screen=TRUE;
    delete_text(asteroids_bar_text1);
END

//-----------------------------------------------------------------------------

PROCESS fleet_bar();

PRIVATE
    region_using_fleet;

    fleet_bar_text1;
    fleet_bar_text2;
    fleet_bar_text3;
    fleet_bar_text4;
    fleet_bar_text5;
    fleet_bar_text6;
    fleet_bar_text7;
    fleet_bar_text8;
    fleet_bar_text9;
    fleet_bar_text10;
    fleet_bar_text11;
    fleet_bar_text12;
    fleet_bar_text13;
    fleet_bar_text14;
    fleet_bar_text15;
    fleet_bar_text16;
    fleet_bar_text17;
    fleet_bar_text18;
    fleet_bar_text19;
    fleet_bar_text20;
    fleet_bar_text21;
    fleet_bar_text22;
    fleet_bar_text23;
    fleet_bar_text24;
    fleet_bar_text25;
    fleet_bar_text26;

BEGIN
    WHILE(mouse.left==1);
    LOOP
        FRAME;
        END
    END
    channel3=sound(s_007,player1[16],256);
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    IF(fleet_number==0) region_using_fleet=30; END
    IF(fleet_number==30) region_using_fleet=40; END
    IF(fleet_number==60) region_using_fleet=50; END
    IF(fleet_number==90) region_using_fleet=60; END

    fleet_bar_text1=write(main_font,403,48,4,fleets[fleet_number]);
    fleet_bar_text2=write(red_font,403,80,4,fleets_status[fleets[fleet_number+4]]);
    fleet_bar_text23=write(main_font,302,517,4,"SELF REPAIR");
    fleet_bar_text24=write(main_font,507,517,4,"GO TO PORT");
    fleet_bar_text25=write(main_font,302,552,4,"ATTACK");
    fleet_bar_text26=write(main_font,507,552,4,"SPACE TRAVEL");

    fleet_bar_text3=write(yellow_font,275,120,3,planets_building_text[1]);
    fleet_bar_text4=write(yellow_font,275,160,3,planets_building_text[2]);
    fleet_bar_text5=write(yellow_font,275,200,3,planets_building_text[3]);
    fleet_bar_text6=write(yellow_font,275,240,3,planets_building_text[4]);
    fleet_bar_text7=write(yellow_font,275,280,3,planets_building_text[5]);
    fleet_bar_text8=write(yellow_font,275,320,3,planets_building_text[6]);
    fleet_bar_text9=write(yellow_font,275,360,3,planets_building_text[7]);
    fleet_bar_text10=write(yellow_font,275,400,3,planets_building_text[8]);
    fleet_bar_text11=write(yellow_font,275,440,3,planets_building_text[9]);
    fleet_bar_text12=write(yellow_font,275,480,3,planets_building_text[10]);

    fleet_bar_text13=write_int(yellow_font,210,120,3,& fleets[fleet_number+0+5]);
    fleet_bar_text14=write_int(yellow_font,210,160,3,& fleets[fleet_number+1+5]);
    fleet_bar_text15=write_int(yellow_font,210,200,3,& fleets[fleet_number+2+5]);
    fleet_bar_text16=write_int(yellow_font,210,240,3,& fleets[fleet_number+3+5]);
    fleet_bar_text17=write_int(yellow_font,210,280,3,& fleets[fleet_number+4+5]);
    fleet_bar_text18=write_int(yellow_font,210,320,3,& fleets[fleet_number+5+5]);
    fleet_bar_text19=write_int(yellow_font,210,360,3,& fleets[fleet_number+6+5]);
    fleet_bar_text20=write_int(yellow_font,210,400,3,& fleets[fleet_number+7+5]);
    fleet_bar_text21=write_int(yellow_font,210,440,3,& fleets[fleet_number+8+5]);
    fleet_bar_text22=write_int(yellow_font,210,480,3,& fleets[fleet_number+9+5]);

    health_bar(1);
    health_bar(2);
    health_bar(3);
    health_bar(4);
    health_bar(5);
    health_bar(6);
    health_bar(7);
    health_bar(8);
    health_bar(9);
    health_bar(10);
    health_bar_surround(1);
    health_bar_surround(2);
    health_bar_surround(3);
    health_bar_surround(4);
    health_bar_surround(5);
    health_bar_surround(6);
    health_bar_surround(7);
    health_bar_surround(8);
    health_bar_surround(9);
    health_bar_surround(10);

    FRAME;
        WHILE(region3_open==TRUE AND region3_using==region_using_fleet);

        IF(region4_open==FALSE AND fleets[fleet_number+5]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>100 AND mouse.y<140 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+1]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>140 AND mouse.y<180 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+1);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+2]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>180 AND mouse.y<220 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+2);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+3]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>220 AND mouse.y<260 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+3);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+4]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>260 AND mouse.y<300 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+4);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+5]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>300 AND mouse.y<340 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+5);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+6]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>340 AND mouse.y<380 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+6);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+7]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>380 AND mouse.y<420 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+7);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+8]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>420 AND mouse.y<460 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+8);
        END

        IF(region4_open==FALSE AND fleets[fleet_number+5+9]>0 AND  mouse.x>200 AND mouse.x<550 AND mouse.y>460 AND mouse.y<500 AND mouse.left)
        region4_open=TRUE;
        move_ships_to_fleet(fleet_number,5+9);
        END

        IF(region4_open==FALSE AND mouse.x>405 AND mouse.x<609 AND mouse.y>500 AND mouse.y<534 AND mouse.left)
        WHILE(mouse.left==1);
            FRAME;
        END
        move_fleet_to_port=fleet_number;
        region3_open=FALSE;
        region3_using=0;
        channel3=sound(s_007,player1[16],256);
        END

        IF(region4_open==FALSE AND mouse.x>405 AND mouse.x<609 AND mouse.y>535 AND mouse.y<569 AND mouse.left)
        WHILE(mouse.left==1);
            FRAME;
        END
        move_fleet=fleet_number;
        region3_open=FALSE;
        region3_using=0;
        channel3=sound(s_007,player1[16],256);
        END
        FRAME;
    END
    space_screen=TRUE;
    signal(TYPE health_bar,s_kill);
    signal(TYPE health_bar_surround,s_kill);
    delete_text(fleet_bar_text1);
    delete_text(fleet_bar_text2);
    delete_text(fleet_bar_text3);
    delete_text(fleet_bar_text4);
    delete_text(fleet_bar_text5);
    delete_text(fleet_bar_text6);
    delete_text(fleet_bar_text7);
    delete_text(fleet_bar_text8);
    delete_text(fleet_bar_text9);
    delete_text(fleet_bar_text10);
    delete_text(fleet_bar_text11);
    delete_text(fleet_bar_text12);
    delete_text(fleet_bar_text13);
    delete_text(fleet_bar_text14);
    delete_text(fleet_bar_text15);
    delete_text(fleet_bar_text16);
    delete_text(fleet_bar_text17);
    delete_text(fleet_bar_text18);
    delete_text(fleet_bar_text19);
    delete_text(fleet_bar_text20);
    delete_text(fleet_bar_text21);
    delete_text(fleet_bar_text22);
    delete_text(fleet_bar_text23);
    delete_text(fleet_bar_text24);
    delete_text(fleet_bar_text25);
    delete_text(fleet_bar_text26);
END

//-----------------------------------------------------------------------------


PROCESS health_bar_surround(bar);

BEGIN
    file=main_file;
    graph=52;
    region=3;
    x=490;
    IF(bar==1) y=120; END
    IF(bar==2) y=160; END
    IF(bar==3) y=200; END
    IF(bar==4) y=240; END
    IF(bar==5) y=280; END
    IF(bar==6) y=320; END
    IF(bar==7) y=360; END
    IF(bar==8) y=400; END
    IF(bar==9) y=440; END
    IF(bar==10) y=480; END
    z=-150;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS health_bar(bar);

BEGIN
    file=main_file;
    graph=53;
    IF(bar==1) region=11; END
    IF(bar==2) region=12; END
    IF(bar==3) region=13; END
    IF(bar==4) region=14; END
    IF(bar==5) region=15; END
    IF(bar==6) region=16; END
    IF(bar==7) region=17; END
    IF(bar==8) region=18; END
    IF(bar==9) region=19; END
    IF(bar==10) region=20; END
    x=490;
    IF(bar==1) y=120; END
    IF(bar==2) y=160; END
    IF(bar==3) y=200; END
    IF(bar==4) y=240; END
    IF(bar==5) y=280; END
    IF(bar==6) y=320; END
    IF(bar==7) y=360; END
    IF(bar==8) y=400; END
    IF(bar==9) y=440; END
    IF(bar==10) y=480; END
    z=-160;
    LOOP
    IF(bar==1) define_region(11,440,111,fleets[fleet_number+15],18); END
    IF(bar==2) define_region(12,440,151,fleets[fleet_number+15+1],18); END
    IF(bar==3) define_region(13,440,191,fleets[fleet_number+15+2],18); END
    IF(bar==4) define_region(14,440,231,fleets[fleet_number+15+3],18); END
    IF(bar==5) define_region(15,440,271,fleets[fleet_number+15+4],18); END
    IF(bar==6) define_region(16,440,311,fleets[fleet_number+15+5],18); END
    IF(bar==7) define_region(17,440,351,fleets[fleet_number+15+6],18); END
    IF(bar==8) define_region(18,440,391,fleets[fleet_number+15+7],18); END
    IF(bar==9) define_region(19,440,431,fleets[fleet_number+15+8],18); END
    IF(bar==10) define_region(20,440,471,fleets[fleet_number+15+9],18); END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS move_ships_to_fleet(fleet_numb,ships_to_move);

BEGIN
    WHILE(mouse.left);
        FRAME;
    END
    channel3=sound(s_007,player1[16],256);
    file=main_file;
    graph=17;
    x=405;
    y=300;
    z=-510;
    region=4;
    FRAME;
        WHILE(region4_open==TRUE);
            IF(fleet_numb<>0 AND  mouse.x>200 AND mouse.x<405 AND mouse.y>283 AND mouse.y<317 AND mouse.left) fleets[0+ships_to_move]+=fleets[fleet_numb+ships_to_move]; fleets[fleet_numb+ships_to_move]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256);  END
            IF(fleet_numb<>30 AND  mouse.x>200 AND mouse.x<405 AND mouse.y>317 AND mouse.y<351 AND mouse.left) fleets[30+ships_to_move]+=fleets[fleet_numb+ships_to_move]; fleets[fleet_numb+ships_to_move]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256); END
            IF(fleet_numb<>60 AND  mouse.x>405 AND mouse.x<609 AND mouse.y>283 AND mouse.y<317 AND mouse.left) fleets[60+ships_to_move]+=fleets[fleet_numb+ships_to_move]; fleets[fleet_numb+ships_to_move]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256);  END
            IF(fleet_numb<>90 AND  mouse.x>405 AND mouse.x<609 AND mouse.y>317 AND mouse.y<351 AND mouse.left) fleets[90+ships_to_move]+=fleets[fleet_numb+ships_to_move]; fleets[fleet_numb+ships_to_move]=0; WHILE(mouse.left); FRAME; END region4_open=FALSE;  channel3=sound(s_007,player1[16],256); END
            IF(fleet_numb==0 AND  mouse.x>200 AND mouse.x<405 AND mouse.y>283 AND mouse.y<317 AND mouse.left) WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256);  END
            IF(fleet_numb==30 AND  mouse.x>200 AND mouse.x<405 AND mouse.y>317 AND mouse.y<351 AND mouse.left) WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256); END
            IF(fleet_numb==60 AND  mouse.x>405 AND mouse.x<609 AND mouse.y>283 AND mouse.y<317 AND mouse.left) WHILE(mouse.left); FRAME; END region4_open=FALSE; channel3=sound(s_007,player1[16],256);  END
            IF(fleet_numb==90 AND  mouse.x>405 AND mouse.x<609 AND mouse.y>317 AND mouse.y<351 AND mouse.left) WHILE(mouse.left); FRAME; END region4_open=FALSE;  channel3=sound(s_007,player1[16],256); END
          FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS technology_bar();

PRIVATE
    technology_bar_text1;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    technology_bar_text1=write(main_font,403,48,4,"TECHNOLOGY");
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==70);
        FRAME;
    END
    space_screen=TRUE;
    delete_text(technology_bar_text1);
END

//-----------------------------------------------------------------------------

PROCESS enemy_bar();

PRIVATE
    enemy_bar_text1;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    enemy_bar_text1=write(main_font,403,48,4,"ENEMY");
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==80);
        FRAME;
    END
    space_screen=TRUE;
    delete_text(enemy_bar_text1);
END

//-----------------------------------------------------------------------------

PROCESS log_bar();

PRIVATE
    log_bar_text1;
    log_bar_text2;
    log_bar_text3;
    log_bar_text4;
    log_bar_text5;
    log_bar_text6;
    log_bar_text7;
    log_bar_text8;
    log_bar_text9;
    log_bar_text10;
    log_bar_text11;
    log_bar_text12;
    log_bar_text13;


BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    log_bar_text1=write(main_font,403,48,4,"LOG");
    log_bullet_point(main_file,bullet_point_messages[player1[1]],0,230,110);
    log_bar_text2=write(main_font,265,100,3,players[player1[1]]);
    log_bar_text3=write(main_font,265,120,3,messages[player1[2]]);
    log_bullet_point(main_file,bullet_point_messages[player1[3]],0,230,170);
    log_bar_text4=write(main_font,265,160,3,players[player1[3]]);
    log_bar_text5=write(main_font,265,180,3,messages[player1[4]]);
    log_bullet_point(main_file,bullet_point_messages[player1[5]],0,230,230);
    log_bar_text6=write(main_font,265,220,3,players[player1[5]]);
    log_bar_text7=write(main_font,265,240,3,messages[player1[6]]);
    log_bullet_point(main_file,bullet_point_messages[player1[7]],0,230,290);
    log_bar_text8=write(main_font,265,280,3,players[player1[7]]);
    log_bar_text9=write(main_font,265,300,3,messages[player1[8]]);
    log_bullet_point(main_file,bullet_point_messages[player1[9]],0,230,350);
    log_bar_text10=write(main_font,265,340,3,players[player1[9]]);
    log_bar_text11=write(main_font,265,360,3,messages[player1[10]]);
    log_bullet_point(main_file,bullet_point_messages[player1[11]],0,230,410);
    log_bar_text12=write(main_font,265,400,3,players[player1[11]]);
    log_bar_text13=write(main_font,265,420,3,messages[player1[12]]);
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==90);
        FRAME;
    END
    space_screen=TRUE;
    signal(TYPE log_bullet_point,s_kill);
    delete_text(log_bar_text1);
    delete_text(log_bar_text2);
    delete_text(log_bar_text3);
    delete_text(log_bar_text4);
    delete_text(log_bar_text5);
    delete_text(log_bar_text6);
    delete_text(log_bar_text7);
    delete_text(log_bar_text8);
    delete_text(log_bar_text9);
    delete_text(log_bar_text10);
    delete_text(log_bar_text11);
    delete_text(log_bar_text12);
    delete_text(log_bar_text13);
END

//-----------------------------------------------------------------------------

PROCESS options_bar();

PRIVATE
    options_bar_text1;
    options_bar_text2;
    options_bar_text3;
    options_bar_text4;
    options_bar_text5;
    options_bar_text6;
    options_bar_text7;
    options_bar_text9;
    options_bar_text10;
    options_bar_text11;
    options_bar_text12;
    options_bar_text13;
    options_bar_text14;
    options_bar_text15;
    options_bar_text16;
    options_bar_text17;
    options_bar_text18;
    options_bar_text19;
    options_bar_text20;
    options_bar_text21;
    options_bar_text22;
    options_bar_text23;
    options_bar_text24;
    options_bar_text25;
    options_bar_text26;
    options_bar_text27;
    options_bar_text28;
    options_bar_text29;
    options_bar_text30;
    options_bar_text31;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    file=main_file;
    graph=50;
    x=403;
    y=170;
    z=-150;
    region=3;

    music_volume_bar();
    effects_volume_bar_surround();
    effects_volume_bar();

    options_bar_text1=write(main_font,403,48,4,"OPTIONS");
    options_bar_text5=write(main_font,403,80,4,"MUSIC");
    options_bar_text6=write(main_font,403,100,4,music_track[player1[15]]);
    options_bar_text2=write(main_font,403,140,4,"MUSIC VOLUME");
    options_bar_text7=write(main_font,403,200,4,"EFFECTS VOLUME");
    options_bar_text3=write(main_font,403,280,4,"AUTO BAR OPEN");
    options_bar_text9=write(main_font,403,340,4,"SPACE GRID");

    options_bar_text14=write(yellow_font,244,510,3,letters[player1[22]]);
    options_bar_text15=write(yellow_font,244+18,510,3,letters[player1[23]]);
    options_bar_text16=write(yellow_font,244+36,510,3,letters[player1[24]]);
    options_bar_text17=write(yellow_font,244+54,510,3,letters[player1[25]]);
    options_bar_text18=write(yellow_font,244+72,510,3,letters[player1[26]]);
    options_bar_text19=write(yellow_font,244+90,510,3,letters[player1[27]]);
    options_bar_text20=write(yellow_font,244+108,510,3,letters[player1[28]]);
    options_bar_text21=write(yellow_font,244+126,510,3,letters[player1[29]]);
    options_bar_text22=write(yellow_font,244+144,510,3,letters[player1[30]]);
    options_bar_text23=write(yellow_font,244+162,510,3,letters[player1[31]]);
    options_bar_text24=write(yellow_font,244+180,510,3,letters[player1[32]]);
    options_bar_text25=write(yellow_font,244+198,510,3,letters[player1[33]]);
    options_bar_text26=write(yellow_font,244+216,510,3,letters[player1[34]]);
    options_bar_text27=write(yellow_font,244+234,510,3,letters[player1[35]]);
    options_bar_text28=write(yellow_font,244+252,510,3,letters[player1[36]]);
    options_bar_text29=write(yellow_font,244+270,510,3,letters[player1[37]]);
    options_bar_text30=write(yellow_font,244+288,510,3,letters[player1[38]]);
    options_bar_text31=write(yellow_font,244+306,510,3,letters[player1[39]]);

    options_bar_text11=write(yellow_font,403,530,4,"YOU HAVE BEEN ON THIS GAME");
    options_bar_text12=write_int(yellow_font,398,550,5,& player1[20]);
    options_bar_text13=write(yellow_font,408,550,3,"TIMES");
    IF(player1[13]==TRUE); options_bar_text4=write(main_font,403,300,4,"ON"); END
    IF(player1[13]==FALSE); options_bar_text4=write(main_font,403,300,4,"OFF"); END
    IF(player1[17]==TRUE); options_bar_text10=write(main_font,403,360,4,"ON"); END
    IF(player1[17]==FALSE); options_bar_text10=write(main_font,403,360,4,"OFF"); END
    options_arrows(21,300,75);
    options_arrows(22,505,75);
    options_arrows(21,300,135);
    options_arrows(22,505,135);
    options_arrows(21,300,195);
    options_arrows(22,505,195);
    options_arrows(21,300,275);
    options_arrows(22,505,275);
    options_arrows(21,300,335);
    options_arrows(22,505,335);
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==100);
        IF(mouse.x>290 AND mouse.x<310 AND mouse.y>65 AND mouse.y<85 AND mouse.left)
        channel3=sound(s_007,player1[16],256);
        player1[15]-=1;
        IF(player1[15]<1) player1[15]=6; END
        delete_text(options_bar_text6);
        options_bar_text6=write(main_font,403,100,4,music_track[player1[15]]);
        WHILE(mouse.left);
            FRAME;
            END
        END

        IF(mouse.x>495 AND mouse.x<515 AND mouse.y>65 AND mouse.y<85 AND mouse.left)
        channel3=sound(s_007,player1[16],256);
        player1[15]+=1;
        IF(player1[15]>6) player1[15]=1; END
        delete_text(options_bar_text6);
        options_bar_text6=write(main_font,403,100,4,music_track[player1[15]]);
        WHILE(mouse.left);
            FRAME;
            END
        END

        IF(player1[13]==FALSE AND mouse.x>495 AND mouse.x<515 AND mouse.y>275 AND mouse.y<295 AND mouse.left)
        channel3=sound(s_007,player1[16],256);
            player1[13]=TRUE;
            delete_text(options_bar_text4);
            options_bar_text4=write(main_font,403,300,4,"ON");
        END
        IF(player1[13]==TRUE AND mouse.x>290 AND mouse.x<310 AND mouse.y>275 AND mouse.y<295 AND mouse.left)
        channel3=sound(s_007,player1[16],256);
            player1[13]=FALSE;
            delete_text(options_bar_text4);
            options_bar_text4=write(main_font,403,300,4,"OFF");
        END

        IF(player1[17]==FALSE AND mouse.x>495 AND mouse.x<515 AND mouse.y>335 AND mouse.y<355 AND mouse.left)
        channel3=sound(s_007,player1[16],256);
            player1[17]=TRUE;
            delete_text(options_bar_text10);
            options_bar_text10=write(main_font,403,360,4,"ON");
        END
        IF(player1[17]==TRUE AND mouse.x>290 AND mouse.x<310 AND mouse.y>335 AND mouse.y<355 AND mouse.left)
        channel3=sound(s_007,player1[16],256);
            player1[17]=FALSE;
            delete_text(options_bar_text10);
            options_bar_text10=write(main_font,403,360,4,"OFF");
        END
        FRAME;
    END
    space_screen=TRUE;
    signal(TYPE options_arrows,s_kill);
    signal(TYPE music_volume_bar,s_kill);
    signal(TYPE effects_volume_bar_surround,s_kill);
    signal(TYPE effects_volume_bar,s_kill);
    delete_text(options_bar_text1);
    delete_text(options_bar_text2);
    delete_text(options_bar_text3);
    delete_text(options_bar_text4);
    delete_text(options_bar_text5);
    delete_text(options_bar_text6);
    delete_text(options_bar_text7);
    delete_text(options_bar_text9);
    delete_text(options_bar_text10);
    delete_text(options_bar_text11);
    delete_text(options_bar_text12);
    delete_text(options_bar_text13);
    delete_text(options_bar_text14);
    delete_text(options_bar_text15);
    delete_text(options_bar_text16);
    delete_text(options_bar_text17);
    delete_text(options_bar_text18);
    delete_text(options_bar_text19);
    delete_text(options_bar_text20);
    delete_text(options_bar_text21);
    delete_text(options_bar_text22);
    delete_text(options_bar_text23);
    delete_text(options_bar_text24);
    delete_text(options_bar_text25);
    delete_text(options_bar_text26);
    delete_text(options_bar_text27);
    delete_text(options_bar_text28);
    delete_text(options_bar_text29);
    delete_text(options_bar_text30);
    delete_text(options_bar_text31);
END

//-----------------------------------------------------------------------------

PROCESS music_volume_bar();

BEGIN
    file=main_file;
    graph=51;
    region=4;
    x=403;
    y=170;
    z=-160;
    LOOP
    define_region(4,228,161,player1[14]*14/10,18);
    IF(player1[14]>0 AND mouse.x>290 AND mouse.x<310 AND mouse.y>130 AND mouse.y<150 AND mouse.left) player1[14]-=10; change_sound(channel1,player1[14],256); change_sound(channel2,player1[14],256); END
    IF(player1[14]<250 AND mouse.x>495 AND mouse.x<515 AND mouse.y>130 AND mouse.y<150 AND mouse.left) player1[14]+=10; change_sound(channel1,player1[14],256);  change_sound(channel2,player1[14],256);  END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS effects_volume_bar_surround();

BEGIN
    file=main_file;
    graph=50;
    x=403;
    y=230;
    z=-150;
    region=3;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS effects_volume_bar();

BEGIN
    file=main_file;
    graph=51;
    region=5;
    x=403;
    y=230;
    z=-160;
    LOOP
    define_region(5,228,221,player1[16]*14/10,18);
    IF(player1[16]>0 AND mouse.x>290 AND mouse.x<310 AND mouse.y>190 AND mouse.y<210 AND mouse.left) player1[16]-=10; change_sound(channel3,player1[16],256); END
    IF(player1[16]<250 AND mouse.x>495 AND mouse.x<515 AND mouse.y>190 AND mouse.y<210 AND mouse.left) player1[16]+=10; change_sound(channel3,player1[16],256); END
    FRAME;
    END
END

//-----------------------------------------------------------------------------



PROCESS options_arrows(graph,x,y);

BEGIN
    file=main_file;
    z=-160;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS exit_bar();

PRIVATE
    exit_bar_text1;
    exit_bar_text2;
    exit_bar_text3;
    exit_bar_text4;
    exit_bar_text5;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    exit_bar_text1=write(main_font,403,48,4,"EXIT");
    exit_bar_text2=write(red_font,403,260,4,"ARE YOU SURE YOU WANT TO QUIT?");
    exit_bar_text5=write(red_font,403,280,4,"(IT WILL AUTOMATICALLY SAVE)");
    exit_bar_text3=write(red_font,393,320,5,"NO");
    exit_bar_text4=write(red_font,413,320,3,"YES");
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==120);
        IF(mouse.left AND mouse.x<403 AND mouse.x>200 AND mouse.y>310 AND mouse.y<330) channel3=sound(s_007,player1[16],256); region3_using=0;  region3_open=FALSE; END
        IF(mouse.left AND mouse.x>403 AND mouse.x<607 AND mouse.y>310 AND mouse.y<330) channel3=sound(s_007,player1[16],256);
            save("dat/GC/player1.dat",offset player1,sizeof(player1));
            save("dat/GC/planets.dat",offset planets,sizeof(planets));
            save("dat/GC/fleets.dat",offset fleets,sizeof(fleets));
        new_screen=99; END
        FRAME;
    END
    space_screen=TRUE;
    delete_text(exit_bar_text1);
    delete_text(exit_bar_text2);
    delete_text(exit_bar_text3);
    delete_text(exit_bar_text4);
    delete_text(exit_bar_text5);
END

//-----------------------------------------------------------------------------

PROCESS save_bar();

PRIVATE
    save_bar_text1;
    save_bar_text2;
    save_bar_text3;
    save_bar_text4;
    save_bar_text5;

BEGIN
    space_screen=FALSE;
    region3_open=TRUE;
    region3_used=0;
    region=3;

    save_bar_text1=write(main_font,403,48,4,"SAVE");
    save_bar_text2=write(yellow_font,403,260,4,"ARE YOU SURE YOU WANT TO SAVE?");
    save_bar_text5=write(yellow_font,403,280,4,"(IT WILL SAVE WHEN YOU EXIT)");
    save_bar_text3=write(yellow_font,393,320,5,"NO");
    save_bar_text4=write(yellow_font,413,320,3,"YES");
    FRAME;
        WHILE(region3_open==TRUE AND region3_using==130);
        IF(mouse.left AND mouse.x<403 AND mouse.x>200 AND mouse.y>310 AND mouse.y<330) channel3=sound(s_007,player1[16],256); region3_using=0;  region3_open=FALSE; END
        IF(mouse.left AND mouse.x>403 AND mouse.x<607 AND mouse.y>310 AND mouse.y<330) channel3=sound(s_007,player1[16],256);
            save("dat/GC/player1.dat",offset player1,sizeof(player1));
            save("dat/GC/planets.dat",offset planets,sizeof(planets));
            save("dat/GC/fleets.dat",offset fleets,sizeof(fleets));
        region3_using=0;
        region3_open=FALSE;
        END
        FRAME;
    END
    space_screen=TRUE;
    delete_text(save_bar_text1);
    delete_text(save_bar_text2);
    delete_text(save_bar_text3);
    delete_text(save_bar_text4);
    delete_text(save_bar_text5);
END

//-----------------------------------------------------------------------------

PROCESS planets_bullet_point(file,graph,graph_changing,x,y);

PRIVATE
    origonal_graph;
    animated_bullet;

BEGIN
    origonal_graph=graph;
    animated_bullet=0;
    z=-200;
    LOOP
    IF(graph_changing>0) animated_bullet+=1; END
    IF(animated_bullet>1) graph+=1; animated_bullet=0; END
    IF(graph>origonal_graph+graph_changing) graph=origonal_graph; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS log_bullet_point(file,graph,graph_changing,x,y);

PRIVATE
    origonal_graph;
    animated_bullet;

BEGIN
    origonal_graph=graph;
    animated_bullet=0;
    z=-200;
    LOOP
    IF(graph_changing>0) animated_bullet+=1; END
    IF(animated_bullet>1) graph+=1; animated_bullet=0; END
    IF(graph>origonal_graph+graph_changing) graph=origonal_graph; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS planet(planet_number);

PRIVATE
    origonal_graph;
    graph_changed;
    planet_spin;

BEGIN

    file=space_file;
    graph=planets[planet_number+1];

    z=200;
    origonal_graph=graph;
    planet_spin=0;

    graph_changed=0;
    player_planet(planet_number);

    LOOP
    x=planets[planet_number+2]+scroll_x;
    y=planets[planet_number+3]+scroll_y;
        planet_spin+=1;
        IF(graph_changed==0 AND planets[planet_number+5]=>7000) planets[planet_number+1]=100; graph=100; origonal_graph=100; graph_changed=1; END
        IF(planet_spin>1) graph+=1; planet_spin=0; END
        IF(graph>origonal_graph+8) graph=origonal_graph; END
        IF(space_screen==TRUE AND move_fleet==-10 AND move_fleet_to_port==-10
        AND mouse.x>x-20 AND mouse.x<x+20 AND mouse.y>y-20 AND mouse.y<y+20 AND mouse.left) region3_used=11; region3_using=11; player1_planet_number=planet_number; END

            IF(move_fleet_to_port=>0 AND mouse.left
            AND mouse.x>x-20 AND mouse.x<x+20 AND mouse.y>y-20 AND mouse.y<y+20)
            WHILE(mouse.left==1);
                FRAME;
            END
            fleets[move_fleet_to_port+25]=planets[planet_number+2];
            fleets[move_fleet_to_port+26]=planets[planet_number+3];
            fleets[move_fleet_to_port+4]=6;
            channel3=sound(s_007,player1[16],256);
            move_fleet_to_port=-10;
            mouse.graph=20;
        END

    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player_planet(planet_number);

BEGIN

    file=main_file;
    graph=59+planets[planet_number+4];
    z=190;
    LOOP
    x=planets[planet_number+2]+scroll_x;
    y=planets[planet_number+3]+scroll_y;
    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS fleets_graph(fleets_number);

PRIVATE
    pos_x;
    pos_y;

BEGIN

    file=fleets_file;
    graph=fleets[fleets_number+1];

    z=180;
    player_fleet(fleets_number);

    LOOP
    x=fleets[fleets_number+2]+scroll_x;
    y=fleets[fleets_number+3]+scroll_y;
    angle=fget_angle(fleets[fleets_number+2]+scroll_x,fleets[fleets_number+3]+scroll_y,fleets[fleets_number+25]+scroll_x,fleets[fleets_number+26]+scroll_y);
    IF(fleets[fleets_number+2]==fleets[fleets_number+25] AND fleets[fleets_number+3]== fleets[fleets_number+26])
        IF(fleets[fleets_number+4]==1) fleets[fleets_number+4]=2; END
        IF(fleets[fleets_number+4]==6) fleets[fleets_number+4]=0; END
    END
        advance(2);
        fleets[fleets_number+2]=x-scroll_x;
        fleets[fleets_number+3]=y-scroll_y;

    IF(fleets[fleets_number+4]==0) graph=0; END
    IF(fleets[fleets_number+4]>0) graph=fleets[fleets_number+1]; END

    FRAME;
    END
END

//-----------------------------------------------------------------------------

PROCESS player_fleet(fleets_number);

BEGIN
    file=main_file;
    graph=64;
    z=170;
    LOOP
    x=fleets[fleets_number+2]+scroll_x;
    y=fleets[fleets_number+3]+scroll_y;
    angle=fget_angle(fleets[fleets_number+2]+scroll_x,fleets[fleets_number+3]+scroll_y,fleets[fleets_number+25]+scroll_x,fleets[fleets_number+26]+scroll_y);
    FRAME;
    END
END

//-----------------------------------------------------------------------------
