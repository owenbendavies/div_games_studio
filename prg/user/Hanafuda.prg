compiler_options _extended_conditions;
program hanafuda;

global

/*  These variables have proliferated.  (Trying to write discrete modules
    in the main section of the program meant that I never used an existing
    variable unless I wanted its old value)*/

    myfont;
    file1;
    c_id;deck_id;bell;ptext;
    ding;won;flick;hah;//sound codes
    channels;//to stop sound
    v;h;c;//coordinates for layout

    j;k;kk;//counters
    copy;//used in the shuffle routine
    handsuit;spreadsuit;csuit;lsuit;clsuit;
    layout[24];
    stack[48]=(0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48);
    values[48]=(0,1,1,5,20,1,1,5,10,1,1,5,20,1,1,5,10,1,1,5,10,1,1,5,10,1,1,5,10,1,1,10,20,1,1,5,20,1,1,5,10,1,5,10,20,1,1,1,20);
    hvalue;svalue;
    hand[9];comphand[9];

    dpos=630;depth=100;cdpos;cdepth=100;//placing of captured pairs
    taken;found;matched;turned=false;
    dropx=70;
    myvalue;myscore;compscore;comptotal;mytotal;
    cardcount=29;
    phase;  //from 0 to 3, defines stage of play
    level=1;
    jump=true;

    handcount=9;comphandcount=9;xval;
    check;count;draws;drop;newcard;
    vacantx=0;vacanty=0;
    spreadhit;handhit;score;topscore;lowest;
    sg;hg;spreadg;drawg;handg;gp;g;cg;//copies of graphic codes
    //bonus tallies
    cbonus;crt;cbt;crlt;c_rain;c_paul;cbdb;cwist;cview;ctz;cbri;cnobonus;
    mybonus;rt;bt;rlt;rain;paul;bdb;wist;view;tz;bri;nobonus;
    movesuit;suitnum[12];takethree;// movecard[3];

begin
    myfont=load_fnt("user\hanafuda\hanafuda.fnt");
    ding=load_pcm("user\hanafuda\ding.pcm",0);
    flick=load_pcm("user\hanafuda\flick.pcm",0);
    hah=load_pcm("user\hanafuda\hah.pcm",0);
    won=load_pcm("user\hanafuda\won.pcm",0);
    set_mode(m800x600);
    mouse.graph=201;
    file1=load_fpg("user\hanafuda\hanaback.fpg");

    LOOP
        IF (jump==true)
            SWITCH(level)
                CASE 1:
                    jump=false;
                    delete_text(all_text);
                    put_screen(file1,51);
                    let_me_alone();
                    LOOP
                        if (key(_esc))
                            exit("Done",0);
                        end
                        if (key(_enter))
                            jump=true;
                            level=2;
                            break;
                        end
                        frame;
                    END
                end //CASE


                CASE 2:

                    let_me_alone();
                    delete_text(all_text);
                    write_int(0,100,575,3,&movesuit);
