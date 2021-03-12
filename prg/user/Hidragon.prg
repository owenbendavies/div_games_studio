/*-----------------------------------------------------------------------------
===============================================================================
PROGRAMING AND ALL GRAPHICS AND SOUND BY PAUL HAMILTON

I REALY ENJOYED MAKING THIS GAME, I HOPE YOU ENJOY PLAYIN IT.
FOR HIDDENDRAGON2 I WANT TO MAKE MORE DIVERSE CHARACTERS AND MOVES, ESPECIALY
SOME SPECIAL MOVES, IVE BEEN MESSIN AROUND WITH FIREBALLS AND ORBITAL FIREBALLS
BUT I FELT THIS GAME FLOWED BETTER WITHOUT THEM. ALSO IVE STARTED TO REDO THE
FIGHTERS SO THEY LOOK MORE LIKE STREETFIGHTER ALPHA STYLE, ANYWAYS ILL SHUT-UP.

===============================================================================
------------------------------------------------------------------------------*/
PROGRAM HIDDENDRAGON;

CONST
    _IDLE=23;
    _forwarding=1;
    _backwarding=2;
    _DUCKING=3;
    _crouched=4;
    _standing_up=5;
    _jumping=6;
    _lowpunch=7;
    _HIGHPUNCH=8;
    _turning_kick=9;
    _normal_kick=10;
    _flying_kick=11;
    _touched=12;
    _dead=13;
    _LANDING=14;
    _HIGHKICK=15;
    _MIDKICK=16;
    _LOWKICK=17;
    _FLYKICK=18;
    _BLOCKING=19;
    _HEADBUT=21;
    _FLYPUNCH=22;
    _BOWING=0;
    _ENDBOWING=24;
    _GESTURE=25;

    JUMP=0;
    DUCK=1;
    forward=2;
    backward=3;
    HITTING=4;
    HITTING2=5;
    //HIGHKICK=5;
    //MIDKICK=6;
    //LOWKICK=7;
    //FLYKICK=8;

    PLAYER1=1; PLAYER2=2; COMPUTER=0; COMPUTER2=3;

GLOBAL
//ANIM0[]=20,20,20,20,20;               //
ANIM0[]=3,3,3,3,3,3,3,3,2,2,2,2,2,2,2,2,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2;//IDLE-BREATHING
//ANIM0[]=1,1,1,1,2,2,2,2,3,3,3,3,2,2,2,2;                     //IDLE-BREATHING

ANIM1[]=20,20,20,20,20,20,20,20,20,20;                       //BLOCK
ANIM2[]=22,22,22,22,22,22,22,22,22,22;                       //TOUCHED
ANIM3[]=30,31,31,32,32,33,33,34,34,35,35,34,34,33,33,32,32,31,31;                                     //WALKING
//ANIM3[]=1,1,2,2,3,3,2,2;
ANIM5[]=11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11;
ANIM6[]=11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,
        12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11,11;              //BOWING
ANIM7[]=7,7,7,7,7,7,7,7,7;                                   //LOWPUNCH
ANIM8[]=8,8,8,8,8,8,8,8,8;                                   //HIGHPUNCH
ANIM9[]=9,9,9,9,9,9,9,9,9;                                   //FLYPUNCH
ANIM10[]=5,5;                                                //JUMP
ANIM11[]=4,4;                                                //DUCK
//ANIM12[]=12,12,12,12;                                        //
ANIM15[]=16,16,16,16,16,16,16,16,16;                         //HIGHKICK
ANIM16[]=15,15,15,15,15,15,15,15,15;                         //MIDKICK
ANIM17[]=14,14,14,14,14,14,14,14,14;                         //SWEEPKICK LOW
ANIM18[]=17,17,17,17,17,17,17,17,17;                         //FLYING KICK
ANIM19[]=18,18,18,18,18,18,19,19,19,19,19,19,18,18,18,18,18; //GESTURE

anim21[]=21,21,21,21,21,21,21,21,21;                         //HEADBUT

ANIM69[]=6,7,8,9,10,11,12,13,14;                    //OLDMAN GO INTO BOTTLE
ANIM70[]=14,14,14,13,13,13,12,12,12,11,11,11,
10,10,10,9,9,9,8,8,8,7,7,7,6,6,6;                   //OLDMAN COME OUT OF BOTTLE

change=false;

RANDCOLOUR;  COLOURSWITCH; COLOUR; OLDMANFPG;
//NEW_COLOUR[247]=112;
NEW_COLOURR[255]=           //RED
   0,1,2,3,4,5,6,7,8,9,1,2,3,13,14,15,17,17,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254;


NEW_COLOURY[255]=           //YELLOW
   0,1,2,3,4,5,6,7,8,9,4,5,6,13,14,15,17,29,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254;


NEW_COLOURB[255]=           //BLUE
   0,1,2,3,4,5,6,7,8,9,7,8,9,13,14,15,17,11,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254;

NEW_COLOURW[255]=           //WHITE
   0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,8,1,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254;

NEW_COLOURK[255]=           //BLACK
   0,1,2,3,4,5,6,7,8,9,19,18,17,13,14,15,20,17,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,14,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254;

new_colourz[255]=            //brown
   0,1,2,3,4,5,6,7,8,9,231,29,70,13,14,15,31,17,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255;



//pallete changes = 10,11,12 - clothing; 16 - belt; 17 - hair;


GRAPHCOUNTER;

/*   0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,
   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,
   40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,
   60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,
   80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,
   100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,
   120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,
   140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,
   160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,
   180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,
   200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,
   220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,
   240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255;

*/



HITX; HITY;
HATX; HATY;


HITGRAPH;

idFIGHTER1,idFIGHTER2,idFIGHTER3;

idcFIGHTER1=1;
idcFIGHTER2=2;
idcFIGHTER3=3;

CFIGHTER1=1;
CFIGHTER2=2;

FIGHTER1,FIGHTER2; YODA;

CANFIGHT=FALSE;

STAGEND=TRUE; STAGE=3;

FPG0; FPG1; FPG2; FPG3;
FPG4; FPG69; FPG6; FPG7;

FNT1; FNT2; FNT3;
TIME=60;

TEXT1; text2;

TITLE; PCM1; PCM2; PCM3; PCM4; PCM10; PCM11; PCM12;
CLIK; CLAP; AAGH;
HIT1; HIT2; LAND1;
                       DIST;
CANFIRE=1;
CANHIT=1;

HIDTEXT; DRATEXT; XVAL=0; YVAL=0;

ENERGY1;  ENERGY0;

VALUE;

name; nametext;

Round=0;

LOCAL
STATE; A_STEP;
INCX,INCY;
ENEMY;
PLAYER;
ENERGY;

BEGIN
LOOP
 IF (STAGEND==TRUE)
  SWITCH(STAGE)
/////////////////////////////////////////////////////// TITLE SCREEN
CASE 1:
(STAGEND=FALSE); LET_ME_ALONE(); SET_FPS(30,0);   FILE=FPG0;
LOAD_PAL("user\hdragon\MENU.FPG");

