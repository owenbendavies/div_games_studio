/*
  programme:  DIV LIVE ON THE ROAD
  Auteur:     Dereumaux H
  Groupe:     Artificial Dreams
  Version:    1.1
  Date:       13/09/2001


  Description:
    Live on the road est une course d'auto type "out run"

  Scenario:
    route
  Modifications:
    Nouveaux graphiques:
      - decors: Arbres, eclairage, panneaux, batiments
      - voitures: Camion, pick-up, decapotable, autres voitures
      - le background: la mer, la montagne, le desert, la ville

 Version:1.0 Certation du main process
 Version:1.1 Ammelioration de l'animation
 Version:1.2 repositionnement des obstacles +
             Editeur de parcours

*/
program route;
const
  max=2500;             // longeur maxi du circuit
  screen_x=640;         // Taille ecran en X
  screen_y=480;         // Taille ecran en Y

global
  status;

  struct circuit[2500];// longeur du circuit
    pos_x;              // virage
    pos_Y;              // montee
    graf;               // graphique route
    dec_g;              // decor a gauche
    dec_d;              // Decor a droite
    decG_x;             // position X a gauche
    decD_x;             // position X a droite
  end

  cxx; cyy;             // variables pour calcul position route
  struct regen[112];    // Tableau contenant les coords route
    pos_x;              // position X
    pos_Y;              // position Y
    taille;             // taille du block
  end

  struct moto[10];      // Tableau pour les concurrents
    pos_x;              // Position X sur la route
    km;                 // km parcouru
    image;              // image du motard
    d_angle;            // angle du zigzag
  end

  struct bike[7];       // listes des concurrents
    image[8];           // images correspondantes
  end
  =
  34,33,32,31,30,31,32,33,34,
  39,38,37,36,35,36,37,38,39,
  44,43,42,41,40,41,42,43,44,
  49,48,47,46,45,46,47,48,49,
  54,53,52,51,50,51,52,53,54,
  59,58,57,56,55,56,57,58,59,
  64,63,62,61,60,61,62,63,64,
  69,68,67,66,65,66,67,68,69;

  niveau_sol;           // position de la ligne d'horizon
  pos_sol;              // position du sol en fonction de la route
  pos=0;                // km parcouru
  id_fntA;              // font du temps
  id_fntB;              // font du score
  id_fntc;              // font de la vitesse

  score;                // le score du joueur
  temps;                // temps restant
  vitesse;              // vitesse du joueur
  heros_x;              // position X du heros sur la route
  heros_status;         // Status du heros
                        // 0 = normal 1 = perdu
  mode;       // selection de  mode d'affichage
              // pour les machines lentes  0
              // pour les machines rapides 4
  id_mbike;
  id_level;
  level;

  id_sounda;
  id_soundb;
  id_soundc;
  id_soundd;
  id_sounde;
  id_soundf;
  channela;
  channelb;
  channelc;
  channeld;
  channele;

local
  i; j;                 // variables pour les boucles

private
  tab;                  // position de la route sur l'horizon
  dd;         // position d'un obstacle en fonction du milieu de la route
  gg;         // pour regenerer de la route (graphique)
  back_x;     // position X du decor en arriere plan
  flag;       // variable pour test defilement bas cote
  ff;         // calcul du flags des concurrents si mirroir
  fg;         // calcul de la position de l'image des concurrents
  id_f1;
  id_f2;
  id_f3;
  fpsx;        // frame / seconde

begin
  set_mode(m640x480);                           // mode ecran
  id_fntA=load_fnt("user\mrbike\temps.fnt");   // charger fnt
  id_fntB=load_fnt("user\mrbike\score.fnt");   // charger fnt
  id_fntC=load_fnt("user\mrbike\vites.fnt");   // charger fnt
  id_mbike=load_fpg("user\mrbike\mbike.fpg");

  id_sounda=load_pcm("user\mrbike\beep.pcm",0);
  id_soundb=load_pcm("user\mrbike\moto.pcm",0);
  id_soundc=load_pcm("user\mrbike\awesome.pcm",1);
  id_soundd=load_pcm("user\mrbike\car2.pcm",1);
  id_sounde=load_pcm("user\mrbike\coche6.pcm",0);
  id_soundf=load_pcm("user\mrbike\crash.pcm",0);

  set_fps(120,30);                                // frame / sec
  max_process_time=50;                          // nbre de process
  dump_type=complete_dump;                      // type d'affichage
  mode=0;                                      // option par defaut

