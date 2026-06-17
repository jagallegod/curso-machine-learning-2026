# figuras_S5.R
# Genera el dataset 2D de anomalias (data/anomalias.csv) y las figuras nuevas de S5
# (deteccion de anomalias con LOF; representacion con PCA).
# Ejecutar desde la carpeta de la sesion S5:  Rscript figuras_S5.R
# Salida: data/anomalias.csv y archivos PDF en img/.  (Etiquetas en ASCII.)

dir.create("img", showWarnings = FALSE)
dir.create("data", showWarnings = FALSE)

## 0. Dataset 2D de anomalias (dos grupos densos + outliers dispersos) ----------
set.seed(42)
c1 <- cbind(rnorm(140, 0, 0.5), rnorm(140, 0, 0.5))
c2 <- cbind(rnorm(140, 4, 0.6), rnorm(140, 3, 0.6))
out <- cbind(runif(12, -3, 7), runif(12, -2, 6))
dat <- as.data.frame(round(rbind(c1, c2, out), 3))
# Dominio: transacciones financieras (monto vs. frecuencia de operaciones);
# los outliers representan operaciones atipicas / posible fraude.
colnames(dat) <- c("monto", "frecuencia")
write.csv(dat, "data/anomalias.csv", row.names = FALSE)

## 1. LOF: deteccion de transacciones atipicas por densidad local --------------
suppressMessages(library(dbscan))
scores <- lof(as.matrix(dat), minPts = 20)
anom <- scores > 1.5
pdf("img/lof_anomalias.pdf", width = 6.2, height = 4.4)
par(mar = c(4, 4, 2, 1))
plot(dat$monto, dat$frecuencia,
     cex = pmin(scores, 3) * 0.6 + 0.4,
     pch = ifelse(anom, 17, 16),
     col = ifelse(anom, "red", "grey55"),
     xlab = "Monto (estandarizado)", ylab = "Frecuencia de operaciones",
     main = "Deteccion de transacciones atipicas (LOF)")
legend("topright", c("Normal", "Atipica (posible fraude)"),
       pch = c(16, 17), col = c("grey55", "red"), bty = "n")
dev.off()

## 2. PCA: la idea (direccion de maxima varianza) ------------------------------
set.seed(7)
n <- 250
z <- rnorm(n)
X <- cbind(z + rnorm(n, 0, 0.3), 0.8 * z + rnorm(n, 0, 0.3))
pc <- prcomp(X)
ctr <- colMeans(X)
v1 <- pc$rotation[, 1] * pc$sdev[1] * 2
pdf("img/pca_idea.pdf", width = 5.6, height = 4.4)
par(mar = c(4, 4, 2, 1))
plot(X[, 1], X[, 2], pch = 16, col = "grey60", cex = 0.7, asp = 1,
     xlab = "Variable 1", ylab = "Variable 2",
     main = "PCA: direccion de maxima varianza")
arrows(ctr[1] - v1[1], ctr[2] - v1[2], ctr[1] + v1[1], ctr[2] + v1[2],
       col = "red", lwd = 3, length = 0.12, code = 3)
text(ctr[1] + v1[1], ctr[2] + v1[2], "Componente 1", col = "red", pos = 4, cex = 0.8)
dev.off()

## 3. PCA sobre wisc_bc_data: proyeccion a 2 componentes -----------------------
wbcd <- read.csv("data/wisc_bc_data.csv", stringsAsFactors = FALSE)
diag <- factor(wbcd$diagnosis, levels = c("B", "M"), labels = c("Benigno", "Maligno"))
feat <- wbcd[, 3:32]              # 30 caracteristicas numericas
pca <- prcomp(feat, scale. = TRUE)
pdf("img/pca_projection.pdf", width = 6, height = 4.4)
par(mar = c(4, 4, 2, 1))
cols <- c("steelblue", "red")[as.integer(diag)]
plot(pca$x[, 1], pca$x[, 2], col = cols, pch = 16, cex = 0.6,
     xlab = "Componente principal 1", ylab = "Componente principal 2",
     main = "30 variables resumidas en 2 componentes")
legend("topright", levels(diag), col = c("steelblue", "red"), pch = 16, bty = "n")
dev.off()

## 4. PCA: varianza explicada (scree) ------------------------------------------
ve <- (pca$sdev^2) / sum(pca$sdev^2)
pdf("img/pca_scree.pdf", width = 6, height = 4)
par(mar = c(4, 4, 2, 1))
barplot(ve[1:10] * 100, names.arg = paste0("PC", 1:10), col = "steelblue",
        ylab = "Varianza explicada (%)", xlab = "Componente",
        main = "Varianza explicada por componente", cex.names = 0.8)
dev.off()

cat("Listo. Varianza explicada por PC1 y PC2:", round(sum(ve[1:2]) * 100, 1), "%\n")
cat("Figuras en img/:\n"); print(list.files("img", pattern = "(lof|pca)"))
