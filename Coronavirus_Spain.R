## The case of Spain: SIR model
browseURL("https://en.wikipedia.org/wiki/Compartmental_models_in_epidemiology")
browseURL("https://blog.ephorie.de/epidemiology-how-contagious-is-novel-coronavirus-2019-ncov")
browseURL("https://www.r-bloggers.com/covid-19-the-case-of-germany/")


## Data
# install.packages("deSolve")
library(deSolve)
library(ggplot2)
library(gridExtra)
library(reshape2)

browseURL("https://es.wikipedia.org/wiki/Pandemia_de_enfermedad_por_coronavirus_de_2020_en_España")
# copy the table and run:
# datos <- read.table("clipboard", header = F, sep = "\t", dec = ",")
# colnames(datos) <- 
# View(datos)

# Spain:
# Infected <- as.numeric(gsub("[[:space:]]", "", datos$Casos.confirmados))
Infected <- c(1,2,3,4,8,14,26,45,59,84,125,169,228,282,365,430,674,1231,1695,
              2277,3146,5232,6332,7844,9942,11178,14769,18077,20410,25374,
              28768,33089,39673)
new.Infec <- c(1,diff(Infected))
incr.pct <- round((diff(Infected)/head(Infected, -1))*100, 2)

# Salamanca 12/03/2020
# browseURL("https://analisis.datosabiertos.jcyl.es/pages/coronavirus/")
# Infected <- c(6,11,12,31,32,65,125,149,203,265)

Day <- 1:(length(Infected))
xlabs <- format(as.Date(Day, origin = "2020/02/20"), format = "%d-%m")
# xlabs <- format(as.Date(Day, origin = "2020/03/11"), format = "%d-%m")
# N <- 330119 # population of province of Salamanca from INE
N <- 47100396 # population of Spain from INE

g1 <- ggplot(data.frame(Day = Day, Infected = Infected), aes(Day, Infected)) +
  geom_point(col = "blue", size = 3) + geom_line() + 
  theme(axis.text.x = element_text(angle = 90, size = 18, vjust = 0.5)) +
  scale_x_continuous(breaks = Day, labels = xlabs) + ylab("Infected (real data)") +
  labs(title = "Infected (real data)") +
  geom_text(aes(label = Infected), vjust = -0.3, size = 8, col = "blue")

g2 <- ggplot(data.frame(Day = Day, Infected = Infected), aes(Day, Infected)) +
  geom_point(aes(col = "observed"), size = 3) + geom_line() + theme(axis.text.x = element_text(angle = 90, size = 18, vjust = 0.5)) +
  scale_x_continuous(breaks = Day, labels = xlabs) + ylab("Infected (compared to exponential)") + 
  scale_y_continuous(trans = 'log10') + geom_smooth(method = 'lm', se = F, aes(col = "exponential")) +
  labs(title = "Infected (compared to exponential)") +
  scale_colour_manual(name = "", values = c(observed = "blue", exponential = "red"))

g5 <- ggplot(data.frame(Day = Day, Increase = c(100, incr.pct)), aes(Day, Increase)) +
  geom_line() + theme(axis.text.x = element_text(angle = 90, size = 18, vjust = 0.5)) +
  scale_x_continuous(breaks = Day, labels = xlabs) + ylab("% daily increase in infections") +
  labs(title = "% daily increase in infections") + 
  geom_label(aes(label = paste0(Increase, "%")), hjust = 0.5, nudge_x = 0.05, size = 6)


g1; g2; g5

png("Corona_datos_01.png", width = 2000, height = 1000)
g1
dev.off()
png("Corona_datos_02.png", width = 1500, height = 1000)
g2
dev.off()
png("Corona_datos_03.png", width = 2000, height = 1000)
g5
dev.off()
# grid.arrange(g1, g2, nrow = 1, top = "Total infections COVID-19 Spain (from 21/02/20)")
# # grid.arrange(g1, g2, nrow = 1, top = "Total infections COVID-19 Salamanca (from 21/02/20)")
# dev.off()

## Adjust SIR model
SIR <- function(time, state, parameters) {
  par <- as.list(c(state, parameters))
  with(par, {
    dS <- -beta/N * I * S
    dI <- beta/N * I * S - gamma * I
    dR <- gamma * I
    list(c(dS, dI, dR))
  })
}

