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
    //--------------/**/
    //     FILES    /**/
    /**/ main_file; /**/
    //--------------/**/

    //-----------------------/**/
    //     MOUSE VARIABLES   /**/
    /**/ mouse_left_pushed;  /**/
    /**/ mouse_right_pushed; /**/
    /**/ mouse_region;       /**/
    /**/ mouse_over;         /**/
    /**/ units_selected;     /**/
    /**/ multi_select;       /**/
    /**/ multi_select_x1;    /**/
    /**/ multi_select_y1;    /**/
    /**/ multi_select_x2;    /**/
    /**/ multi_select_y2;    /**/
    /**/ multi_select_box;   /**/
    /**/ multi_select_line;  /**/
    /**/ ready_to_select;    /**/
    /**/ ready_to_select_x;  /**/
    /**/ ready_to_select_y;  /**/
    //-----------------------/**/

    map_width;
    map_height;

    STRUCT game[0];
        number_of_units,
    END

    STRUCT units[100];
        x,
        y,
        at_f,
        fx,
        fy,
        selected,
        group,
        enemy_to_kill,
    END

    STRUCT enemy_units[100];
        x,
        y,
    END

PRIVATE
    game_screen;
    multi_units;
    unit_counter;
    ready_to_unselect;
BEGIN

    set_mode(m800x600);                     // Set Up General Programe
    set_fps(30,30);                         // Set Up General Programe
    load_pal("pal\C&C\palette.pal");        // Set Up General Programe


    main_file=load_fpg("fpg\1.fpg");    // Load Files

    game_screen=100;                        // Set Deafault Global's

    mouse.file=main_file;                   // Set Up Mouse
    mouse.graph=3;                          // Set Up Mouse

    LOOP

        SWITCH (game_screen);               // Sets Up A Function For Different Screens + Menus
            CASE 100: //levle
                define_region(1,0,0,650,600);
                define_region(2,650,0,150,600);
                start_scroll(1,main_file,2,0,1,15);
                start_scroll(2,main_file,52,0,2,15);

                map_width=2000;
                map_height=2000;

                unit(1,400,300);
                unit(2,400,350);
                unit_counter=3;
                unit(unit_counter,rand(20,700),rand(20,600)); unit_counter+=1;

                object(main_file,5,150,400,-150,11);
                object(main_file,5,600,200,-150,11);

                enemy_unit(1,200,200);

                scenery_mini();
                darkness();
                darkness_mini();
                LOOP
                    //-----------------------------------------------------------------------------/**/
                    //        FUNCTION FOR STOPING MOUSE BEING HELD DOWN                           /**/
                    /**/ IF(mouse_left_pushed==1) mouse_left_pushed=2; END                         /**/
                    /**/ IF(mouse_right_pushed==1) mouse_right_pushed=2; END                       /**/
                    /**/ IF(mouse.right==FALSE) mouse_right_pushed=0; END                          /**/
                    /**/ IF(mouse.left==FALSE) mouse_left_pushed=0; END                            /**/
                    /**/ IF(mouse.right==TRUE AND mouse_right_pushed==0) mouse_right_pushed=1; END /**/
                    /**/ IF(mouse.left==TRUE AND mouse_left_pushed==0) mouse_left_pushed=1; END    /**/
                    //-----------------------------------------------------------------------------/**/

                    IF(key(_space) AND game[0].number_of_units<100) unit(unit_counter,rand(20,700),rand(20,600)); unit_counter+=1; END

                    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/
                    //        FUNCTION FOR SELECTING UINTS                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  /**/
                    /**/ IF(mouse.x<=650) mouse_region=1; ELSE mouse_region=0; END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          /**/
                    /**/ IF(ready_to_unselect==FALSE) multi_select=FALSE; END                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   /**/
                    /**/ IF(mouse.left AND mouse_region==1 AND ready_to_select==FALSE) ready_to_select=TRUE; ready_to_select_x=mouse.x; ready_to_select_y=mouse.y; END                                                                                                                                                                                                                                                                                                                                                                                                      /**/
                    /**/ IF(ready_to_select==TRUE AND (mouse.x<ready_to_select_x-10 OR mouse.x>ready_to_select_x+10 OR mouse.y<ready_to_select_y-10 OR mouse.y>ready_to_select_y+10) AND multi_select==FALSE) multi_select=TRUE; ready_to_unselect=TRUE; multi_select_x1=scroll[1].x0+ready_to_select_x; multi_select_y1=scroll[1].y0+ready_to_select_y; multi_select_box=draw(3,1,1,1,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); multi_select_line=draw(2,53,15,1,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); END /**/
                    /**/ IF(ready_to_select==TRUE AND mouse.left==FALSE); ready_to_select=FALSE; IF(multi_select==TRUE) ready_to_unselect=FALSE; delete_draw(multi_select_box); delete_draw(multi_select_line); END END                                                                                                                                                                                                                                                                                                                                                          /**/
                    /**/ IF(ready_to_unselect==TRUE) multi_select_x2=scroll[1].x0+mouse.x; multi_select_y2=scroll[1].y0+mouse.y; move_draw(multi_select_box,1,1,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); move_draw(multi_select_line,53,15,multi_select_x1-scroll[1].x0,multi_select_y1-scroll[1].y0,multi_select_x2-scroll[1].x0,multi_select_y2-scroll[1].y0); END                                                                                                                                /**/
                    /**/ mouse_over=0; FROM multi_units=0 TO 100; IF(mouse.x<((units[multi_units].x+20)-scroll[1].x0) AND mouse.x>((units[multi_units].x-20)-scroll[1].x0) AND mouse.y<((units[multi_units].y+20)-scroll[1].y0) AND mouse.y>((units[multi_units].y-20)-scroll[1].y0)) mouse_over=multi_units; END END FROM multi_units=0 TO 100; IF(mouse.x<((enemy_units[multi_units].x+20)-scroll[1].x0) AND mouse.x>((enemy_units[multi_units].x-20)-scroll[1].x0) AND mouse.y<((enemy_units[multi_units].y+20)-scroll[1].y0) AND mouse.y>((enemy_units[multi_units].y-20)-scroll[1].y0)) mouse_over=multi_units+100; END END
                    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------/**/

                    IF(map_get_pixel(main_file,4,(mouse.x+scroll[1].x0)/21,(mouse.y+scroll[1].x0)/21)==0)
                        IF(units_selected>0 AND mouse_over==0) mouse.graph=29; END
                        IF(units_selected>0 AND mouse_over=>1 AND mouse_over=<100) mouse.graph=3; END
                        IF(units_selected>0 AND mouse_over=>101 AND mouse_over=<200) mouse.graph=30; END
                        ELSE
                        mouse.graph=29;
                    END

                    IF(units_selected==0) mouse.graph=3; END
                    IF(mouse.x>650) mouse.graph=3; END

                    //---------------------------------------------------------------------------------------------/**/
                    //        FUNCTION FOR SCROLLING ROUND THE MAP                                                 /**/
                    /**/ IF(mouse.x<10 AND mouse.y>10 AND mouse.y<580) scroll[1].x0-=15; mouse.graph=21; END       /**/
                    /**/ IF(mouse.x>780 AND mouse.y>10 AND mouse.y<580) scroll[1].x0+=15; mouse.graph=22; END      /**/
                    /**/ IF(mouse.y<10 AND mouse.x>10 AND mouse.x<780) scroll[1].y0-=15; mouse.graph=23; END       /**/
                    /**/ IF(mouse.y>580 AND mouse.x>10 AND mouse.x<780) scroll[1].y0+=15; mouse.graph=24; END      /**/
                    /**/ IF(mouse.x=<10 AND mouse.y=<10) scroll[1].x0-=15; scroll[1].y0-=15; mouse.graph=25; END   /**/
                    /**/ IF(mouse.x=>780 AND mouse.y=<10) scroll[1].x0+=15; scroll[1].y0-=15; mouse.graph=26; END  /**/
                    /**/ IF(mouse.x=<10 AND mouse.y=>580) scroll[1].x0-=15; scroll[1].y0+=15; mouse.graph=27; END  /**/
                    /**/ IF(mouse.x=>780 AND mouse.y>=580) scroll[1].x0+=15; scroll[1].y0+=15; mouse.graph=28; END /**/
