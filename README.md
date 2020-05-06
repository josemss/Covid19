Covid-19: The case of Spain
================
JMSS \[Usal - CIC\]
(updated: 06 may 2020)

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

##### Infecteds forecast for tomorrow (2020-05-07): 256492

##### Deaths forecast for tomorrow (2020-05-07): 26101

Previous predictions:

    Infecteds forecast:

    06-04 -> predicted = 136782; observed = 142169; error = -3.94%
    07-04 -> predicted = 139305; observed = 147438; error = -5.84%
    08-04 -> predicted = 145988; observed = 153010; error = -4.81%
    09-04 -> predicted = 152870; observed = 158732; error = -3.83%
    10-04 -> predicted = 158202; observed = 163334; error = -3.24%
    11-04 -> predicted = 161598; observed = 167941; error = -3.93%
    12-04 -> predicted = 166682; observed = 171897; error = -3.13%
    13-04 -> predicted = 170186; observed = 175057; error = -2.86%
    14-04 -> predicted = 172973; observed = 178260; error = -3.06%
    15-04 -> predicted = 175586; observed = 182759; error = -4.09%
    16-04 -> predicted = 182725; observed = 187827; error = -2.79%
    17-04 -> predicted = 187999; observed = 192518; error = -2.40%
    18-04 -> predicted = 193320; observed = 198231; error = -2.54%
    19-04 -> predicted = 195384; observed = 202583; error = -3.68%
    20-04 -> predicted = 200162; observed = 206225; error = -3.03%
    21-04 -> predicted = 204476; observed = 209838; error = -2.62%
    22-04 -> predicted = 208146; observed = 213569; error = -2.61%
    23-04 -> predicted = 212600; observed = 218290; error = -2.68%
    24-04 -> predicted = 217659; observed = 221779; error = -1.89%
    25-04 -> predicted = 226504; observed = 225679; error =  0.36%
    26-04 -> predicted = 227754; observed = 228468; error = -0.31%
    27-04 -> predicted = 229499; observed = 231090; error = -0.69%
    28-04 -> predicted = 232215; observed = 234005; error = -0.77%
    29-04 -> predicted = 234834; observed = 237461; error = -1.12%
    30-04 -> predicted = 240088; observed = 240572; error = -0.20%
    01-05 -> predicted = 242630; observed = 243817; error = -0.49%
    02-05 -> predicted = 246030; observed = 246271; error = -0.10%
    03-05 -> predicted = 247936; observed = 247848; error =  0.04%
    04-05 -> predicted = 248609; observed = 248939; error = -0.13%
    05-05 -> predicted = 249301; observed = 250872; error = -0.63%
    06-05 -> predicted = 252385; observed = 253682; error = -0.51%

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
    03-05 -> predicted = 25376; observed = 25264; error =  0.44%
    04-05 -> predicted = 25428; observed = 25428; error =  0.00%
    05-05 -> predicted = 25592; observed = 25613; error = -0.08%
    06-05 -> predicted = 25798; observed = 25857; error = -0.23%

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

##### Infected forecast for tomorrow (2020-05-07): 244965, with 95% prediction interval: (229192 , 260738)

##### Deaths forecast for tomorrow (2020-05-07): 25398, with 95% prediction interval: (24306 , 26490)

Previous predictions:

    Infected forecast:

    24-03 -> predicted =  38574; observed =  48822; error = -26.6%
    25-03 -> predicted =  44008; observed =  57368; error = -30.4%
    26-03 -> predicted =  51614; observed =  66309; error = -28.5%
    27-03 -> predicted =  60476; observed =  75467; error = -24.8%
    28-03 -> predicted =  69832; observed =  83727; error = -19.9%
    29-03 -> predicted =  79588; observed =  90133; error = -13.2%
    30-03 -> predicted =  88856; observed =  95934; error =  -8.0%
    31-03 -> predicted =  97620; observed = 104072; error =  -6.6%
    01-04 -> predicted = 107073; observed = 111499; error =  -4.1%
    02-04 -> predicted = 116393; observed = 119047; error =  -2.3%
    03-04 -> predicted = 125701; observed = 126283; error =  -0.5%
    04-04 -> predicted = 134713; observed = 132956; error =   1.3%
    05-04 -> predicted = 143291; observed = 138526; error =   3.3%
    06-04 -> predicted = 151139; observed = 142169; error =   5.9%
    07-04 -> predicted = 157785; observed = 147438; error =   6.6%
    08-04 -> predicted = 163883; observed = 153010; error =   6.6%
    09-04 -> predicted = 156194; observed = 158732; error =  -1.6%
    10-04 -> predicted = 159990; observed = 163334; error =  -2.1%
    11-04 -> predicted = 163201; observed = 167941; error =  -2.9%
    12-04 -> predicted = 166184; observed = 171897; error =  -3.4%
    13-04 -> predicted = 168756; observed = 175057; error =  -3.7%
    14-04 -> predicted = 170778; observed = 178260; error =  -4.4%
    15-04 -> predicted = 172277; observed = 182759; error =  -6.1%
    16-04 -> predicted = 174407; observed = 187827; error =  -7.7%
    17-04 -> predicted = 177122; observed = 192518; error =  -8.7%
    18-04 -> predicted = 178734; observed = 198231; error = -10.9%
    19-04 -> predicted = 182176; observed = 202583; error = -11.2%
    20-04 -> predicted = 185733; observed = 206225; error = -11.0%
    21-04 -> predicted = 189443; observed = 209838; error = -10.8%
    22-04 -> predicted = 193176; observed = 213569; error = -10.6%
    23-04 -> predicted = 197066; observed = 218290; error = -10.8%
    24-04 -> predicted = 201285; observed = 221779; error = -10.2%
    25-04 -> predicted = 206656; observed = 225679; error =  -9.2%
    26-04 -> predicted = 211791; observed = 228468; error =  -7.9%
    27-04 -> predicted = 216298; observed = 231090; error =  -6.8%
    28-04 -> predicted = 220303; observed = 234005; error =  -6.2%
    29-04 -> predicted = 223900; observed = 237461; error =  -6.1%
    30-04 -> predicted = 227692; observed = 240572; error =  -5.7%
    01-05 -> predicted = 231382; observed = 243817; error =  -5.4%
    02-05 -> predicted = 232197; observed = 246271; error =  -6.1%
    03-05 -> predicted = 235320; observed = 247848; error =  -5.3%
    04-05 -> predicted = 237926; observed = 248939; error =  -4.6%
    05-05 -> predicted = 240127; observed = 250872; error =  -4.5%
    06-05 -> predicted = 242505; observed = 253682; error =  -4.6%

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
    03-05 -> predicted = 24508; observed = 25264; error = -3.1%
    04-05 -> predicted = 24761; observed = 25428; error = -2.7%
    05-05 -> predicted = 24979; observed = 25613; error = -2.5%
    06-05 -> predicted = 25181; observed = 25857; error = -2.7%

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

