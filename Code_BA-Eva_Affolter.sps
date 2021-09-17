* Encoding: UTF-8.
* Mittelwerte: Verortung der Parteien auf der Links-rechts-Skala 2007-2019.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=jahr MEAN(Grüne) MEAN(SP) MEAN(CVP) MEAN(FDP) 
    MEAN(SVP) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
   TEMPLATE=["/Applications/IBM SPSS Statistics 27/SPSS "+ 
    "Statistics.app/Contents/bin/Looks/chart_style.sgt"] 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: jahr=col(source(s), name("jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Verortung der Parteien auf der Links-Rechts-Skala (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung der Parteien auf der Links-rechts-Skala 2007-2019.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=jahr MEAN(Grüne) MEAN(SP) MEAN(CVP) MEAN(FDP) 
    MEAN(SVP) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
   TEMPLATE=["/Applications/IBM SPSS Statistics 27/SPSS "+ 
    "Statistics.app/Contents/bin/Looks/chart_style.sgt"] 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: jahr=col(source(s), name("jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Kohärenz der Verortung der Parteien auf der Links-Rechts-Skala (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Mittelwerte: Verortung der Parteien auf der Links-rechts-Skala 2007-2019 (gewählt/nicht gewählt).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=jahr MEAN(MP) MEAN(cand) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(85,150,230), COLOR2(9,38,114), COLOR3(159,24,83), COLOR4(250,77,86), 
    COLOR5(87,4,8), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: jahr=col(source(s), name("jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Verortung der Parteien auf der Links-Rechts-Skala (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung der Parteien auf der Links-rechts-Skala 2007-2019 (gewählt/nicht gewählt).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=jahr MEAN(MP) MEAN(cand) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(85,150,230), COLOR2(9,38,114), COLOR3(159,24,83), COLOR4(250,77,86), 
    COLOR5(87,4,8), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: jahr=col(source(s), name("jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Kohärenz der Verortung der Parteien auf der Links-Rechts-Skala (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwerte: Verortung der Parteien auf der Links-rechts-Skala 2007-2019 (nach Alter).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Altersklasse_1_MW) MEAN(Altersklasse_2_MW) 
    MEAN(Altersklasse_3_MW) MEAN(Altersklasse_4_MW) MEAN(Altersklasse_5_MW) MEAN(Altersklasse_6_MW) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Verortung der Parteien auf der Links-Rechts-Skala (2007-2019")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

 * Standardabweichung: Verortung der Parteien auf der Links-rechts-Skala 2007-2019 (nach Alter).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Altersklasse_1_SW) MEAN(Altersklasse_2_SW) 
    MEAN(Altersklasse_3_SW) MEAN(Altersklasse_4_SW) MEAN(Altersklasse_5_SW) MEAN(Altersklasse_6_SW) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Kohärenz der Verortung der Parteien auf der Links-Rechts-Skala (2007-2019")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwerte: Verortung der Parteien auf der Links-rechts-Skala 2007-2019 (nach Geschlecht).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Frauen_MW) MEAN(Männer_MW) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Verortung der Parteien auf der Links-Rechts-Skala (2007-2019) ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung der Parteien auf der Links-rechts-Skala 2007-2019 (nach Geschlecht).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Frauen_SD) MEAN(Männer_SD) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Kohärenz der Verortung der Parteien auf der Links-Rechts-Skala (2007-2019) ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.
11.1.1	Innerhalb der Parteien: gewählt vs. nicht gewählt
* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der Grünen.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_grüne) MEAN(cand_grüne) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der Grünen.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_grüne_SW) MEAN(cand_grüne_SW) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" Grüne: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_SP) MEAN(cand_SP) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" SP: Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_SP_SW) MEAN(cand_SP_SW) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" SP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_CVP) MEAN(cand_CVP) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" CVP: Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_CVP_SW) MEAN(cand_CVP_SW) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" CVP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_FDP) MEAN(cand_FDP) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" FDP: Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_FDP_SW) MEAN(cand_FDP_SW) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" FDP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_SVP) MEAN(cand_SVP) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" SVP: Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(MP_SVP_SW) MEAN(cand_SVP_SW) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" SVP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala (2007-2019).")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.
11.1.2	Innerhalb der Parteien: nach Alter
* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der Grünen.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_Grüne_1) MEAN(Alter_Grüne_2) 
    MEAN(Alter_Grüne_3) MEAN(Alter_Grüne_4) MEAN(Alter_Grüne_5) MEAN(Alter_Grüne_6) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der Grünen.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_Grüne_1_SW) MEAN(Alter_Grüne_2_SW) 
    MEAN(Alter_Grüne_3_SW) MEAN(Alter_Grüne_4_SW) MEAN(Alter_Grüne_5_SW) MEAN(Alter_Grüne_6_SW) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" Grüne: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_SP_1) MEAN(Alter_SP_2) 
    MEAN(Alter_SP_3) MEAN(Alter_SP_4) MEAN(Alter_SP_5) MEAN(Alter_SP_6) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_SP_1_SW) MEAN(Alter_SP_2_SW) 
    MEAN(Alter_SP_3_SW) MEAN(Alter_SP_4_SW) MEAN(Alter_SP_5_SW) MEAN(Alter_SP_6_SW) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" SP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_CVP_1) MEAN(Alter_CVP_2) 
    MEAN(Alter_CVP_3) MEAN(Alter_CVP_4) MEAN(Alter_CVP_5) MEAN(Alter_CVP_6) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_CVP_1_sd) MEAN(Alter_CVP_2_sd) 
    MEAN(Alter_CVP_3_sd) MEAN(Alter_CVP_4_sd) MEAN(Alter_CVP_5_sd) MEAN(Alter_CVP_6_sd) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" CVP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_FDP_1) MEAN(Alter_FDP_2) 
    MEAN(Alter_FDP_3) MEAN(Alter_FDP_4) MEAN(Alter_FDP_5) MEAN(Alter_FDP_6) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_FDP_1_sd) MEAN(Alter_FDP_2_sd) 
    MEAN(Alter_FDP_3_sd) MEAN(Alter_FDP_4_sd) MEAN(Alter_FDP_5_sd) MEAN(Alter_FDP_6_sd) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" FDP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_SVP_1) MEAN(Alter_SVP_2) 
    MEAN(Alter_SVP_3) MEAN(Alter_SVP_4) MEAN(Alter_SVP_5) MEAN(Alter_SVP_6) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Alter_SVP_1_sd) MEAN(Alter_SVP_2_sd) 
    MEAN(Alter_SVP_3_sd) MEAN(Alter_SVP_4_sd) MEAN(Alter_SVP_5_sd) MEAN(Alter_SVP_6_sd) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label(" SVP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Alter (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.
11.1.3	Innerhalb der Parteien: nach Geschlecht
* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der Grünen.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_F_mw) MEAN(Grüne_M_mw) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "2007-2019")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der Grünen.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_F_sd) MEAN(Grüne_M_sd) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SP_F_mw) MEAN(SP_M_mw) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "2007-2019")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SP_F_sd) MEAN(SP_M_sd) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(CVP_F_mw) MEAN(CVP_M_mw) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "2007-2019")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(CVP_F_sd) MEAN(CVP_M_sd) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(FDP_F_mw) MEAN(FDP_M_mw) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "2007-2019")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(FDP_F_sd) MEAN(FDP_M_sd) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Mittelwert: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SVP_F_mw) MEAN(SVP_M_mw) 
    MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "2007-2019")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung auf der Links-rechts-Achse durch die Kandidierenden der SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SVP_F_sd) MEAN(SVP_M_sd) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Kohärenz der Selbsteinschätzung auf der Links-Rechts-Skala nach Geschlecht ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.