//                    /**/ IF(mouse.x=>10 AND mouse.x<=780 AND mouse.y=>10 AND mouse.y<=580) mouse.graph=3; END      /**/
                    /**/ IF(mouse.x<=5) mouse.x=5; END                                                             /**/
                    /**/ IF(mouse.x>=785) mouse.x=785; END                                                         /**/
                    /**/ IF(mouse.y=<5) mouse.y=5; END                                                             /**/
                    /**/ IF(mouse.y=>585) mouse.y=585; END                                                         /**/
                    /**/ IF(scroll[1].x0<=0) scroll[1].x0=0; END                                                   /**/
                    /**/ IF(scroll[1].y0<=0) scroll[1].y0=0; END                                                   /**/
                    /**/ IF(scroll[1].x0=>map_width-800) scroll[1].x0=map_width-800; END                           /**/
                    /**/ IF(scroll[1].y0=>map_height-600) scroll[1].y0=map_height-600; END                         /**/
                    //---------------------------------------------------------------------------------------------/**/

                FRAME;
                END
                signal(TYPE unit,s_kill);
                signal(TYPE selector,s_kill);
                signal(TYPE object,s_kill);
                signal(TYPE darkness,s_kill);
                signal(TYPE darkness_revealed,s_kill);
                signal(TYPE scenery_mini,s_kill);
                signal(TYPE darkness_mini,s_kill);
                signal(TYPE enemy_unit,s_kill);
            END

        END
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS unit(number,x,y);