/*
  -----------------------------------------------
  Introduction
  -----------------------------------------------
*/
file=id_mbike;
loop
  set_fps(50,0);                                // frame / sec
  write(ID_fntb,320,100,1,"ARTIFICIAL DREAMS");
  write(id_fntb,320,150,1,"PRESENTS");

  write(0,320,440,1,"Graphiques: Dereumaux H");
  write(0,320,430,1,"Musique:    Doct. Awesome");
  write(0,320,420,1,"Programmation: Dereumaux H.");
  write(0,320,460,1,"E-Mail:DEREUMAUX_HERVE@HOTMAIL.COM");


  status=0;
  lettre(980,185);

  repeat
    frame;
  until (status==6);

  write(id_fntb,320,280,1,"BETA VERSION");

/*
  -----------------------------------------------
  phase 0: Selectionner le mode
  -----------------------------------------------
*/
  static(100,360,990);
  static(540,360,991);
  from i= 0 to 4;
    selection(200+(50*i),360,i);
  end
  repeat                                        // boucle d'attente
    frame;                                      // affichage
    if (key(_left) and mode>0)
      mode--;
      REPEAT;FRAME;until (scan_code==0);
    end
    if (key(_right) and mode <4)
      mode++;
      REPEAT;FRAME;until (scan_code==0);
    end
  until (key(_enter));
  switch(mode)
    case 0: set_fps(50,0);end
    case 1: set_fps(25,0);end
    case 1: set_fps(12,0);end
    case 3: set_fps(50,0);end
    case 4: set_fps(25,0);end
  end

  delete_text(all_text);                        // effacer les options
  let_me_alone();

/*
  -----------------------------------------------
  phase 1: Chargement du niveau
  -----------------------------------------------
*/
  load("user\mrbike\levelA.mbk",offset circuit);
  if(id_level<>0)unload_fpg(id_level);end
  id_level=load_fpg("user\mrbike\lev0.fpg");
/*
  -----------------------------------------------
  phase 3: Creer les differents process
    la gestion du heros
    la gestion du scrolling de la route
    les autres vehicules (moto)
  -----------------------------------------------
*/
  channelD=sound(id_soundd,256,256);

  heros_status=1;
  vitesse=0;
  pos=0;
  heros_x=0;
  level=0;

  x=-150;y=0;
  from i=0 to 10;
    moto[i].pos_x=x;
    moto[i].km=y;
    moto[i].image=rand(0,7);
    moto[i].d_angle=rand(0,90000);
    x+=50;
    if (i==2)x+=50;end
    if (i>=4) x=0;y=500;end
  end

  moto_heros();
  scrolling();
  compteur();
  redraw();

  graph=953;
  x=320;
  y=180;
  timer[5]=0;
  repeat
    frame;
    i=rand(0,3);if (i==0) sound(id_soundb,256,256);end
  until (timer[5]>=150);
  id_f1=feu(287,180,954);
  sound(id_sounda,256,256);
  timer[5]=0;
  repeat
    frame;
    i=rand(0,3);if (i==0) sound(id_soundb,256,256);end
  until (timer[5]>=150);
  id_f2=feu(320,180,954);
  sound(id_sounda,256,256);
  timer[5]=0;
  repeat
    frame;
    i=rand(0,3);if (i==0) sound(id_soundb,256,256);end
  until (timer[5]>=150);
  id_f3=feu(353,180,955);
  sound(id_sounda,200,512);

  y=-640;
  signal(id_f1,s_kill);
  signal(id_f2,s_kill);
  signal(id_f3,s_kill);

  temps=90;
  timer[0]=0;
  heros_status=0;
  mad();
  curseur();
  channelc=sound(id_soundc,512,256);

  repeat
    frame;
    if (level==2)
      heros_status=3;
      write(2,320,160,1,"CONGRATUTION");
      repeat
        score+=50;
        temps--;
        frame;
      until (temps==0);
      end
  until (key(_esc) or temps<=0);

  stop_sound(channeld);
  x=320;
  y=240;
  graph=952;
  heros_status=1;
  timer[5]=0;
  i=512;
  repeat
    frame;
    change_sound(channelc,i,256);
    i=-10;
    if (i<=0)i=0;end
  until (timer[5]>200);
  stop_sound(channelc);
  delete_text(all_text);
  let_me_alone();
  clear_screen();
  y=-640;
  end
