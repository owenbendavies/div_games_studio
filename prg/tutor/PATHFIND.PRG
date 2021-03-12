
PROGRAM example_path_find;

GLOBAL
//    num_points;
    STRUCT points[100]
        x,y;
    END
    point_x;
    point_y;
BEGIN
        set_mode(m800x600);
    load_fpg("help\help.fpg");
    start_scroll(1,0,7,0,0,15);
    ctype=c_scroll;
    graph=200;
x=10;
y=10;
point_x=20;
point_y=20;
        thing();
        thing2(x,y);
    LOOP
//    num_points=path_find(0,0,201,2,point_x,point_y,OFFSET points,sizeof(points));
            IF(fget_dist(x,y,points[0].x,points[0].y)>4)
                xadvance(fget_angle(x,y,points[0].x,points[0].y),4);

                ELSE

                x=points[0].x;
                y=points[0].y;
            END
            FRAME;

        IF(key(_right)) scroll[1].x0+=10; END
        IF(key(_left)) scroll[1].x0-=10; END
        IF(key(_up)) scroll[1].y0-=10; END
        IF(key(_down)) scroll[1].y0+=10; END
        IF(key(_a)) point_x-=10; END
        IF(key(_d)) point_x+=10; END
        IF(key(_w)) point_y-=10; END
        IF(key(_s)) point_y+=10; END

        FRAME;
    END
END

PROCESS thing();
BEGIN
    graph=200;
    ctype=c_scroll;
    LOOP
    x=point_x;
    y=point_y;
    FRAME;
    END
END

PROCESS thing2(x,y);
BEGIN
    LOOP
    x=father.x;
    y=father.y;
//    num_points=
    path_find(0,0,201,4,point_x,point_y,OFFSET points,sizeof(points));
    FRAME;
    END
END