init <- c(S = N - Infected[1], I = Infected[1], R = 0)
RSS <- function(parameters) {
  names(parameters) <- c("beta", "gamma")
  out <- ode(y = init, times = Day, func = SIR, parms = parameters)
  fit <- out[ , 3]
  sum((Infected - fit)^2)
}

Opt <- optim(c(0.5, 0.5), RSS, method = "L-BFGS-B", lower = c(0, 0), upper = c(1, 1)) # optimize with some sensible conditions
Opt$message
# [1] "CONVERGENCE: REL_REDUCTION_OF_F <= FACTR*EPSMCH"

Opt_par <- setNames(Opt$par, c("beta", "gamma"))
Opt_par

t <- 1:(length(Infected) + 30) # time in days
fit <- data.frame(ode(y = init, times = t, func = SIR, parms = Opt_par))

df <- melt(data.frame(Day = fit$time, Susceptibles = fit$S, Infecteds = fit$I, Recovereds = fit$R),
           id.var = "Day")
xlabs2 <- format(as.Date(t, origin = "2020/02/20"), format = "%d-%m")
# xlabs2 <- format(as.Date(t, origin = "2020/03/12"), format = "%d-%m")

g3 <- ggplot(df, aes(x = Day, y = value, col = variable)) + geom_line(size = 1.5) + theme_light() +
  theme(axis.text.x = element_text(angle = 90, size = 15), axis.text.y = element_text(size = 20),
        panel.grid.major.x = element_blank(), legend.text = element_text(size = 20)) +
  scale_x_continuous(breaks = fit$time, labels = xlabs2) + ylab("Number of subjects") +
  scale_color_manual(values = c("grey", "tomato1", "lightgreen")) + 
  scale_y_continuous(breaks = seq(0, 5, by = 0.5)*10^7) +
  geom_vline(xintercept = which(fit$I == max(fit$I)), col = "blue", linetype = "dotted", size = 1)

g4 <- ggplot(df, aes(x = Day, y = value, col = variable)) + geom_line(size = 1.5) + theme_light() +
  theme(axis.text.x = element_text(angle = 90, size = 15), axis.text.y = element_text(size = 20),
        panel.grid.major.x = element_blank(), legend.text = element_text(size = 20)) +
  scale_x_continuous(breaks = fit$time, labels = xlabs2) + ylab("Number of subjects") +
  scale_color_manual(values = c("grey", "tomato1", "lightgreen")) + 
  scale_y_continuous(trans = 'log10', breaks = 10^(0:8)) +
  geom_vline(xintercept = which(fit$I == max(fit$I)), col = "blue", linetype = "dotted", size = 1)
g3; g4

png("SIR-model_01.png", width = 1500, height = 1000)
g3
dev.off()
png("SIR-model_02.png", width = 1500, height = 1000)
g4
dev.off()

# png("SIR_model.png", width = 2000, height = 1000)
# grid.arrange(g3, g4, nrow = 1, top = "SIR model Covid-19 Spain")
# # grid.arrange(g3, g4, nrow = 1, top = "SIR model Covid-19 Salamanca")
# dev.off()


## Predict
# estimated percentages extracted from the url:
browseURL("https://www.elperiodico.com/es/sociedad/20200316/coronavirus-hospitalizados-graves-contagio-7891866")
browseURL("https://www.newscientist.com/article/mg24532733-700-why-is-it-so-hard-to-calculate-how-many-people-will-die-from-covid-19/")
severe <- 0.37*0.5
uci <- 0.05
death <- 0.007 #(datos$Muertos/datos$Casos.confirmados)[length(Infected)]
  
R0 <- setNames(Opt_par["beta"] / Opt_par["gamma"], "R0"); R0

max <- fit[fit$I == max(fit$I), "I", drop = FALSE]; max # height of pandemic
max.index <- which(fit$I == max(fit$I))
max.day <- format(as.Date(max.index, "2020/02/20"), 
                  format = "%d/%m/%Y"); max.day # date of height of pandemic
# max.day <- format(as.Date(max.index, "2020/03/12"), 
#                   format = "%d/%m/%Y"); max.day # height of pandemic SA