end

/*
  -----------------------------------------------
  Gestion des autres vehicules
  -----------------------------------------------
*/

process mad();
private
  dcol;                               // distance en Z du mad et du heros
  ddx;                                // distance en X du heros et du mad
  begin
  from i=6 to 10;
    moto[i].km=rand(200,max);
    moto[i].image=rand(0,7);
    moto[i].d_angle= rand(0,90000);
  end
  loop
    frame;
    from i=0 to 10;
      if (i<=5)                       // deplacement
        moto[i].km+=(i+1);
      else
        moto[i].km+=3;
      end
      if(moto[i].km>max)  moto[i].km-=max;end // gestion du circuit
      if(moto[i].km<0)    moto[i].km+=max;end
      moto[i].pos_x=get_distx(moto[i].d_angle,180);       // zigzag
      if (abs(circuit[moto[i].km].pos_x)<=1) moto[i].d_angle+=500;end
      dcol=abs(moto[i].km-pos);
      if (dcol<5)                       // collision avec heros
        ddx=abs (moto[i].pos_x + heros_x);
        if (ddx<=20)
          vitesse-=100;
        end
      end
    end
  end
end



/*
  -----------------------------------------------
  Gestion du deplacement de la route
  -----------------------------------------------
*/
process scrolling();
private
  tab;
  tt;
  dvit;
  id_old;
begin

// preparation du tableau regen[]

  from i= 0 to 112;
    size=5+(i*size/100);
    if(size>200) size=200;end
    regen[i].taille=size;
  end

// Affichage de la vitesse + position
  write_int(id_fntB,630,10,2,offset score);
  write_int(id_fntA,320,48,4,offset temps);
  write_int(0,10,10,0,offset pos);
  loop
    if (heros_status>0)
      dvit=0;
      if (heros_status==2)
        if (heros_x<0) Heros_x+=5;end
        if (heros_x>0) heros_x-=5;end
        if (heros_x <5 and heros_x >-5) heros_status=0;end
      end
    else
      dvit=(vitesse/48)+1;// calcul de la vitesse
    end
    if (heros_status==0)
      if(key(_left)) heros_x+=15; end     // tourner a gauche
      if(key(_right)) heros_x-=15; end     // tourner a droite
    end

//    if (abs(heros_x)>=190) vitesse-=20;end

    score+=dvit;
    if (timer[0]>=100)timer[0]=0;temps--;end
    if (temps<0)temps=0;end

    pos+=dvit;
    if(pos>max)
      pos-=max;
      temps+=60;
      level++;
      load("user\mrbike\levelB.mbk",offset circuit);
      id_old=id_level;
      id_level=load_fpg("user\mrbike\lev1.fpg");
      unload_fpg(id_old);
    end

    if(pos<0) pos+=max;end

// derapage
    heros_x-=(vitesse* circuit[pos].pos_x)/25;



/*-----------------------------------------------*/


    tab=pos;
    cxx=0;
    cyy=0;
    pos_sol=112;
    niveau_sol=480;
    from i=112 to 0 step -1;

      if (tab<0)tab+=max;end
      if (tab>max)tab-=max;end

      cxx+=circuit[tab].pos_x;
      cyy+=circuit[tab].pos_Y;

      regen[i].pos_x=(screen_x/2)+cxx+(heros_x*regen[i].taille/100);
      regen[i].pos_Y=(screen_y/2)+cYY+regen[i].taille;
      if (regen[i].pos_Y<niveau_sol)
        niveau_sol=regen[i].pos_Y;
        pos_sol=i;
      end

      tab++;

    end

