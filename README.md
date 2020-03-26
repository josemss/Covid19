Covid-19: The case of Spain
================
by JMSS (Usal - CIC)

# Models for the coronavirus crisis

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

Daily data:
[Wikipedia](https://es.wikipedia.org/wiki/Pandemia_de_enfermedad_por_coronavirus_de_2020_en_España)

![](README_files/figure-gfm/data%20plots-1.png)<!-- -->![](README_files/figure-gfm/data%20plots-2.png)<!-- -->

Since we do not know the true data of infected people, two important
variables to take into account are the daily increase in infected and
death people.

![](README_files/figure-gfm/increase%20plot-1.png)<!-- -->![](README_files/figure-gfm/increase%20plot-2.png)<!-- -->

Estimates with the SIR model:

![](README_files/figure-gfm/SIR%20plots-1.png)<!-- -->![](README_files/figure-gfm/SIR%20plots-2.png)<!-- -->

According to this model, the rate of infection is 1.97, the height of
the pandemic will be reached by 14/04/2020.

About 6987260 people would be infected by then, which translates to
about 1292643 severe cases, about 349363 cases in need of intensive care
and up to 97822 deaths.

##### Infected forecast for tomorrow: 67868 (2020-03-27)

Previous predictions:

    21-03 -> predicted = 24896; observed = 25374; error = -1.9%
    22-03 -> predicted = 30117; observed = 28768; error =  4.5%
    23-03 -> predicted = 35272; observed = 33089; error =  6.2%
    24-03 -> predicted = 57913; observed = 39673; error = 31.5%
    25-03 -> predicted = 48440; observed = 47610; error =  1.7%
    26-03 -> predicted = 57420; observed = 56188; error =  2.1%

## REGRESSION MODEL

How the SIR model seems to predict worse, I use a cubic polynomial
regression model. See
[Wikipedia.](https://en.wikipedia.org/wiki/Regression_analysis)

The fit of the model is very good since the coefficient \(R^2\) is very
close to 1.

![](README_files/figure-gfm/regresion-1.png)<!-- -->

##### Infected forecast for tomorrow (2020-03-27): 60476, with 95% prediction interval: (58065 , 62887)

Previous predictions:

    24-03 -> predicted = 38574; observed = 39673; error = -2.8%
    25-03 -> predicted = 44008; observed = 47610; error = -8.2%
    26-03 -> predicted = 51614; observed = 56188; error = -8.9%

-----

\#StayAtHome \#QuedateEnCasa
