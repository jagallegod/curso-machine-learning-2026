# figuras_S6.R
# Genera las figuras nuevas de S6 (funciones de activacion, CNN y RNN).
# Ejecutar desde la carpeta de la sesion S6:  Rscript figuras_S6.R
# Salida: PDFs en img/.  (Etiquetas en ASCII.)

dir.create("img", showWarnings = FALSE)

## 1. Funciones de activacion (sigmoid, tanh, ReLU) ----------------------------
x <- seq(-5, 5, 0.05)
pdf("img/activaciones.pdf", width = 6.4, height = 4)
par(mar = c(4, 4, 2, 1))
plot(x, 1 / (1 + exp(-x)), type = "l", lwd = 3, col = "blue", ylim = c(-1.2, 3),
     xlab = "Entrada", ylab = "Salida f(x)", main = "Funciones de activacion")
lines(x, tanh(x), lwd = 3, col = "darkgreen")
lines(x, pmax(0, x), lwd = 3, col = "red")
abline(h = 0, col = "grey80", lty = 3)
legend("topleft", c("Sigmoide", "Tanh", "ReLU"),
       lwd = 3, col = c("blue", "darkgreen", "red"), bty = "n")
dev.off()

## 2. Convolucion: un filtro recorre la imagen ---------------------------------
pdf("img/convolution.pdf", width = 7, height = 4)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 14), ylim = c(0, 7))
title("Convolucion: un filtro recorre la imagen")
# imagen 6x6 (izquierda)
for (i in 0:5) for (j in 0:5) rect(j, 6 - i, j + 1, 7 - i, border = "grey70")
# ventana 3x3 resaltada (esquina superior izquierda)
rect(0, 4, 3, 7, border = "red", lwd = 3)
text(3, 0.4, "Imagen (pixeles)", cex = 0.9)
# flecha
arrows(6.3, 3.5, 8.7, 3.5, lwd = 2, length = 0.12)
text(7.5, 4.1, "filtro", cex = 0.85, col = "red")
# mapa de caracteristicas (derecha) 4x4
for (i in 0:3) for (j in 0:3) rect(9 + j, 5 - i, 10 + j, 6 - i, border = "grey70")
rect(9, 5, 10, 6, col = "tomato", border = "red", lwd = 2)
text(11, 0.6, "Mapa de caracteristicas", cex = 0.9)
dev.off()

## 3. Arquitectura tipica de una CNN -------------------------------------------
pdf("img/cnn_diagram.pdf", width = 9, height = 3.2)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 30), ylim = c(0, 10)); title("Arquitectura tipica de una CNN")
etapas <- c("Imagen", "Conv", "Pool", "Conv", "Pool", "Flatten", "Densa", "Salida")
cols <- c("grey85", "lightblue", "khaki", "lightblue", "khaki", "grey85", "palegreen", "grey85")
n <- length(etapas); w <- 2.6; gap <- (30 - n * w) / (n + 1)
for (k in 1:n) {
  x0 <- gap + (k - 1) * (w + gap)
  rect(x0, 3.5, x0 + w, 6.5, col = cols[k], border = NA)
  text(x0 + w / 2, 5, etapas[k], cex = 0.75)
  if (k < n) arrows(x0 + w, 5, x0 + w + gap, 5, length = 0.06, col = "grey55")
}
text(15, 1.5, "extraccion de caracteristicas  -->  clasificacion", cex = 0.9, col = "grey30")
dev.off()

## 4. RNN desplegada en el tiempo ----------------------------------------------
pdf("img/rnn_unrolled.pdf", width = 8.5, height = 3.6)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 18), ylim = c(0, 10)); title("Una RNN desplegada en el tiempo")
for (t in 1:3) {
  cx <- 2 + (t - 1) * 5.5
  rect(cx, 4, cx + 2.4, 6, col = "khaki", border = NA)
  text(cx + 1.2, 5, paste0("h", t), cex = 0.95)
  # entrada x_t (abajo)
  text(cx + 1.2, 1.6, paste0("x", t), cex = 0.95)
  arrows(cx + 1.2, 2.1, cx + 1.2, 4, length = 0.07)
  # salida y_t (arriba)
  text(cx + 1.2, 8.6, paste0("y", t), cex = 0.95)
  arrows(cx + 1.2, 6, cx + 1.2, 8.1, length = 0.07)
  # recurrencia h_t -> h_{t+1}
  if (t < 3) arrows(cx + 2.4, 5, cx + 5.5, 5, length = 0.08, col = "red", lwd = 2)
}
text(9, 9.6, "el estado h se pasa de un paso al siguiente (memoria)", cex = 0.85, col = "red")
dev.off()

cat("Figuras S6 generadas en img/:\n")
print(list.files("img", pattern = "(activaciones|convolution|cnn|rnn)"))
