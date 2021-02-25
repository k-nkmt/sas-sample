/* 
"""アノテーション サンプル
Note:
    出力内容は完全にお遊びなので、実行は昼休みや業務時間外を一応推奨

"""
*/
data work.anno ;
  infile cards dsd missover ;
  length part label $ 200
         function anchor $20 x1 y1  x2 y2 height width  cornerradius rotate 8 display linecolor fillcolor textcolor $20 ;
         ;
  retain drawspace "graphpixel" heightunit widthunit "pixel";
  input part function anchor x1 y1  x2 y2 width height cornerradius rotate display linecolor fillcolor label textcolor ;
  
  y1 = y1+450 ;
cards ;
face       ,oval     ,top       ,320,   0,   ,   ,300,300,    ,   ,    all,cx333333,cx10a6ce,, 
face white ,oval     ,top       ,320, -85,   ,   ,264,196,    ,   ,    all,cx333333,cxffffff,, 
face dummy ,rectangle,top       ,320,-270,   ,   ,250, 40,    ,   ,   fill,        ,cxffffff,, 
mouth      ,oval     ,top       ,320,-110,   ,   ,210,130,    ,   ,outline,cx333333,        ,, 
mouth dummy,oval     ,top       ,320,-108,   ,   ,220,127,    ,   ,    all,cxffffff,cxffffff,,
eye white  ,rectangle,top       ,284, -45,   ,   , 72, 83,0.95,   ,    all,cx333333,cxffffff,, 
eye white  ,rectangle,top       ,356, -45,   ,   , 72, 83,0.95,   ,    all,cx333333,cxffffff,, 
eye black  ,oval     ,top       ,295,-100,   ,   , 15, 15,    ,   ,    all,cx333333,cx333333,, 
eye black  ,oval     ,top       ,345,-100,   ,   , 15, 15,    ,   ,    all,cx333333,cx333333,,  
nose line  ,line     ,top       ,320,-140,320,210,   ,   ,    ,   ,       ,cx333333,        ,, 
nose       ,oval     ,top       ,320,-117,   ,   , 32, 32,    ,   ,    all,cx333333,cxc93e00,, 
nose light ,oval     ,top       ,330,-127,   ,   , 10, 10,    ,   ,   fill,        ,cxedbda8,, 
whisker    ,rectangle,topright  ,365,-175,   ,   , 60,  2,    ,160,   fill,        ,cx333333,, 
whisker    ,rectangle,topleft   ,365,-165,   ,   , 60,  2,    ,  0,   fill,        ,cx333333,, 
whisker    ,rectangle,topleft   ,365,-155,   ,   , 60,  2,    , 20,   fill,        ,cx333333,, 
whisker    ,rectangle,topright  ,275,-175,   ,   , 60,  2,    , 20,   fill,        ,cx333333,, 
whisker    ,rectangle,topright  ,275,-165,   ,   , 60,  2,    ,  0,   fill,        ,cx333333,, 
whisker    ,rectangle,topleft   ,275,-155,   ,   , 60,  2,    ,160,   fill,        ,cx333333,, 
band       ,rectangle,top       ,320,-255,   ,   ,230, 20, 0.5,   ,    all,cx333333,cxb53000,, 
bell       ,oval     ,top       ,320,-260,   ,   , 40, 40,    ,   ,    all,cx333333,cxf9f12a,, 
bell       ,oval     ,top       ,320,-280,   ,   , 12, 10,    ,   ,    all,cx333333,cx000000,, 
bell       ,line     ,top       ,320,-290,320,150,   ,   ,    ,   ,       ,cx000000,        ,,
bell       ,rectangle,top       ,320,-270,   ,   , 36,  3, 0.7,   ,    all,cx333333,cxf9f12a,, 
text       ,text     ,bottomleft, 10,-435,   ,   ,600,   ,    ,   ,       ,        ,        ,参考ページ：https://purecss3.net/doraemon/doraemon_css3.html,cx333333
;
run ;

data work._dummy ;
  retain x 1 ;
run ;

ods html ;
ods graphics / width=640px height=480px; 

proc sgplot data=work._dummy sganno=work.anno ;
 scatter x=x y= x / markerattrs=(size=0) ;
 xaxis display=none ;
 yaxis display=none ;
run;