write(0,130,575,3,"Drag to match     Right-click to discard     F1 for new deal     Space to quit");
                    write_int(myfont,10,500,3,&myscore);
                    write_int(myfont,10,540,3,&mybonus);
                    write_int(myfont,780,580,5,&mytotal);
                    write_int(myfont,10,50,3,&compscore);
                    write_int(myfont,10,80,3,&cbonus);
                    write_int(myfont,780,20,5,&comptotal);
                    plus(5,80);plus(5,540);
                    jump=false;
                    dropx=70;takethree=false;
                    myscore=0;compscore=0;
                    cbonus=0;crt=0;cbt=0;crlt=0;c_rain=0;cwist=0;c_paul=0;cbdb=0;
                    cview=0;ctz=0;cbri=0;
                    mybonus=0;rt=0;bt=0;rlt=0;rain=0;wist=0;paul=0;bdb=0;
                    view=0;tz=0;bri=0;

              //SHUFFLE
                    for (j=1;j<300;j++)
                        k=rand(2,48);
                        copy=stack[k];
                        stack[k]=stack[1];
                        stack[1]=copy;
                    end
              //DEAL
                    k=1;
                    from j=11 to 19;
                        hand[k]=stack[j];
                        k++;
                    end

                    for (j=11;j<25;j++)
                        layout[j]=99;
                    end

                    from j=1 to 10;
                        layout[j]=stack[j];
                    end


                   // check here for three of suit in spread

                    movesuit=0;k=0;
                    from j=1 to 12;
                        suitnum[j]=0;
                    end
                    from j=1 to 10;
                        lsuit=suit(layout[j]);
                        suitnum[lsuit]++;
                    end
                    from j=1 to 12;
                        if (suitnum[j]>2)
                           movesuit=j;
                        end
                    end


                    k=1;
                    from j=20 to 28;
                        comphand[k]=stack[j];
                        k++;
                    end

                    put_screen(file1,50);
                    //Move the movecards up on generating the spread.

                    c=1;h=70;//v=80;
                    REPEAT
                        if (suit(layout[c])==movesuit)
                            v=65;
                        else
                            v=80;
                        end
                        spreadcard(layout[c],h,v);
                        c++;
                        h=h+70;
                        frame;
                    UNTIL (c>10)

                    c=1;h=60;v=500;
                    REPEAT
                        handcard(hand[c],h,v);
                        c++;
                        h=h+70;
                        frame;
                    UNTIL (c>9)
                    cardcount=29;
                    handcount=9; comphandcount=9;
                    dpos=440;cdpos=40;
                    depth=100;cdepth=100;
                    deck_id=deck(760,500);
                    cnobonus=false;nobonus=false;

                    phase=0;
                end //case
            end //switch
        end //if

        //Display appropriate text for each phase
        switch(phase);
            case 0:
                delete_text(ptext);
                if (comphandcount>0) //======handcount
                    ptext=write(myfont,10,420,3,"Play from your hand");
                    //NEW #################
                    signal(TYPE handcard,s_wakeup);
                else
                    if ((compscore+cbonus)>(myscore+mybonus))
                        //comptotal+=compscore+cbonus-(myscore+mybonus);
                        ptext=write(myfont,10,420,3,"Both hands out;  I won.         (F1 to deal, Space to quit.)");
                    else
                        ptext=write(myfont,10,420,3,"Both hands out.  You won.       (F1 to deal, Space to quit.)");
                    end
                end
            end
            case 1:
                delete_text(ptext);
                ptext=write(myfont,550,420,3,"Play from the deck");
                //NEW ###################
                signal(TYPE handcard,s_freeze);
                signal(newcard,s_wakeup);

            end
            case 2:
                delete_text(ptext);
                ptext=write(myfont,300,420,3,"* * * MY PLAY * * *");
            end
        end


    //#################   COMPUTER TURN   ##########################

                if (phase==2)
                timer=0;
                repeat
                    frame;
                until (timer>50)

                   found=false;
                   score=0;topscore=0;handhit=0;
                   csuit=0;clsuit=0;
                   check=get_id(type deck);
                   WHILE (check=get_id(TYPE spreadcard))
                      gp=check.graph;
                      clsuit=suit(gp);



                      FOR (kk=1;kk<10;kk++)
                          csuit=suit(comphand[kk]);
                          IF (csuit==clsuit)
                              found=true;
                              g=comphand[kk];

                              hvalue=values[g];
                              svalue=values[gp];
                              score=hvalue+svalue;
                              if(csuit==11) score=score+20;end
                              IF (score>topscore)
                                spreadhit=check;
                                handhit=kk;
                                topscore=score;
                                if(csuit==11) topscore=topscore-20;end
                                sg=gp;
                                hg=g;
                              END
                          END
                      END
                   END  //while

                   IF(found)

                      drop=spreadcard(hg,spreadhit.x+30,spreadhit.y-30);
                      drop.z=-200;
                      timer=0;
                      repeat
                       frame;
                      until (timer>100)
                      signal(drop,s_kill);

                      compscore+=topscore;
                      vacantx=spreadhit.x;vacanty=spreadhit.y;
                      if (vacanty<80) vacanty=80;end

                      if (spreadhit.y<80)
                        takethree=true;
                      end

                      signal(spreadhit,s_kill);
                      comphand[handhit]=99;comphandcount-=1;//===============
                      sound(flick,100,256);
                      cdeadcard(cdpos,340,sg,cdepth);
                      cdpos=cdpos+12;cdepth=cdepth-1;
                      cdeadcard(cdpos,340,hg,cdepth);
                      cdpos=cdpos+12;cdepth=cdepth-1;

                      if(takethree)
                      sound(flick,100,256);
                        check=get_id(type deck);
                        while (check=get_id(TYPE spreadcard))
                            if (check.y<80)
                                cg=check.graph;
                                cdeadcard(cdpos,340,cg,cdepth);
                                cdpos=cdpos+12;cdepth=cdepth-1;
                                compscore=compscore+values[cg];
                                signal(check,s_kill);
                            end
                        end
                        takethree=false;
                      end

                   ELSE
                      lowest=20;
                      FOR (kk=1;kk<10;kk++)

                          if (comphand[kk]<49)
                             hvalue=values[comphand[kk]];
                             IF (hvalue<lowest)
                                lowest=hvalue;
                                handhit=kk;
                                handg=comphand[kk];
                             END
                          END
                      END

                      IF (vacantx>0)
                          spreadcard(handg,vacantx,vacanty);
                          vacantx=0;vacanty=0;
                      ELSE
                          spreadcard(handg,dropx,200);
                          dropx=dropx+70;
                      END

                      comphand[handhit]=99;comphandcount-=1;
                      handg=0;handhit=0;
                   END

    // ###########  Computer draws from the deck  ########################


                   csuit=0;clsuit=0;drawg=0;spreadg=0;
                   draws=handcard(stack[cardcount],720,450);

                    timer=0;
                    repeat
                        frame;
                    until (timer>100)

                   cardcount++;
                   signal(deck_id,s_wakeup);
                   drawg=draws.graph;
                   csuit=suit(drawg);
                   matched=false;
                   topscore=0;score=0;spreadhit=0;
                   get_id(TYPE deck);
                   WHILE (check=get_id(TYPE spreadcard))
                      spreadg=check.graph;
                      clsuit=suit(spreadg);
                      if((clsuit==csuit) and not(drawg==spreadg))
                          matched=true;
                          score=values[drawg]+values[spreadg];
                          if (score>topscore)
                              sg=spreadg;hg=drawg;
                              spreadhit=check;
                              topscore=score;
                              hg=drawg;sg=spreadg;
                          end
                      end
                   END

                   IF (matched)
                        signal(draws,s_kill);
                        vacantx=spreadhit.x;vacanty=spreadhit.y;
                        if (vacanty<80) vacanty=80;end

                        if (spreadhit.y<80)
                            takethree=true;
                        end
                        sound(flick,100,256);
                        signal(spreadhit,s_kill);
                        cdeadcard(cdpos,340,sg,cdepth);
                        cdpos=cdpos+12;cdepth=cdepth-1;
                        cdeadcard(cdpos,340,hg,cdepth);
                        cdpos=cdpos+12;cdepth=cdepth-1;
                        compscore=compscore+topscore;
                        hvalue=0;svalue=0;

                        if(takethree)
                            check=get_id(type deck);
                            sound(flick,100,256);
                            while (check=get_id(TYPE spreadcard))
                                if (check.y<80)
                                    cg=check.graph;
                                    cdeadcard(cdpos,340,cg,cdepth);
                                    cdpos=cdpos+12;cdepth=cdepth-1;
                                    compscore=compscore+values[cg];
                                    signal(check,s_kill);
                                end
                            end
                            takethree=false;
                        end

                   ELSE
                       IF (vacantx>0)
                          spreadcard(drawg,vacantx,vacanty);
                          vacantx=0;vacanty=0;phase=0;drawg=0;

                       ELSE
                          spreadcard(drawg,dropx,200);
                          dropx=dropx+70;phase=0;drawg=0;
                       END

                       signal(draws,s_kill);
                   END

                   drawg=0;spreadg=0;
                   phase=0;
               end  //of IF (phase==2)
    frame;
    end//loop
