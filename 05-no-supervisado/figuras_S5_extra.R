# figuras_S5_extra.R
# Figuras adicionales para la ampliacion de las Partes 3 (anomalias) y 4 (representacion) de S5.
# Ejecutar desde la carpeta de la sesion S5:  Rscript figuras_S5_extra.R
# Salida: PDFs en img/.  (Etiquetas en ASCII.)

dir.create("img", showWarnings = FALSE)

## 1. Enfoque estadistico: regla de 3 sigma -----------------------------------
set.seed(11)
x <- c(rnorm(200, 50, 8), 90, 95, 10, 14)
z <- (x - mean(x)) / sd(x)
out <- abs(z) > 3
pdf("img/zscore_outliers.pdf", width = 6.2, height = 4)
par(mar = c(4, 4, 2, 1))
plot(x, pch = ifelse(out, 17, 16), col = ifelse(out, "red", "grey55"),
     cex = ifelse(out, 1.3, 0.7), xlab = "Observacion", ylab = "Valor",
     main = "Deteccion estadistica: regla de 3 sigma")
abline(h = mean(x), col = "blue", lwd = 2)
abline(h = mean(x) + c(-3, 3) * sd(x), col = "blue", lty = 2)
legend("topright", c("Normal", "Anomalia (|z|>3)", "media +/- 3 sd"),
       pch = c(16, 17, NA), lty = c(NA, NA, 2), col = c("grey55", "red", "blue"), bty = "n")
dev.off()

## 2. PCA: cargas (loadings) de la primera componente -------------------------
wbcd <- read.csv("data/wisc_bc_data.csv", stringsAsFactors = FALSE)
feat <- wbcd[, 3:32]
pca <- prcomp(feat, scale. = TRUE)
load1 <- pca$rotation[, 1]
top <- sort(load1)[1:12]      # las 12 variables con mayor peso (en magnitud, negativas aqui)
pdf("img/pca_loadings.pdf", width = 7, height = 4.4)
par(mar = c(4, 9, 2, 1))
barplot(rev(abs(top)), horiz = TRUE, names.arg = rev(names(top)), las = 1,
        col = "steelblue", xlab = "Peso en la componente 1 (magnitud)",
        main = "PCA: que variables pesan en la 1.a componente", cex.names = 0.65)
dev.off()

## 3. Embeddings: analogia tipo word2vec --------------------------------------
pdf("img/embeddings_analogy.pdf", width = 6, height = 4.6)
par(mar = c(2, 2, 2, 1))
plot(NA, xlim = c(0, 4), ylim = c(0, 4), axes = FALSE, xlab = "", ylab = "",
     main = "Embeddings: relaciones con significado")
pts <- list(hombre = c(1, 1), rey = c(1.4, 3), mujer = c(3, 1), reina = c(3.4, 3))
arrows(pts$hombre[1], pts$hombre[2], pts$rey[1], pts$rey[2], col = "red", lwd = 2, length = 0.12)
arrows(pts$mujer[1], pts$mujer[2], pts$reina[1], pts$reina[2], col = "red", lwd = 2, length = 0.12)
for (n in names(pts)) points(pts[[n]][1], pts[[n]][2], pch = 16, col = "steelblue", cex = 1.4)
text(pts$hombre[1], pts$hombre[2], "hombre", pos = 1, cex = 0.9)
text(pts$rey[1], pts$rey[2], "rey", pos = 3, cex = 0.9)
text(pts$mujer[1], pts$mujer[2], "mujer", pos = 1, cex = 0.9)
text(pts$reina[1], pts$reina[2], "reina", pos = 3, cex = 0.9)
text(2.2, 2, "rey - hombre  ~=  reina - mujer", col = "red", cex = 0.9)
dev.off()

## 4. Concepto de embedding 2D (lo similar queda junto) -----------------------
set.seed(5)
g <- function(cx, cy) cbind(rnorm(40, cx, 0.5), rnorm(40, cy, 0.5))
d <- rbind(g(0, 0), g(3, 0.5), g(1.5, 3), g(4, 3))
grp <- rep(c("0", "1", "2", "3"), each = 40)
pdf("img/tsne_concept.pdf", width = 6, height = 4.4)
par(mar = c(2, 2, 2, 1))
plot(d, col = c("red", "blue", "darkgreen", "purple")[as.factor(grp)], pch = 16, cex = 0.8,
     axes = FALSE, xlab = "", ylab = "", main = "Un embedding 2D agrupa lo similar")
box()
legend("topright", paste("grupo", 0:3), col = c("red", "blue", "darkgreen", "purple"),
       pch = 16, bty = "n", title = "(p. ej. digitos)")
text(mean(par("usr")[1:2]), par("usr")[3] + 0.3,
     "los ejes no tienen significado propio; importa la cercania", cex = 0.75, col = "grey30")
dev.off()

cat("Figuras extra S5 generadas:\n"); print(list.files("img", pattern = "(zscore|loadings|embeddings|tsne)"))