/*-----------------------------------------------*/

    frame;
  end
end

process moto_heros();
private
  image;
  anim[12]=
  -13,-12,-11,-10,-9,-8,7,8,9,10,11,12,13;
  flag;

begin
  file=id_mbike;
  x=screen_x/2;
  y=screen_y-2;;
  image=6;
  loop
    if (anim[image]<0) flags=1;else flags=0;end
    graph=abs(anim[image]);
    frame;
    if (key(_left))
      image--;
    else
      if (image<7)image++;end
    end
    if (key(_right))
      image++;
    else
      if (image>7) image--;end
    end
    if (image<0)image=0; end
    if (image>12)image=12;end
// chute du motard
    if (circuit[pos].dec_g<>0 and abs(heros_x)>=circuit[pos].decg_x-40)
stop_sound(channeld);
sound(id_soundf,256,256);
      heros_status=1;
      from i= 112 to 80 step -1;
        y=regen[i].pos_y;
        size-=2;
        graph++;
        if (graph>20)
          graph=20;
          x+=2;
        end
        frame;
      end;
      heros_status=2;
      x=screen_x/2;
      y=screen_y-2;;
      image=6;
      size=100;
      graph=7;
channelD=sound(id_soundd,256,256);
      repeat
        frame;
      until (heros_status==0);
    end

// chute du motard
    if (circuit[pos].dec_d<>0 and heros_x>=circuit[pos].decd_x-40)
      stop_sound(channeld);
      sound(id_soundf,256,256);
      heros_status=1;
      from i= 112 to 80 step -1;
        y=regen[i].pos_y;
        size-=2;
        graph++;
        if (graph>20)
          graph=20;
          x+=2;
        end
        frame;
      end;
      heros_status=2;
      x=screen_x/2;
      y=screen_y-2;;
      image=6;
      size=100;
      graph=7;
channelD=sound(id_soundd,256,256);
      repeat
        frame;
      until (heros_status==0);
    end
// fin de la course
    if (heros_status==3);
      from graph= 7 to 1 step -1;
        frame;
      end
      graph=1;
      loop
        frame;
      end
    end
  end
end

process compteur();
begin
  file=id_mbike;
  graph=950;
  x=560;
  y=400;
  speed();
  loop
    frame;
  end
end

process speed();
begin
  file=id_mbike;
  graph=951;
  x=father.x;
  y=father.y;
  angle=225000;
  write_int(id_fntC,560,440,4,offset vitesse);
  loop
    if (heros_status==0)
      if(key(_up))vitesse+=5;else vitesse--;end      // accelerer
      if(key(_down))vitesse-=15;end    // freiner
      change_sound(channeld,200,256+(vitesse*2));
    end
//    if (get_pixel (320,475)>15) vitesse-=10;end
    if (vitesse<0)vitesse=0;end
    if (vitesse>600)vitesse=600;end

    angle=225000-(vitesse*1000);
    frame;
  end
end

process lettre(graph,dx);
private
  dangle;
  flag;
begin
  file=id_mbike;
  size=2;
  x=60;
  y=60;
  z=graph;

  channela=sound(id_sounde,256,256);
  repeat
    y++;
    frame;
    dangle=(y-60)*1000;
    x=60 - get_disty(dangle,600);
    if (size<100)size++;end;
    if (x-dx>=60 and flag==0)
      lettre(graph+1,x);
      flag=1;
    end
  until (X>=590);

  repeat
    y++;
    frame;
    dangle=(y-60)*1000;
    x=dx - get_disty(dangle,640-dx);
    if (size<100)size++;end;
    if (x-dx>=60 and flag==0)
      lettre(graph+1,x);
      flag=1;
    end
  until (y==240);

  status++;
  loop
    frame;
  end;
end




process redraw();
private
  tab;                  // position de la route sur l'horizon
  dd;         // position d'un obstacle en fonction du milieu de la route
  gg;         // pour regenerer de la route (graphique)
  back_x;
  back_x1;     // position X du decor en arriere plan
  flag;       // variable pour test defilement bas cote
  ff;         // calcul du flags des concurrents si mirroir
  fg;         // calcul de la position de l'image des concurrents

