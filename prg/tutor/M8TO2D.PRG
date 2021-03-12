


PROGRAM mode8_labels;

CONST
    magic_number=555;

GLOBAL
    fpgfile;

    scrnx;
    scrny;
    xfocus;
    yfocus;

BEGIN
  set_mode(m800x600);

  scrnx = 800;
  scrny = 600;
//  xfocus = scrnx*magic_number/800;
//  yfocus = scrny*magic_number/600;
  xfocus = magic_number;
  yfocus = magic_number;

  set_fps(70,0);
  fpgfile = load_fpg("HELP\WLD_VIEW.FPG");
  load_wld("HELP\WLD_VIEW.WLD",file);

  start_mode8(id,0,0);

  ctype=c_m8;
  height=64;
  radius=64;
  m8.height=32;
  go_to_flag(0);

  test_thing(0,"Mark");
  test_thing(1,"Jeff");
  test_thing(2,"Bob");
  test_thing(3,"Susan");
  test_thing(4,"Annie");

  LOOP
      IF (key(_right)) angle-=2000; END
      IF (key(_left))  angle+=2000; END
      IF (key(_up))    advance(24); END
      IF (key(_down))  advance(-9); END
      IF (key(_q))     z+=16;       END
      IF (key(_a))     z-=16;       END
      IF (key(_w))     m8.angle+=8; END
      IF (key(_s))     m8.angle-=8; END
      IF (key(_d))     xadvance(angle+90000,15); END
      IF (key(_f))     xadvance(angle-90000,15); END

      FRAME;
  END

END


PROCESS test_thing(flag,STRING name[7])
PRIVATE
    text;
    tx; ty; td;
    circle;
    cx; cy; cd;
BEGIN

    graph = 31;
    ctype=c_m8;
    height=64;
    radius=64;
    go_to_flag(flag);

    text = write(0,0,0,4,name);
    circle = draw(2,0,0,0,0,0,0,0);

    LOOP

        get_visible_coords(x,y,z+135,father,0,&tx,&ty,&td);
        move_text(text,tx,ty);

        get_visible_coords(x,y,z+38,father,0,&cx,&cy,&cd);
        move_draw(circle,15,15,cx-cd,cy-cd,cx+cd,cy+cd);

        FRAME;
    END
END


PROCESS get_visible_coords(x,y,z,cam,number,outx,outy,outd)
PRIVATE
    across;
    up;
    depth;
    dist;

BEGIN

    across  = get_distx(90000-cam.angle,(x-cam.x))     + get_distx(-cam.angle,(y-cam.y));
    depth   = -(get_disty(90000-cam.angle,(x-cam.x))   + get_disty(-cam.angle,(y-cam.y)));
    up      = -(z-cam.z);
    dist    = fget_dist(cam.x,cam.y,x,y);

    IF(depth > 0)
        ^outx = scrnx/2 + xfocus * (across*1000/depth) / 1000;
        ^outy = scrny/2 + yfocus * (up    *1000/depth) / 1000 + scrny/2*m8[number].angle/128;
        IF(dist>0)
            ^outd = ((50000000/dist)*64)/100000;
        END
    ELSE
        ^outx = -512;
        ^outy = -512;
        ^outd = 0;
    END

END