PRIVATE
    id_destination_line;
    numbers_1_to_0;
    number_ajustment_x;
    number_ajustment_y;
    darkness_counter;
    STRUCT path_find_points[20];
        x,
        y,
    END
    ready_to_select_unit;
    confidence;
BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=1;
    units[number].selected=FALSE;
    units[number].fx=x;
    units[number].fy=y;
    darkness_revealed(x,y);
    z=-100;
    game[0].number_of_units+=1;
    confidence=rand(100,150);
    LOOP
        IF(mouse.left==TRUE AND mouse_region==1 AND mouse_left_pushed<2 AND ready_to_select_unit==FALSE) ready_to_select_unit=TRUE; END
        IF(mouse.left==FALSE AND ready_to_select_unit==TRUE) ready_to_select_unit=FALSE;
            IF(multi_select==FALSE)
                // WHEN UNIT IS CLICKED DESTINATION LINE IS DRAWN
                IF(id_destination_line==0)
                    id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0);
                END
                // IF UNIT SELECTED AND MOUSE NOT OVER OSOMETHING ELSE, UNIT SENT TO MOUSE
                IF(units[number].selected==TRUE AND mouse_over==0);
                    units[number].enemy_to_kill=0;
                    IF(units_selected>1)
                        number_ajustment_x=rand(-100*sqrt(sqrt(units_selected)),100*sqrt(sqrt(units_selected))); number_ajustment_y=rand(-100*sqrt(sqrt(units_selected)),100*sqrt(sqrt(units_selected)));
                        ELSE
                        number_ajustment_x=0; number_ajustment_y=0;
                    END
                    IF(path_free(main_file,6,16,mouse.x+scroll[1].x0+number_ajustment_x,mouse.y+scroll[1].y0+number_ajustment_y))
                        units[number].fx=mouse.x+scroll[1].x0+number_ajustment_x; units[number].fy=mouse.y+scroll[1].y0+number_ajustment_y;
                    END
                END

                IF(units[number].selected==TRUE AND mouse_over AND mouse_over=>101 AND mouse_over=<200);
                    units[number].enemy_to_kill=mouse_over-100;
                    units[number].fx=mouse.x+scroll[1].x0; units[number].fy=mouse.y+scroll[1].y0;
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

        IF(units[number].enemy_to_kill>0) units[number].fx=enemy_units[units[number].enemy_to_kill].x; units[number].fy=enemy_units[units[number].enemy_to_kill].y; END


        // UNIT SELECTED IF ITS GROUP NUMBER IS PUSHED
        IF(key(_1)) IF(key(_alt)==FALSE) IF(units[number].group==1 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=1; ELSE IF(units[number].group==1) units[number].group=0; END END END END
        IF(key(_2)) IF(key(_alt)==FALSE) IF(units[number].group==2 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=2; ELSE IF(units[number].group==2) units[number].group=0; END END END END
        IF(key(_3)) IF(key(_alt)==FALSE) IF(units[number].group==3 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=3; ELSE IF(units[number].group==3) units[number].group=0; END END END END
        IF(key(_4)) IF(key(_alt)==FALSE) IF(units[number].group==4 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=4; ELSE IF(units[number].group==4) units[number].group=0; END END END END
        IF(key(_5)) IF(key(_alt)==FALSE) IF(units[number].group==5 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=5; ELSE IF(units[number].group==5) units[number].group=0; END END END END
        IF(key(_6)) IF(key(_alt)==FALSE) IF(units[number].group==6 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=6; ELSE IF(units[number].group==6) units[number].group=0; END END END END
        IF(key(_7)) IF(key(_alt)==FALSE) IF(units[number].group==7 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=7; ELSE IF(units[number].group==7) units[number].group=0; END END END END
        IF(key(_8)) IF(key(_alt)==FALSE) IF(units[number].group==8 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=8; ELSE IF(units[number].group==8) units[number].group=0; END END END END
        IF(key(_9)) IF(key(_alt)==FALSE) IF(units[number].group==9 AND units[number].selected==FALSE) units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END ELSE IF(units[number].selected==TRUE) units[number].group=9; ELSE IF(units[number].group==9) units[number].group=0; END END END END
        // WHEN UNIT IS IN SELECTION BOX UNIT IS SELECTED
        IF(units[number].selected==FALSE AND units_selected<20 AND multi_select==TRUE AND units[number].x=>multi_select_x1 AND units[number].x=<multi_select_x2 AND units[number].y=>multi_select_y1 AND units[number].y=<multi_select_y2)  units[number].selected=TRUE; selector(number); units_selected+=1; IF(units[number].at_f==FALSE AND id_destination_line==0) id_destination_line=draw(1,53,15,1,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END
        IF(units[number].selected==TRUE AND multi_select==TRUE AND (units[number].x<multi_select_x1 OR units[number].x>multi_select_x2 OR units[number].y<multi_select_y1 OR units[number].y>multi_select_y2))  units[number].selected=FALSE; units_selected-=1; END


        // UNIT UN-SELECTED WHEN RIGHT CLICK
        IF(mouse.right AND units[number].selected==TRUE); units[number].selected=FALSE; units_selected-=1; END
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
//        IF(x<(units[number].fx-10) OR x>(units[number].fx+10) OR y<(units[number].fy-10) OR y>(units[number].fy+10)) units[number].at_f=FALSE; ELSE units[number].at_f=TRUE; END
        IF(units[number].enemy_to_kill==0)
            IF(fget_dist(x,y,units[number].fx,units[number].fy)>10) units[number].at_f=FALSE; ELSE units[number].at_f=TRUE; END
            IF(units[number].at_f==FALSE) path_find(0,main_file,6,16,units[number].fx,units[number].fy,OFFSET path_find_points,SIZEOF(path_find_points)); xadvance(fget_angle(units[number].x,units[number].y,path_find_points[0].x,path_find_points[0].y),5); darkness_counter+=1; IF(darkness_counter>15) darkness_revealed(units[number].x,units[number].y); darkness_counter=0; END IF(units[number].selected==TRUE) move_draw(id_destination_line,53,15,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END
            IF(units[number].at_f==TRUE AND id_destination_line>0) delete_draw(id_destination_line); id_destination_line=0; END
            ELSE
            IF(fget_dist(x,y,units[number].fx,units[number].fy)>confidence) units[number].at_f=FALSE; path_find(0,main_file,6,16,units[number].fx,units[number].fy,OFFSET path_find_points,SIZEOF(path_find_points)); xadvance(fget_angle(units[number].x,units[number].y,path_find_points[0].x,path_find_points[0].y),5); darkness_counter+=1; IF(darkness_counter>15) darkness_revealed(units[number].x,units[number].y); darkness_counter=0; END IF(units[number].selected==TRUE) move_draw(id_destination_line,53,15,units[number].x-scroll[1].x0,units[number].y-scroll[1].y0,units[number].fx-scroll[1].x0,units[number].fy-scroll[1].y0); END END
        END

        //--------------------------------------/**/
        //      STOPS UNIT GOING OFF MAP        /**/
        /**/ IF(x<0) x=0; END                   /**/
        /**/ IF(x>map_width) x=map_width; END   /**/
        /**/ IF(y<0) y=0; END                   /**/
        /**/ IF(y>map_height) y=map_height; END /**/
        //--------------------------------------/**/

        units[number].x=x;
        units[number].y=y;

    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS selector(number);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=60;
    z=-210;
    WHILE(units[number].selected==TRUE);
        x=units[number].x;
        y=units[number].y;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS enemy_unit(number,x,y);

PRIVATE
BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=8;
    z=-100;
    LOOP

        IF(key(_a)) x-=10; END
        IF(key(_d)) x+=10; END
        IF(key(_w)) y-=10; END
        IF(key(_s)) y+=10; END

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
END

//-----------------------------------------------------------------------------------------------

PROCESS object(file,graph,x,y,z,ajustment);

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    map_put(main_file,6,7,(x/16),(y/16));
    y-=ajustment;
    LOOP
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS darkness();

BEGIN
    ctype=c_scroll;
    cnumber=c_1;
    file=main_file;
    graph=4;
    size=2000;
    x=1000;
    y=1000;
    z=-200;
    LOOP
        graph=4;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS scenery_mini();

BEGIN
    file=main_file;
    graph=6;
    x=722;
    y=92;
    size=84;
    flags=4;
    LOOP
        graph=6;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS darkness_mini();

BEGIN
    file=main_file;
    graph=4;
    x=730;
    y=100;
    size=120;
    LOOP
        graph=4;
    FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS darkness_revealed(x,y);

PRIVATE
    sequence_x;
    sequence_y;

BEGIN
    FROM sequence_x=-8 TO 8;
        IF(sqrt(sequence_x*sequence_x)==0) FROM sequence_y=-4 TO 4;  map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==1) FROM sequence_y=-4 TO 4;  map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==2) FROM sequence_y=-3 TO 3;  map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==3) FROM sequence_y=-3 TO 3;  map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==4) FROM sequence_y=-2 TO 2; map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==5) FROM sequence_y=-2 TO 2; map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==6) FROM sequence_y=-1 TO 1; map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==7) FROM sequence_y=-1 TO 1; map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END END
        IF(sqrt(sequence_x*sequence_x)==8) sequence_y=0; map_put_pixel(main_file,4,(x/21)+sequence_x,(y/21)+sequence_y,0); END
    END
END

//-----------------------------------------------------------------------------------------------

