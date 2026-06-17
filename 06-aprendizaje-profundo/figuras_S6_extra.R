# figuras_S6_extra.R
# Figuras adicionales para la ampliacion de las Partes 2 (CNNs) y 3 (RNNs) de S6.
# Ejecutar desde la carpeta de la sesion S6:  Rscript figuras_S6_extra.R
# Salida: PDFs en img/.  (Esquemas en base R, etiquetas ASCII.)

dir.create("img", showWarnings = FALSE)

## 1. Una imagen = matriz de pixeles + canales RGB ----------------------------
pdf("img/image_pixels.pdf", width = 8, height = 3.6)
par(mfrow = c(1, 2), mar = c(1, 1, 2, 1))
set.seed(1)
m <- matrix(0.85, 8, 8); m[3:6, 4:5] <- 0.15; m[2:7, 4] <- 0.1   # un trazo
image(t(m[8:1, ]), col = gray(seq(1, 0, length = 30)), axes = FALSE,
      main = "Imagen = matriz de pixeles"); box()
plot(NA, xlim = c(0, 10), ylim = c(0, 10), axes = FALSE, xlab = "", ylab = "",
     main = "Color = 3 canales (RGB)")
rect(1, 1, 6, 6, col = rgb(1, 0, 0, 0.45), border = NA)
rect(2.2, 2.2, 7.2, 7.2, col = rgb(0, 1, 0, 0.45), border = NA)
rect(3.4, 3.4, 8.4, 8.4, col = rgb(0, 0, 1, 0.45), border = NA)
text(c(1.5, 2.7, 3.9), c(1.5, 2.7, 3.9), c("R", "G", "B"), cex = 0.9)
dev.off()

## 2. La convolucion en detalle (producto punto + suma) -----------------------
pdf("img/conv_detail.pdf", width = 8.5, height = 3.6)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 17), ylim = c(0, 6)); title("Convolucion: producto punto + suma")
patch <- matrix(c(1, 0, 1, 0, 1, 1, 0, 0, 1), 3, byrow = TRUE)
filt  <- matrix(c(1, 0, 1, 0, 1, 0, 1, 0, 1), 3, byrow = TRUE)
drawgrid <- function(x0, M, lab) {
  for (i in 1:3) for (j in 1:3) {
    rect(x0 + j - 1, 4 - i, x0 + j, 5 - i, border = "grey60")
    text(x0 + j - 0.5, 4.5 - i, M[i, j], cex = 0.8)
  }
  text(x0 + 1.5, 0.7, lab, cex = 0.85)
}
drawgrid(0, patch, "ventana (pixeles)")
text(4.2, 2.5, "*", cex = 1.6)
drawgrid(5, filt, "filtro (pesos)")
text(9.2, 2.5, "=", cex = 1.6)
rect(10.5, 2, 12.5, 4, col = "tomato", border = "red", lwd = 2)
text(11.5, 3, sum(patch * filt), cex = 1.2)
text(13.8, 3, "un valor del\nmapa de\ncaracteristicas", cex = 0.8)
dev.off()

## 3. Max pooling 2x2 ----------------------------------------------------------
pdf("img/pooling.pdf", width = 7, height = 3.6)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 13), ylim = c(0, 5)); title("Max pooling 2x2")
M <- matrix(c(1, 3, 2, 4, 5, 6, 1, 2, 0, 1, 7, 8, 3, 2, 9, 4), 4, byrow = TRUE)
for (i in 1:4) for (j in 1:4) {
  rect(j - 1, 4 - i, j, 5 - i, border = "grey60",
       col = if (i <= 2 && j <= 2) "lightblue" else "white")
  text(j - 0.5, 4.5 - i, M[i, j], cex = 0.8)
}
text(2, -0.2, "mapa 4x4", cex = 0.85)
arrows(4.4, 2.5, 6.4, 2.5, length = 0.1, lwd = 2)
text(5.4, 3, "max", cex = 0.85)
res <- matrix(c(max(M[1:2, 1:2]), max(M[1:2, 3:4]), max(M[3:4, 1:2]), max(M[3:4, 3:4])), 2, byrow = TRUE)
for (i in 1:2) for (j in 1:2) {
  rect(7 + j - 1, 3.5 - i, 7 + j, 4.5 - i, border = "grey50",
       col = if (i == 1 && j == 1) "lightblue" else "white")
  text(7 + j - 0.5, 4 - i, res[i, j], cex = 0.9)
}
text(8, 0.6, "resumen 2x2", cex = 0.85)
dev.off()

