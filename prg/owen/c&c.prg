//-----------------------------------------------------------------------------------------------
//
//  TITLE       Command & Conquer
//  AUTHOR      Owen Davies
//  COPYRITE    Owen Games (c) 2004
//
//-----------------------------------------------------------------------------------------------

PROGRAM Command_And_Conquer;

CONST

GLOBAL
    main_file;
    gdi_file;
    nod_file;
    scenery_file;

    placing_building;
    able_to_place_building;
    mouse_left_pushed;
    game_mouse;
    mouse_over;
    units_selected;
    building_selected;
    multi_select;
    multi_select_x1;
    multi_select_y1;
    multi_select_x2;
    multi_select_y2;
    multi_select_box;
    multi_select_line;
    ready_to_select;
    ready_to_select_x;
    ready_to_select_y;

    map_width;
    map_height;

    game_loaded;

    STRUCT player[0];
        has_construction_yard;
        has_power_plant;
        has_barracs;
        main_barracs;
        deploying_mcv;
    END

    number_of_units;
    STRUCT units[100];
        x;
        y;
        at_f;
        fx;
        fy;
        selected;
        group;
        enemy_to_kill;
        health;
        from_building;
        unit_type;
    END

    number_of_buildings;
    STRUCT buildings[100];
        x;
        y;
        way_point_x;
        way_point_y;
        selected;
        health;
        building_type;
    END

    number_of_enemy_units;
    STRUCT enemy_units[100];
        x;
        y;
        selected;
        health;
    END

    movement_offset;
    movement_offset_x[]=0,-25,-25,25,25, -75,-75,-100,-125,-125, 75,75,100,125,125, -25,25,0,-25,25,   -75,-75,-100,-125,-125, 75,75,100,125,125;
    movement_offset_y[]=0,-25,25,-25,25, -25,25,0,-25,25,        -25,25,0,-25,25,   75,75,100,125,125, 75,125,100,75,125,      75,125,100,75,125;

    close_movement_offset;
    close_movement_offset_x[]=0,-20,-20,20,20, -60,-60,-80,-100,-100, 60,60,80,100,100, -20,20,0,-20,20,   -60,-60,-80,-100,-100, 60,60,80,100,100;
    close_movement_offset_y[]=0,-20,20,-20,20, -20,20,0,-20,20,        -20,20,0,-20,20,   60,60,80,100,100, 60,100,80,60,100,      60,100,80,60,100;

PRIVATE
    game_screen;
    multi_units;
    unit_counter;
    ready_to_unselect;
    drag_screen_x;
    drag_screen_y;
    game_timer;
    ready_to_push;
    units_counter;
