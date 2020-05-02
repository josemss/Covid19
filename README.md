Covid-19: The case of Spain
================
JMSS \[Usal - CIC\]
(updated: 02 may 2020)

# Models for the COVID-19 pandemic in Spain

## DATA

Daily data: [Datadista
GitHub](https://github.com/datadista/datasets/tree/master/COVID%2019)
(and Ministerio de Sanidad
[MSCBS](https://www.mscbs.gob.es/profesionales/saludPublica/ccayes/alertasActual/nCov-China/situacionActual.htm))

![](README_files/figure-gfm/data%20plots-1.png)<!-- -->![](README_files/figure-gfm/data%20plots-2.png)<!-- -->![](README_files/figure-gfm/data%20plots-3.png)<!-- -->![](README_files/figure-gfm/data%20plots-4.png)<!-- -->

Since we do not know the true data of infected people, two important
variables to take into account are the daily increase in infected and
death people.

![](README_files/figure-gfm/increase%20plot-1.png)<!-- -->![](README_files/figure-gfm/increase%20plot-2.png)<!-- -->

The following graph shows the differences between CC.AA. (regions) in
mortality per 10,000 inhabitants.

![](README_files/figure-gfm/mort-1.png)<!-- -->

-----

## CUBIC SPLINES

Since April 5, I propose this new model to predict the number of deaths,
cause the SIR and Regression models seem to make bigger mistakes in
their predictions.

It is based on interpolation with cubic splines. See
[Wikipedia](https://en.wikipedia.org/wiki/Spline_interpolation)

![](README_files/figure-gfm/splinesI-1.png)<!-- -->

![](README_files/figure-gfm/splinesD-1.png)<!-- -->

##### Infecteds forecast for tomorrow (2020-05-03): 247936

##### Deaths forecast for tomorrow (2020-05-03): 25376

Previous predictions:

    Infecteds forecast:

    06-04 -> predicted = 136782; observed = 141989; error = -3.81%
    07-04 -> predicted = 139305; observed = 147252; error = -5.70%
    08-04 -> predicted = 145988; observed = 152808; error = -4.67%
    09-04 -> predicted = 152870; observed = 158512; error = -3.69%
    10-04 -> predicted = 158202; observed = 163111; error = -3.10%
    11-04 -> predicted = 161598; observed = 167717; error = -3.79%
    12-04 -> predicted = 166682; observed = 171673; error = -2.99%
    13-04 -> predicted = 170186; observed = 174834; error = -2.73%
    14-04 -> predicted = 172973; observed = 178022; error = -2.92%
    15-04 -> predicted = 175586; observed = 182519; error = -3.95%
    16-04 -> predicted = 182725; observed = 187582; error = -2.66%
    17-04 -> predicted = 187999; observed = 192256; error = -2.26%
    18-04 -> predicted = 193320; observed = 197142; error = -1.98%
    19-04 -> predicted = 195384; observed = 202293; error = -3.54%
    20-04 -> predicted = 200162; observed = 205927; error = -2.88%
    21-04 -> predicted = 204476; observed = 209525; error = -2.47%
    22-04 -> predicted = 208146; observed = 213246; error = -2.45%
    23-04 -> predicted = 212600; observed = 217970; error = -2.53%
    24-04 -> predicted = 217659; observed = 221456; error = -1.74%
    25-04 -> predicted = 226504; observed = 225314; error =  0.53%
    26-04 -> predicted = 227754; observed = 228101; error = -0.15%
    27-04 -> predicted = 229499; observed = 230705; error = -0.53%
    28-04 -> predicted = 232215; observed = 233549; error = -0.57%
    29-04 -> predicted = 234834; observed = 236872; error = -0.87%
    30-04 -> predicted = 240088; observed = 240007; error =  0.03%
    01-05 -> predicted = 242630; observed = 243198; error = -0.23%
    02-05 -> predicted = 246030; observed = 245567; error =  0.19%

    Deaths forecast:

    06-04 -> predicted = 13092; observed = 12462; error =  4.81%
    07-04 -> predicted = 13692; observed = 13219; error =  3.45%
    08-04 -> predicted = 14541; observed = 13976; error =  3.89%
    09-04 -> predicted = 15312; observed = 14757; error =  3.62%
    10-04 -> predicted = 15921; observed = 15399; error =  3.28%
    11-04 -> predicted = 16448; observed = 15899; error =  3.34%
    12-04 -> predicted = 16863; observed = 16505; error =  2.12%
    13-04 -> predicted = 17591; observed = 17056; error =  3.04%
    14-04 -> predicted = 18006; observed = 17591; error =  2.30%
    15-04 -> predicted = 18623; observed = 18276; error =  1.86%
    16-04 -> predicted = 19102; observed = 18893; error =  1.09%
    17-04 -> predicted = 19681; observed = 19478; error =  1.03%
    18-04 -> predicted = 19826; observed = 20043; error = -1.09%
    19-04 -> predicted = 20608; observed = 20453; error =  0.75%
    20-04 -> predicted = 20863; observed = 20852; error =  0.05%
    21-04 -> predicted = 21251; observed = 21282; error = -0.15%
    22-04 -> predicted = 21712; observed = 21717; error = -0.02%
    23-04 -> predicted = 22152; observed = 22157; error = -0.02%
    24-04 -> predicted = 22597; observed = 22524; error =  0.32%
    25-04 -> predicted = 22891; observed = 22902; error = -0.05%
    26-04 -> predicted = 23280; observed = 23190; error =  0.39%
    27-04 -> predicted = 23478; observed = 23521; error = -0.18%
    28-04 -> predicted = 23852; observed = 23822; error =  0.13%
    29-04 -> predicted = 24123; observed = 24275; error = -0.63%
    30-04 -> predicted = 24728; observed = 24543; error =  0.75%
    01-05 -> predicted = 24811; observed = 24824; error = -0.05%
    02-05 -> predicted = 25105; observed = 25100; error =  0.02%

-----

## REGRESSION MODEL

Here I use a polynomial regression model to predict number of infecteds
and deaths. See
[Wikipedia.](https://en.wikipedia.org/wiki/Regression_analysis).

I started using a cubic model but as time went on the predictions got
worse. It is now a degree 4 polynomial (since April 7).

The goodness of fit of this model is very good since the coefficient
R<sup>2</sup> is very close to 1. At the moment a cubic fit works well,
although when it reaches the maximum it is likely that the precision of
the model will decrease.

![](README_files/figure-gfm/regresion-1.png)<!-- -->

##### Infected forecast for tomorrow (2020-05-03): 235320, with 95% prediction interval: (219822 , 250818)

##### Deaths forecast for tomorrow (2020-05-03): 24508, with 95% prediction interval: (23423 , 25594)

Previous predictions:

    Infected forecast:

    24-03 -> predicted =  38574; observed =  48760; error = -26.4%
    25-03 -> predicted =  44008; observed =  57276; error = -30.1%
    26-03 -> predicted =  51614; observed =  66200; error = -28.3%
    27-03 -> predicted =  60476; observed =  75350; error = -24.6%
    28-03 -> predicted =  69832; observed =  83620; error = -19.7%
    29-03 -> predicted =  79588; observed =  90026; error = -13.1%
    30-03 -> predicted =  88856; observed =  95825; error =  -7.8%
    31-03 -> predicted =  97620; observed = 103972; error =  -6.5%
    01-04 -> predicted = 107073; observed = 111381; error =  -4.0%
    02-04 -> predicted = 116393; observed = 118903; error =  -2.2%
    03-04 -> predicted = 125701; observed = 126143; error =  -0.4%
    04-04 -> predicted = 134713; observed = 132797; error =   1.4%
    05-04 -> predicted = 143291; observed = 138357; error =   3.4%
    06-04 -> predicted = 151139; observed = 141989; error =   6.1%
    07-04 -> predicted = 157785; observed = 147252; error =   6.7%
    08-04 -> predicted = 163883; observed = 152808; error =   6.8%
    09-04 -> predicted = 156194; observed = 158512; error =  -1.5%
    10-04 -> predicted = 159990; observed = 163111; error =  -2.0%
    11-04 -> predicted = 163201; observed = 167717; error =  -2.8%
    12-04 -> predicted = 166184; observed = 171673; error =  -3.3%
    13-04 -> predicted = 168756; observed = 174834; error =  -3.6%
    14-04 -> predicted = 170778; observed = 178022; error =  -4.2%
    15-04 -> predicted = 172277; observed = 182519; error =  -5.9%
    16-04 -> predicted = 174407; observed = 187582; error =  -7.6%
    17-04 -> predicted = 177122; observed = 192256; error =  -8.5%
    18-04 -> predicted = 178734; observed = 197142; error = -10.3%
    19-04 -> predicted = 182176; observed = 202293; error = -11.0%
    20-04 -> predicted = 185733; observed = 205927; error = -10.9%
    21-04 -> predicted = 189443; observed = 209525; error = -10.6%
    22-04 -> predicted = 193176; observed = 213246; error = -10.4%
    23-04 -> predicted = 197066; observed = 217970; error = -10.6%
    24-04 -> predicted = 201285; observed = 221456; error = -10.0%
    25-04 -> predicted = 206656; observed = 225314; error =  -9.0%
    26-04 -> predicted = 211791; observed = 228101; error =  -7.7%
    27-04 -> predicted = 216298; observed = 230705; error =  -6.7%
    28-04 -> predicted = 220303; observed = 233549; error =  -6.0%
    29-04 -> predicted = 223900; observed = 236872; error =  -5.8%
    30-04 -> predicted = 227692; observed = 240007; error =  -5.4%
    01-05 -> predicted = 231382; observed = 243198; error =  -5.1%
    02-05 -> predicted = 232197; observed = 245567; error =  -5.8%

    Deaths forecast:

    24-03 -> predicted =  2836; observed =  2707; error =  4.5%
    25-03 -> predicted =  3355; observed =  3303; error =  1.5%
    26-03 -> predicted =  3930; observed =  3918; error =  0.3%
    27-03 -> predicted =  4563; observed =  4663; error = -2.2%
    28-03 -> predicted =  5256; observed =  5502; error = -4.7%
    29-03 -> predicted =  6199; observed =  6217; error = -0.3%
    30-03 -> predicted =  7196; observed =  6913; error =  3.9%
    31-03 -> predicted =  8212; observed =  7733; error =  5.8%
    01-04 -> predicted =  9248; observed =  8662; error =  6.3%
    02-04 -> predicted = 10296; observed =  9539; error =  7.4%
    03-04 -> predicted = 11379; observed = 10384; error =  8.7%
    04-04 -> predicted = 12475; observed = 11164; error = 10.5%
    05-04 -> predicted = 13529; observed = 11834; error = 12.5%
    06-04 -> predicted = 14496; observed = 12462; error = 14.0%
    07-04 -> predicted = 15379; observed = 13219; error = 14.0%
    08-04 -> predicted = 16227; observed = 13976; error = 13.9%
    09-04 -> predicted = 16059; observed = 14757; error =  8.1%
    10-04 -> predicted = 16605; observed = 15399; error =  7.3%
    11-04 -> predicted = 17084; observed = 15899; error =  6.9%
    12-04 -> predicted = 17474; observed = 16505; error =  5.5%
    13-04 -> predicted = 17856; observed = 17056; error =  4.5%
    14-04 -> predicted = 18193; observed = 17591; error =  3.3%
    15-04 -> predicted = 18525; observed = 18276; error =  1.3%
    16-04 -> predicted = 18841; observed = 18893; error = -0.3%
    17-04 -> predicted = 19166; observed = 19478; error = -1.6%
    18-04 -> predicted = 18878; observed = 20043; error = -6.2%
    19-04 -> predicted = 19297; observed = 20453; error = -6.0%
    20-04 -> predicted = 19688; observed = 20852; error = -5.9%
    21-04 -> predicted = 20062; observed = 21282; error = -6.1%
    22-04 -> predicted = 20445; observed = 21717; error = -6.2%
    23-04 -> predicted = 20843; observed = 22157; error = -6.3%
    24-04 -> predicted = 21262; observed = 22524; error = -5.9%
    25-04 -> predicted = 21663; observed = 22902; error = -5.7%
    26-04 -> predicted = 22062; observed = 23190; error = -5.1%
    27-04 -> predicted = 22421; observed = 23521; error = -4.9%
    28-04 -> predicted = 22773; observed = 23822; error = -4.6%
    29-04 -> predicted = 23112; observed = 24275; error = -5.0%
    30-04 -> predicted = 23511; observed = 24543; error = -4.4%
    01-05 -> predicted = 23877; observed = 24824; error = -4.0%
    02-05 -> predicted = 24206; observed = 25100; error = -3.7%

-----

## SIR MODEL

I will use the same model used in this post: [Epidemiology: How
contagious is Novel Coronavirus
(2019-nCoV)](http://blog.ephorie.de/epidemiology-how-contagious-is-novel-coronavirus-2019-ncov)?.
You can find all the details there and in the comments. It is a [SIR
model](https://es.wikipedia.org/wiki/Modelo_SIR).

The results should not be taken seriously since the absence of real data
makes the model inconsistent. This entry was created for informational
purposes on SIR models. I will try to update it daily. More reliable
information can be found at [IMM-UPV](https://www.imm.upv.es/covid-19/)

Estimates with the SIR model:

![](README_files/figure-gfm/SIR%20plots-1.png)<!-- -->

According to this model, the rate of infection is 1.22, the height of
the pandemic will be reached by 12/05/2020.

About 784167 people would be infected by then, which translates to about
376400 hospitalized cases, about 47050 cases in need of intensive care
(UCI) and up to 35288 deaths.

#### Infected forecast for tomorrow: 356328 (2020-05-03)

Previous predictions:

    21-03 -> predicted =  24896; observed =  31636; error = -27.1%
    22-03 -> predicted =  30117; observed =  36503; error = -21.2%
    23-03 -> predicted =  35272; observed =  41123; error = -16.6%
    24-03 -> predicted =  57913; observed =  48760; error =  15.8%
    25-03 -> predicted =  48440; observed =  57276; error = -18.2%
    26-03 -> predicted =  57420; observed =  66200; error = -15.3%
    27-03 -> predicted =  67868; observed =  75350; error = -11.0%
    28-03 -> predicted =  78955; observed =  83620; error =  -5.9%
    29-03 -> predicted =  90661; observed =  90026; error =   0.7%
    30-03 -> predicted = 102000; observed =  95825; error =   6.1%
    31-03 -> predicted = 113106; observed = 103972; error =   8.1%
    01-04 -> predicted = 125311; observed = 111381; error =  11.1%
    02-04 -> predicted = 137373; observed = 118903; error =  13.4%
    03-04 -> predicted = 150165; observed = 126143; error =  16.0%
    04-04 -> predicted = 162414; observed = 132797; error =  18.2%
    05-04 -> predicted = 174860; observed = 138357; error =  20.9%
    06-04 -> predicted = 186188; observed = 141989; error =  23.7%
    07-04 -> predicted = 196945; observed = 147252; error =  25.2%
    08-04 -> predicted = 206927; observed = 152808; error =  26.2%
    09-04 -> predicted = 217154; observed = 158512; error =  27.0%
    10-04 -> predicted = 227228; observed = 163111; error =  28.2%
    11-04 -> predicted = 236766; observed = 167717; error =  29.2%
    12-04 -> predicted = 246144; observed = 171673; error =  30.3%
    13-04 -> predicted = 254626; observed = 174834; error =  31.3%
    14-04 -> predicted = 262925; observed = 178022; error =  32.3%
    15-04 -> predicted = 270168; observed = 182519; error =  32.4%
    16-04 -> predicted = 278011; observed = 187582; error =  32.5%
    17-04 -> predicted = 286247; observed = 192256; error =  32.8%
    18-04 -> predicted = 240850; observed = 197142; error =  18.1%
    19-04 -> predicted = 244558; observed = 202293; error =  17.3%
    20-04 -> predicted = 251935; observed = 205927; error =  18.3%
    21-04 -> predicted = 263275; observed = 209525; error =  20.4%
    22-04 -> predicted = 266091; observed = 213246; error =  19.9%
    23-04 -> predicted = 273274; observed = 217970; error =  20.2%
    24-04 -> predicted = 285694; observed = 221456; error =  22.5%
    25-04 -> predicted = 293874; observed = 225314; error =  23.3%
    26-04 -> predicted = 301895; observed = 228101; error =  24.4%
    27-04 -> predicted = 303361; observed = 230705; error =  24.0%
    28-04 -> predicted = 316803; observed = 233549; error =  26.3%
    29-04 -> predicted = 316741; observed = 236872; error =  25.2%
    30-04 -> predicted = 330817; observed = 240007; error =  27.5%
    01-05 -> predicted = 337735; observed = 243198; error =  28.0%
    02-05 -> predicted = 350027; observed = 245567; error =  29.8%

-----

\#StayAtHome \#QuedateEnCasa

-----