FPG0=LOAD_FPG("user\hdragon\MENU.FPG");
FNT1=LOAD_FNT("user\hdragon\64FNT1.FNT");
FNT3=LOAD_FNT("user\hdragon\16FNT.FNT");
HIT2=LOAD_PCM("user\hdragon\HIT.PCM",0);
MUSIC();
SET_MODE(M640X480);
PUT_SCREEN(0,1);
WRITE(FNT3,100,460,4,"ENTER TO PLAY");
WRITE(FNT3,540,460,4,"ESCAPE TO EXIT");
text1=WRITE(FNT3,320,10,4,"A Paul Hamilton Game");
text2=WRITE(FNT3,320,20,4,"For MonkeyMookGames");
//TEXTS();
HIDTEXT=WRITE(FNT1,320,0,4,"HIDDEN");
DRATEXT=WRITE(FNT1,320,0,4,"DRAGON");
//XPUT(FPG0,2,800-YVAL,240,0,600,0,0);
BIGHID(4,3200,240,600,30); BIGHID(5,5620,240,600,30);
BIGHID(4,2800,240,600,2); BIGHID(5,5218,240,600,2);
YVAL=0;


  REPEAT
   IF(KEY(_0)) ROUND=0; END
   IF(KEY(_1)) ROUND=1; END
   IF(KEY(_2)) ROUND=2; END
   IF(KEY(_3)) ROUND=3; END
   IF(KEY(_4)) ROUND=4; END
   IF(KEY(_5)) ROUND=5; END
   IF(KEY(_6)) ROUND=6; END
   IF(KEY(_7)) ROUND=7; END
   IF(KEY(_8)) ROUND=8; END
   IF(KEY(_9)) ROUND=9; END

    MOVE_TEXT(HIDTEXT,320,-300+YVAL);
    MOVE_TEXT(DRATEXT,320,780-YVAL);

    MOVE_TEXT(TEXT1,320,340+YVAL);
    MOVE_TEXT(TEXT2,320,360+YVAL);

    IF(YVAL<505) YVAL+=1; END

    IF (NOT FADING AND RAND(0,10)<2)
    fade(rand(20,100),rand(20,100),rand(20,100),1); END


    FRAME;
   IF(KEY(_ESC))EXIT("mmm...CHICKEN",0);END
  UNTIL(KEY(_ENTER) OR MOUSE.LEFT) UNLOAD_FPG(0); DELETE_TEXT(ALL_TEXT);
  stop_sound(all_sound);
  STAGEND=TRUE; STAGE=4;

END
///////////////////////////////////////////////////////FIGHT
CASE 2:
(STAGEND=FALSE);  LET_ME_ALONE(); SET_FPS(30,0);
LOAD_PAL("user\hdragon\CLIFF.FPG");
HIT1=LOAD_PCM("user\hdragon\LAND.PCM",0);
PCM1=LOAD_PCM("user\hdragon\WIND.PCM",1);
LAND1=LOAD_PCM("user\hdragon\ha.PCM",0);
CLAP=LOAD_PCM("user\hdragon\CLAPS.PCM",0);
FNT2=LOAD_FNT("user\hdragon\32FNT.FNT");
FNT3=LOAD_FNT("user\hdragon\16FNT.FNT");
PCM2=LOAD_PCM("user\hdragon\MUSICA5.PCM",0);
PCM4=LOAD_PCM("user\hdragon\TAMBOR9.PCM",1);


SWITCH(IDCFIGHTER1)
 CASE 1: LOAD_FPG("user\hdragon\CLIFF.FPG"); END  //USE THESE AND THEN ADD MORE CASES AND CHANGE PALLETE OF EACH CASE!
 CASE 2: LOAD_FPG("user\hdragon\CLIFF.FPG"); END
END

SWITCH(IDCFIGHTER2)
 CASE 1: LOAD_FPG("user\hdragon\CLIFF.FPG"); END
 CASE 2: LOAD_FPG("user\hdragon\CLIFF.FPG"); END
END


SET_MODE(m640x480);
define_region(1,0,0,640,480);
START_SCROLL(0,0,200,0,1,0);
scroll.x0=300;

SOUND(PCM1,100,256);
SOUND(PCM2,100,256);
SOUND(PCM4,30,256);
LEAFTHROWER();
TEXTS();
THETIME();

//NRG BAR OBJECTS/////////////////////////////////////////////
if(cfighter1==3); OBJECT(30,32,120,100,0);end //PLAYER1s HAIR
OBJECT(35,45,24,100,0);  //PLAYER1s FACE
OBJECT(605,45,24,100,1); //PLAYER2s FACE
OBJECT(602,37,121,160,1);//CPUs HAT
OBJECT(162,42,29,100,4); //NRGBAR1 OUTLINE
OBJECT(478,42,29,100,5); //NRGBAR2 OUTLINE

WRITE(FNT3,547,25,5,"The Monkey King");
WRITE(FNT3,90,25,3,name);
WRITE(FNT3,320,9,4,"TIME");
WRITE(FNT3,90,67,3,"Round");
WRITE_INT(FNT3,160,67,4,&round);
//WRITE_INT(FNT3,100,100,4,&ENERGY1);
//IDFIGHTER3=NECTO(955,350,1,1,COMPUTER,IDCFIGHTER3);
IDFIGHTER2=NECTO(755,350,1,0,computer,-200);
IDFIGHTER1=NECTO(325,350,0,1,player1,-202);

YODA=OLDMAN(542,220);
BOTTLE(540,370);

if(change==true)

FROM GRAPHCOUNTER=1 TO 40;

 IF(CFIGHTER1==1)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURz); END //player1
 IF(CFIGHTER1==2)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURy); END //colours
 IF(CFIGHTER1==3)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURk); END
 IF(CFIGHTER1==4)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURb); END
 IF(CFIGHTER1==5)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURr); END
 IF(CFIGHTER1==6)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURw); END
 IF(CFIGHTER1==7)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURk); END
 IF(CFIGHTER1==8)convert_palette(1,GRAPHCOUNTER,&NEW_COLOURr); END

 IF(CFIGHTER2==1)convert_palette(0,GRAPHCOUNTER,&NEW_COLOURw); END          //computer colours
 IF(CFIGHTER2==2)convert_palette(0,GRAPHCOUNTER,&NEW_COLOURr); END

END
   end

//FROM GRAPHCOUNTER=1 TO 40;
// IF(CFIGHTER2==1)convert_palette(IDCFIGHTER2,GRAPHCOUNTER,&NEW_COLOURw);           //computer colours
// IF(CFIGHTER2==2)convert_palette(IDCFIGHTER2,GRAPHCOUNTER,&NEW_COLOURr); END
//END

FROM GRAPHCOUNTER=1 TO 14;                     //OLDMAN
convert_palette(OLDMANFPG,GRAPHCOUNTER,&NEW_COLOURK);
END