## 4. Jerarquia de caracteristicas --------------------------------------------
pdf("img/feature_hierarchy.pdf", width = 8.5, height = 2.8)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 24), ylim = c(0, 6)); title("Las capas aprenden una jerarquia")
et <- c("Pixeles", "Bordes y\ncolores", "Texturas\ny partes", "Objetos")
cl <- c("grey85", "lightblue", "khaki", "palegreen")
for (k in 1:4) {
  x0 <- 0.5 + (k - 1) * 6
  rect(x0, 2, x0 + 4, 4.4, col = cl[k], border = NA)
  text(x0 + 2, 3.2, et[k], cex = 0.85)
  if (k < 4) arrows(x0 + 4, 3.2, x0 + 6.5, 3.2, length = 0.08, col = "grey55")
}
text(12, 0.6, "capas tempranas  -->  capas profundas (mas abstracto)", cex = 0.85, col = "grey30")
dev.off()

## 5. Tipos de tareas secuenciales --------------------------------------------
pdf("img/rnn_task_types.pdf", width = 9, height = 3.4)
par(mfrow = c(1, 3), mar = c(1, 1, 2, 1))
celda <- function(title, xin, yout) {
  plot.new(); plot.window(xlim = c(0, 10), ylim = c(0, 10)); title(title, cex.main = 1)
  for (t in 1:3) {
    cx <- 1.5 + (t - 1) * 3
    rect(cx, 4.2, cx + 1.6, 5.8, col = "khaki", border = NA)
    if (t < 3) arrows(cx + 1.6, 5, cx + 3, 5, length = 0.06, col = "red")
    if (t %in% xin) { text(cx + 0.8, 1.8, paste0("x", t), cex = 0.9); arrows(cx + 0.8, 2.3, cx + 0.8, 4.2, length = 0.05) }
    if (t %in% yout) { text(cx + 0.8, 8.4, paste0("y", t), cex = 0.9); arrows(cx + 0.8, 5.8, cx + 0.8, 7.9, length = 0.05) }
  }
}
celda("muchos a uno\n(clasificar texto)", 1:3, 3)
celda("muchos a muchos\n(traducir/etiquetar)", 1:3, 1:3)
celda("uno a muchos\n(generar)", 1, 1:3)
dev.off()

## 6. Celda LSTM: compuertas ---------------------------------------------------
pdf("img/lstm_gates.pdf", width = 7.5, height = 3.8)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 12), ylim = c(0, 8)); title("Celda LSTM: compuertas que regulan la memoria")
rect(2, 1.5, 10, 6.5, border = "grey50", lwd = 2)
# linea de memoria
arrows(0.3, 5.7, 11.7, 5.7, length = 0.1, lwd = 3, col = "red")
text(11.2, 6.2, "memoria", col = "red", cex = 0.8)
g <- c("olvidar", "entrada", "salida")
for (k in 1:3) {
  x0 <- 3 + (k - 1) * 2.6
  rect(x0, 2.5, x0 + 1.8, 4, col = "lightblue", border = NA)
  text(x0 + 0.9, 3.25, g[k], cex = 0.8)
  arrows(x0 + 0.9, 4, x0 + 0.9, 5.55, length = 0.05)
}
text(1, 0.7, "x_t (entrada) + h_(t-1) (estado previo)", cex = 0.8, pos = 4)
dev.off()

## 7. Atencion (Transformers) --------------------------------------------------
pdf("img/attention_concept.pdf", width = 8, height = 3.4)
par(mar = c(1, 1, 2, 1))
plot.new(); plot.window(xlim = c(0, 12), ylim = c(0, 6)); title("Atencion: cada palabra 'mira' a las demas")
pal <- c("El", "gato", "que", "vimos", "dormia")
xs <- seq(1, 11, length = 5)
for (i in seq_along(pal)) { rect(xs[i] - 0.8, 1, xs[i] + 0.8, 2, col = "grey88", border = NA); text(xs[i], 1.5, pal[i], cex = 0.85) }
# "dormia" (5) atiende a "gato" (2) fuerte y a otras debil
foc <- 5
w <- c(0.2, 0.9, 0.1, 0.3, 0)
for (i in 1:4) if (w[i] > 0) {
  lines(c(xs[foc], xs[i]), c(2.2, 4.2), lwd = w[i] * 5, col = rgb(0, 0, 1, w[i]))
}
text(xs[foc], 4.6, "dormia", cex = 0.9, font = 2)
text(6, 5.3, "el grosor = cuanta atencion presta", cex = 0.8, col = "grey30")
dev.off()

cat("Figuras extra S6 generadas:\n"); print(list.files("img", pattern = "(image_pixels|conv_detail|pooling|hierarchy|task_types|lstm|attention)"))