begin
  back_x=0;   back_x1=0;
// write_int(0,10,100,0,offset back_x);
  loop

//    put_screen(id_level,10);                  // afficher le ciel
//    put(id_level,12,back_x1,(screen_y/2));        // dessiner le decor du fond
    put(id_level,10,back_x1,(screen_y/2));
    put(id_level,10,back_x1+640,(screen_y/2));
    put(id_level,11,back_x,(screen_y/2));     // le decor d'arriere plan
    put(id_level,11,back_x+640,(screen_y/2));
    if (heros_status==0)
      back_x1-=(circuit[pos].pos_x)/2;         // gerer son deplacement
      back_x-=circuit[pos].pos_x;         // gerer son deplacement
    end
    if (back_x< -320) back_x+=320;end
    if (back_x>  320) back_x+=320;end     // gestion du deplacement
    if (back_x1< -320) back_x1+=320;end
    if (back_x1>  320) back_x1+=320;end     // gestion du deplacement
    tab=pos+112;                        // position de l'horizon
    from i= 0 to 112;                   // boucle de tracer
      if (tab<0)tab+=max;end            // gestion du circuit
      if (tab>max)tab-=max;end

      if (i==pos_sol and mode<2)
        put(id_level,13,(screen_x/2),niveau_sol);   //terre
      end

      if (regen[i].taille>0 and regen[i].taille<200)
        if (circuit[tab].dec_g<>0)            // decor a gauche
        dd=circuit[tab].decG_X*regen[i].taille/100;
          xput(
            id_level,
            circuit[tab].dec_g,
            regen[i].pos_x-dd,
            regen[i].pos_Y,
            0,
            regen[i].taille,
            0,
            0);
        end
        if (circuit[tab].dec_d<>0)            // decor a droite
          dd=230*regen[i].taille/100;
        dd=circuit[tab].decD_X*regen[i].taille/100;
          xput(
            id_level,
            circuit[tab].dec_d,
            regen[i].pos_x+dd,
            regen[i].pos_Y,
            0,
            regen[i].taille,
            0,
            0);
        end
      end

      if (flag<>circuit[tab].graf and mode>=2)
        xput(                     // pour les machine + rapide
          id_level,                      // affiche le deplacement du bas cote
          circuit[tab].graf+2,
          320,
          regen[i].pos_Y,
          0,
          100,
          0,
          0
        );
        flag=circuit[tab].graf;
      end

      xput(                      // Afficher la route
        id_level,
        circuit[tab].graf,
        regen[i].pos_x,
        regen[i].pos_Y,
        0,
        regen[i].taille,
        0,
        0
      );

      from j=0 to 10;          // Afficher les autres vehicules
        if (moto[j].km==tab)
        dd=moto[j].pos_x*regen[i].taille/100;
        fg=circuit[tab].pos_x;
        if (fg<0) ff=1;else ff=0;end
        fg=abs(fg)+4;
        xput(
          id_mbike,
          bike[moto[j].image].image[fg],
          regen[i].pos_x+dd,
          regen[i].pos_Y,
          0,
          regen[i].taille/2,
          ff,
          0);
        end
      end
      tab--;         // On se raproche
    end
    frame;
  end
end

process feu(x,y,graph);
begin
  file=id_mbike;
  loop
    frame;
  end
end

process curseur();
private
  dpos;flag;
  pcx;
  pmax;
begin
  file=id_mbike;
  x=5;
  y=5;
  graph=956;
  dpos=10;
  pmax=graphic_info(0,956,g_wide);
  pcx=2;
  loop
    frame;
    dpos=pos/50;
    if (dpos<>flag)
      map_put(0,956,957,pcx,8);
      pcx++;
      flag=dpos;
    end
    if (pcx>= pmax) temps=0;end
  end
end

process static(x,y,graph);
begin
  file=id_mbike;
  loop
    frame;
  end
end

process selection(x,y,idd)
begin
  file=id_mbike;
  loop
    frame;
    if (idd==mode) graph=993;else graph=992;end
  end
end

