PROGRAM box_test;

GLOBAL
    screen=1;
    new_screen=0;

    ARCHIVO_WLD = "HELP\WLD_VIEW.WLD";
    ARCHIVO_FPG = "HELP\WLD_VIEW.FPG";

    id1;

BEGIN

    set_mode(m800x600);
    set_fps(40,40);

    load_fpg(ARCHIVO_FPG);
    load_wld(ARCHIVO_WLD,0);

    LOOP
        SWITCH(screen);
            CASE 1: game(); END
        END
    FRAME:
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS game();

BEGIN
    screen=0;
    new_screen=0;
    id1=box(0,4552,8991);
    fade_on();

    LOOP
        IF(key(_esc))
            exit("OWEN GAMES (c) 2002",0);
        END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS box(angle,x,y);

BEGIN
    ctype=c_m8;
    radius=70;
    camera(angle);
    LOOP
        IF(key(_up)) advance(15); END
        IF(key(_down)) advance(-10); END
        IF(key(_left)) angle+=5000; END
        IF(key(_right)) angle-=5000; END

        set_point_m8(491,x+get_distx(angle+45000,91),y+get_disty(angle+45000,91));
        set_point_m8(490,x+get_distx(angle-45000,91),y+get_disty(angle-45000,91));
        set_point_m8(488,x+get_distx(angle+135000,91),y+get_disty(angle+135000,91));
        set_point_m8(489,x+get_distx(angle-135000,91),y+get_disty(angle-135000,91));

    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS camera(angle);

PRIVATE
    floor_height;

BEGIN
    start_mode8(id,0,0);
    ctype=c_m8;
    LOOP
        get_sector_height(m8_sector,OFFSET floor_height,0);
        z=1000+200;
        x=father.x;
        y=father.y;
        IF(key(_z)) angle-=5000; END
        IF(key(_x)) angle+=5000; END
        advance(-500);
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------