According to this model, the rate of infection is 1.4, the height of the
pandemic will be reached by 24/05/2020.

About 2099354 people would be infected by then, which translates to
about 1007690 hospitalized cases, about 125961 cases in need of
intensive care (UCI) and up to 94471 deaths.

#### Infected forecast for tomorrow: 367623 (2020-05-07)

Previous predictions:

    21-03 -> predicted =  24896; observed =  31674; error = -27.2%
    22-03 -> predicted =  30117; observed =  36551; error = -21.4%
    23-03 -> predicted =  35272; observed =  41176; error = -16.7%
    24-03 -> predicted =  57913; observed =  48822; error =  15.7%
    25-03 -> predicted =  48440; observed =  57368; error = -18.4%
    26-03 -> predicted =  57420; observed =  66309; error = -15.5%
    27-03 -> predicted =  67868; observed =  75467; error = -11.2%
    28-03 -> predicted =  78955; observed =  83727; error =  -6.0%
    29-03 -> predicted =  90661; observed =  90133; error =   0.6%
    30-03 -> predicted = 102000; observed =  95934; error =   5.9%
    31-03 -> predicted = 113106; observed = 104072; error =   8.0%
    01-04 -> predicted = 125311; observed = 111499; error =  11.0%
    02-04 -> predicted = 137373; observed = 119047; error =  13.3%
    03-04 -> predicted = 150165; observed = 126283; error =  15.9%
    04-04 -> predicted = 162414; observed = 132956; error =  18.1%
    05-04 -> predicted = 174860; observed = 138526; error =  20.8%
    06-04 -> predicted = 186188; observed = 142169; error =  23.6%
    07-04 -> predicted = 196945; observed = 147438; error =  25.1%
    08-04 -> predicted = 206927; observed = 153010; error =  26.1%
    09-04 -> predicted = 217154; observed = 158732; error =  26.9%
    10-04 -> predicted = 227228; observed = 163334; error =  28.1%
    11-04 -> predicted = 236766; observed = 167941; error =  29.1%
    12-04 -> predicted = 246144; observed = 171897; error =  30.2%
    13-04 -> predicted = 254626; observed = 175057; error =  31.2%
    14-04 -> predicted = 262925; observed = 178260; error =  32.2%
    15-04 -> predicted = 270168; observed = 182759; error =  32.4%
    16-04 -> predicted = 278011; observed = 187827; error =  32.4%
    17-04 -> predicted = 286247; observed = 192518; error =  32.7%
    18-04 -> predicted = 240850; observed = 198231; error =  17.7%
    19-04 -> predicted = 244558; observed = 202583; error =  17.2%
    20-04 -> predicted = 251935; observed = 206225; error =  18.1%
    21-04 -> predicted = 263275; observed = 209838; error =  20.3%
    22-04 -> predicted = 266091; observed = 213569; error =  19.7%
    23-04 -> predicted = 273274; observed = 218290; error =  20.1%
    24-04 -> predicted = 285694; observed = 221779; error =  22.4%
    25-04 -> predicted = 293874; observed = 225679; error =  23.2%
    26-04 -> predicted = 301895; observed = 228468; error =  24.3%
    27-04 -> predicted = 303361; observed = 231090; error =  23.8%
    28-04 -> predicted = 316803; observed = 234005; error =  26.1%
    29-04 -> predicted = 316741; observed = 237461; error =  25.0%
    30-04 -> predicted = 330817; observed = 240572; error =  27.3%
    01-05 -> predicted = 337735; observed = 243817; error =  27.8%
    02-05 -> predicted = 350027; observed = 246271; error =  29.6%
    03-05 -> predicted = 356328; observed = 247848; error =  30.4%
    04-05 -> predicted = 362206; observed = 248939; error =  31.3%
    05-05 -> predicted = 357248; observed = 250872; error =  29.8%
    06-05 -> predicted = 362444; observed = 253682; error =  30.0%

-----

\#StayAtHome \#QuedateEnCasa

-----
