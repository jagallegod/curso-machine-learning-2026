# figuras_S4.R
# Genera las figuras nuevas de la Parte 2 del deck de S4 (Mejorando el desempeño).
# Ejecutar desde la carpeta de la sesion S4:  Rscript figuras_S4.R
# Salida: archivos PDF en img/.  (Etiquetas en ASCII para evitar problemas de codificacion.)

dir.create("img", showWarnings = FALSE)

## 1. Validacion cruzada k-fold ------------------------------------------------
pdf("img/kfold_cv.pdf", width = 7, height = 3.4)
par(mar = c(3, 5.5, 2, 1))
k <- 5
plot(NA, xlim = c(0, k), ylim = c(0, k), axes = FALSE, xlab = "", ylab = "",
     main = "Validacion cruzada (5-fold)")
for (i in 1:k) {
  for (j in 1:k) {
    col <- if (j == i) "tomato" else "lightblue"
    rect(j - 1, k - i, j, k - i + 1, col = col, border = "white", lwd = 2)
  }
  text(-0.15, k - i + 0.5, paste("Ronda", i), adj = 1, xpd = TRUE, cex = 0.85)
}
legend("bottom", c("Entrenamiento", "Prueba"), fill = c("lightblue", "tomato"),
       horiz = TRUE, bty = "n", inset = -0.02, xpd = TRUE, cex = 0.9)
dev.off()

## 2. Ingenieria de variables: transformacion log -----------------------------
set.seed(3)
v <- rlnorm(1000, meanlog = 1, sdlog = 1)
pdf("img/feature_transform.pdf", width = 7, height = 3.4)
par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
hist(v, breaks = 40, col = "grey80", main = "Variable original (sesgada)", xlab = "x")
hist(log(v), breaks = 40, col = "steelblue", main = "Despues de log(x)", xlab = "log(x)")
dev.off()

## 3. Importancia de variables (C5.0 sobre credit) -----------------------------
suppressMessages(library(C50))
credit <- read.csv("data/credit.csv", stringsAsFactors = TRUE)
credit$default <- factor(credit$default)
set.seed(123)
m <- C5.0(credit[-21], credit$default)
imp <- C5imp(m, metric = "usage")
top <- head(imp[order(-imp$Overall), , drop = FALSE], 10)
pdf("img/varimportance.pdf", width = 7, height = 4.2)
par(mar = c(4, 9.5, 2, 1))
barplot(rev(top$Overall), horiz = TRUE, names.arg = rev(rownames(top)), las = 1,
        col = "steelblue", xlab = "Uso (% de casos)",
        main = "Importancia de variables (arbol C5.0)", cex.names = 0.7)
dev.off()

## 4. Clase desbalanceada ------------------------------------------------------
set.seed(1)
n <- 600; xa <- rnorm(n); ya <- rnorm(n)
nb <- 35; xb <- rnorm(nb, 2.3, 0.7); yb <- rnorm(nb, 2.3, 0.7)
pdf("img/imbalance_scatter.pdf", width = 6, height = 4.2)
par(mar = c(4, 4, 2, 1))
plot(xa, ya, col = "grey75", pch = 16, cex = 0.6, xlab = "x1", ylab = "x2",
     main = "Una clase rara se pierde en la mayoria")
points(xb, yb, col = "red", pch = 17, cex = 1)
legend("topleft", c(paste0("Frecuente (", n, ")"), paste0("Rara (", nb, ")")),
       col = c("grey75", "red"), pch = c(16, 17), bty = "n")
dev.off()

## 5. Re-muestreo de clases ----------------------------------------------------
d <- matrix(c(880, 120, 500, 500), nrow = 2,
            dimnames = list(c("Frecuente", "Rara"), c("Original", "Balanceado")))
pdf("img/resampling.pdf", width = 6, height = 4)
par(mar = c(4, 4, 2, 1))
barplot(d, beside = TRUE, col = c("grey70", "red"),
        legend.text = TRUE, args.legend = list(x = "top", bty = "n"),
        main = "Re-muestreo: balancear las clases", ylab = "Numero de casos")
dev.off()

## 6. SMOTE: ejemplos sinteticos -----------------------------------------------
set.seed(2)
mx <- c(1, 1.5, 2, 2.6, 3, 2.2); my <- c(1, 1.8, 1.2, 2.4, 1.9, 3)
pdf("img/smote_illustration.pdf", width = 6, height = 4.2)
par(mar = c(4, 4, 2, 1))
plot(mx, my, col = "red", pch = 17, cex = 1.5, xlim = c(0.5, 3.5), ylim = c(0.5, 3.5),
     xlab = "x1", ylab = "x2", main = "SMOTE: casos sinteticos de la minoria")
