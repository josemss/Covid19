Covid-19: The case of Spain
================
by JMSS (Usal - CIC)

# Models for the coronavirus crisis

## DATA

Daily data:
[Wikipedia](https://es.wikipedia.org/wiki/Pandemia_de_enfermedad_por_coronavirus_de_2020_en_España)

![](README_files/figure-gfm/data%20plots-1.png)<!-- -->![](README_files/figure-gfm/data%20plots-2.png)<!-- -->![](README_files/figure-gfm/data%20plots-3.png)<!-- -->![](README_files/figure-gfm/data%20plots-4.png)<!-- -->

Since we do not know the true data of infected people, two important
variables to take into account are the daily increase in infected and
death people.

![](README_files/figure-gfm/increase%20plot-1.png)<!-- -->![](README_files/figure-gfm/increase%20plot-2.png)<!-- -->

The following graph shows the differences between CC.AA. (regions) in
mortality per 10,000 inhabitants.

![](README_files/figure-gfm/mort-1.png)<!-- -->

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

![](README_files/figure-gfm/SIR%20plots-1.png)<!-- -->![](README_files/figure-gfm/SIR%20plots-2.png)<!-- -->

According to this model, the rate of infection is 1.86, the height of
the pandemic will be reached by 18/04/2020.

About 6053866 people would be infected by then, which translates to
about 2905856 hospitalized cases, about 363232 cases in need of
intensive care (UCI) and up to 484309 deaths.

#### Infected forecast for tomorrow: 125311 (2020-04-01)

Previous predictions:

    21-03 -> predicted =  24896; observed = 25374; error = -1.9%
    22-03 -> predicted =  30117; observed = 28768; error =  4.5%
    23-03 -> predicted =  35272; observed = 33089; error =  6.2%
    24-03 -> predicted =  57913; observed = 39673; error = 31.5%
    25-03 -> predicted =  48440; observed = 47610; error =  1.7%
    26-03 -> predicted =  57420; observed = 56188; error =  2.1%
    27-03 -> predicted =  67868; observed = 64059; error =  5.6%
    28-03 -> predicted =  78955; observed = 72248; error =  8.5%
    29-03 -> predicted =  90661; observed = 78797; error = 13.1%
    30-03 -> predicted = 102000; observed = 85195; error = 16.5%
    31-03 -> predicted = 113106; observed = 94417; error = 16.5%

-----

## REGRESSION MODEL

How the SIR model seems to predict worse, I use a cubic polynomial
regression model. See
[Wikipedia.](https://en.wikipedia.org/wiki/Regression_analysis)

The fit of the model is very good since the coefficient R<sup>2</sup> is
very close to 1.

![](README_files/figure-gfm/regresion-1.png)<!-- -->

##### Infected forecast for tomorrow (2020-04-01): 107073, with 95% prediction interval: (104001 , 110144)

##### Deaths forecast for tomorrow (2020-04-01): 9248, with 95% prediction interval: (8865 , 9630)

Previous predictions:

    Infected forecast:

    24-03 -> predicted = 38574; observed = 39673; error = -2.8%
    25-03 -> predicted = 44008; observed = 47610; error = -8.2%
    26-03 -> predicted = 51614; observed = 56188; error = -8.9%
    27-03 -> predicted = 60476; observed = 64059; error = -5.9%
    28-03 -> predicted = 69832; observed = 72248; error = -3.5%
    29-03 -> predicted = 79588; observed = 78797; error =  1.0%
    30-03 -> predicted = 88856; observed = 85195; error =  4.1%
    31-03 -> predicted = 97620; observed = 94417; error =  3.3%

    Deaths forecast:

    24-03 -> predicted = 2836; observed = 2696; error =  4.9%
    25-03 -> predicted = 3355; observed = 3434; error = -2.4%
    26-03 -> predicted = 3930; observed = 4089; error = -4.0%
    27-03 -> predicted = 4563; observed = 4858; error = -6.5%
    28-03 -> predicted = 5256; observed = 5690; error = -8.3%
    29-03 -> predicted = 6199; observed = 6528; error = -5.3%
    30-03 -> predicted = 7196; observed = 7340; error = -2.0%
    31-03 -> predicted = 8212; observed = 8189; error =  0.3%

-----

\#StayAtHome \#QuedateEnCasa