repeat

FIGHTER1=idFIGHTER1;
FIGHTER2=idFIGHTER2;

fighter1.enemy=fighter2;
fighter2.enemy=fighter1;

ENERGY1=FIGHTER1.ENERGY-ROUND;
ENERGY0=FIGHTER2.ENERGY;


scroll.x0=(fighter1.x+fighter2.x)/2-320;
dist=ABS(FIGHTER1.x-FIGHTER2.x);
/*
 if (energy1==0 or ENERGY0==0) SOUND(CLAP,256,256); timer[1]=0;
 IF(ROUND==10) TEXT1=WRITE(FNT2,320,240,4,"A True Champion");
               text2=write(fnt2,320,260,4,"And New Monkey King!");
 END
 IF(ROUND==9) TEXT1=WRITE(FNT2,320,240,4,"Going Well, Stay Strong");
 end
 IF(ROUND==8) TEXT1=WRITE(FNT2,320,240,4,"Not Far Now, Keep It Together");
 end
 IF(ROUND<8 AND ROUND>3) TEXT1=WRITE(FNT1,320,240,4,"Superb");
 end
 if(ROUND<4 AND ROUND>0) TEXT1=write(fnt2,320,240,4,"Excellent");
 END
 IF(ROUND==0) TEXT1=WRITE(FNT2,320,240,4,"Well Done");
 end
 CANFIGHT=FALSE;

 IF(ENERGY1>ENERGY0 AND NOT _JUMPING) FIGHTER1.STATE=_ENDBOWING; round+=1; ELSE FIGHTER2.STATE=_ENDBOWING; round=0; END
///////////////////////////////////////////////MOVE THE END MESSAGE/////////
*/


 if (ENERGY1==0 or ENERGY0==0) SOUND(CLAP,256,256); timer[1]=0;
if(ENERGY1>ENERGY0)
 IF(ROUND==10) TEXT1=WRITE(FNT2,320,240,4,"A True Champion");
               text2=write(fnt2,320,270,4,"And New Monkey King!");
 END
 IF(ROUND==9) TEXT1=WRITE(FNT2,320,240,4,"Going Well, Stay Strong");
 end
 IF(ROUND==8) TEXT1=WRITE(FNT2,320,240,4,"Not Far Now, Keep It Together");
 end
 IF(ROUND<8 AND ROUND>4) TEXT1=WRITE(FNT2,320,240,4,"Superb");
 end
 if(ROUND<5 AND ROUND>1) TEXT1=write(fnt2,320,240,4,"Excellent");
 END
 if(round==1) TEXT1=WRITE(FNT2,320,240,4,"Well Done");
 end
 IF(ROUND==0) TEXT1=WRITE(FNT2,320,240,4,"Good Going");
              TEXT2=WRITE(FNT2,320,270,4,"Now Try With Less Energy");
 end
END
IF(ENERGY0>ENERGY1)
 TEXT1=WRITE(FNT2,320,240,4,"Try Harder Next Time");
END

CANFIGHT=FALSE;



IF(ENERGY1>ENERGY0 AND NOT _JUMPING) FIGHTER1.STATE=_ENDBOWING; round+=1; ELSE FIGHTER2.STATE=_ENDBOWING; round=0; END
///////////////////////////////////////////////MOVE THE END MESSAGE/////////
repeat                                                                  //
  timer[1]++;                                                             //
  MOVE_TEXT(TEXT1,320+RAND(-1,1),240); FRAME;                             //
  until(timer[1]>1000);                                                   //
 STAGEND=TRUE;                                                            //
 end                                                                      //
////////////////////////////////////////////////////////////////////////////
  IF(KEY(_ESC)) STAGEND=TRUE; STAGE=1; END

 FRAME;
 until(MOUSE.LEFT OR STAGEND==TRUE)//WHEN STAGE END/////////////
  DELETE_TEXT(ALL_TEXT); STOP_SOUND(ALL_SOUND);//DELETE ALL FILES///////////
                                                     //
  SIGNAL(TYPE OLDMAN,S_KILL);

  IF(ROUND==11) STAGEND=TRUE; STAGE=5; end                                            //

  LET_ME_ALONE();

  UNLOAD_FPG(0); UNLOAD_FPG(1); UNLOAD_FPG(2);
  UNLOAD_FNT(FNT1); UNLOAD_FNT(FNT2); UNLOAD_FNT(FNT3);                   //

  FRAME;                                             //
END                                                                       //
///////////////////////////////////////////////////////INTRO///////////////
CASE 3:                                                                   //
LET_ME_ALONE();                                                           //
SET_MODE(m320x200);                                                       //
FRAME(4000);                                                              //
FADE_ON();                                                                //
                                                                          //
START_FLI("user\hdragon\MMLOGO.FLI",0,0);                                   //
 REPEAT                                      //VALUE==0 or                              //
  VALUE=FRAME_FLI();                                                      //
   FRAME(150);                                                            //
 UNTIL(SCAN_CODE<>0) END_FLI(); FADE_OFF(); STAGEND=TRUE; STAGE=1;
 FRAME;                                                                   //
END                                                                       //
///////////////////////////////////////////////////////CHARACTER SELECT////
CASE 4:                                                                   //
(STAGEND=FALSE); LET_ME_ALONE();                                          //
LOAD_PAL("user\hdragon\SELECTA.FPG");                                  //
FPG6=LOAD_FPG("user\hdragon\SELECTA.FPG");                             //
FPG7=LOAD_FPG("user\hdragon\CLIFF.FPG");                               //
CLIK=LOAD_PCM("user\hdragon\CLIK.PCM",0);
FNT2=LOAD_FNT("user\hdragon\32FNT.FNT");
FNT3=LOAD_FNT("user\hdragon\16FNT.FNT");
SOUND(PCM12,200,256);
SOUND(PCM4,100,256);
//FPG1=LOAD_FPG("user\hdragon\CLIFF.FPG");                             //
SET_MODE(m640X480); PUT_SCREEN(0,1);                                      //
ROBJECT(320,240,1,200,4,FPG6);
SELECTA();
write(fnt3,320,455,4,"CONTROLS: Arrow Keys to Move, N to Punch, M to Kick");
write(fnt3,320,470,4,"You must push a direction before you kick or punch");
                                                               //                                                                     //
REPEAT                                                                    //                                                                    //                                                      //
 FRAME;
 IF(KEY(_ENTER)) FRAME(100);STAGEND=TRUE;END

 UNTIL(STAGEND==TRUE)
  DELETE_TEXT(ALL_TEXT); //UNLOAD_FPG(FPG6); UNLOAD_FPG(FPG7);
  UNLOAD_FPG(0); UNLOAD_FPG(1); UNLOAD_FNT(FNT2); UNLOAD_FNT(FNT3);
  STOP_SOUND(ALL_SOUND);
  STAGE=2; LET_ME_ALONE();
