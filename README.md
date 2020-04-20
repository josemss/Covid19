Covid-19: The case of Spain
================
by JMSS (Usal - CIC)

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

How the curve has flattened since March 27:

![](README_files/figure-gfm/flat-1.gif)<!-- -->

-----

## CUBIC SPLINES

Since April 5, I propose this new model to predict the number of deaths,
cause the SIR and Regression models seem to make bigger mistakes in
their predictions.

It is based on interpolation with cubic splines. See
[Wikipedia](https://en.wikipedia.org/wiki/Spline_interpolation)

![](README_files/figure-gfm/splinesI-1.png)<!-- -->

![](README_files/figure-gfm/splinesD-1.png)<!-- -->

##### Infecteds forecast for tomorrow (2020-04-21): 204476

##### Deaths forecast for tomorrow (2020-04-21): 21251

Previous predictions:

    Infecteds forecast:

    06-04 -> predicted = 136782; observed = 135032; error =  1.28%
    07-04 -> predicted = 139305; observed = 140510; error = -0.87%
    08-04 -> predicted = 145988; observed = 146690; error = -0.48%
    09-04 -> predicted = 152870; observed = 152446; error =  0.28%
    10-04 -> predicted = 158202; observed = 157022; error =  0.75%
    11-04 -> predicted = 161598; observed = 161852; error = -0.16%
    12-04 -> predicted = 166682; observed = 166019; error =  0.40%
    13-04 -> predicted = 170186; observed = 169496; error =  0.41%
    14-04 -> predicted = 172973; observed = 172541; error =  0.25%
    15-04 -> predicted = 175586; observed = 177633; error = -1.17%
    16-04 -> predicted = 182725; observed = 182816; error = -0.05%
    17-04 -> predicted = 187999; observed = 188068; error = -0.04%
    18-04 -> predicted = 193320; observed = 191726; error =  0.82%
    19-04 -> predicted = 195384; observed = 195944; error = -0.29%
    20-04 -> predicted = 200162; observed = 200210; error = -0.02%

    Deaths forecast:

    06-04 -> predicted = 13092; observed = 13055; error =  0.28%
    07-04 -> predicted = 13692; observed = 13798; error = -0.77%
    08-04 -> predicted = 14541; observed = 14555; error = -0.10%
    09-04 -> predicted = 15312; observed = 15238; error =  0.48%
    10-04 -> predicted = 15921; observed = 15843; error =  0.49%
    11-04 -> predicted = 16448; observed = 16353; error =  0.58%
    12-04 -> predicted = 16863; observed = 16972; error = -0.65%
    13-04 -> predicted = 17591; observed = 17489; error =  0.58%
    14-04 -> predicted = 18006; observed = 18056; error = -0.28%
    15-04 -> predicted = 18623; observed = 18579; error =  0.24%
    16-04 -> predicted = 19102; observed = 19130; error = -0.15%
    17-04 -> predicted = 19681; observed = 19478; error =  1.03%
    18-04 -> predicted = 19826; observed = 20043; error = -1.09%
    19-04 -> predicted = 20608; observed = 20453; error =  0.75%
    20-04 -> predicted = 20863; observed = 20852; error =  0.05%

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

##### Infected forecast for tomorrow (2020-04-21): 189443, with 95% prediction interval: (179771 , 199116)

##### Deaths forecast for tomorrow (2020-04-21): 20062, with 95% prediction interval: (19152 , 20972)

Previous predictions:

    Infected forecast:

    24-03 -> predicted =  38574; observed =  39673; error = -2.8%
    25-03 -> predicted =  44008; observed =  47610; error = -8.2%
    26-03 -> predicted =  51614; observed =  56188; error = -8.9%
    27-03 -> predicted =  60476; observed =  64059; error = -5.9%
    28-03 -> predicted =  69832; observed =  72248; error = -3.5%
    29-03 -> predicted =  79588; observed =  78797; error =  1.0%
    30-03 -> predicted =  88856; observed =  85195; error =  4.1%
    31-03 -> predicted =  97620; observed =  94417; error =  3.3%
    01-04 -> predicted = 107073; observed = 102136; error =  4.6%
    02-04 -> predicted = 116393; observed = 110238; error =  5.3%
    03-04 -> predicted = 125701; observed = 117710; error =  6.4%
    04-04 -> predicted = 134713; observed = 124736; error =  7.4%
    05-04 -> predicted = 143291; observed = 130759; error =  8.7%
    06-04 -> predicted = 151139; observed = 135032; error = 10.7%
    07-04 -> predicted = 157785; observed = 140510; error = 10.9%
    08-04 -> predicted = 163883; observed = 146690; error = 10.5%
    09-04 -> predicted = 156194; observed = 152446; error =  2.4%
    10-04 -> predicted = 159990; observed = 157022; error =  1.9%
    11-04 -> predicted = 163201; observed = 161852; error =  0.8%
    12-04 -> predicted = 166184; observed = 166019; error =  0.1%
    13-04 -> predicted = 168756; observed = 169496; error = -0.4%
    14-04 -> predicted = 170778; observed = 172541; error = -1.0%
    15-04 -> predicted = 172277; observed = 177633; error = -3.1%
    16-04 -> predicted = 174407; observed = 182816; error = -4.8%
    17-04 -> predicted = 177122; observed = 188068; error = -6.2%
    18-04 -> predicted = 178734; observed = 191726; error = -7.3%
    19-04 -> predicted = 182176; observed = 195944; error = -7.6%
    20-04 -> predicted = 185733; observed = 200210; error = -7.8%

    Deaths forecast:

    24-03 -> predicted =  2836; observed =  2696; error =  4.9%
    25-03 -> predicted =  3355; observed =  3434; error = -2.4%
    26-03 -> predicted =  3930; observed =  4089; error = -4.0%
    27-03 -> predicted =  4563; observed =  4858; error = -6.5%
    28-03 -> predicted =  5256; observed =  5690; error = -8.3%
    29-03 -> predicted =  6199; observed =  6528; error = -5.3%
    30-03 -> predicted =  7196; observed =  7340; error = -2.0%
    31-03 -> predicted =  8212; observed =  8189; error =  0.3%
    01-04 -> predicted =  9248; observed =  9053; error =  2.1%
    02-04 -> predicted = 10296; observed = 10003; error =  2.8%
    03-04 -> predicted = 11379; observed = 10935; error =  3.9%
    04-04 -> predicted = 12475; observed = 11744; error =  5.9%
    05-04 -> predicted = 13529; observed = 12418; error =  8.2%
    06-04 -> predicted = 14496; observed = 13055; error =  9.9%
    07-04 -> predicted = 15379; observed = 13798; error = 10.3%
    08-04 -> predicted = 16227; observed = 14555; error = 10.3%
    09-04 -> predicted = 16059; observed = 15238; error =  5.1%
    10-04 -> predicted = 16605; observed = 15843; error =  4.6%
    11-04 -> predicted = 17084; observed = 16353; error =  4.3%
    12-04 -> predicted = 17474; observed = 16972; error =  2.9%
    13-04 -> predicted = 17856; observed = 17489; error =  2.1%
    14-04 -> predicted = 18193; observed = 18056; error =  0.8%
    15-04 -> predicted = 18525; observed = 18579; error = -0.3%
    16-04 -> predicted = 18841; observed = 19130; error = -1.5%
    17-04 -> predicted = 19166; observed = 19478; error = -1.6%
    18-04 -> predicted = 18878; observed = 20043; error = -6.2%
    19-04 -> predicted = 19297; observed = 20453; error = -6.0%
    20-04 -> predicted = 19688; observed = 20852; error = -5.9%

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

According to this model, the rate of infection is 1.27, the height of
the pandemic will be reached by 02/05/2020.

About 1153758 people would be infected by then, which translates to
about 553804 hospitalized cases, about 69225 cases in need of intensive
care (UCI) and up to 115376 deaths.

#### Infected forecast for tomorrow: 263275 (2020-04-21)

Previous predictions:

    21-03 -> predicted =  24896; observed =  24926; error = -0.1%
    22-03 -> predicted =  30117; observed =  28572; error =  5.1%
    23-03 -> predicted =  35272; observed =  33089; error =  6.2%
    24-03 -> predicted =  57913; observed =  39673; error = 31.5%
    25-03 -> predicted =  48440; observed =  47610; error =  1.7%
    26-03 -> predicted =  57420; observed =  56188; error =  2.1%
    27-03 -> predicted =  67868; observed =  64059; error =  5.6%
    28-03 -> predicted =  78955; observed =  72248; error =  8.5%
    29-03 -> predicted =  90661; observed =  78797; error = 13.1%
    30-03 -> predicted = 102000; observed =  85195; error = 16.5%
    31-03 -> predicted = 113106; observed =  94417; error = 16.5%
    01-04 -> predicted = 125311; observed = 102136; error = 18.5%
    02-04 -> predicted = 137373; observed = 110238; error = 19.8%
    03-04 -> predicted = 150165; observed = 117710; error = 21.6%
    04-04 -> predicted = 162414; observed = 124736; error = 23.2%
    05-04 -> predicted = 174860; observed = 130759; error = 25.2%
    06-04 -> predicted = 186188; observed = 135032; error = 27.5%
    07-04 -> predicted = 196945; observed = 140510; error = 28.7%
    08-04 -> predicted = 206927; observed = 146690; error = 29.1%
    09-04 -> predicted = 217154; observed = 152446; error = 29.8%
    10-04 -> predicted = 227228; observed = 157022; error = 30.9%
    11-04 -> predicted = 236766; observed = 161852; error = 31.6%
    12-04 -> predicted = 246144; observed = 166019; error = 32.6%
    13-04 -> predicted = 254626; observed = 169496; error = 33.4%
    14-04 -> predicted = 262925; observed = 172541; error = 34.4%
    15-04 -> predicted = 270168; observed = 177633; error = 34.3%
    16-04 -> predicted = 278011; observed = 182816; error = 34.2%
    17-04 -> predicted = 286247; observed = 188068; error = 34.3%
    18-04 -> predicted = 240850; observed = 191726; error = 20.4%
    19-04 -> predicted = 244558; observed = 195944; error = 19.9%
    20-04 -> predicted = 251935; observed = 200210; error = 20.5%

-----

\#StayAtHome \#QuedateEnCasa

-----
