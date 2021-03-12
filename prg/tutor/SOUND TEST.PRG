
//-----------------------------------------------------------------------------------------------

SETUP_PROGRAM div_sound_setup;

GLOBAL
    STRUCT botones[24]
        x,y,
        graph,
        inc,
        max,
        valor;
    END =
        262,136,10,-1,0,&setup.card,
        285,136,11,1,7,&setup.card,

        135,195,10,-1,0,&setup.port,
        158,195,11,1,5,&setup.port,
        261,195,10,-1,0,&setup.irq,
        284,195,11,1,9,&setup.irq,
        135,255,10,-1,0,&setup.dma,
        158,255,11,1,10,&setup.dma,
        261,255,10,-1,0,&setup.dma2,
        284,255,11,1,10,&setup.dma2,
        135,315,10,-8,8,&setup.bits,
        158,315,10,8,16,&setup.bits,
        261,315,10,-11025,11025,&setup.rate,
        284,315,10,11025,44100,&setup.rate,

        539,136,10,-1,0,&setup.master,
        562,136,11,1,15,&setup.master,
        539,195,10,-1,0,&setup.sound_fx,
        562,195,11,1,15,&setup.sound_fx,
        539,255,10,-1,0,&setup.cd_audio,
        562,255,11,1,15,&setup.cd_audio,
        539,315,10,-1,1,&setup.mixer,
        562,315,11,1,2,&setup.mixer,

        423,38,13,0,0,0,
        510,38,14,0,0,0,
        597,38,12,0,0,0;

    tarjeta_sonido[]="No Sound","Sound Blaster 1.5","Sound Blaster 2.0","Sound Blaster Pro",
           "Sound Blaster 16","Sound Blaster AWE","Gravis Ultra Sound","Gravis Ultra Sound MAX";

    puerto[]="0x210","0x220","0x230","0x240","0x250","0x260";

    irq[]="2","3","5","7","10","11","12","13","14","15";

    dma[]="0","1","2","3","4","5","6","7","8","9","10";

    mixer[]="","Fast mixer","Quality mixer";

    s_test;

    sound_file;

    sound_font;

BEGIN
    set_mode(m800x600);
    set_fps(30,5);

    sound_file=load_fpg("fpg\cg\sound.fpg");
    load_fnt("setup\setup.fnt");
    put(0,1,400,300);

    dump_type=partial_dump;
    restore_type=partial_restore;

    mouse.graph=100;

    FROM x=0 TO 24;
        sound_button(x);
    END

    volume_slider(1,458,164);
    volume_slider(2,458,222);
    volume_slider(3,458,282);

    volume_bar();

    LOOP
        IF (key(_esc)) exit("",0); END
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS sound_button(n£mero)

PRIVATE
    bot¢n_pulsado;

BEGIN
    file=sound_file;
    x=botones[n£mero].x+80;
    y=botones[n£mero].y+60;
    LOOP
        graph=botones[n£mero].graph;
        IF (NOT collision(TYPE mouse) OR NOT mouse.left)
            graph=0;
            IF (bot¢n_pulsado)
                bot¢n_pulsado=FALSE;
                FRAME;
                switch(n£mero)
                    case 22:
                        reset_sound();
                        save("sound.cfg",&setup,sizeof(setup));
                    END
                    case 23:
                        unload_pcm(s_test);
                        reset_sound();
                        s_test=load_pcm("setup\setup.pcm",0);
                        sound(s_test,256,256);
                    END
                    case 24:
                        exit("",0);
                    END
                    default:
                        IF (botones[n£mero].inc>0)
                            IF ([botones[n£mero].valor]<botones[n£mero].max)
                                [botones[n£mero].valor]+=botones[n£mero].inc;
                            END
                        ELSE
                            IF ([botones[n£mero].valor]>botones[n£mero].max)
                                [botones[n£mero].valor]+=botones[n£mero].inc;
                            END
                        END
                    END
                END
                volume_bar();
            END
        ELSE
            IF (mouse.left) bot¢n_pulsado=TRUE; END
        END
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

PROCESS volume_bar()

BEGIN
    delete_text(all_text);
    write(sound_font,178+80,162+60,4,tarjeta_sonido[setup.card]);
    write(sound_font,120+80,220+60,4,puerto[setup.port]);
    write(sound_font,244+80,220+60,4,irq[setup.irq]);
    write(sound_font,120+80,280+60,4,dma[setup.dma]);
    write(sound_font,244+80,280+60,4,dma[setup.dma2]);
    write_int(sound_font,120+80,340+60,4,&setup.bits);
    write_int(sound_font,244+80,340+60,4,&setup.rate);
    write(sound_font,450+80,340+60,4,mixer[setup.mixer]);

    define_region(1,346+80,157+60,14+(14*setup.master),15);
    define_region(2,346+80,215+60,14+(14*setup.sound_fx),15);
    define_region(3,346+80,275+60,14+(14*setup.cd_audio),15);
END

//-----------------------------------------------------------------------------------------------

PROCESS volume_slider(region,x,y)

BEGIN
    file=sound_file;
    graph=50;
    x+=80;
    y+=60;
    LOOP
        FRAME;
    END
END

//-----------------------------------------------------------------------------------------------