END
////////////////////////////////////////////////////////
CASE 5:
(STAGEND=FALSE); LET_ME_ALONE();
LOAD_PAL("user\hdragon\SELECTA.FPG");
FPG6=LOAD_FPG("user\hdragon\SELECTA.FPG");
FNT2=LOAD_FNT("user\hdragon\32FNT.FNT");
FNT3=LOAD_FNT("user\hdragon\16FNT.FNT");

SET_MODE(m640X480); PUT_SCREEN(0,1);
ROBJECT(320,240,1,200,4,FPG6);

WRITE(FNT2,320,240,4,"You've Completed Survival Mode!");
WRITE(FNT2,320,280,4,"Look out for updates soon!");
WRITE(FNT2,320,460,4,"MONKEYMOOK@YAHOO.CO.UK");

REPEAT
 FRAME;
 IF(SCAN_CODE<>0) STAGEND=TRUE;END
 UNTIL(SCAN_CODE<>0 OR STAGEND==TRUE)
  DELETE_TEXT(ALL_TEXT); //UNLOAD_FPG(FPG6); UNLOAD_FPG(FPG7);
  UNLOAD_FPG(0); UNLOAD_FNT(FNT2); UNLOAD_FNT(FNT3);
  EXIT("THANK YOU FOR PLAYING",0); STAGE=3; LET_ME_ALONE();
END
////////////////////////////////////////////////////////
  END
 END
FRAME;
END
END
////////////////////////////////////////////////////////
PROCESS MUSIC();
BEGIN

PCM10=LOAD_PCM("user\hdragon\DRUMROLL.PCM",0);
PCM11=LOAD_PCM("user\hdragon\TAMBOR.PCM",0);
PCM12=LOAD_PCM("user\hdragon\GONG.PCM",0);
PCM4=LOAD_PCM("user\hdragon\TAMBOR9.PCM",1);
PCM3=LOAD_PCM("user\hdragon\MUSICA6.PCM",0);

TIMER[0]=0;
REPEAT
FRAME;
UNTIL(TIMER[0]>0) SOUND(PCM10,200,256); //-----------=DRUMROLL
REPEAT
FRAME;
UNTIL(TIMER[0]>600) SOUND(PCM11,200,256); //-----------=DUNG
REPEAT
FRAME;
UNTIL(TIMER[0]>700) SOUND(PCM11,200,256); //-----------=DUNG
REPEAT
FRAME;
UNTIL(TIMER[0]>800) SOUND(PCM11,200,256); //-----------=DUNG
REPEAT
FRAME;
UNTIL(TIMER[0]>900) SOUND(PCM12,200,256);SOUND(PCM4,100,256);//STOP_SOUND(ALL_SOUND);
REPEAT
FRAME;
UNTIL(TIMER[0]>1700) SOUND(PCM3,100,256);

END



////////////////////////////////////////////////////////END OF GAME LOOP
PROCESS SELECTA();
BEGIN

FILE=FPG7;
//SQUARES/////////////////////////////////////////////////////////////////////////
MOBJECT(227,358,25,100,4); MOBJECT(289,358,25,100,4); MOBJECT(351,358,25,100,4); MOBJECT(413,358,25,100,4);
MOBJECT(227,420,25,100,4); MOBJECT(289,420,25,100,4); MOBJECT(351,420,25,100,4); MOBJECT(413,420,25,100,4);
//afros/////////////////////////////////////////////////////////////////////////
MOBJECT(354,347,120,100,1);//MOBJECT(354,412,120,100,1);
//FACES////////////////////////////////////////////////////////////////////////////
MOBJECT(227,358,24,100,0); MOBJECT(289,358,45,100,0); MOBJECT(351,358,24,100,1); MOBJECT(413,358,43,100,1);
MOBJECT(227,420,24,100,0); MOBJECT(289,420,44,100,0); MOBJECT(351,420,24,100,1); MOBJECT(413,420,24,100,1);
//SELECTION BOX/////////////////////////////////////////////////////////////////////////
MOVABOX(227,358);
//COLOURED SHIRTS//////////////////////////////////////////////////////////
MOBJECT(223,378,42,100,0); MOBJECT(285,378,38,100,0); MOBJECT(354,378,40,100,1); MOBJECT(416,378,39,100,1);
MOBJECT(223,440,36,100,0); MOBJECT(285,440,37,100,0); MOBJECT(354,440,40,100,1); MOBJECT(416,440,36,100,1);



//TEXTS////////////////////////////////////////////////////////////////////
WRITE(FNT2,320,50,4,"SELECT YOUR FIGHTER");

//WRITE_INT(FNT2,320,240,4,&CFIGHTER1);
//WRITE_INT(FNT2,220,240,4,&COLOURSWITCH);

FRAME;
END
//////////////////////////////////////////////////////////
PROCESS MOBJECT(X,Y,GRAPH,SIZE,FLAGS);
BEGIN
CTYPE=C_SCREEN; FILE=FPG7;
LOOP
FRAME;
END
END
//////////////////////////////////////////////////////////
PROCESS ZOBJECT(X,Y,GRAPH,SIZE,FLAGS,FILE,ROTA);
BEGIN
CTYPE=C_SCREEN; //FILE=FPG6;
LOOP
IF(X<FATHER.X) X+=20; END
IF(X>FATHER.X) X-=20; END
IF(Y<FATHER.Y) Y+=20; END
IF(Y>FATHER.Y) Y-=20; END
delete_text(nametext);nametext=WRITE(FNT2,320,300,4,name);
ANGLE+=ROTA;  Z+=20;
FRAME;
END
END
//////////////////////////////////////////////////////////
PROCESS LOBJECT(X,Y,GRAPH,SIZE,FLAGS);
BEGIN
CTYPE=C_SCREEN; FILE=FPG6;
LOOP
ANGLE-=500;
FRAME;
END
END
//////////////////////////////////////////////////////////
PROCESS ROBJECT(X,Y,GRAPH,SIZE,FLAGS,FILE);
BEGIN
CTYPE=C_SCREEN; FILE=FPG6;
LOOP
ANGLE+=1000;
FRAME;
END
END
//////////////////////////////////////////////////////////
PROCESS MOVABOX(X,Y);
BEGIN
CTYPE=C_SCREEN; FILE=FPG7; GRAPH=27; FLAGS=4; name="The Spaniard";//Z=+200;
nametext=WRITE(FNT2,320,300,4,name);
ZOBJECT(X,Y,27,100,0,FPG7,6000);
ZOBJECT(X,Y,27,100,0,FPG7,4000);
ZOBJECT(X,Y,27,100,0,FPG7,2000);
 LOOP
  IF(Y==358)
   IF(X==227) CFIGHTER1=1; name="Mike Green"; END
   IF(X==289) CFIGHTER1=2; name="Eddie"; END
   IF(X==351) CFIGHTER1=3; name="Tyler"; END
   IF(X==413) CFIGHTER1=4; name="DanX"; END
  END
  IF(Y==420)
   IF(X==227) CFIGHTER1=5; name="Scribbley"; END
   IF(X==289) CFIGHTER1=6; name="Uass Mooncha"; END
   IF(X==351) CFIGHTER1=7; name="MonkeyMook"; END
   IF(X==413) CFIGHTER1=8; name="Johnny Knocksville"; END
  END
  IF(KEY(_RIGHT)) X+=62; SOUND(CLIK,100,256); END//delete_text(nametext);nametext=WRITE(FNT2,320,300,4,name); END
  IF(KEY(_LEFT))  X-=62; SOUND(CLIK,100,156); END//delete_text(nametext);nametext=WRITE(FNT2,320,300,4,name); END
  IF(KEY(_UP))    Y-=62; SOUND(CLIK,100,256); END//delete_text(nametext);nametext=WRITE(FNT2,320,300,4,name); END
  IF(KEY(_DOWN))  Y+=62; SOUND(CLIK,100,156); END//delete_text(nametext);nametext=WRITE(FNT2,320,300,4,name); END
  IF(Y<358)Y=358;END IF(Y>420)Y=420;END
  IF(X<227)X=227;END IF(X>413)X=413;END