end//program


PROCESS handcard(g,xpos,ypos);
PRIVATE incr_x;incr_y;lx;jj;
BEGIN
    graph=g;x=xpos;y=ypos;z=-50;xval=x;
    LOOP
            IF ((NOT taken) and mouse.left)
                IF (collision(TYPE mouse))
                    signal(deck_id,s_wakeup);
                    //signal(type card,s_kill);
                  //Calculate suit and value here:
                    handsuit=suit(graph);
                    handg=graph;
                    hvalue=values[graph];
                    taken=1;
                    xval=x;
                    incr_x=x-mouse.x;
                    incr_y=y-mouse.y;
                    REPEAT
                        x=mouse.x+incr_x;
                        y=mouse.y+incr_y;
                        FRAME;
                    UNTIL (mouse.left==0);
                    taken=0;
                    FRAME;
                END
            END

            IF ((collision(TYPE mouse)) and mouse.right and (not(phase==2)))

                if (xval<650)
                    handcount=handcount-1;
                    turned=false;
                end
                //search for first empty dropx
                 IF (vacantx>0)
                     spreadcard(graph,vacantx,vacanty);
                     vacantx=0;vacanty=0;
                 ELSE
                     spreadcard(graph,dropx,200);
                     dropx=dropx+70;
                 END
                signal(deck_id,s_wakeup);
                signal(id,s_kill);
                if (phase<>2)
                    phase++;if (phase>3) phase=0;end
                end
            END
            frame;
    END
