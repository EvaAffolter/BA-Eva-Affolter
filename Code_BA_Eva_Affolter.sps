* Encoding: UTF-8.

***Auswertungen.
*Auswertungen 2007.
***1. Schritt: Verortung der Parteien auf der Links-rechts-Achse durch die Kandidierenden.
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE c3a (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    Links_rechts_umcodiert_BA.
EXECUTE.

*Nur die fünf grössten Parteien der Schweiz filtern (GPS, SP, CVP, FDP, SVP).
COMPUTE filter_$=(party_national_ID=84 | party_national_ID=82 | party_national_ID=86 | 
    party_national_ID= 85 | party_national_ID=83). 
VARIABLE LABELS filter_$ 'party_national_ID=84 | party_national_ID=82 | party_national_ID=86 | '+ 
    'party_national_ID= 85 | party_national_ID=83 (FILTER)'. 
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'. 
FORMATS filter_$ (f1.0). 
FILTER BY filter_$. 
EXECUTE.

* Tabelle Verteilung der Links-rechts-Verortung pro Partei/wie gross das N der Verortungen ist. 
CTABLES 
  /VLABELS VARIABLES=Links_rechts_umcodiert_BA party_na DISPLAY=LABEL 
  /TABLE Links_rechts_umcodiert_BA [COUNT F40.0] BY party_na 
  /CATEGORIES VARIABLES=Links_rechts_umcodiert_BA ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_na ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.   

*Histogramm und Häufigkeiten der fünf Parteien zusammen.
    FREQUENCIES VARIABLES=Links_rechts_umcodiert_BA party_national_name
  /STATISTICS=STDDEV VARIANCE MINIMUM MAXIMUM SEMEAN MEAN MEDIAN MODE SUM 
  /HISTOGRAM NORMAL 
  /ORDER=ANALYSIS.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=Links_rechts_umcodiert_BA party_national_name DISPLAY=LABEL 
  /TABLE Links_rechts_umcodiert_BA [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV, VARIANCE]] BY 
    party_national_name 
  /CATEGORIES VARIABLES=Links_rechts_umcodiert_BA ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_national_name ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= Links_rechts_umcodiert_BA  BY party_national_ID
  /CELLS=MEAN COUNT STDDEV.

*neue Variable erstellen: gewählt NR und SR zusammen.
 COMPUTE MP_all_BA_2007=sr_in_office = 1 + nr_in_office = 1. 
EXECUTE. 
FREQUENCIES VARIABLES=MP_all_BA_2007
  /STATISTICS=RANGE MINIMUM MAXIMUM MODE 
  /ORDER=ANALYSIS.

*Mittelwerte vergleichen von den gewählten und nicht gewählten.
MEANS TABLES=Links_rechts_umcodiert_BA BY party_national_ID BY MP_all_BA_2007 
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen von den verschiedenen Altersgruppen.
MEANS TABLES=Links_rechts_umcodiert_BA BY party_national_ID BY C_age_REC2 
  /CELLS=MEAN COUNT STDDEV.
*Mittelwerte vergleichen zwischen den Geschlechtern.
MEANS TABLES=Links_rechts_umcodiert_BA BY party_national_ID BY gender 
  /CELLS=MEAN COUNT STDDEV.

***2. Schritt: smartvote-Fragen.
*Wichtigstes Problem (1,2,3) pro Partei.
CTABLES 
  /VLABELS VARIABLES=c1ar party_national_name DISPLAY=LABEL 
  /TABLE c1ar  BY party_national_name [COUNT F40.0] 
  /CATEGORIES VARIABLES=c1ar c1br c1cr ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_national_name ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Zustimmung smartvote-Fragen (nicht recodiert).