IF(KEY(_ENTER))change=true;end
 FRAME;
 END
END
//////////////////////////////////////////////////////////
PROCESS CONTROL(ACTION)
BEGIN
IF(CANFIGHT==TRUE)
 SWITCH(FATHER.PLAYER)
  CASE PLAYER1:
   SWITCH(ACTION)
     CASE FORWARD:
      IF(FATHER.FLAGS)
        RETURN(KEY(_RIGHT));
      ELSE
        RETURN(KEY(_LEFT));
      END
     END
     CASE BACKWARD:
      IF(FATHER.FLAGS)
        RETURN(KEY(_LEFT));
      ELSE
        RETURN(KEY(_RIGHT));
      END
     END
     CASE JUMP:
        RETURN(KEY(_UP));
     END
     CASE DUCK:
        RETURN(KEY(_DOWN));
     END
     CASE HITTING:
        RETURN(KEY(_M));
     END
     CASE HITTING2:
        RETURN(KEY(_N));
     END
   END
  END

  CASE PLAYER2:
   SWITCH(ACTION)
     CASE FORWARD:
        RETURN(JOY.RIGHT);
     END
     CASE BACKWARD:
        RETURN(JOY.LEFT);
     END
     CASE JUMP:
        RETURN(JOY.UP);
     END
     CASE DUCK:
        RETURN(JOY.DOWN);
     END
     CASE HITTING:
        RETURN(JOY.BUTTON1);
     END
   END
  END
//////////////////////////////////////////////////////////////////////////
  CASE COMPUTER2:        //JUMPER
   SWITCH(FATHER.STATE)
    CASE _IDLE:
     SWITCH(ACTION)
      CASE JUMP:
       IF(RAND(0,5)<5) RETURN(1); END
      END
     END
    END
/*  CASE _jumping:
     SWITCH(action)
      CASE hitTING:
       IF (rand(0,10)==0) RETURN(1); END
      END
     END
    END
   */
   END
   RETURN(0);
  END
//////////////////////////////////////////////////////////////////////////
  CASE COMPUTER:

   SWITCH(FATHER.STATE)
    CASE _IDLE:
     SWITCH(ACTION)

      CASE BACKward:     //(FORWARDS)
       IF (dist>120)
        IF (rand(0,4)==0) RETURN(1); END
         ELSE
         IF (dist<120 AND rand(0,8)==0) RETURN(1); END
       END
      END

      CASE FORward:     //(BACKWARDS)

       IF (dist<60 AND rand(0,2)==0) RETURN(1); END
       //IF (dist<180 AND rand(0,50)==0) RETURN(1); END
      END

      CASE DUCK:
       IF(DIST<100 AND RAND(0,35)==0) RETURN(1); END
      END
      CASE JUMP:
       IF(DIST<200 AND RAND(0,25)==0) RETURN(1); END
      END
      //CASE HITTING:
       //IF(DIST<180 AND DIST>60 AND RAND(0,5)==0) RETURN(1); END
      //END
     END
    END
                   CASE _forwarding:
                    SWITCH(action)
                        CASE jump:
                            IF (dist>180 AND dist<300 AND rand(0,800)==0)
                                RETURN(1);
                            END
                        END
                        CASE HITTING:
                            IF (dist>40 AND dist<80 AND rand(0,20)==0)
                                RETURN(1);
                            END
                        END
                        CASE hitTING2:
                            IF (DIST>20 AND dist<40 AND rand(0,2)==0)
                                RETURN(1);
                            END
                        END

                    END
                END
                CASE _backwarding:
                    SWITCH(action)
                        CASE jump:
                            IF (dist<120 AND rand(0,600)==0)
                                RETURN(1);
                            END
                        END
                        CASE hitTING:
                            IF (DIST>40 AND dist<80 AND rand(0,20)==0)
                                RETURN(1);
                            END
                        END
                        CASE hitTING2:
                            IF (DIST>20 AND dist<40 AND rand(0,10)==0)
                                RETURN(1);
                            END
                        END

                    END
                END
                CASE _DUCKING:
                    SWITCH(action)
                        CASE DUCK:
                            IF (rand(0,5)<>0)
                                RETURN(1);
                            END
                        END
                        CASE hitTING:
                            IF (dist<180 AND rand(0,5)==0)
                                RETURN(1);
                            END
                        END
                    END
                END
                CASE _jumping:
                    SWITCH(action)
                        CASE hitTING:
                            IF (rand(0,10)==0)
                                RETURN(1);
                            END
                        END
                    END
                END
                /*CASE _HITTING:
                 SWITCH(ACTION)
                  CASE _HIGHKICK:
                   IF (rand(0,10)<10) RETURN(1); END
                  END
                 END
                END

                CASE _HIGHKICK:
                 IF (RAND(0,10)<10) RETURN(1); END
                END
                */

   END
   RETURN(0);
  END
END
 END
END
////////////////////////////////////


PROCESS NECTO(X,Y,FLAGS,FILE,PLAYER,Z);
PRIVATE
    NEW_STATE;
    NEW_STEP;
    BOWSTATE;
BEGIN
CTYPE=C_SCROLL;     //Z=-200;

SIZE=100;
ENERGY=11;
//IF(ROUND==1)
//FIGHTER1.ENERGY=5; ENERGY0=11;
//END
ENERGYBAR1();
ENERGYBAR2();
FRAME;
SHADOW(100,420,150);
//RING(X,Y,4);
FIGHTER1=idFIGHTER1;
FIGHTER2=idFIGHTER2;