END

//this for capturing three! (Deadcard won't do)
PROCESS dead3(x,y,g,z)
BEGIN
    graph=g;
    bonus(graph);
    loop;frame;end
END



PROCESS deadcard(x,y,g,z)
BEGIN
    graph=g;
    bonus(graph);
    phase++;if (phase>3) phase=0;end
    if (xval<650) handcount=handcount-1;end
    clone
        graph=handg;
        bonus(handg);
        x=x+12;
        dpos+=12;
    end
    loop;frame;end;
END



PROCESS cdeadcard(x,y,g,z)
BEGIN
    graph=g;
    compbonus(g);
    loop;frame;end;
END




PROCESS spreadcard(g,xpos,ypos);
BEGIN
    graph=g;x=xpos;y=ypos;z=100;

    LOOP
        IF ((NOT taken)) //and mouse.left)
            c_id=collision(TYPE handcard);
            IF (c_id>0)
                spreadsuit=suit(graph);
                svalue=values[graph];
                IF (spreadsuit==handsuit)
                    myscore=myscore+svalue+hvalue;
                    signal(c_id,s_kill);
                    sound(flick,140,256);
                    deadcard(dpos,340,graph,depth);
                    dpos=dpos+12;depth=depth-1;

                    if (y<80)
                        takethree=true;
                    end

                    vacantx=x;vacanty=y;
                    if (vacanty<80) vacanty=80;end

                    //go for takethree.  v.sup.
                    if (takethree)
                        sound(flick,140,256);
                        check=get_id(TYPE deck);
                        while (check=get_id(TYPE spreadcard))
                            if (check.y<80)
                                g=check.graph;
                                dpos+=12;depth-=1;
                                dead3(dpos,340,g,depth);
                                myscore=myscore+values[g];
                                signal(check,s_kill);
                            end
                        end
                        takethree=false;
                    end

                    signal(ID,s_kill);return;
                END
            END
        END
        frame;
    END
END


PROCESS deck(x,y)
BEGIN
    graph=400;z=500;

    loop
        if (key(_space))
            jump=true;
            phase=0;
            level=1;
            signal(TYPE spreadcard,s_kill);
            signal(deck_id,s_kill);
            break;
        end

        if (key(_F1))
                    if((compscore+cbonus)>(myscore+mybonus))
                        comptotal+=compscore+cbonus-(myscore+mybonus);
                    else
                        mytotal+=myscore+mybonus-(compscore+cbonus);
                    end
            jump=true;
            phase=0;
            level=2;
            signal(TYPE spreadcard,s_kill);
            signal(deck_id,s_kill);
            break;
        end

        IF (phase==1)
            if (collision(TYPE mouse) AND mouse.left)
                turned=true;
                signal(ID,s_freeze);

                newcard=handcard(stack[cardcount],690,490);
                signal(newcard,s_wakeup);

                cardcount++;
                IF (cardcount>48)
                    signal(ID,s_kill);
                END
            end
        END
        frame;
    end
END

