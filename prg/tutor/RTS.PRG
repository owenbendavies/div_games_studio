
//-----------------------------------------------------------------------------------------------
// TITLE:      3000
// AUTHOR:     OWEN DAVIES
// DATE:       OWEN GAMES 2003
//-----------------------------------------------------------------------------------------------

PROGRAM program_3000;

GLOBAL
    main_fpg;

    units_selected;

BEGIN
    set_mode(m800x600);
    set_fps(32,32);

    main_fpg=load_fpg("fpg\3000\main.fpg");
    load_pal("fpg\3000\main.fpg");

    mouse.graph=200;

    building(400,300,0);
    building(200,50,30000);

    man(10,10,false);
    man(100,100,false);

    start_scroll(0,main_fpg,1,0,0,15);

    write_int(0,400,300,0,& ascii);

    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS man(x,y,unit_selected);

PRIVATE
    number_of_movement_points;
    STRUCT movement_points[20]
        x,y;
    END
    destination_x;
    destination_y;
    destination_line;
    mouse_selecting;

BEGIN

    graph=3;
    destination_x=x;
    destination_y=y;

    LOOP
        IF(unit_selected==FALSE AND units_selected==0 AND mouse.left AND fget_dist(mouse.x,mouse.y,x,y)<10)
            mouse_selecting=TRUE;
            graph=4;
            unit_selected=TRUE;
            units_selected+=1;
        END

        IF(unit_selected==FALSE AND key(_l_shift) AND mouse.left AND fget_dist(mouse.x,mouse.y,x,y)<10)
            mouse_selecting=TRUE;
            graph=4;
            unit_selected=TRUE;
            units_selected+=1;
        END

        IF(mouse_selecting==TRUE AND mouse.left==0)
            mouse_selecting=FALSE;
        END

        IF(unit_selected==TRUE AND mouse_selecting==FALSE AND mouse.left AND path_free(main_fpg,2,4,mouse.x,mouse.y)==1)
            destination_x=mouse.x;
            destination_y=mouse.y;
        END

        IF(unit_selected==TRUE AND mouse.right);
            graph=3;
            unit_selected=FALSE;
            units_selected-=1;
        END

        number_of_movement_points=path_find(0,main_fpg,2,4,destination_x,destination_y,OFFSET movement_points,sizeof(movement_points));

        IF(number_of_movement_points>0)

            IF(fget_dist(x,y,movement_points[0].x,movement_points[0].y)>1)
                xadvance(fget_angle(x,y,movement_points[0].x,movement_points[0].y),2);
                ELSE
                x=movement_points[0].x;
                y=movement_points[0].y;
            END

            IF(unit_selected==TRUE)
                destination_line=draw(1,229,15,0,x,y,destination_x,destination_y);
            END

        END

        FRAME;

        IF(unit_selected==TRUE)
            delete_draw(destination_line);
        END

    END
END

//-----------------------------------------------------------------------------------------------

PROCESS building(x,y,angle)

BEGIN
    graph=5;
    map_xput(main_fpg,2,graph,x/4,y/4,angle,25,0);
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------