BEGIN

    set_mode(m800x600);
    set_fps(30,30);
    load_pal("pal\C&C\palette.pal");

    main_file=load_fpg("fpg\c&c\game.fpg");
    gdi_file=load_fpg("fpg\c&c\gdi.fpg");
    nod_file=load_fpg("fpg\c&c\nod.fpg");
    scenery_file=load_fpg("fpg\c&c\scenery.fpg");

    game_screen=100;

    mouse.file=main_file;
    mouse.graph=100;

    LOOP
        SWITCH (game_screen);

            CASE 1:
                put(main_file,2,400,300);
                fade_on();
                game_timer=0;
                LOOP
                IF(game_timer=>150) BREAK; END
                game_timer+=1;
                FRAME;
                END
                fade_off();
                clear_screen();
                game_screen=2;
            END

            CASE 2:
                put(main_file,1,400,300);
                fade_on();
                game_timer=0;
                LOOP
                IF(game_timer=>90) BREAK; END
                game_timer+=1;
                FRAME;
                END
                fade_off();
                clear_screen();
                game_screen=3;
            END

            CASE 3:
                put(main_file,3,400,300);
                fade_on();
                game_timer=0;
                LOOP
                IF(game_timer=>90) BREAK; END
                game_timer+=1;
                FRAME;
                END
                fade_off();
                clear_screen();
                game_screen=10;
            END

            CASE 10:
                put(main_file,10,400,300);
                fade_on();
                LOOP
                IF(mouse.left) BREAK; END
                FRAME;
                END
                fade_off();
                clear_screen();
                game_screen=100;
            END

            CASE 100:
                bar();

                define_region(1,0,23,600,577);
                define_region(2,610,40,180,180);
                start_scroll(1,scenery_file,1,0,1,15);
                start_scroll(2,scenery_file,1,0,2,15);

                map_width=2000;
                map_height=2000;

                darkness(10);
                darkness(12);

                radar(10);
                radar(11);
                radar(12);
                screen_position();

                gi(1,400,300);
                gi(2,400,350);
                unit_counter=3;

                building(1,1,3,6);

                enemy_unit(1,180,180);

                fade_on();
                LOOP
                    movement_offset=0;
                    //-----------------------------------------------------------------------------/**/
                    //        FUNCTION FOR STOPING LEFT MOUSE BEING HELD DOWN                      /**/
                    /**/ IF(mouse_left_pushed==1) mouse_left_pushed=2; END                         /**/
                    /**/ IF(mouse.left==FALSE) mouse_left_pushed=0; END                            /**/
                    /**/ IF(mouse.left==TRUE AND mouse_left_pushed==0) mouse_left_pushed=1; END    /**/
                    //-----------------------------------------------------------------------------/**/
                    //        WETHER MOUSE IS ON GAME AREA                                         /**/
                    /**/ IF(mouse.x<=600 AND mouse.y>23) game_mouse=1; ELSE game_mouse=0; END      /**/
                    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/
                    //        FUNCTION FOR DRAGING AND SELECTING UINTS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  /**/
                    /**/ IF(ready_to_unselect==FALSE) multi_select=FALSE; END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           /**/
                    /**/ IF(mouse.left AND game_mouse==1 AND ready_to_select==FALSE AND placing_building==FALSE) ready_to_select=TRUE; ready_to_select_x=mouse.x; ready_to_select_y=mouse.y; END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    /**/
                    /**/ IF(ready_to_select==TRUE AND (mouse.x<ready_to_select_x-10 OR mouse.x>ready_to_select_x+10 OR mouse.y<ready_to_select_y-10 OR mouse.y>ready_to_select_y+10) AND multi_select==FALSE) multi_select=TRUE; ready_to_unselect=TRUE; multi_select_x1=scroll[1].x0+ready_to_select_x; multi_select_y1=scroll[1].y0+ready_to_select_y; multi_select_box=draw(3,1,1,1,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); multi_select_line=draw(2,20,15,1,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); END /**/
                    /**/ IF(ready_to_select==TRUE AND mouse.left==FALSE); ready_to_select=FALSE; IF(multi_select==TRUE) ready_to_unselect=FALSE; delete_draw(multi_select_box); delete_draw(multi_select_line); END END                                                                                                                                                                                                                                                                                                                                                                                                                                                 /**/
                    /**/ IF(ready_to_unselect==TRUE) multi_select_x2=scroll[1].x0+mouse.x; multi_select_y2=scroll[1].y0+mouse.y; move_draw(multi_select_box,1,1,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); move_draw(multi_select_line,20,15,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); END                                                                                                                                                                                                                       /**/
                    //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/
                    //              WHAT THE MOUSE IS OVER                                                                                                                                                                                                                                                                        /**/
                    /**/ mouse_over=0;                                                                                                                                                                                                                                                                                            /**/
                    /**/ FROM multi_units=0 TO 100; IF(mouse.x<(units[multi_units].x+20-scroll[1].x0) AND mouse.x>(units[multi_units].x-20-scroll[1].x0) AND mouse.y<(units[multi_units].y+20-scroll[1].y0+23) AND mouse.y>(units[multi_units].y-20-scroll[1].y0+23)) mouse_over=multi_units; END END                             /**/
                    /**/ FROM multi_units=0 TO 100; IF(mouse.x<(enemy_units[multi_units].x+20-scroll[1].x0) AND mouse.x>(enemy_units[multi_units].x-20-scroll[1].x0) AND mouse.y<(enemy_units[multi_units].y+20-scroll[1].y0+23) AND mouse.y>(enemy_units[multi_units].y-20-scroll[1].y0+23)) mouse_over=multi_units+100; END END /**/
                    /**/ FROM multi_units=0 TO 20;
                        IF(buildings[multi_units].building_type==1 AND mouse.x<(buildings[multi_units].x+90-scroll[1].x0) AND mouse.x>(buildings[multi_units].x-90-scroll[1].x0) AND mouse.y<(buildings[multi_units].y+36-scroll[1].y0+23) AND mouse.y>(buildings[multi_units].y-108-scroll[1].y0+23)) mouse_over=multi_units+200; END
                        IF(buildings[multi_units].building_type==2 AND mouse.x<(buildings[multi_units].x+60-scroll[1].x0) AND mouse.x>(buildings[multi_units].x-60-scroll[1].x0) AND mouse.y<(buildings[multi_units].y+36-scroll[1].y0+23) AND mouse.y>(buildings[multi_units].y-108-scroll[1].y0+23)) mouse_over=multi_units+200; END
                        IF(buildings[multi_units].building_type==3 AND mouse.x<(buildings[multi_units].x+60-scroll[1].x0) AND mouse.x>(buildings[multi_units].x-60-scroll[1].x0) AND mouse.y<(buildings[multi_units].y+36-scroll[1].y0+23) AND mouse.y>(buildings[multi_units].y-108-scroll[1].y0+23)) mouse_over=multi_units+200; END
                        END
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/
                    //              WHAT THE MOUSE IS OVER GRAPH                                                                                             /**/
                    /**/                                                                                                                                     /**/
                    /**/ IF(game_mouse==TRUE);                                                                                                               /**/
                    /**/     IF(map_get_pixel(scenery_file,11,(mouse.x+scroll[1].x0)/68,(mouse.y+scroll[1].y0-23)/68)==6) mouse.graph=110; ELSE mouse.graph=107; END  /**/
                    /**/     IF(units_selected==0 AND (building_selected==0 OR key(_alt)==FALSE)) mouse.graph=100; END                                                                                        /**/
                    /**/     IF(map_get_pixel(scenery_file,11,(mouse.x+scroll[1].x0)/68,(mouse.y+scroll[1].y0-23)/68)==151) mouse.graph=111; END                  /**/
                    /**/     IF(map_get_pixel(scenery_file,10,(mouse.x+scroll[1].x0)/21,(mouse.y+scroll[1].y0-23)/21)==0)                                        /**/
                    /**/         IF(units_selected>0)                                                                                                        /**/
                    /**/             IF(mouse_over=>1 AND mouse_over=<100) IF(units[mouse_over].selected==FALSE) mouse.graph=111; ELSE mouse.graph=100; END END /**/
                    /**/             IF(mouse_over=>101 AND mouse_over=<200) mouse.graph=108; END                                                             /**/
                    /**/                                                                                                                                      /**/
                    /**/             ELSE                                                                                                                    /**/
                    /**/                                                                                                                                     /**/
                    /**/             IF(mouse_over=>1 AND mouse_over=<200) mouse.graph=111; END                                                               /**/
                    /**/         END

                    /**/     END                                                                                                                             /**/
                             IF(building_selected>200) IF(buildings[building_selected-200].building_type==3) IF(mouse_over==building_selected) mouse.graph=115; END ELSE IF(mouse_over==building_selected) mouse.graph=100; END END END
                    /**/     IF(placing_building==TRUE) mouse.graph=100; END
                    /**/                                                                                                                                     /**/
                    /**/     ELSE                                                                                                                            /**/
                    /**/                                                                                                                                     /**/
                    /**/     mouse.graph=100;                                                                                                                  /**/
                    /**/ END                                                                                                                                 /**/
                    /**/                                                                                                                                     /**/
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/
                    //        FUNCTION FOR SCROLLING ROUND THE MAP                                                                                                                                                          /**/
                    /**/ IF(mouse.x=<20 AND mouse.y=>20 AND mouse.y=<580) scroll[1].x0-=15; IF(scroll[1].x0<=10) mouse.graph=104; ELSE mouse.graph=101; END mouse.flags=0; END                                                /**/
                    /**/ IF(mouse.x=>780 AND mouse.y=>20 AND mouse.y=<580) scroll[1].x0+=15; IF(scroll[1].x0>=map_width-610) mouse.graph=104; ELSE mouse.graph=101; END mouse.flags=1; END                                    /**/
                    /**/ IF(mouse.y=<20 AND mouse.x=>20 AND mouse.x<=780) scroll[1].y0-=15; IF(scroll[1].y0<=10) mouse.graph=105; ELSE mouse.graph=102; END mouse.flags=0; END                                                /**/
                    /**/ IF(mouse.y=>580 AND mouse.x=>20 AND mouse.x<=780) scroll[1].y0+=15; IF(scroll[1].y0>=map_height-610) mouse.graph=105; ELSE mouse.graph=102; END mouse.flags=2; END                                   /**/
                    /**/ IF(mouse.x=<20 AND mouse.y=<20) scroll[1].x0-=15; scroll[1].y0-=15; IF(scroll[1].x0<=10 AND scroll[1].y0<=10) mouse.graph=106; ELSE mouse.graph=103; END mouse.flags=2; END                          /**/
                    /**/ IF(mouse.x=>780 AND mouse.y=<20) scroll[1].x0+=15; scroll[1].y0-=15; IF(scroll[1].x0>=map_width-610 AND scroll[1].y0=<10) mouse.graph=106; ELSE mouse.graph=103; END mouse.flags=3; END              /**/
                    /**/ IF(mouse.x=<20 AND mouse.y=>580) scroll[1].x0-=15; scroll[1].y0+=15; IF(scroll[1].x0=<10 AND scroll[1].y0>=map_height-610) mouse.graph=106; ELSE mouse.graph=103; END mouse.flags=0; END             /**/
                    /**/ IF(mouse.x=>780 AND mouse.y>=580) scroll[1].x0+=15; scroll[1].y0+=15; IF(scroll[1].x0=>map_width-610 AND scroll[1].y0>=map_height-610) mouse.graph=106; ELSE mouse.graph=103; END mouse.flags=1; END /**/
                    /**/ IF(mouse.x>20 AND mouse.x<780 AND mouse.y>20 AND mouse.y<580 AND mouse.flags<>0) mouse.flags=0; END                                                                                                /**/
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/
                    //              LIMITS FOR MOUSE                                       /**/
                    /**/ IF(mouse.x=<20) mouse.x=20; END                                   /**/
                    /**/ IF(mouse.x=>780) mouse.x=780; END                                 /**/
                    /**/ IF(mouse.y=<20) mouse.y=20; END                                   /**/
                    /**/ IF(mouse.y=>580) mouse.y=580; END                                 /**/
                    //---------------------------------------------------------------------/**/
                    //              LIMITS FOR SCROLL                                      /**/
                    /**/ IF(scroll[1].x0<=0) scroll[1].x0=0; END                           /**/
                    /**/ IF(scroll[1].y0<=0) scroll[1].y0=0; END                           /**/
                    /**/ IF(scroll[1].x0=>map_width-600) scroll[1].x0=map_width-600; END   /**/
                    /**/ IF(scroll[1].y0=>map_height-577) scroll[1].y0=map_height-577; END /**/
                    //---------------------------------------------------------------------/**/

                    IF(mouse.left AND mouse.x>610 AND mouse.x<790 AND mouse.y>40 AND mouse.y<220 AND units_selected==FALSE); scroll[1].x0=drag_screen_x; scroll[1].y0=drag_screen_y;  drag_screen_x=((mouse.x-610)*11)-300; drag_screen_y=((mouse.y-40)*11)-300; IF(((mouse.x-610)*11)-300<0) drag_screen_x=0; END IF(((mouse.x-610)*11)-300>map_width) drag_screen_x=map_width-600; END IF(((mouse.y-40)*11)-300<0) drag_screen_y=0; END IF(((mouse.y-40)*11)-300>map_height) drag_screen_y=map_height-600; END END

                    IF(mouse.left==TRUE AND mouse_left_pushed<2 AND ready_to_push==FALSE) ready_to_push=TRUE; END
                    IF(mouse.left==FALSE AND ready_to_push==TRUE)
                        IF(player[0].has_construction_yard==TRUE AND mouse.x>627 AND mouse.x<706 AND mouse.y>277 AND mouse.y<346) building_placer(2); END
                        IF(player[0].has_construction_yard==TRUE AND player[0].has_power_plant==TRUE AND mouse.x>627 AND mouse.x<706 AND mouse.y>350 AND mouse.y<419) building_placer(3); END
                        IF(player[0].has_barracs==TRUE AND mouse.x>714 AND mouse.x<793 AND mouse.y>277 AND mouse.y<346)
                            gi(unit_counter,buildings[player[0].main_barracs].x,buildings[player[0].main_barracs].y-30);
                            close_movement_offset=0;
                            FROM units_counter=1 TO 100; IF(units_counter<>unit_counter AND units[units_counter].fx==buildings[player[0].main_barracs].way_point_x+close_movement_offset_x[close_movement_offset] AND units[units_counter].fy==buildings[player[0].main_barracs].way_point_y+close_movement_offset_y[close_movement_offset]) close_movement_offset+=1; END END
                            units[unit_counter].fx=buildings[player[0].main_barracs].way_point_x+close_movement_offset_x[close_movement_offset];
                            units[unit_counter].fy=buildings[player[0].main_barracs].way_point_y+close_movement_offset_y[close_movement_offset];
                            unit_counter+=1;
                        END
                        ready_to_push=FALSE;
                    END

                FRAME;
                END
            END

        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS object(file,graph,x,y,z);