max_infected <- max(fit$I); max_infected # infected cases

max.severe <- max_infected * severe; max.severe # severe cases

max.uci <- max_infected * uci; max.uci # cases with need for intensive care

max.death <- max_infected * death; max.death # deaths with supposed 3% fatality rate

tomorrow <- round(fit$I[(as.numeric(Sys.Date() - as.Date("2020/02/20")))], 0)
tomorrow
# tomorrow <- round(fit$I[(as.numeric(Sys.Date() - as.Date("2020/03/11")))], 0)


## Conclusions
cat("According to this model, the rate of infection is ", round(R0,2),", the height of the pandemic will be reached by ",max.day,
".\n\nAbout ", round(max_infected, 0), " people would be infected by then, which translates to about ", 
round(max.severe, 0), " severe cases, about ", round(max.uci, 0), 
" cases in need of intensive care and up to ", round(max.death, 0), " deaths.",
"\n\nInfected forecast for tomorrow: ", tomorrow, sep = "")


### Regression
library(gridExtra)
install.packages("ggpmisc")
library(ggpmisc)

x <- 1:length(Infected)
df <- data.frame(T = x, Y = Infected)

fit.poly <- lm(Y ~ poly(T, 3, raw=TRUE), data = df)
summary(fit.poly)

day.pred <- length(Infected) + 1
pred <- as.data.frame(predict(fit.poly, data.frame(T = day.pred), interval = "prediction"))
rownames(pred) <- "Tomorrow"

formula <- y ~ poly(x, 3, raw = TRUE)

p <- ggplot(df, aes(T, Y)) + geom_point(size = 2) +
  geom_smooth(method = "loess", se = F) + 
  scale_x_continuous(breaks = Day, labels = xlabs) +
  scale_y_continuous(breaks = seq(0, max(Infected), by = 5000)) +
  theme(axis.text.x = element_text(angle = 90, size = 18, vjust = 0.5),
        axis.text.y = element_text(size = 18, hjust = 0.5)) +
  labs(title = "Regression model for infected") +
  stat_poly_eq(formula = formula, coef.digits = 5, rr.digits = 4, parse = T, size = 8,
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~~"))) +
  annotation_custom(tableGrob(round(pred, 0),
                              theme = ttheme_default(base_size = 18)),
                    xmin = 0, xmax = 10, ymin = 24000, ymax = 27500) +
  xlab("Day") + ylab("Infected"); p

png("Poly_model_01.png", width = 1500, height = 1000)
p
dev.off()



# plot cubic
curve(-1498.783602 + 787.825790*x - 94.991158*x^2 + 3.270166*x^3, from = -1000, to = 10000)

# Calculo del pico a partir de > 100 infectados
for (i in 10:length(Infected)) {
  Infected <- Infected[1:i]
  Opt <- optim(c(0.5, 0.5), RSS, method = "L-BFGS-B", lower = c(0, 0), upper = c(1, 1)) # optimize with some sensible conditions
  Opt_par <- setNames(Opt$par, c("beta", "gamma"))
  t <- 1:(length(Infected) + 40) # time in days
  fit <- data.frame(ode(y = init, times = t, func = SIR, parms = Opt_par))
  max <- fit[fit$I == max(fit$I), "I", drop = FALSE]
  max.index <- which(fit$I == max(fit$I))
  max.day <- format(as.Date(max.index, "2020/02/20"), format = "%d/%m/%Y")
}


# lm_eqn <- function(df){
#   m <- lm(Y ~ poly(T, 3, raw=TRUE), data = df);
#   eq <- substitute(italic(y) == d %.% italic(x)^3 ~ c %.% italic(x)^2 ~ 
#                      b %.% italic(x) ~ a*","~~italic(R)^2~"="~r2, 
#                    list(a = format(unname(coef(m)[1]), digits = 4),
#                         b = format(unname(coef(m)[2]), digits = 4),
#                         c = format(unname(coef(m)[3]), digits = 4),
#                         d = format(unname(coef(m)[4]), digits = 4),
#                         r2 = format(summary(m)$r.squared, digits = 4)))
#   as.character(as.expression(eq));
# }