11.2	Antworten der Kandidierenden auf die selects-Fragen (nach Partei)
*Zustimmung: selects-Fragen Grüne.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Gr_mw_1) MEAN(Gr_mw_2) MEAN(Gr_mw_3) 
    MEAN(Gr_mw_4) MEAN(Gr_mw_5) MEAN(Gr_mw_6) MEAN(Gr_mw_7) MEAN(Gr_mw_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Antworten auf die selects-Fragen (2007-2019)"))   
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Standardabweichung: selects-Fragen Grüne.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Gr_sd_1) MEAN(Gr_sd_2) MEAN(Gr_sd_3) 
    MEAN(Gr_sd_4) MEAN(Gr_sd_5) MEAN(Gr_sd_6) MEAN(Gr_sd_7) MEAN(Gr_sd_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Kohärenz der Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: selects-Fragen SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SP_mw_1) MEAN(SP_mw_2) MEAN(SP_mw_3) 
    MEAN(SP_mw_4) MEAN(SP_mw_5) MEAN(SP_mw_6) MEAN(SP_mw_7) MEAN(SP_mw_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Standardabweichung: selects-Fragen SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SP_sd_1) MEAN(SP_sd_2) MEAN(SP_sd_3) 
    MEAN(SP_sd_4) MEAN(SP_sd_5) MEAN(SP_sd_6) MEAN(SP_sd_7) MEAN(SP_sd_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Kohärenz der Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: selects-Fragen CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(CVP_mw_1) MEAN(CVP_mw_2) MEAN(CVP_mw_3) 
    MEAN(CVP_mw_4) MEAN(CVP_mw_5) MEAN(CVP_mw_6) MEAN(CVP_mw_7) MEAN(CVP_mw_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Standardabweichung: selects-Fragen CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(CVP_sd_1) MEAN(CVP_sd_2) MEAN(CVP_sd_3) 
    MEAN(CVP_sd_4) MEAN(CVP_sd_5) MEAN(CVP_sd_6) MEAN(CVP_sd_7) MEAN(CVP_sd_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Kohärenz der Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: selects-Fragen FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(FDP_mw_1) MEAN(FDP_mw_2) MEAN(FDP_mw_3) 
    MEAN(FDP_mw_4) MEAN(FDP_mw_5) MEAN(FDP_mw_6) MEAN(FDP_mw_7) MEAN(FDP_mw_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Standardabweichung: selects-Fragen FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(FDP_sd_1) MEAN(FDP_sd_2) MEAN(FDP_sd_3) 
    MEAN(FDP_sd_4) MEAN(FDP_sd_5) MEAN(FDP_sd_6) MEAN(FDP_sd_7) MEAN(FDP_sd_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Kohärenz der Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: selects-Fragen SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SVP_mw_1) MEAN(SVP_mw_2) MEAN(SVP_mw_3) 
    MEAN(SVP_mw_4) MEAN(SVP_mw_5) MEAN(SVP_mw_6) MEAN(SVP_mw_7) MEAN(SVP_mw_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Standardabweichung: selects-Fragen SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SVP_sd_1) MEAN(SVP_sd_2) MEAN(SVP_sd_3) 
    MEAN(SVP_sd_4) MEAN(SVP_sd_5) MEAN(SVP_sd_6) MEAN(SVP_sd_7) MEAN(SVP_sd_8) MISSING=LISTWISE 
    REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Kohärenz der Antworten auf die selects-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", "7")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Zustimmung: Gesamtscore selects-Fragen nach Parteien.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_selects_mw) MEAN(SP_selects_mw) MEAN(CVP_selects_mw) 
    MEAN(FDP_selects_mw) MEAN(SVP_selects_mw) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Gesamtscore: Antworten der Parteien auf die selects-Fragen ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(100)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Gesamtscore selects-Fragen nach Parteien.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_selects_sd) MEAN(SP_selects_sd) MEAN(CVP_selects_sd) 
    MEAN(FDP_selects_sd) MEAN(SVP_selects_sd) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Gesamtscore: Kohärenz der Antworten der Parteien auf die selects-Fragen ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.
11.3	Antworten der Kandidierenden auf die smartvote-Fragen (nach Partei)
*Zustimmung: smartvote-Fragen Grüne.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Gr_mw_1) MEAN(Gr_mw_2) MEAN(Gr_mw_3) 
    MEAN(Gr_mw_4) MEAN(Gr_mw_5) MEAN(Gr_mw_6) MEAN(Gr_mw_7) MEAN(Gr_mw_8) MEAN(Gr_mw_9) MEAN(Gr_mw_10) 
    MEAN(Gr_mw_11) MEAN(Gr_mw_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: smartvote-Fragen Grüne.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Gr_sd_1) MEAN(Gr_sd_2) MEAN(Gr_sd_3) 
    MEAN(Gr_sd_4) MEAN(Gr_sd_5) MEAN(Gr_sd_6) MEAN(Gr_sd_7) MEAN(Gr_sd_8) MEAN(Gr_sd_9) MEAN(Gr_sd_10) 
    MEAN(Gr_sd_11) MEAN(Gr_sd_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Grüne: Kohärenz der Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: smartvote-Fragen SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SP_mw_1) MEAN(SP_mw_2) MEAN(SP_mw_3) 
    MEAN(SP_mw_4) MEAN(SP_mw_5) MEAN(SP_mw_6) MEAN(SP_mw_7) MEAN(SP_mw_8) MEAN(SP_mw_9) MEAN(SP_mw_10) 
    MEAN(SP_mw_11) MEAN(SP_mw_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: smartvote-Fragen SP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SP_sd_1) MEAN(SP_sd_2) MEAN(SP_sd_3) 
    MEAN(SP_sd_4) MEAN(SP_sd_5) MEAN(SP_sd_6) MEAN(SP_sd_7) MEAN(SP_sd_8) MEAN(SP_sd_9) MEAN(SP_sd_10) 
    MEAN(SP_sd_11) MEAN(SP_sd_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SP: Kohärenz der Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: smartvote-Fragen CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(CVP_mw_1) MEAN(CVP_mw_2) MEAN(CVP_mw_3) 
    MEAN(CVP_mw_4) MEAN(CVP_mw_5) MEAN(CVP_mw_6) MEAN(CVP_mw_7) MEAN(CVP_mw_8) MEAN(CVP_mw_9) MEAN(CVP_mw_10) 
    MEAN(CVP_mw_11) MEAN(CVP_mw_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: smartvote-Fragen CVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(CVP_sd_1) MEAN(CVP_sd_2) MEAN(CVP_sd_3) 
    MEAN(CVP_sd_4) MEAN(CVP_sd_5) MEAN(CVP_sd_6) MEAN(CVP_sd_7) MEAN(CVP_sd_8) MEAN(CVP_sd_9) MEAN(CVP_sd_10) 
    MEAN(CVP_sd_11) MEAN(CVP_sd_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("CVP: Kohärenz der Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: smartvote-Fragen FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(FDP_mw_1) MEAN(FDP_mw_2) MEAN(FDP_mw_3) 
    MEAN(FDP_mw_4) MEAN(FDP_mw_5) MEAN(FDP_mw_6) MEAN(FDP_mw_7) MEAN(FDP_mw_8) MEAN(FDP_mw_9) MEAN(FDP_mw_10) 
    MEAN(FDP_mw_11) MEAN(FDP_mw_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: smartvote-Fragen FDP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(FDP_sd_1) MEAN(FDP_sd_2) MEAN(FDP_sd_3) 
    MEAN(FDP_sd_4) MEAN(FDP_sd_5) MEAN(FDP_sd_6) MEAN(FDP_sd_7) MEAN(FDP_sd_8) MEAN(FDP_sd_9) MEAN(FDP_sd_10) 
    MEAN(FDP_sd_11) MEAN(FDP_sd_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("FDP: Kohärenz der Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

*Zustimmung: smartvote-Fragen SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SVP_mw_1) MEAN(SVP_mw_2) MEAN(SVP_mw_3) 
    MEAN(SVP_mw_4) MEAN(SVP_mw_5) MEAN(SVP_mw_6) MEAN(SVP_mw_7) MEAN(SVP_mw_8) MEAN(SVP_mw_9) MEAN(SVP_mw_10) 
    MEAN(SVP_mw_11) MEAN(SVP_mw_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: smartvote-Fragen SVP.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(SVP_sd_1) MEAN(SVP_sd_2) MEAN(SVP_sd_3) 
    MEAN(SVP_sd_4) MEAN(SVP_sd_5) MEAN(SVP_sd_6) MEAN(SVP_sd_7) MEAN(SVP_sd_8) MEAN(SVP_sd_9) MEAN(SVP_sd_10) 
    MEAN(SVP_sd_11) MEAN(SVP_sd_12) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("SVP: Kohärenz der Antworten auf die smartvote-Fragen (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4", "5", "6", 
    "7", "8", "9", "10", "11")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Zustimmung: Gesamtscore nach Parteien.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_sv_mw) MEAN(SP_sv_mw) MEAN(CVP_sv_mw) 
    MEAN(FDP_sv_mw) MEAN(SVP_sv_mw) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Gesamtscore: Antworten der Parteien auf die smartvote-Fragen ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Gesamtscore nach Parteien.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_sv_sd) MEAN(SP_sv_sd) MEAN(CVP_sv_sd) 
    MEAN(FDP_sv_sd) MEAN(SVP_sv_sd) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Gesamtscore: Kohärenz der Antworten der Parteien auf die smartvote-Fragen ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Zustimmung: Gesamtscore nach Parteien (relevante Themen).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_sv_mw_rel) MEAN(SP_sv_mw_rel) MEAN(CVP_sv_mw_rel) 
    MEAN(FDP_sv_mw_rel) MEAN(SVP_sv_mw_rel) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Zustimmung")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Gesamtscore: Antworten der Parteien auf die relevanten smartvote-Fragen ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Gesamtscore nach Parteien (Relevante Themen).
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=Jahr MEAN(Grüne_sv_sd_rel) MEAN(SP_sv_sd_rel) MEAN(CVP_sv_sd_rel) 
    MEAN(FDP_sv_sd_rel) MEAN(SVP_sv_sd_rel) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: Jahr=col(source(s), name("Jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Gesamtscore: Kohärenz der Antworten der Parteien auf die relevanten smartvote-Fragen ", 
    "(2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(Jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.
11.4	Verortung der Parteien auf der Links-rechts-Achse durch die Wählenden
* Mittelwerte: Verortung der Parteien auf der Links-rechts-Skala durch die Wählenden 2007-2019.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=jahr MEAN(Grüne) MEAN(SP) MEAN(CVP) MEAN(FDP) 
    MEAN(SVP) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
   TEMPLATE=["/Applications/IBM SPSS Statistics 27/SPSS "+ 
    "Statistics.app/Contents/bin/Looks/chart_style.sgt"] 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: jahr=col(source(s), name("jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Links-Rechts-Skala")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Verortung der Parteien auf der Links-rechts-Skala durch die Wählenden (2007-2019)")) 
  SCALE: linear(dim(2), include(0)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.

* Standardabweichung: Verortung der Parteien auf der Links-rechts-Skala durch die Wählenden 2007-2019.
GGRAPH 
  /GRAPHDATASET NAME="graphdataset" VARIABLES=jahr MEAN(Grüne_sd) MEAN(SP_sd) MEAN(CVP_sd) MEAN(FDP_sd) 
    MEAN(SVP_sd) MISSING=LISTWISE REPORTMISSING=NO 
    TRANSFORM=VARSTOCASES(SUMMARY="#SUMMARY" INDEX="#INDEX") 
  /GRAPHSPEC SOURCE=INLINE 
   TEMPLATE=["/Applications/IBM SPSS Statistics 27/SPSS "+ 
    "Statistics.app/Contents/bin/Looks/chart_style.sgt"] 
  /COLORCYCLE COLOR1(95,195,56), COLOR2(215,0,51), COLOR3(227,215,16), COLOR4(85,150,230), 
    COLOR5(41,134,38), COLOR6(25,128,56), COLOR7(0,45,156), COLOR8(238,83,139), COLOR9(178,134,0), 
    COLOR10(0,157,154), COLOR11(1,39,73), COLOR12(138,56,0), COLOR13(165,110,255), 
    COLOR14(236,230,208), COLOR15(69,70,71), COLOR16(92,202,136), COLOR17(208,83,52), 
    COLOR18(204,127,228), COLOR19(225,188,29), COLOR20(237,75,75), COLOR21(28,205,205), 
    COLOR22(92,113,72), COLOR23(225,139,14), COLOR24(9,38,114), COLOR25(90,100,94), COLOR26(155,0,0), 
    COLOR27(207,172,227), COLOR28(150,145,145), COLOR29(63,235,124), COLOR30(105,41,196) 
  /FRAME OUTER=NO INNER=NO 
  /GRIDLINES XAXIS=NO YAXIS=YES. 
BEGIN GPL 
  SOURCE: s=userSource(id("graphdataset")) 
  DATA: jahr=col(source(s), name("jahr"), unit.category()) 
  DATA: SUMMARY=col(source(s), name("#SUMMARY")) 
  DATA: INDEX=col(source(s), name("#INDEX"), unit.category()) 
  GUIDE: axis(dim(1), label("Jahr")) 
  GUIDE: axis(dim(2), label("Standardabweichung (Kohärenz)")) 
  GUIDE: legend(aesthetic(aesthetic.color.interior), label("")) 
  GUIDE: text.title(label("Kohärenz der Verortung der Parteien auf der Links-Rechts-Skala durch die Wählenden (2007-2019)")) 
  SCALE: linear(dim(2), min(0), max(50)) 
  SCALE: cat(aesthetic(aesthetic.color.interior), include("0", "1", "2", "3", "4")) 
  ELEMENT: line(position(jahr*SUMMARY), color.interior(INDEX), missing.wings()) 
END GPL.