//fighter1.enemy=fighter2;
//fighter2.enemy=fighter1;

 LOOP
   NEW_STATE=STATE;
    //IF(CANFIGHT==FALSE) STATE=23; END

    SWITCH(STATE)
        CASE _BOWING:
           GRAPH=anim6[a_step++];
           IF (a_step==sizeof(anim6))
            a_step=0;
            NEW_STATE=_IDLE;
           END
        END

        CASE _ENDBOWING:
           IF(Y<350) Y++; END
           GRAPH=anim5[a_step++];
           IF (a_step==sizeof(anim5))
            a_step=0;
            NEW_STATE=_GESTURE;
           END
        END

        CASE _GESTURE:
           GRAPH=anim19[a_step++];
           IF(A_STEP>6 AND A_STEP<13) Y=343; ELSE Y=350; END

           IF (a_step==sizeof(anim19))
            a_step=0;
            NEW_STATE=_IDLE;
           END
        END


        CASE _IDLE:
           GRAPH=anim0[a_step++]; //FRAME();
           IF (a_step==sizeof(anim0))
            a_step=0;
           END

           IF (a_step>1) INCX=0; END

           //suspect
           IF (flags)
            IF (enemy.x>x) flags=0; END
           ELSE
            IF (enemy.x<x) flags=1; END
           END
           //

           IF(CONTROL(FORWARD)) NEW_STATE=_FORWARDING;    END
           IF(CONTROL(BACKWARD)) NEW_STATE=_BACKWARDING;  END
           IF(CONTROL(JUMP)) NEW_STATE=_JUMPING; INCY=-16;END
           IF(CONTROL(DUCK)) NEW_STATE=_DUCKING;          END
           IF(CONTROL(HITTING))  NEW_STATE=_IDLE; END
           IF(CONTROL(HITTING2))  NEW_STATE=_IDLE; END

          //IF(ENERGY==0) NEW_STATE=_DEAD; END
        END

        CASE _FORWARDING:
           GRAPH=anim3[a_step++];
           IF (a_step==sizeof(anim3)) NEW_STATE=_IDLE;END

           IF(FLAGS)
             X+=4;
           ELSE
             X-=4;
           END

           IF(CONTROL(HITTING))
              NEW_STATE=_MIDKICK;
           END

           IF(CONTROL(HITTING2))
              NEW_STATE=_Headbut;
           END


           IF (control(jump))
              new_state=_jumping;
              incy=-16;
              IF(FLAGS)
               incx=12;
              ELSE
               INCX=-12;
              END
           END
        END

        CASE _BACKWARDING:
           GRAPH=anim3[a_step++];
           IF (a_step==sizeof(anim3)) NEW_STATE=_IDLE;END

           IF(FLAGS)
             X-=4;
           ELSE
             X+=4;
           END

           IF(CONTROL(HITTING))
              NEW_STATE=_HIGHKICK;
           END

           IF(CONTROL(HITTING2))
              NEW_STATE=_highpunch;
           END


           IF (control(jump))
              new_state=_jumping;
              incy=-16;
              IF(FLAGS)
               incx=-8;
              ELSE
               INCX=8;
              END
           END
        END


            CASE _jumping:                // Checks if you are jumping
                graph=anim10[a_step++];    // Animates the graphics
                IF (a_step==SIZEOF(ANIM10)) A_STEP=0; END           // If the animation's point has been reached
                    x+=incx;             // Moves the character
                    y+=incy*3;
                    incy+=2;           // Changes the increment so it bounces
                    IF (y>=350)         // Checks if it has touched the floor
                        y=350;
                        //dust(x,y);     // Creates a dust cloud when falling
                        // Looks if you want to jump again
                        IF (control(jump))
                            new_state=_IDLE;
                        ELSE
                            new_state=_DUCKING;
                        END
                    END
                //END
                IF (control(hitTING))       // Checks if you want to hit
                    new_state=_flykick;
                    new_step=a_step;
                END

                IF (control(hitTING2))       // Checks if you want to hit
                    new_state=_flyPUNCH;
                    new_step=a_step;
                END


            END


        CASE _DUCKING:
           //GRAPH=4;
           graph=anim11[a_step++];
           IF (a_step==SIZEOF(ANIM11)) A_STEP=0; END

           IF(NOT CONTROL(DUCK)) NEW_STATE=_IDLE;
           /* IF(CANHIT==1)
             SOUND(LAND1,256,RAND(250,350));
              IF(KEY(_CONTROL)) CANHIT=0; END
            END  */
           END
           IF(CONTROL(HITTING))
              NEW_STATE=_LOWKICK;
           END
           IF(CONTROL(HITTING2))
              NEW_STATE=_LOWPUNCH;
           END


        END

        CASE _BLOCKING:
           GRAPH=anim1[a_step++];
           IF (a_step==sizeof(anim1))
            NEW_STATE=_IDLE;
           END
           IF(A_STEP==4)
            SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
           END

        END

        CASE _headbut:
           GRAPH=anim21[a_step++];
           IF (a_step==sizeof(anim21))
            NEW_STATE=_IDLE;
           END
           IF(A_STEP==4)
            SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
            //AHAT(HATX,HATY).ANGLE=+45;
           END

        END

        CASE _HIGHpunch:
           GRAPH=anim8[a_step++];
           IF (a_step==sizeof(anim8))
            NEW_STATE=_IDLE;
           END
           IF(A_STEP==4)
            SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
           END
        END

        CASE _LOWpunch:
           GRAPH=anim7[a_step++];
           IF (a_step==sizeof(anim7))
            NEW_STATE=_DUCKING;
           END
           IF(A_STEP==4)
            SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
           END
        END

        CASE _flyPUNCH:     // Checks the flying PUNCH
         graph=anim9[a_step++];
         IF (a_step==SIZEOF(ANIM9)) A_STEP=0; END
          x+=incx;
          y+=incy*3;
          incy+=2;
           IF (y>=350)
            y=350;
         //dust(x,y);
            IF (control(jump))
               new_state=_IDLE;
            ELSE
               new_state=_DUCKING;
            END
           END
                //END
           IF (a_step==4)
            sound(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
                    //IF (hit_strength[4]>2)
                    //    hit_strength[4]--;
                    //END
           END
        END


        CASE _LOWKICK:
           GRAPH=anim17[a_step++];
           IF (a_step==sizeof(anim17))
            NEW_STATE=_DUCKING;
           END
           IF(A_STEP==4)
            SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
           END
        END

        CASE _MIDKICK:
           GRAPH=anim16[a_step++];
           IF (a_step==sizeof(anim16))
            NEW_STATE=_IDLE;
           END
           IF(A_STEP==4)
            SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);//,hit_strength[4]);
           END
        END

        CASE _HIGHKICK:
           GRAPH=anim15[a_step++];
           IF (a_step==sizeof(anim15))
            NEW_STATE=_IDLE;
           END
            IF(A_STEP==4)
             SOUND(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
           END
        END


        CASE _flykick:     // Checks the flying kick
         graph=anim18[a_step++];
         IF (a_step==SIZEOF(ANIM18)) A_STEP=0; END
          x+=incx;
          y+=incy*3;
          incy+=2;
           IF (y>=350)
            y=350;
         //dust(x,y);
            IF (control(jump))
               new_state=_IDLE;
            ELSE
               new_state=_DUCKING;
            END
           END
                //END
           IF (a_step==4)
            sound(HIT1,100,200);
            get_real_point(1,&hitx,&hity);
            ahit(hitx,hity);
                    //IF (hit_strength[4]>2)
                    //    hit_strength[4]--;
                    //END
           END
        END

        CASE _TOUCHED:
         GRAPH=ANIM0[A_STEP++];
         IF (A_STEP==SIZEOF(ANIM0));
         //SOUND
         NEW_STATE=_IDLE;
         Y=350;
         END
         //HITSTAR(HITX,HITY);
         X+=INCX;
         IF(INCX<0) INCX++; END
         IF(INCX>0) INCX--; END
         IF(Y<350) Y+=16; END
         IF(Y>350) Y=350; END
        END

        CASE _DEAD:
         GRAPH=10;
          IF (Y<370) Y+=16;
           IF(FIGHTER1.X>FIGHTER2.X) X-=20;ELSE X+=20; END
          END
        END

    END

        IF (state<>new_state)
            state=new_state;
            a_step=new_step;
            new_step=0;
        END

        IF (x<50)
            x=50;
        END
        IF (x>1070)
            x=1070;
        END

IF(PLAYER==PLAYER1)
 get_real_point(10,&hatx,&haty);
 if(cfighter1==3);// or cfighter1==7);
 ahat(hatx,haty,120); end  HITGRAPH=51;
END

IF(PLAYER==COMPUTER)
 get_real_point(10,&hatx,&haty);
 ahat(hatx,haty,121);   HITGRAPH=52;
END


   FRAME;
 END
END
///////////////////////////////////////////////////////////
PROCESS ENERGYBAR1();

PRIVATE
 wide;

BEGIN
region=9; x=156; y=37; z=100; graph=28; FLAGS=0;

IF(ROUND==0) wide=-30; END
IF(ROUND==1) wide=3; END
IF(ROUND==2) wide=36; END
IF(ROUND==3) wide=69; END
IF(ROUND==4) wide=102; END
IF(ROUND==5) wide=135; END
IF(ROUND==6) wide=168; END
IF(ROUND==7) wide=201; END
IF(ROUND==8) wide=230; END
IF(ROUND==9) wide=255; END
IF(ROUND==10) wide=280; END


energy=energy1;
define_region(9,WIDE,2,310,72);
 LOOP
   WHILE (energy==energy1)
     FRAME;
   END

   wide=wide+33;
   IF (wide>308) wide=308; END
   define_region(9,WIDE,2,310,72);
   energy=energy1;

 END
END
///////////////////////////////////////////////////////////
PROCESS ENERGYBAR2();

PRIVATE
 wide2;

BEGIN
region=10; x=484; y=37; z=100; graph=28; FLAGS=1; wide2=342;

energy=energy0;
define_region(10,329,2,WIDE2,72);
 LOOP
   WHILE (energy==energy0)
     FRAME;
   END

   wide2=wide2-33;
   IF (wide2<1) wide2=1; END
   define_region(10,329,2,WIDE2,72);
   energy=energy0;

 END
END
//////////////////////////////////////////////////////////
PROCESS ahit(x,y); //,DAMAGE);

PRIVATE
    characters_id; // Identifier to the characters
    counter0;      // General purpouse counter

BEGIN
    ctype=c_scroll;     // Introduces the process within the scroll
    z=-1;               // Puts it before the characters
    graph=101;          // Chooses the graphic of a ball, so it embraces a bigger region
    // Checks if a character is being touched
    characters_id=collision(type NECTO);
    IF (characters_id==father)      // And that it is not the same that called this process
        characters_id=collision(type NECTO);  // If it is the same, it tries to take the other identifier
    END
        IF(ENERGY1<1)
         FIGHTER1.ENERGY=0;
         FIGHTER1.state=_dead;
        END

    IF (characters_id)              // If it has touched
        // Plays a sound randomly from the available ones
        /*SWITCH (rand(0,2))
            CASE 0:
                sound(s_touched1,rand(25,75),256);
            END
            CASE 1:
                sound(s_touched2,rand(25,75),256);
            END
            CASE 2:
                sound(s_touched3,rand(25,75),256);
            END
        END */
        SOUND(HIT2,RAND(150,256),RAND(320,350));
        characters_id.a_step=0;             // Refreshes the animation of the character that has been touched
        //IDFIGHTER1.ENERGY-=1;
        CHARACTERS_ID.energy-=1;//damage/2;     // Substracts him energy
        IF (characters_id.energy<=0)        // If he has no energy left
         characters_id.energy=0;         // Is because he is dead
         characters_id.state=_dead;

         //game_state=2;
        ELSE
            characters_id.state=_TOUCHED;   // Or else, he has been just touched
        END
        IF (characters_id.flags)            // Moves the graphic a bit backwards
            characters_id.incx=15;
        ELSE
            characters_id.incx=-15;
        END

        //IF(PLAYER==PLAYER1) HITSTAR(X,Y,); END
        //IF(PLAYER==COMPUTER)
        HITSTAR(X,Y,HITGRAPH);
        FATHER.Z=-3;
        FATHER.ENEMY.Z=-1;
        /*SWITCH(blood)          // Creates the blood
            // Depending on the chosen level on the options
            CASE 0:     // Hit with no blood at all
                noblood_hit(x,y);
            END
            CASE 1:     // Hit with blood
                counter0=damage/3+1;
                WHILE (counter0>0)
                    blood_particle(x,y,characters_id.inc_x+rand(-2,2),rand(-4,0),rand(10,20));
                    counter0--;
                END
            END
            CASE 2:    // Hit with a lot of blood
                counter0=damage+2;
                WHILE (counter0>0)
                    blood_particle(x,y,characters_id.inc_x*2+rand(-4,4),rand(-8,2),rand(15,30));
                    counter0--;
                END
            END
        END   */
    END
END
///////////////////////////////////////////////////////////
PROCESS HITSTAR(X,Y,GRAPH);
BEGIN
CTYPE=C_SCROLL;
//GRAPH=23;
FLAGS=4;

LOOP
//IF(PLAYER==PLAYER1)GRAPH=22;
//ELSE GRAPH=23;
//END


SIZE-=5; ANGLE+=30000;
IF(SIZE<0) SIGNAL(ID,S_KILL); END
FRAME;
END
END

////////////////////////////////////////////////////////////
PROCESS AHAT(X,Y,GRAPH);
BEGIN
CTYPE=C_SCROLL; Z=FATHER.Z+1; FLAGS=FATHER.FLAGS; file=FATHER.FILE;
IF(FATHER.PLAYER==COMPUTER)
 Z=FATHER.Z-1;SIZE=160;
 IF(FLAGS)X=X-7;Y=Y+2;ELSE X=X+7;Y=Y+2;END
END
FRAME;
END
//////////////////////////////////////////////////////////
PROCESS OBJECT(X,Y,GRAPH,SIZE,FLAGS);
BEGIN
CTYPE=C_SCREEN;
LOOP
FRAME;
END
END
////////////////////////////////////////////////////////
PROCESS SHADOW(X,Y,SIZE);
BEGIN
ctype=c_scroll; priority=-1;
graph=100; z=100; FLAGS=4;

  LOOP
    x=FATHER.x;
    SIZE=(FATHER.Y+70)/3;

    FRAME;
  END
END
//////////////////////////////////////////////////////////////
PROCESS FIREBALL(X,Y,FLAGS,SIZE);
BEGIN
ctype=c_scroll; graph=110; Z=100;

    REPEAT
      IF(FLAGS)FLAGS+=4; X-=RAND(1,2); ELSE FLAGS+=4; X+=RAND(1,2);END

      IF(SIZE<40) SIZE++; END

      FRAME(4);
    UNTIL(OUT_REGION(ID,1));
END
/////////////////////////////////////////////////////////////////
PROCESS BOTTLE(X,Y);
BEGIN
GRAPH=15; FILE=OLDMANFPG; CTYPE=C_SCROLL; SIZE=40; Z=+99;
LOOP
 IF(TIMER[1]>200 AND TIMER[1]<500)
  IF(Y<372)Y+=1;END
  IF(Y==372)Y=370;END
   STARS(X,Y-20,22,20);
   STARS(X,Y-20,23,5);
 END
FRAME;
END
END
////////////////////////////////////////////////////////////////////
PROCESS STARS(X,Y,GRAPH,SIZE);
BEGIN
FILE=1; CTYPE=C_SCROLL; FLAGS=4; Z=+202;
LOOP
IF(TIMER[1]<500) Y-=4; X+=RAND(-2,+2); ANGLE+=99999; END
IF(Y<300 OR TIMER[1]>500) SIGNAL(ID,S_KILL); END

FRAME;
END
END

//////////////////////////////////////////////////////////////////
PROCESS OLDMAN(X,Y);
BEGIN
CTYPE=C_SCROLL;  STATE=5; Z=+98;

OLDMANFPG=LOAD_FPG("user\hdragon\OLDMAN.FPG");
FILE=OLDMANFPG;

TIMER[1]=0;
LOOP
TIMER[1]++;
 SWITCH(STATE)
  //////////////////////////////////////COMING OUT OF THE BOTTLE/////////////
  CASE 1:                                                                  //
  GRAPH=anim70[a_step++];  Y-=2;                                           //
  IF (a_step==sizeof(anim70))                                              //
  A_STEP=0; SHADOW(100,420,50);                                            //
  STATE=2;                                                                 //
  END END                                                                  //
  //////////////////////////////////////FLOATING DOWN TO GROUND//////////////
  CASE 2:                                                                  //
  GRAPH=5;  IF(TIMER[1]>1100 AND Y==350)STATE=3; CANFIGHT=TRUE; END        //
  END                                                                      //
  //////////////////////////////////////GOING BACK INTO BOTTLE///////////////
  CASE 3:                                                                  //
  GRAPH=anim69[a_step++];  Y-=12;                                          //
  IF (a_step==sizeof(anim69))                                              //
  A_STEP=0; SIGNAL(SON,S_KILL);                                            //
  STATE=4;                                                                 //
  END END                                                                  //
  //////////////////////////////////////ASLEEP IN THE BOTTLE/////////////////
  CASE 4:                                                                  //
  GRAPH=1;                                                                 //
  END                                                                      //
  //////////////////////////////////////STARTING STATE///////////////////////
  CASE 5:                                                                  //
  GRAPH=1;                                                                 //
  IF(TIMER[1]>300) STATE=1; END                                            //
  END                                                                      //
 END                                                                       //
/////////////////////////////////////////////////////////////////////////////
IF(Y<350)Y++;END                                                           //
FRAME;                                                                     //
END                                                                        //
END                                                                        //
////////////////////////////////////////////////////////////////////////////
PROCESS THETIME();                                                         //
BEGIN                                                                      //
TIME=60;                                                                   //
//WHILE(TIME==60) WRITE(FNT2,320,240,4,"ROUND ONE"); FRAME; END            //
                                                                           //
LOOP                                                                       //
IF(CANFIGHT==TRUE)                                                         //
                                                                           //
REPEAT                                                                     //
 IF (TIME=<300); TIME--; FRAME(3000); END                                  //


  IF (TIME==0) TIME=0; //WRITE(FNT2,320,240,4,"DRAW!");
   TIMER[1]=0; YODA.STATE=5;
   stagend=true; stage+=1;
   FRAME;
  END
UNTIL(TIME==0 OR TIME==60);  CANFIGHT=FALSE;

END
FRAME;
END
END
////////////////////////////////////////////////////////////////
PROCESS TEXTS();
BEGIN
//WRITE(FNT1,320,40,4,"TIME");
//WRITE_INT(FNT2,50,20,4,&YVAL);
//WRITE_INT(FNT2,50,440,4,&XVAL);
//WRITE(FNT1,320,40,4,"TIME");

//WRITE_INT(FNT2,110,40,4,&ENERGY1);
//WRITE_INT(FNT2,530,40,4,&ENERGY0);
//WRITE_INT(FNT2,320,440,4,&DIST);
WRITE_INT(FNT2,320,32,4,&TIME);

FRAME;
END
/////////////////////////////////////////////////////////////////
PROCESS LEAF(GRAPH,SPEED,Y);
BEGIN
X=640;  FLAGS=4; Z+=101; SIZE=RAND(80,150); ANGLE=RAND(-180000,270000);
REPEAT
X-=SPEED;
ANGLE+=10000;
FRAME;
UNTIL (X<-100); SIGNAL(ID,S_KILL);
END
/////////////////////////////////////////////////////////////////
PROCESS LEAFTHROWER();
BEGIN
LOOP
IF (RAND(0,100)<30)
LEAF(150,20,RAND(0,480)); END
FRAME;
END
END
//////////////////////////////////////////////////////
PROCESS BIGHID(GRAPH,X,Y,SIZE,SPEED);
BEGIN  FLAGS=4;
LOOP
X-=SPEED;
FRAME;
END
END
///////////////////////////////ORBITAL FIREBALL///////////////////////
/*
PROCESS RING(X,Y,flags);

PRIVATE
    point;
    x_point;
    y_point;

BEGIN
    CTYPE=C_SCROLL;
    Z=+201;
    graph=170;
    LOOP
    x=FIGHTER1.X;
    y=FIGHTER1.Y;

        FROM point=1 TO 8;

        get_real_point(point, offset x_point, offset y_point);

        process_marker(x_point, y_point, 171);
        END
        angle+=10000;
        FRAME;
    END
END

PROCESS process_marker(x, y, graph);
BEGIN
CTYPE=C_SCROLL;

FLAGS=4;  Z=+201;

FRAME;
END
      */