/*
PROCESS card(g,x,y)
BEGIN
    graph=g;
    loop;frame;end
END


PROCESS compcard(g,x,y)
BEGIN
    graph=g;
    size=45;
    loop;frame;end
END
*/
PROCESS compbonus(n)
BEGIN
    IF (!cnobonus)
        size=60;y=270;
        bell=false;
        switch (n);
            case 3,7,11:
                graph=401;
                x=cdpos-30;
                crlt++;ctz++;
                if (crlt>2)
                    cbonus+=20;bell=true;
                    crlt=0;
                end
            end

            case 23,35,39:
                graph=402;
                x=cdpos-30;
                cbt++;ctz++;
                if (cbt>2)
                    cbonus+=20;bell=true;
                    cbt=0;
                end

            end

            case 15,19,27,42:
                graph=403;
                x=cdpos-30;
                crt++;ctz++;
                if (crt>2)
                    cbonus+=10;bell=true;
                    crt=0;
                end
             end

             case 41..44:
                graph=404;
                x=cdpos-30;
                c_rain++;
                if (c_rain>2)
                    cbonus+=20;bell=true;
                    sound(hah,100,300);
                    c_rain=0;
                    mybonus=0;nobonus=true;
                                        graph=100;
                                        x=dpos;
                end
            end

            case 45..48:
                graph=405;
                x=cdpos-30;
                c_paul++;
                if(c_paul>2)
                    cbonus+=10:bell=true;
                    c_paul=0;
                end
            end

            case 24,28,40:
                graph=406;
                x=cdpos-30;
                cbdb++;
                if(cbdb>2)
                    cbonus+=20:bell=true;
                    cbdb=0;
                end
            end

            case 13..16:
                graph=407;
                x=cdpos-30;
                cwist++;
                if(cwist>2)
                    cbonus+=10:bell=true;
                    cwist=0;
                end
            end

            case 12,32,36:
                graph=408;
                x=cdpos-30;
                cview++;
                if(cview>2)
                    cbonus+=40;bell=true;
                    cview=0;
                end
            end

            case 4,8,20:
                graph=409;
                x=cdpos-30;
                cbri++;
                if (cbri>2)
                    cbonus+=30;bell=true;
                    cbri=0;
                end
            end
        end

        if (bell) sound(ding,128,512);end
        if (ctz>6)
            sound(ding,128,256);
            cbonus+=20;
            ctz=0;
        end
    end
    loop;frame;end;

END


PROCESS bonus(n)
BEGIN
    IF (!nobonus)
        size=60;y=270;
        bell=false;
        switch (n);
            case 3,7,11:
                graph=401;
                x=dpos-30;
                rlt++;tz++;
                if (rlt>2)
                    mybonus+=20;bell=true;
                    rlt=0;
                end
            end

            case 23,35,39:
                graph=402;
                x=dpos-30;
                bt++;tz++;
                if (bt>2)
                    mybonus+=20;bell=true;
                    bt=0;
                end
            end

            case 15,19,27,42:
                graph=403;
                x=dpos-30;
                rt++;tz++;
                if (rt>2)
                    mybonus+=10;bell=true;
                    rt=0;
                end
            end

            case 41..44:
                graph=404;
                x=dpos-30;
                rain++;
                if (rain>2)
                    mybonus+=20;bell=true;
                    rain=0;
                    cbonus=0;cnobonus=true;
                //end
                                            graph=100;
                                            x=cdpos;
                end
            end

            case 45..48:
                graph=405;
                x=dpos-30;
                paul++;
                if(paul>2)
                    mybonus+=10:bell=true;
                    paul=0;
                end
            end

            case 24,28,40:
                graph=406;
                x=dpos-30;
                bdb++;
                if(bdb>2)
                    mybonus+=20:bell=true;
                    bdb=0;
                end
            end

            case 13..16:
                graph=407;
                x=dpos-30;
                wist++;
                if(wist>2)
                    mybonus+=10:bell=true;
                    wist=0;
                end
            end

            case 12,32,36:
                graph=408;
                x=dpos-30;
                view++;
                if(view>2)
                    mybonus+=40;bell=true;
                    view=0;
                end
            end

            case 4,8,20:
                graph=409;
                x=dpos-30;
                bri++;
                if (bri>2)
                    mybonus+=30;bell=true;
                    bri=0;
                end
            end

        end
        if (bell) sound(ding,128,256);end
        if (tz>6)
            sound(ding,128,512);
            mybonus+=20;
            tz=0;
        end

    END
    loop;frame;end;
END


PROCESS suit(p)
PRIVATE q;
BEGIN
    q=((p-1)/4)+1;
    RETURN(q);
END


PROCESS plus(x,y)
BEGIN
    graph=49;
    loop;frame;end
END
