on (keyPress "0"){if(mode==1){if(hyp==0)rcl();else dispgcd();}else if(mode==2){if(hyp==0)stor();else displcm();}else{input(0);mkey=lkey;lkey=0;}}
-
on (keyPress "1"){if(mode==1){if(hyp==0)sin();else sinh();}else if(mode==2){if(hyp==0)asin();else asinh();}else{input(1);mkey=lkey;lkey=1;}}
-
on (keyPress "2"){if(mode==1){if(hyp==0)cos();else cosh();}else if(mode==2){if(hyp==0)acos();else acosh();}else{input(2);mkey=lkey;lkey=2;}}
-
on (keyPress "3"){if(mode==1){if(hyp==0)tan();else tanh();}else if(mode==2){if(hyp==0)atan();else atanh();}else if(mode==2){atan();}else{input(3);mkey=lkey;lkey=3;}}
-
on (keyPress "4"){if(mode==1){if(hyp==0)log();else nCr();}else if(mode==2){if(hyp==0)exp();else phi_disp();}else{input(4);mkey=lkey;lkey=4;}}
-
on (keyPress "5"){if(mode==1){if(hyp==0)log10();else nPr();}else if(mode==2){if(hyp==0)pow10();else rect2pole();}else{input(5);mkey=lkey;lkey=5;}}
-
on (keyPress "6"){if(mode==1){if(hyp==0)inv();else mod();}else if(mode==2){if(hyp==0)parresist();else pole2rect();}else{input(6);mkey=lkey;lkey=6;}}
-
on (keyPress "7"){if(mode==1){if(hyp==0)root();else chgcmplxmd();}else if(mode==2){if(hyp==0)fact();else dblfact();}else{input(7);mkey=lkey;lkey=7;}}
-
on (keyPress "8"){if(mode==1){if(hyp==0)pow();else s2eq();}else if(mode==2){if(hyp==0)nroot();else qeq();}else{input(8);mkey=lkey;lkey=8;}}
-
on (keyPress "9"){if(mode==1){if(hyp==0)neg();else s3eq();}else if(mode==2){if(hyp==0)rcllastx();else ceq();}else{input(9);mkey=lkey;lkey=9;}}
-
on (keyPress "#"){if(lkey==10){changeMode();}else{shosu();mkey=lkey;lkey=10;}}
-
on (keyPress "*"){if(mode==1){if(hyp==0)swap();else anglemode1();}else if(mode==2){if(hyp==0){temp=text0;pop();text11=temp;}else {temp=text11;push();text0=temp;}}else{del();mkey=lkey;lkey=11;}}
-
on (keyPress "<Enter>"){if(mode==1){y10x();}else if(mode==2){pi();}else{push();mkey=lkey;lkey=12;}}
-
on (keyPress "<Left>"){if(mode==1){rad2deg();}else if(mode==2){deg2rad();}else{add();mkey=lkey;lkey=13;}}
-
on (keyPress "<Down>"){if(mode==0){times();mkey=lkey;lkey=14;}else{hypch();}}
-
on (keyPress "<Right>"){if(mode==1){dec2hms();}else if(mode==2){hms2dec();}else{substract();mkey=lkey;lkey=15;}}
-
on (keyPress "<Up>"){if(mode==1){percent();}else if(mode==2){delpercent();}else{devide();mkey=lkey;lkey=16;}}