BEGIN
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS bar();

BEGIN
    object(main_file,50,700,300,0);
    object(main_file,51,300,11,0);
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS darkness(graph);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=scenery_file;
    size=2000;
    x=1000;
    y=1000;
    z=-200;
    IF(graph==12) flags=4; END
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS darkness_revealed(x,y);

PRIVATE
    sequence_x;
    sequence_y;

BEGIN
    FROM sequence_x=-7 TO 7;
        IF(sqrt(sequence_x*sequence_x)==0) FROM sequence_y=-7 TO 7; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==1) FROM sequence_y=-7 TO 7; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==2) FROM sequence_y=-6 TO 6; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==3) FROM sequence_y=-6 TO 6; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==4) FROM sequence_y=-5 TO 5; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==5) FROM sequence_y=-5 TO 5; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==6) FROM sequence_y=-3 TO 3; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==7) FROM sequence_y=-1 TO 1; map_put_pixel(scenery_file,10,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
    END

    FROM sequence_x=-6 TO 6;
        IF(sqrt(sequence_x*sequence_x)==0) FROM sequence_y=-6 TO 6; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==1) FROM sequence_y=-6 TO 6; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==2) FROM sequence_y=-5 TO 5; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==3) FROM sequence_y=-5 TO 5; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==4) FROM sequence_y=-4 TO 4; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==5) FROM sequence_y=-3 TO 3; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==6) FROM sequence_y=-1 TO 1; map_put_pixel(scenery_file,12,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS radar(graph);

BEGIN
    IF(graph==10 OR graph==12)
        file=scenery_file;
        x=700;
        y=130;
        size=180;
        IF(graph==12) flags=4; END
    END
    IF(graph==11)
        file=scenery_file;
        x=908;
        y=340;
        size=600;
    END
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS screen_position();

BEGIN
    file=main_file;
    graph=109;
    LOOP
       x=(scroll[1].x0/11)+637;
       y=(scroll[1].y0/11)+67;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS targeter()

PRIVATE
    targeter_x;
    targeter_y;

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=210;
    flags=4;
    targeter_x=mouse.x+scroll[1].x0;
    targeter_y=mouse.y+scroll[1].y0-23;
    z=-256;
    LOOP
        IF(graph=>214) BREAK; END
        x=targeter_x;
        y=targeter_y;
        graph+=1;
    FRAME(250);
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS gi(number,x,y);

PRIVATE
    confidence;
    STRUCT path_find_points[20];
        x,
        y,
    END
    ready_to_select_unit;
    id_destination_line;
    id_view_circle;
    circle_around;
    number_ajustment_x;
    number_ajustment_y;
    darkness_counter;
    path_find_accuracy;
    units_counter;
BEGIN
    number_of_units+=1;
    ctype=c_scroll;
    cnumber=c_1;
    z=-100;
    confidence=rand(100,150);

    file=gdi_file;
    units[number].unit_type=1;
    graph=1;

    IF(game_loaded==FALSE);
        darkness_revealed(x,y);
        units[number].selected=FALSE;
        units[number].x=x;
        units[number].y=y;
        units[number].fx=x;
        units[number].fy=y;
        units[number].selected=FALSE;
        units[number].group=0;
        units[number].enemy_to_kill=0;
        units[number].health=6;
        units[number].from_building=TRUE;
    END
    unit_radar(number);

    WHILE(units[number].health>0);
        IF(units[number].from_building==TRUE AND map_get_pixel(scenery_file,11,units[number].x/20,units[number].y/20)==0) units[number].from_building=FALSE; END
        IF(units_selected>5) path_find_accuracy=0; ELSE path_find_accuracy=1; END
        //          WHEN LEFT MOUSE IS CLICKED THEN REALEASED
        IF(placing_building==FALSE AND mouse.left==TRUE AND game_mouse==1 AND mouse_left_pushed<2 AND ready_to_select_unit==FALSE) ready_to_select_unit=TRUE; END
        IF(mouse.left==FALSE AND ready_to_select_unit==TRUE)
            ready_to_select_unit=FALSE;
            IF(multi_select==FALSE)
                // WHEN UNIT IS CLICKED DESTINATION LINE IS DRAWN
                IF(id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END
                // IF UNIT SELECTED AND MOUSE NOT OVER OSOMETHING ELSE, UNIT SENT TO MOUSE
                IF(units[number].selected==TRUE AND mouse_over==0);
                    units[number].enemy_to_kill=0;
                    IF(units_selected>1)
                        number_ajustment_x=movement_offset_x[movement_offset];
                        number_ajustment_y=movement_offset_y[movement_offset];
                        movement_offset+=1;
                        ELSE
                        number_ajustment_x=0; number_ajustment_y=0;
                    END
                    IF(path_free(scenery_file,11,20,mouse.x+scroll[1].x0+number_ajustment_x,mouse.y+scroll[1].y0-23+number_ajustment_y))
                        units[number].fx=mouse.x+scroll[1].x0+number_ajustment_x; units[number].fy=mouse.y-23+scroll[1].y0+number_ajustment_y; targeter();
                    END
                END
                // IF ENEMY IS CLICKED UNIT F IS ENEMY
                IF(units[number].selected==TRUE AND mouse_over AND mouse_over=>101 AND mouse_over=<200);
                    units[number].enemy_to_kill=mouse_over-100; targeter();
                    units[number].fx=mouse.x+scroll[1].x0; units[number].fy=mouse.y-23+scroll[1].y0;
                END

                IF(key(_l_shift)==FALSE)
                    IF(mouse_over==number AND units[number].selected==FALSE)
                        units[number].selected=TRUE; selector(number); units_selected+=1;
                    END
                    IF(mouse_over<>number AND mouse_over>0 AND mouse_over<=100 AND units[number].selected==TRUE)
                        units[number].selected=FALSE; units_selected-=1;
                    END
                    ELSE
                    IF(mouse_over==number AND units[number].selected==FALSE)
                        units[number].selected=TRUE; selector(number); units_selected+=1;
                    END
                END
            END
        END
        IF(units[number].from_building==FALSE AND path_free(scenery_file,11,20,units[number].fx,units[number].fy)==FALSE) units[number].fx=x; units[number].fy=y; END
        // UNIT MOVES TOWARDS ENEMY
        IF(units[number].enemy_to_kill>0) units[number].fx=enemy_units[units[number].enemy_to_kill].x; units[number].fy=enemy_units[units[number].enemy_to_kill].y; END

        // UNIT SELECTED IF ITS GROUP NUMBER IS PUSHED
        IF(key(_1)) IF(key(_control)==FALSE) IF(units[number].group==1 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=1; ELSE IF(units[number].group==1) units[number].group=0; END END END END
        IF(key(_2)) IF(key(_control)==FALSE) IF(units[number].group==2 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=2; ELSE IF(units[number].group==2) units[number].group=0; END END END END
        IF(key(_3)) IF(key(_control)==FALSE) IF(units[number].group==3 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=3; ELSE IF(units[number].group==3) units[number].group=0; END END END END
        IF(key(_4)) IF(key(_control)==FALSE) IF(units[number].group==4 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=4; ELSE IF(units[number].group==4) units[number].group=0; END END END END
        IF(key(_5)) IF(key(_control)==FALSE) IF(units[number].group==5 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=5; ELSE IF(units[number].group==5) units[number].group=0; END END END END
        IF(key(_6)) IF(key(_control)==FALSE) IF(units[number].group==6 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=6; ELSE IF(units[number].group==6) units[number].group=0; END END END END
        IF(key(_7)) IF(key(_control)==FALSE) IF(units[number].group==7 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=7; ELSE IF(units[number].group==7) units[number].group=0; END END END END
        IF(key(_8)) IF(key(_control)==FALSE) IF(units[number].group==8 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=8; ELSE IF(units[number].group==8) units[number].group=0; END END END END
        IF(key(_9)) IF(key(_control)==FALSE) IF(units[number].group==9 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=9; ELSE IF(units[number].group==9) units[number].group=0; END END END END
        // WHEN UNIT IS IN SELECTION BOX UNIT IS SELECTED
        IF(units[number].selected==FALSE AND units_selected<20 AND multi_select==TRUE AND units[number].x=>multi_select_x1 AND units[number].x=<multi_select_x2 AND units[number].y=>multi_select_y1 AND units[number].y=<multi_select_y2)  units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END
        IF(placing_building==TRUE AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        // UNIT UN-SELECTED WHEN NOT IN BOX
        IF(units[number].selected==TRUE AND multi_select==TRUE AND (units[number].x<multi_select_x1 OR units[number].x>multi_select_x2 OR units[number].y<multi_select_y1 OR units[number].y>multi_select_y2))  units[number].selected=FALSE; units_selected-=1; END
         // UNIT UN-SELECTED WHEN RIGHT CLICK
        IF(mouse.right AND units[number].selected==TRUE); units[number].selected=FALSE; units_selected-=1; END
        // UNIT UN-SELECTED WHEN BUILDING IS SELECTED
        IF(building_selected>0 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        // UNIT UN-SELECTED WHEN GROUP SELECTED AND UNIT NOT IN GROUP
        IF(key(_1) AND units[number].group<>1 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_2) AND units[number].group<>2 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_3) AND units[number].group<>3 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_4) AND units[number].group<>4 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_5) AND units[number].group<>5 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_6) AND units[number].group<>6 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_7) AND units[number].group<>7 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_8) AND units[number].group<>8 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END
        IF(key(_9) AND units[number].group<>9 AND units[number].selected==TRUE) units[number].selected=FALSE; units_selected-=1; END

        // WHEN UNIT IS UNSELECTED DESTINATION LINE IS DELETED
        IF(units[number].selected==FALSE AND id_destination_line>0) delete_draw(id_destination_line); id_destination_line=0; END

        // DETERMINS IF UNIT IS AT ITS DESTINATION
        IF(units[number].enemy_to_kill==0)
            IF(fget_dist(x,y,units[number].fx,units[number].fy)>2) units[number].at_f=FALSE; ELSE units[number].at_f=TRUE; END
            IF(units[number].at_f==FALSE) IF(units[number].from_building==TRUE) xadvance(fget_angle(units[number].x,units[number].y,units[number].fx,units[number].fy),3); ELSE path_find(path_find_accuracy,scenery_file,11,68,units[number].fx,units[number].fy,OFFSET path_find_points,SIZEOF(path_find_points)); xadvance(fget_angle(units[number].x,units[number].y,path_find_points[0].x,path_find_points[0].y),3); END darkness_counter+=1; IF(darkness_counter>15) darkness_revealed(units[number].x,units[number].y); darkness_counter=0; END IF(units[number].selected==TRUE) move_draw(id_destination_line,53,15,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END
            IF(units[number].at_f==TRUE AND id_destination_line>0) delete_draw(id_destination_line); id_destination_line=0; END
            ELSE
            IF(fget_dist(x,y,units[number].fx,units[number].fy)>confidence) units[number].at_f=FALSE; path_find(path_find_accuracy,scenery_file,11,68,units[number].fx,units[number].fy,OFFSET path_find_points,SIZEOF(path_find_points)); xadvance(fget_angle(units[number].x,units[number].y,path_find_points[0].x,path_find_points[0].y),3); darkness_counter+=1; IF(darkness_counter>15) darkness_revealed(units[number].x,units[number].y); darkness_counter=0; END IF(units[number].selected==TRUE) move_draw(id_destination_line,53,15,units[number].x-scroll[1].x0,units[number].y+23-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy+23-scroll[1].y0); END END
        END

        IF(units[number].selected==TRUE AND units_selected==1)
            IF(circle_around==FALSE) id_view_circle=draw(4,39,10,1,units[number].x-scroll[1].x0-140,units[number].y+23-scroll[1].y0-140,units[number].x-scroll[1].x0+140,units[number].y+23-scroll[1].y0+140); circle_around=TRUE; END
            move_draw(id_view_circle,39,10,units[number].x-scroll[1].x0-150,units[number].y+23-scroll[1].y0-150,units[number].x-scroll[1].x0+170,units[number].y+23-scroll[1].y0+170);
            ELSE
            IF(circle_around==TRUE) delete_draw(id_view_circle); circle_around=FALSE; END
        END

        //------------------------------------------/**/
        //      STOPS UNIT GOING OFF MAP            /**/
        /**/ IF(x<5) x=5; END                       /**/
        /**/ IF(x>map_width-5) x=map_width-5; END   /**/
        /**/ IF(y<5) y=5; END                       /**/
        /**/ IF(y>map_height-5) y=map_height-5; END /**/
        //-----------------------------------------/**/

        units[number].x=x;
        units[number].y=y;
    FRAME;
    END
    IF(units[number].selected==TRUE) units_selected-=1; END
    units[number].x=0;
    units[number].y=0;
    units[number].at_f=FALSE;
    units[number].fx=0;
    units[number].fy=0;
    units[number].selected=FALSE;
    units[number].group=0;
    units[number].enemy_to_kill=0;
    units[number].health=0;
    number_of_units-=1;
END

//-----------------------------------------------------------------------------------------------

PROCESS unit_radar(number);

BEGIN
    file=scenery_file;
    IF(number=>1 AND number=<100)
        IF(units[number].unit_type==1) graph=110; END
        WHILE(units[number].health>0)
            x=610+(units[number].x/11);
            y=40+(units[number].y/11);
        FRAME;
        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS selector(number);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    z=-210;
    health_selector(number);
    IF(number=>1 AND number=<100)
        IF(units[number].unit_type==1) graph=200; END
        IF(units[number].unit_type==2) graph=209; END
        WHILE(units[number].selected==TRUE AND units[number].health>0);
            x=units[number].x;
            y=units[number].y;
        FRAME;
        END
    END
    IF(number=>101 AND number=<200)
        graph=200;
        WHILE(enemy_units[number-100].selected==TRUE AND enemy_units[number-100].health>0);
            x=enemy_units[number-100].x;
            y=enemy_units[number-100].y;
        FRAME;
        END
    END
    IF(number=>201 AND number=<300)
        IF(buildings[number-200].building_type==1) graph=207; END
        IF(buildings[number-200].building_type==2) graph=208; END
        IF(buildings[number-200].building_type==3) graph=208; END
        WHILE(buildings[number-200].selected==TRUE AND buildings[number-200].health>0);
            x=buildings[number-200].x;
            y=buildings[number-200].y;
        FRAME;
        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS health_selector(number);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    z=-210;
    IF(number=>1 AND number=<100)
        WHILE(units[number].selected==TRUE AND units[number].health>0);
            graph=207-units[number].health;
            x=units[number].x;
            y=units[number].y-26;
        FRAME;
        END
    END
    IF(number=>101 AND number=<200)
        WHILE(enemy_units[number-100].selected==TRUE AND enemy_units[number-100].health>0);
            graph=207-enemy_units[number-100].health;
            x=enemy_units[number-100].x;
            y=enemy_units[number-100].y-26;
        FRAME;
        END
    END
    IF(number=>201 AND number=<300)
        WHILE(buildings[number-200].selected==TRUE AND buildings[number-200].health>0);
            graph=207-buildings[number-200].health;
            x=buildings[number-200].x;
            y=buildings[number-200].y-26;
        FRAME;
        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy_unit(number,x,y);

PRIVATE
    ready_to_select_unit;

BEGIN
    number_of_enemy_units+=1;
    ctype=c_scroll;
    cnumber=c_1;
    file=nod_file;
    graph=1;
    z=-100;
    IF(game_loaded==FALSE)
        enemy_units[number].health=6;
    END
    LOOP
        IF(placing_building==FALSE AND mouse.left==TRUE AND game_mouse==1 AND mouse_left_pushed<2 AND ready_to_select_unit==FALSE) ready_to_select_unit=TRUE; END
        IF(mouse.left==FALSE AND ready_to_select_unit==TRUE)
            ready_to_select_unit=FALSE;
            IF(mouse_over-100==number AND units_selected==0)
                enemy_units[number].selected=TRUE; selector(number+100); building_selected=number+100;
            END
        END

        IF(placing_building==TRUE AND enemy_units[number].selected==TRUE) enemy_units[number].selected=FALSE; building_selected=0; END
        IF(mouse.left==TRUE AND game_mouse==1 AND mouse_over-100<>number) enemy_units[number].selected=FALSE; building_selected=0; END
        IF(enemy_units[number].selected==TRUE AND (key(_1) OR key(_2) OR key(_3) OR key(_4) OR key(_5) OR key(_6) OR key(_7) OR key(_8) OR key(_9))) enemy_units[number].selected=FALSE; building_selected=0; END
        IF(mouse.right AND enemy_units[number].selected==TRUE); enemy_units[number].selected=FALSE; building_selected=0; END

        //--------------------------------------/**/
        //      STOPS UNIT GOING OFF MAP        /**/
        /**/ IF(x<0) x=0; END                   /**/
        /**/ IF(x>map_width) x=map_width; END   /**/
        /**/ IF(y<0) y=0; END                   /**/
        /**/ IF(y>map_height) y=map_height; END /**/
        //--------------------------------------/**/

        enemy_units[number].x=x;
        enemy_units[number].y=y;
    FRAME;
    END
    number_of_enemy_units-=1;
END

//-----------------------------------------------------------------------------------------------

PROCESS building(building_type,number,x,y);

PRIVATE
    ready_to_select_unit;
    way_point;
    way_point_line;
    grid_width;
    grid_height;

BEGIN
    number_of_buildings+=1;
    ctype=c_scroll;
    cnumber=c_1;
    file=gdi_file;

    IF(building_type==1)
        IF(player[0].has_construction_yard==FALSE) object(main_file,52,667,312,-10); player[0].has_construction_yard=TRUE; END
        grid_width=3; grid_height=3; x=(x*68)+((grid_width*68)/2); y=(y*68)+((grid_height*68)/2);
        graph=800;
        map_put_pixel(scenery_file,11,(x/68)-1,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)-1,(y/68)+0,151);
        map_put_pixel(scenery_file,11,(x/68)+0,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)+0,(y/68)+0,151);
        map_put_pixel(scenery_file,11,(x/68)+1,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)+1,(y/68)+0,151);
    END

    IF(building_type==2)
        IF(player[0].has_power_plant==FALSE) object(main_file,53,667,385,-10); player[0].has_power_plant=TRUE; END
        grid_width=2; grid_height=3; x=(x*68)+((grid_width*68)/2); y=(y*68)+((grid_height*68)/2);
        graph=850;
        map_put_pixel(scenery_file,11,(x/68)-1,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)-1,(y/68)+0,151);
        map_put_pixel(scenery_file,11,(x/68)+0,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)+0,(y/68)+0,151);
    END

    IF(building_type==3)
        IF(player[0].has_barracs==FALSE) player[0].main_barracs=number; object(main_file,54,754,312,-10); player[0].has_barracs=TRUE; END
        grid_width=2; grid_height=3; x=(x*68)+((grid_width*68)/2); y=(y*68)+((grid_height*68)/2);
        graph=900;
        map_put_pixel(scenery_file,11,(x/68)-1,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)-1,(y/68)+0,151);
        map_put_pixel(scenery_file,11,(x/68)+0,(y/68)-1,151);
        map_put_pixel(scenery_file,11,(x/68)+0,(y/68)+0,151);
    END

    z=-90;
    buildings[number].building_type=building_type;
    IF(game_loaded==FALSE);
        darkness_revealed(x,y-100);
        darkness_revealed(x,y-40);
        darkness_revealed(x,y+20);
        darkness_revealed(x,y+80);
        buildings[number].health=6;
        buildings[number].x=x;
        buildings[number].y=y;
    END
    buildings[number].way_point_x=x;
    buildings[number].way_point_y=y+70;

    WHILE(buildings[number].health>0);
        //          WHEN LEFT MOUSE IS CLICKED THEN REALEASED
        IF(key(_alt) AND buildings[number].selected==TRUE AND mouse_over==0 AND game_mouse==1 AND mouse.left) buildings[number].way_point_x=mouse.x+scroll[1].x0; buildings[number].way_point_y=mouse.y+scroll[1].y0-23; END
        IF(placing_building==FALSE AND mouse.left==TRUE AND game_mouse==1 AND mouse_left_pushed<2 AND ready_to_select_unit==FALSE) ready_to_select_unit=TRUE; END
        IF(mouse.left==FALSE AND ready_to_select_unit==TRUE)
            ready_to_select_unit=FALSE;
            IF(building_type==3 AND mouse_over-200==number AND buildings[number].selected==TRUE)
                player[0].main_barracs=number;
                primary_building(number);
            END
            IF(mouse_over-200==number AND buildings[number].selected==FALSE)
                buildings[number].selected=TRUE; IF(player[0].main_barracs==number) primary_building(number); END selector(number+200); building_selected=number+200;
                IF(building_type==3) way_point_line=TRUE; way_point=draw(1,53,15,1,buildings[number].x-scroll[1].x0,buildings[number].y+23-scroll[1].y0-50,buildings[number].way_point_x-scroll[1].x0,buildings[number].way_point_y+23-scroll[1].y0); END
            END
        END
        IF(placing_building==TRUE AND buildings[number].selected==TRUE)  buildings[number].selected=FALSE; building_selected=0; END
        IF(buildings[number].selected==TRUE AND mouse.left==TRUE AND game_mouse==1 AND mouse_over-200<>number AND key(_alt)==FALSE) buildings[number].selected=FALSE; building_selected=0; END
        IF(buildings[number].selected==TRUE AND (key(_1) OR key(_2) OR key(_3) OR key(_4) OR key(_5) OR key(_6) OR key(_7) OR key(_8) OR key(_9))) buildings[number].selected=FALSE; building_selected=0; END
        IF(mouse.right AND buildings[number].selected==TRUE); buildings[number].selected=FALSE; building_selected=0; END
        IF(way_point_line==TRUE AND buildings[number].selected==FAlSE AND building_type==3) way_point_line=FALSE; delete_draw(way_point); END
        IF(way_point_line==TRUE) delete_draw(way_point); way_point=draw(1,53,15,1,buildings[number].x-scroll[1].x0,buildings[number].y+23-scroll[1].y0-50,buildings[number].way_point_x-scroll[1].x0,buildings[number].way_point_y+23-scroll[1].y0); END
        FRAME;
    END
    number_of_buildings-=1;
END

//-----------------------------------------------------------------------------------------------

PROCESS primary_building(number);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=114;
    z=-210;
    x=buildings[number].x;
    y=buildings[number].y+25;
    WHILE(buildings[number].selected==TRUE AND buildings[number].health>0 AND player[0].main_barracs==number);
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS building_placer(building_type);

PRIVATE
    ready_to_select_unit;

BEGIN
    placing_building=TRUE;
    ctype=c_scroll;
    cnumber=c_1;
    IF(building_type==1);
        building_placer_square(-1,-1);
        building_placer_square(-1,0);
        building_placer_square(-1,1);
        building_placer_square(0,-1);
        building_placer_square(0,0);
        building_placer_square(0,1);
        building_placer_square(1,-1);
        building_placer_square(1,0);
        building_placer_square(1,1);
    END
    IF(building_type==2 OR building_type==3);
        building_placer_square(-1,-1);
        building_placer_square(-1,0);
        building_placer_square(-1,1);
        building_placer_square(0,-1);
        building_placer_square(0,0);
        building_placer_square(0,1);
    END
    WHILE(placing_building==TRUE)
        IF(mouse.left==TRUE AND game_mouse==1 AND mouse_left_pushed<2 AND ready_to_select_unit==FALSE) ready_to_select_unit=TRUE; END
        IF(mouse.left==FALSE AND ready_to_select_unit==TRUE)
            IF(building_type==1 AND able_to_place_building==TRUE) building(building_type,number_of_buildings+1,(x-68)/68,(y-68)/68); placing_building=FALSE; END
            IF(building_type==2 AND able_to_place_building==TRUE) building(building_type,number_of_buildings+1,(x-68)/68,(y-68)/68); placing_building=FALSE; END
            IF(building_type==3 AND able_to_place_building==TRUE) building(building_type,number_of_buildings+1,(x-68)/68,(y-68)/68); placing_building=FALSE; END
            ready_to_select_unit=FALSE;
        END
        x=(((mouse.x+scroll[1].x0)/68)*68)+34;
        y=(((mouse.y-23+scroll[1].y0)/68)*68)+34;
        IF(mouse.right) placing_building=FALSE; END
        able_to_place_building=TRUE;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS building_placer_square(change_in_x,change_in_y);

PRIVATE
    square_red;
    square_counter;
BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=112;
    z=-210;
    WHILE(placing_building==TRUE);
        IF(square_red==TRUE) able_to_place_building=FALSE; END
        square_red=FALSE;
        graph=112;
        x=father.x+(change_in_x*68);
        y=father.y+(change_in_y*68);
        FROM square_counter=1 TO 100; IF(units[square_counter].x>x-30 AND units[square_counter].x<x+30 AND units[square_counter].y>y-36 AND units[square_counter].y<y+36) square_red=TRUE; graph=113; END END
        FROM square_counter=1 TO 100; IF(enemy_units[square_counter].x>x-30 AND enemy_units[square_counter].x<x+30 AND enemy_units[square_counter].y>y-36 AND enemy_units[square_counter].y<y+36) square_red=TRUE; graph=113; END END
        IF(map_get_pixel(scenery_file,11,x/68,y/68)>0) square_red=TRUE; graph=113; END
        IF(x<68 OR y<68 OR x>(map_width-68) OR y>(map_height-68)) square_red=TRUE; graph=113; END
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