pairs_list <- list(c(1, 2), c(2, 4), c(3, 5), c(4, 6), c(1, 3))
for (p in pairs_list) {
  i <- p[1]; j <- p[2]
  segments(mx[i], my[i], mx[j], my[j], col = "grey60", lty = 2)
  lam <- runif(1, 0.35, 0.65)
  points(mx[i] + lam * (mx[j] - mx[i]), my[i] + lam * (my[j] - my[i]),
         col = "blue", pch = 1, cex = 1.4, lwd = 2)
}
legend("topleft", c("Minoria (real)", "Sintetico"), col = c("red", "blue"),
       pch = c(17, 1), bty = "n")
dev.off()

## 7. Sobreajuste: error de entrenamiento vs prueba ----------------------------
x <- seq(1, 10, length = 200)
train <- 40 / x^1.3
test <- 35 / x + 1.2 * x
pdf("img/overfitting_curve.pdf", width = 6, height = 4)
par(mar = c(4, 4, 2, 1))
plot(x, test, type = "l", lwd = 3, col = "red", ylim = c(0, max(test)),
     xlab = "Complejidad del modelo", ylab = "Error", main = "Sobreajuste")
lines(x, train, lwd = 3, col = "blue")
abline(v = x[which.min(test)], col = "grey50", lty = 2)
legend("top", c("Error de prueba", "Error de entrenamiento"),
       lwd = 3, col = c("red", "blue"), bty = "n")
dev.off()

## 8. Trade-off sesgo-varianza -------------------------------------------------
x <- seq(1, 10, length = 200)
bias2 <- 50 / x; varc <- 0.6 * x; tot <- bias2 + varc
pdf("img/bias_variance.pdf", width = 6, height = 4)
par(mar = c(4, 4, 2, 1))
plot(x, tot, type = "l", lwd = 3, col = "purple", ylim = c(0, max(tot)),
     xlab = "Complejidad del modelo", ylab = "Error esperado",
     main = "Descomposicion sesgo-varianza")
lines(x, bias2, lwd = 2, lty = 2)
lines(x, varc, lwd = 2, lty = 3, col = "darkgreen")
abline(v = x[which.min(tot)], col = "red", lty = 2)
legend("topright", c("Error total", "Sesgo^2", "Varianza"),
       lwd = c(3, 2, 2), lty = c(1, 2, 3), col = c("purple", "black", "darkgreen"), bty = "n")
dev.off()

## 9. Bagging vs Boosting (esquema) --------------------------------------------
pdf("img/bagging_vs_boosting.pdf", width = 8, height = 4)
par(mfrow = c(1, 2), mar = c(1, 1, 2, 1))
# Bagging (paralelo)
plot.new(); plot.window(xlim = c(0, 10), ylim = c(0, 10)); title("Bagging (paralelo)")
rect(3.5, 8.5, 6.5, 9.8, col = "grey85", border = NA); text(5, 9.15, "Datos")
for (i in 1:3) {
  rect(0.5 + 3 * (i - 1), 5, 2.5 + 3 * (i - 1), 6.3, col = "lightblue", border = NA)
  text(1.5 + 3 * (i - 1), 5.65, paste0("Arbol ", i), cex = 0.85)
  arrows(5, 8.5, 1.5 + 3 * (i - 1), 6.4, length = 0.07, col = "grey55")
  arrows(1.5 + 3 * (i - 1), 5, 5, 3.4, length = 0.07, col = "grey55")
}
rect(3.5, 2, 6.5, 3.3, col = "palegreen", border = NA); text(5, 2.65, "Voto", cex = 0.9)
# Boosting (secuencial)
plot.new(); plot.window(xlim = c(0, 10), ylim = c(0, 10)); title("Boosting (secuencial)")
for (i in 1:3) {
  yb0 <- 7.8 - 2.6 * (i - 1)
  rect(1, yb0, 4.5, yb0 + 1.4, col = "khaki", border = NA)
  text(2.75, yb0 + 0.7, paste0("Arbol ", i), cex = 0.85)
  if (i < 3) arrows(2.75, yb0, 2.75, yb0 - 1.2, length = 0.07)
}
text(7.2, 5, "cada arbol\ncorrige los\nerrores del\nanterior", cex = 0.85)
dev.off()

cat("Figuras generadas en img/:\n")
print(list.files("img", pattern = "\\.pdf$"))