CTABLES 
  /VLABELS VARIABLES=sv_question1 sv_question6 sv_question13 sv_question15 sv_question20 
    sv_question18 sv_question21 sv_question31 sv_question33 sv_question34 sv_question11 sv_question60 
    party_national_name
    DISPLAY=LABEL 
  /TABLE party_national_name [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY sv_question1 + sv_question6 + sv_question13 + sv_question15 + sv_question20 + 
    sv_question18 + sv_question21 + sv_question31 + sv_question33 + sv_question34 + sv_question11 + 
    sv_question60
  /CATEGORIES VARIABLES=party_national_name ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=sv_question1 sv_question6 sv_question13 sv_question15 sv_question20 
    sv_question18 sv_question21 sv_question31 sv_question33 sv_question34 sv_question11 sv_question60 ORDER=A KEY=VALUE EMPTY=INCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung smartvote-Fragen. (nicht recodiert).
MEANS TABLES=sv_question1 sv_question6 sv_question13 sv_question15 sv_question20 sv_question18 sv_question21 
  sv_question31 sv_question33 sv_question34 sv_question11 sv_question60 BY party_national_ID 
  /CELLS=MEAN COUNT STDDEV.

***3. Schritt: selects-Fragen.
* Antwortwerte umcodieren.
RECODE c2a (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2a_REC_BA.
EXECUTE.

RECODE c2b (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2b_REC_BA.
EXECUTE.

RECODE c2c (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2c_REC_BA.
EXECUTE.

RECODE c2f (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2f_REC_BA.
EXECUTE.

RECODE c2g (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2g_REC_BA.
EXECUTE.

RECODE c2h (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2h_REC_BA.
EXECUTE.

RECODE c2j (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2j_REC_BA.
EXECUTE.

RECODE c2k (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2k_REC_BA.
EXECUTE.

*Umcodierte Variablen neu labeln.
VALUE LABELS c2a_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2b_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.
VALUE LABELS c2c_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2f_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2g_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2h_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2j_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2k_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

*Den umcodierten Variablen die Fragetexte zuweisen.
VARIABLE LABELS c2a_REC_BA "Immigrants should be required to adjust to the customs of Switzerland?".
VARIABLE LABELS c2b_REC_BA "Politics should abstain from intervening in the economy?".
VARIABLE LABELS c2c_REC_BA "Stronger measures should be taken to protect the environment?".
VARIABLE LABELS c2f_REC_BA "People who break the law should be given stiffer sentences?".
VARIABLE LABELS c2g_REC_BA "Providing a stable network of social security should be the prime goal of government?".
VARIABLE LABELS c2h_REC_BA "Income and wealth should be redistributed towards ordinary people?".
VARIABLE LABELS c2j_REC_BA "Immigrants are good for the Swiss economy?".
VARIABLE LABELS c2k_REC_BA "Women should be free to decide on matters of abortion?".

*Zustimmung selects-Fragen (recodiert).
CTABLES 
  /VLABELS VARIABLES= party_national_ID c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA c2j_REC_BA c2k_REC_BA
    DISPLAY=LABEL 
  /TABLE party_national_name [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY c2a_REC_BA + c2b_REC_BA + c2c_REC_BA + c2f_REC_BA + c2g_REC_BA + c2h_REC_BA + c2j_REC_BA + c2k_REC_BA 
  /CATEGORIES VARIABLES=party_national_name ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA c2j_REC_BA c2k_REC_BA  ORDER=A KEY=VALUE EMPTY=INCLUDE 
    TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung selects-Fragen (recodiert). 
MEANS TABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA c2j_REC_BA c2k_REC_BA BY party_national_ID 
  /CELLS=MEAN COUNT STDDEV.

*Auswertungen 2011.
***1. Schritt: Verortung der Parteien auf der Links-rechts-Achse durch die Kandidierenden.
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE BA_LR_2011 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    BA_LR_2011_REC.
EXECUTE.

*Nur die fünf grössten Parteien der Schweiz filtern.
USE ALL. 
COMPUTE filter_$=(PartyID_BA = 1 | PartyID_BA = 2  | PartyID_BA = 4  | PartyID_BA = 
    6  |  PartyID_BA = 7). 
VARIABLE LABELS filter_$ 'PartyID_BA = 1 | PartyID_BA = 2  | PartyID_BA = 4  | '+ 
    'PartyID_BA = 6  |  PartyID_BA = 7 (FILTER)'. 
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'. 
FORMATS filter_$ (f1.0). 
FILTER BY filter_$. 
EXECUTE.

   * Tabelle Verteilung der Links-rechts-Verortung pro Partei/wie gross das N der Verortungen ist. 
CTABLES 
  /VLABELS VARIABLES=BA_LR_2011_REC PartyID_BA DISPLAY=LABEL 
  /TABLE BA_LR_2011_REC [COUNT F40.0] BY PartyID_BA 
  /CATEGORIES VARIABLES=BA_LR_2011_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=PartyID_BA ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.   

*Histogramm und Häufigkeiten der einzelnen Parteien.
    FREQUENCIES VARIABLES=BA_LR_2011_REC
  /STATISTICS=STDDEV VARIANCE MINIMUM MAXIMUM SEMEAN MEAN MEDIAN MODE SUM 
  /HISTOGRAM NORMAL 
  /ORDER=ANALYSIS.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=BA_LR_2011_REC PartyID_BA DISPLAY=LABEL 
  /TABLE BA_LR_2011_REC [COU
  NT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV, VARIANCE]] BY 
    PartyID_BA 
  /CATEGORIES VARIABLES=BA_LR_2011_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=PartyID_BA ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= BA_LR_2011_REC  BY PartyID_BA
  /CELLS=MEAN COUNT STDDEV.

*neue Variable erstellen: gewählt NR und SR zusammen.
COMPUTE MP_all_BA_2011=MP_NR + MP_SR. 
EXECUTE.

*Mittelwerte vergleichen von den gewählten und nicht gewählten.
MEANS TABLES=BA_LR_2011_REC BY PartyID_BA BY MP_all_BA_2011 
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen von den verschiedenen Altersgruppen.
MEANS TABLES=BA_LR_2011_REC BY PartyID_BA BY C_ageREC2 
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen zwischen den Geschlechtern.
MEANS TABLES=BA_LR_2011_REC BY PartyID_BA BY C_F1 
  /CELLS=MEAN COUNT STDDEV.

***2. Schritt, smartvote-Fragen.
*Wichtigstes Problem (1,2,3) pro Partei.
CTABLES 
  /VLABELS VARIABLES=C1ar PartyID_BA DISPLAY=LABEL 
  /TABLE C1ar  BY PartyID_BA [COUNT F40.0] 
  /CATEGORIES VARIABLES=C1ar ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=PartyID_BA ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Zustimmung smartvote-Fragen (nicht recodiert).
CTABLES 
  /VLABELS VARIABLES=PartyID_BA C_sv_answer_1 C_sv_answer_2 C_sv_answer_16 C_sv_answer_15 
    C_sv_answer_22 C_sv_answer_21 C_sv_answer_24 C_sv_answer_30 C_sv_answer_32 C_sv_answer_33 
    C_sv_answer_41 C_sv_answer_59 
    DISPLAY=LABEL 
  /TABLE PartyID_BA [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY C_sv_answer_1 + C_sv_answer_2 + 
    C_sv_answer_16 + C_sv_answer_15 + C_sv_answer_22 + C_sv_answer_21 + C_sv_answer_24 + C_sv_answer_30 
    + C_sv_answer_32 + C_sv_answer_33 + C_sv_answer_41 + C_sv_answer_59 
  /CATEGORIES VARIABLES=PartyID_BA ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=C_sv_answer_1 C_sv_answer_2 C_sv_answer_16 C_sv_answer_15 C_sv_answer_22 
    C_sv_answer_21 C_sv_answer_24 C_sv_answer_30 C_sv_answer_32 C_sv_answer_33 C_sv_answer_41 
    C_sv_answer_59 ORDER=A KEY=VALUE EMPTY=INCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung smartvote-Fragen. (nicht recodiert).
MEANS TABLES=C_sv_answer_1 C_sv_answer_2 C_sv_answer_16 C_sv_answer_15 C_sv_answer_22 C_sv_answer_21 C_sv_answer_24 C_sv_answer_30 C_sv_answer_32 
    C_sv_answer_33 C_sv_answer_41 C_sv_answer_59 BY PartyID_BA 
  /CELLS=MEAN COUNT STDDEV.

***3. Schritt: selects-Fragen.
* Antwortwerte umcodieren.
RECODE c2a (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2a_REC_BA.
EXECUTE.

RECODE c2b (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2b_REC_BA.
EXECUTE.

RECODE c2c (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2c_REC_BA.
EXECUTE.

RECODE c2f (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2f_REC_BA.
EXECUTE.

RECODE c2g (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2g_REC_BA.
EXECUTE.

RECODE c2h (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2h_REC_BA.
EXECUTE.

RECODE c2j (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2j_REC_BA.
EXECUTE.

RECODE c2k (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2k_REC_BA.
EXECUTE.

*Umcodierte Variablen neu labeln.
VALUE LABELS c2a_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2b_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2c_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2f_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2g_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2h_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2j_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2k_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

*Den umcodierten Variablen die Fragetexte zuweisen.
VARIABLE LABELS c2a_REC_BA "Immigrants should be required to adjust to the customs of Switzerland?".
VARIABLE LABELS c2b_REC_BA "Politics should abstain from intervening in the economy?".
VARIABLE LABELS c2c_REC_BA "Stronger measures should be taken to protect the environment?".
VARIABLE LABELS c2f_REC_BA "People who break the law should be given stiffer sentences?".
VARIABLE LABELS c2g_REC_BA "Providing a stable network of social security should be the prime goal of government?".
VARIABLE LABELS c2h_REC_BA "Income and wealth should be redistributed towards ordinary people?".
VARIABLE LABELS c2j_REC_BA "Immigrants are good for the Swiss economy?".
VARIABLE LABELS c2k_REC_BA "Women should be free to decide on matters of abortion?".   
    
*Zustimmung selects-Fragen (recodiert).
* Benutzerdefinierte Tabellen. 
CTABLES 
  /VLABELS VARIABLES=PartyID_BA c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2j_REC_BA c2k_REC_BA 
    DISPLAY=LABEL 
  /TABLE PartyID_BA [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY c2a_REC_BA + c2b_REC_BA + c2c_REC_BA + 
    c2f_REC_BA + c2g_REC_BA + c2h_REC_BA + c2j_REC_BA + c2k_REC_BA 
  /CATEGORIES VARIABLES=PartyID_BA ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2j_REC_BA c2k_REC_BA ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung selects-Fragen (recodiert). 
MEANS TABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2j_REC_BA c2k_REC_BA  BY PartyID_BA 
  /CELLS=MEAN COUNT STDDEV.

*Auswertungen 2015.
***1. Schritt: Verortung der Parteien auf der Links-rechts-Achse durch die Kandidierenden.
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE BL_LR_2015 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    BA_LR_2015_REC.
EXECUTE.

*Nur die fünf grössten Parteien der Schweiz filtern (GPS, SP, CVP, FDP, SVP).
COMPUTE filter_$=(party_REC = 1 | party_REC = 2 | party_REC = 3 | party_REC = 4 | party_REC = 5). 
VARIABLE LABELS filter_$ 'party_REC = 1 | party_REC = 2 | party_REC = 3 | party_REC = 4 | '+ 
    'party_REC = 5 (FILTER)'. 
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'. 
FORMATS filter_$ (f1.0). 
FILTER BY filter_$. 
EXECUTE.

* Tabelle Verteilung der Links-rechts-Verortung pro Partei/wie gross das N der Verortungen ist. 
CTABLES 
  /VLABELS VARIABLES=BA_LR_2015_REC party_REC DISPLAY=LABEL 
  /TABLE BA_LR_2015_REC [COUNT F40.0] BY party_REC 
  /CATEGORIES VARIABLES=BA_LR_2015_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_REC ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.   

*Histogramm und Häufigkeiten der fünf Parteien zusammen.
    FREQUENCIES VARIABLES=BA_LR_2015_REC party_REC
  /STATISTICS=STDDEV VARIANCE MINIMUM MAXIMUM SEMEAN MEAN MEDIAN MODE SUM 
  /HISTOGRAM NORMAL 
  /ORDER=ANALYSIS.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=BA_LR_2015_REC party_REC DISPLAY=LABEL 
  /TABLE BA_LR_2015_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV, VARIANCE]] BY 
    party_REC 
  /CATEGORIES VARIABLES=BA_LR_2015_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_REC ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= BA_LR_2015_REC  BY party_REC
  /CELLS=MEAN COUNT STDDEV.

*neue Variable erstellen: gewählt NR und SR zusammen.
COMPUTE MP_all_BA_2015=MP_NR + MP_SR. 
EXECUTE.

*Mittelwerte vergleichen von den gewählten und nicht gewählten.
MEANS TABLES=BA_LR_2015_REC BY party_REC BY MP_all_BA_2015
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen von den verschiedenen Altersgruppen.
MEANS TABLES=BA_LR_2015_REC BY party_REC BY age_REC2 
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen zwischen den Geschlechtern.
MEANS TABLES=BA_LR_2015_REC BY party_REC BY gender 
  /CELLS=MEAN COUNT STDDEV.

***2. Schritt: smartvote-Fragen.
*Wichtigstes Problem (1,2,3) pro Partei.
 * Benutzerdefinierte Tabellen. 
CTABLES 
  /VLABELS VARIABLES=C1a_r party_REC DISPLAY=LABEL 
  /TABLE C1a_r  BY party_REC [COUNT F40.0] 
  /CATEGORIES VARIABLES=C1a_r ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_REC ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Zustimmung smartvote-Fragen (nicht recodiert).
CTABLES 
  /VLABELS VARIABLES=party_REC answer_1433 answer_1434  answer_1449 answer_1452  answer_1456  answer_1454  answer_1458  
  answer_1462  answer_1467  answer_1472 answer_1478  answer_1493 
    DISPLAY=LABEL 
  /TABLE party_REC [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY answer_1433  + answer_1434  + answer_1449  + answer_1452  + 
  answer_1456  + answer_1454  + answer_1458  + answer_1462  + answer_1467  + answer_1472  + answer_1478  + answer_1493 
  /CATEGORIES VARIABLES=party_REC ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=party_REC answer_1433  answer_1434  answer_1449  answer_1452  answer_1456  answer_1454  
  answer_1458  answer_1462  answer_1467  answer_1472  answer_1478  answer_1493  ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung smartvote-Fragen. (nicht recodiert).
MEANS TABLES=answer_1433 answer_1434  answer_1449 answer_1452  answer_1456  answer_1454  answer_1458  
  answer_1462  answer_1467  answer_1472 answer_1478  answer_1493 BY party_REC 
  /CELLS=MEAN COUNT STDDEV.

***3. Schritt: selects-Fragen.
* Antwortwerte umcodieren.
RECODE c2a (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2a_REC_BA.
EXECUTE.

RECODE c2b (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2b_REC_BA.
EXECUTE.

RECODE c2c (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2c_REC_BA.
EXECUTE.

RECODE c2f (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2f_REC_BA.
EXECUTE.

RECODE c2g (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2g_REC_BA.
EXECUTE.

RECODE c2h (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2h_REC_BA.
EXECUTE.

RECODE c2i (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2i_REC_BA.
EXECUTE.

RECODE c2j (1=100) (2=75) (3=50) (4=25) (5=0) INTO 
    c2j_REC_BA.
EXECUTE.

*Umcodierte Variablen neu labeln.
VALUE LABELS c2a_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2b_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2c_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2f_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2g_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2h_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2i_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2j_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

*Den umcodierten Variablen die Fragetexte zuweisen.
VARIABLE LABELS c2a_REC_BA "Immigrants should be required to adjust to the customs of Switzerland?".
VARIABLE LABELS c2b_REC_BA "Politics should abstain from intervening in the economy?".
VARIABLE LABELS c2c_REC_BA "Stronger measures should be taken to protect the environment?".
VARIABLE LABELS c2f_REC_BA "People who break the law should be given stiffer sentences?".
VARIABLE LABELS c2g_REC_BA "Providing a stable network of social security should be the prime goal of government?".
VARIABLE LABELS c2h_REC_BA "Income and wealth should be redistributed towards ordinary people?".
VARIABLE LABELS c2i_REC_BA "Immigrants are good for the Swiss economy?".
VARIABLE LABELS c2j_REC_BA "Women should be free to decide on matters of abortion?".
    
*Zustimmung selects-Fragen (recodiert).
CTABLES 
  /VLABELS VARIABLES=party_REC c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2i_REC_BA c2j_REC_BA 
    DISPLAY=LABEL 
  /TABLE party_REC [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY c2a_REC_BA + c2b_REC_BA + c2c_REC_BA + 
    c2f_REC_BA + c2g_REC_BA + c2h_REC_BA + c2i_REC_BA + c2j_REC_BA 
  /CATEGORIES VARIABLES=party_REC ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2i_REC_BA c2j_REC_BA ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung selects-Fragen (recodiert). 
MEANS TABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2i_REC_BA c2j_REC_BA  BY party_REC 
  /CELLS=MEAN COUNT STDDEV.

*Auswertungen 2019.
***1. Schritt: Verortung der Parteien auf der Links-rechts-Achse durch die Kandidierenden.
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE BA_LR_2019 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    BA_LR_2019_REC.
EXECUTE.

*Nur die fünf grössten Parteien der Schweiz filtern (GPS, SP, CVP, FDP, SVP).
USE ALL. 
COMPUTE filter_$=(party_REC7 = 1 | party_REC7 = 2 | party_REC7 = 3 | party_REC7 = 4 | party_REC7 = 5). 
VARIABLE LABELS filter_$ 'party_REC7 = 1 | party_REC7 = 2 | party_REC7 = 3 | party_REC7 = 4 | '+ 
    'party_REC7 = 5 (FILTER)'. 
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'. 
FORMATS filter_$ (f1.0). 
FILTER BY filter_$. 
EXECUTE.

* Tabelle Verteilung der Links-rechts-Verortung pro Partei/wie gross das N der Verortungen ist. 
CTABLES 
  /VLABELS VARIABLES=BA_LR_2019_REC party_REC7 DISPLAY=LABEL 
  /TABLE BA_LR_2019_REC [COUNT F40.0] BY party_REC7 
  /CATEGORIES VARIABLES=BA_LR_2019_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_REC7 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.   

**Histogramm und Häufigkeiten der einzelnen Parteien.
    FREQUENCIES VARIABLES=BA_LR_2019_REC party_REC7 
  /STATISTICS=STDDEV VARIANCE MINIMUM MAXIMUM SEMEAN MEAN MEDIAN MODE SUM 
  /HISTOGRAM NORMAL 
  /ORDER=ANALYSIS.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=BA_LR_2019_REC party_REC7 DISPLAY=LABEL 
  /TABLE BA_LR_2019_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV, VARIANCE]] BY 
    party_REC7 
  /CATEGORIES VARIABLES=BA_LR_2019_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_REC7 ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= BA_LR_2019_REC  BY party_REC7
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen von den gewählten und nicht gewählten.
MEANS TABLES=BA_LR_2019_REC BY party_REC7 BY MP 
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen von den verschiedenen Altersgruppen.
MEANS TABLES=BA_LR_2019_REC BY party_REC7 BY age_REC6 
  /CELLS=MEAN COUNT STDDEV.

*Mittelwerte vergleichen zwischen den Geschlechtern.
MEANS TABLES=BA_LR_2019_REC BY party_REC7 BY gender 
  /CELLS=MEAN COUNT STDDEV.

***2. Schritt: smartvote-Fragen.
*Wichtigstes Problem (1,2,3) pro Partei.
 * Benutzerdefinierte Tabellen. 
CTABLES 
  /VLABELS VARIABLES=C1br party_REC7 DISPLAY=LABEL 
  /TABLE C1br  BY party_REC7 [COUNT F40.0] 
  /CATEGORIES VARIABLES=C1br ORDER=A KEY=VALUE EMPTY=INCLUDE MISSING=EXCLUDE 
  /CATEGORIES VARIABLES=party_REC7 ORDER=A KEY=VALUE EMPTY=EXCLUDE 
  /CRITERIA CILEVEL=95.

*Zustimmung smartvote-Fragen (nicht recodiert).
CTABLES 
  /VLABELS VARIABLES=party_REC7 answer_3412 answer_3413 answer_3427 answer_3429 answer_3392 answer_3432 answer_3435 
  answer_3436 answer_3441 answer_3443 answer_3454 answer_3468
    DISPLAY=LABEL 
  /TABLE party_REC7 [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY answer_3412 + answer_3413 + answer_3427 + answer_3429 + answer_3392 + answer_3432 + answer_3435 + 
  answer_3436 + answer_3441 + answer_3443 + answer_3454 + answer_3468
  /CATEGORIES VARIABLES=party_REC7 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=party_REC7 answer_3412 answer_3413 answer_3427 answer_3429 answer_3392 answer_3432 answer_3435 answer_3436 answer_3441 
  answer_3443 answer_3454 answer_3468 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung smartvote-Fragen. (nicht recodiert).
MEANS TABLES=answer_3412 answer_3413 answer_3427 answer_3429 answer_3392 answer_3432 answer_3435 answer_3436 answer_3441 answer_3443 
  answer_3454 answer_3468 BY party_REC7 
  /CELLS=MEAN COUNT STDDEV.

***3. Schritt: selects-Fragen.
* Antwortwerte umcodieren.
RECODE c2a (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2a_REC_BA.
EXECUTE.

RECODE c2b (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2b_REC_BA.
EXECUTE.

RECODE c2c (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2c_REC_BA.
EXECUTE.

RECODE c2f (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2f_REC_BA.
EXECUTE.

RECODE c2g (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2g_REC_BA.
EXECUTE.

RECODE c2h (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2h_REC_BA.
EXECUTE.

RECODE c2i (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2i_REC_BA.
EXECUTE.

RECODE c2j (1=0) (2=25) (3=50) (4=75) (5=100) INTO 
    c2j_REC_BA.
EXECUTE.
*Umcodierte Variablen neu labeln.
VALUE LABELS c2a_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2b_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2c_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2f_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2g_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2h_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2i_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

VALUE LABELS c2j_REC_BA
0 "Nein"
25 "Eher Nein"
75 "Eher Ja"
100 "Ja".
EXECUTE.

*Den umcodierten Variablen die Fragetexte zuweisen.
VARIABLE LABELS c2a_REC_BA "Immigrants should be required to adjust to the customs of Switzerland?".
VARIABLE LABELS c2b_REC_BA "Politics should abstain from intervening in the economy?".
VARIABLE LABELS c2c_REC_BA "Stronger measures should be taken to protect the environment?".
VARIABLE LABELS c2f_REC_BA "People who break the law should be given stiffer sentences?".
VARIABLE LABELS c2g_REC_BA "Providing a stable network of social security should be the prime goal of government?".
VARIABLE LABELS c2h_REC_BA "Income and wealth should be redistributed towards ordinary people?".
VARIABLE LABELS c2i_REC_BA "Immigrants are good for the Swiss economy?".
VARIABLE LABELS c2j_REC_BA "Women should be free to decide on matters of abortion?".
   
*Zustimmung selects-Fragen (recodiert).
CTABLES 
  /VLABELS VARIABLES=party_REC7 c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2i_REC_BA c2j_REC_BA 
    DISPLAY=LABEL 
  /TABLE party_REC7 [COUNT F40.0, ROWPCT.COUNT PCT40.1] BY c2a_REC_BA + c2b_REC_BA + c2c_REC_BA + 
    c2f_REC_BA + c2g_REC_BA + c2h_REC_BA + c2i_REC_BA + c2j_REC_BA 
  /CATEGORIES VARIABLES=party_REC7 ORDER=A KEY=VALUE EMPTY=EXCLUDE TOTAL=YES POSITION=AFTER 
  /CATEGORIES VARIABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2i_REC_BA c2j_REC_BA ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte und Standardabweichung selects-Fragen (recodiert). 
MEANS TABLES=c2a_REC_BA c2b_REC_BA c2c_REC_BA c2f_REC_BA c2g_REC_BA c2h_REC_BA 
    c2i_REC_BA c2j_REC_BA  BY party_REC7 
  /CELLS=MEAN COUNT STDDEV.

*Auswertung Wählende 2007-2019.
***2007
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE f15300a (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_CVP_REC.
EXECUTE.

RECODE f15300b (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_FDP_REC.
EXECUTE.

RECODE f15300c (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SP_REC.
EXECUTE.

RECODE f15300d (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SVP_REC.
EXECUTE.

RECODE f15300e (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_grüne_REC.
EXECUTE.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC DISPLAY=LABEL 
  /TABLE LR_CVP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + 
    LR_FDP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_grüne_REC [COUNT F40.0, 
    COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SVP_REC [COUNT F40.0, COLPCT.COUNT 
    PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] 
  /CATEGORIES VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC ORDER=A KEY=VALUE EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= LR_CVP_REC LR_FDP_REC LR_SP_REC LR_SVP_REC LR_grüne_REC
  /CELLS=MEAN COUNT STDDEV.

***2011
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE f15300a (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_CVP_REC.
EXECUTE.

RECODE f15300b (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_FDP_REC.
EXECUTE.

RECODE f15300c (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SP_REC.
EXECUTE.

RECODE f15300d (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SVP_REC.
EXECUTE.

RECODE f15300e (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_grüne_REC.
EXECUTE.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC DISPLAY=LABEL 
  /TABLE LR_CVP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + 
    LR_FDP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SP_REC 
    [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_grüne_REC [COUNT F40.0, 
    COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SVP_REC [COUNT F40.0, COLPCT.COUNT 
    PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] 
  /CATEGORIES VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC ORDER=A KEY=VALUE 
    EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= LR_CVP_REC LR_FDP_REC LR_SP_REC LR_SVP_REC LR_grüne_REC
  /CELLS=MEAN COUNT STDDEV.

*** 2015
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE f15130 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_FDP_REC.
EXECUTE.

RECODE f15131 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_CVP_REC.
EXECUTE.

RECODE f15132 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SP_REC.
EXECUTE.

RECODE f15133 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SVP_REC.
EXECUTE.

RECODE f15134 (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_grüne_REC.
EXECUTE.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC DISPLAY=LABEL 
  /TABLE LR_CVP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + 
    LR_FDP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SP_REC 
    [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_grüne_REC [COUNT F40.0, 
    COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SVP_REC [COUNT F40.0, COLPCT.COUNT 
    PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] 
  /CATEGORIES VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC ORDER=A KEY=VALUE 
    EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= LR_CVP_REC LR_FDP_REC LR_SP_REC LR_SVP_REC LR_grüne_REC
  /CELLS=MEAN COUNT STDDEV.

***2019
*Links-Rechts-Skala umcodieren.
DATASET ACTIVATE DataSet1.
RECODE f15130a (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_FDP_REC.
EXECUTE.

RECODE f15130b (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_CVP_REC.
EXECUTE.

RECODE f15130c (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SP_REC.
EXECUTE.

RECODE f15130d (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_SVP_REC.
EXECUTE.

RECODE f15130e (0=0) (1=10) (2=20) (3=30) (4=40) (5=50) (6=60) (7=70) (8=80) (9=90) (10=100) INTO 
    LR_grüne_REC.
EXECUTE.

*Mittelwert und Standardabweichung der Verortungen pro Partei. 
CTABLES 
  /VLABELS VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC DISPLAY=LABEL 
  /TABLE LR_CVP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + 
    LR_FDP_REC [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SP_REC 
    [COUNT F40.0, COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_grüne_REC [COUNT F40.0, 
    COLPCT.COUNT PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] + LR_SVP_REC [COUNT F40.0, COLPCT.COUNT 
    PCT40.1, TOTALS[COUNT F40.0, MEAN, STDDEV]] 
  /CATEGORIES VARIABLES=LR_CVP_REC LR_FDP_REC LR_SP_REC LR_grüne_REC LR_SVP_REC ORDER=A KEY=VALUE 
    EMPTY=INCLUDE TOTAL=YES POSITION=AFTER 
  /CRITERIA CILEVEL=95.

*Mittelwerte vergleichen der fünf Parteien.
MEANS TABLES= LR_CVP_REC LR_FDP_REC LR_SP_REC LR_SVP_REC LR_grüne_REC
  /CELLS=MEAN COUNT STDDEV.


***Grafiken.
*Verortung der Parteien auf der Links-rechts-Achse durch die Kandidierenden.
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

*Innerhalb der Parteien: gewählt und nicht gewählt.
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

*Innerhalb der Parteien: nach Alter.
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

*Innerhalb der Partei: nach Geschlecht.
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


*Antworten der Kandidierenden auf die selects-Fragen (nach Partei).
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


*Antworten der Kandidierenden auf die smartvote-Fragen (nach Partei).
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


*Verortung der Parteien auf der Links-rechts-Achse durch die Wählenden.
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



