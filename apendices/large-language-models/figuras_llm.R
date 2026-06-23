# Figuras ilustrativas para el apendice de Large Language Models.
# Solo R base. Etiquetas ASCII (compatibilidad latin1 del deck).

img <- "/Users/jorgegallego/Library/CloudStorage/Dropbox/documents/Machine Learning/Javeriana 2026/Contenido 2026/Curso 2026/Apendices/Large Language Models/img"
fp <- function(n) file.path(img, n)

## ---------- fig_tokens: texto -> tokens -> embedding ----------
pdf(fp("fig_tokens.pdf"), width = 8, height = 3.4)
par(mar = c(0.5, 0.5, 2, 0.5))
plot(1, type = "n", xlim = c(0, 12), ylim = c(0, 6), axes = FALSE, xlab = "", ylab = "",
     main = "De texto a numeros: tokens y embeddings")
toks <- c("El", "gato", "se", "subio", "al", "tejado")
n <- length(toks); xw <- 12 / n
for (i in 1:n) {
  rect((i - 1) * xw + 0.15, 4.5, i * xw - 0.15, 5.7, col = "lightsteelblue", border = "navy")
  text((i - 0.5) * xw, 5.1, toks[i], cex = 1.0)
}
# de "subio" (token 4) a un vector
cx <- (4 - 0.5) * xw
arrows(cx, 4.4, cx, 3.4, length = 0.07)
set.seed(1); v <- sprintf("%.2f", rnorm(5))
rect(cx - 0.8, 0.6, cx + 0.8, 3.2, border = "grey40")
text(cx, seq(1.0, 2.8, length = 5), v, cex = 0.75)
text(cx, 0.2, "embedding (vector)", cex = 0.75)
text(10.5, 2, "cada token\n-> un vector", cex = 0.8)
dev.off()

## ---------- fig_attention: atencion sobre la frase ----------
pdf(fp("fig_attention.pdf"), width = 8, height = 3.6)
par(mar = c(0.5, 0.5, 2, 0.5))
plot(1, type = "n", xlim = c(0, 12), ylim = c(0, 5), axes = FALSE, xlab = "", ylab = "",
     main = "Atencion: la palabra 'banco' mira a las demas")
w <- c("Se", "sento", "en", "la", "orilla", "del", "banco")
n <- length(w); xs <- seq(1, 11, length = n)
pesos <- c(0.05, 0.10, 0.05, 0.05, 0.55, 0.10, NA)  # 'orilla' recibe mas atencion
src <- n  # 'banco'
for (i in 1:(n - 1)) {
  lwd <- 1 + 9 * pesos[i]
  xspline(c(xs[src], (xs[src] + xs[i]) / 2, xs[i]), c(1.4, 2.4 + 2 * pesos[i], 1.4),
          shape = -1, lwd = lwd, border = ifelse(i == 5, "firebrick", "grey70"))
}
points(xs, rep(1.2, n), pch = 21, bg = "white", cex = 0.5)
for (i in 1:n) text(xs[i], 1.0, w[i], cex = 0.95,
                    col = ifelse(i == src, "navy", ifelse(i == 5, "firebrick", "black")),
                    font = ifelse(i == src, 2, 1))
text(6, 4.6, "Lineas mas gruesas = mas atencion", cex = 0.85)
dev.off()

## ---------- fig_nexttoken: predecir la siguiente palabra ----------
pdf(fp("fig_nexttoken.pdf"), width = 7.5, height = 4.2)
par(mar = c(3, 7, 3, 1))
probs <- c(tejado = 0.42, arbol = 0.23, sofa = 0.15, carro = 0.09, techo = 0.06, otros = 0.05)
barplot(rev(probs), horiz = TRUE, las = 1, col = c(rep("grey75", 5), "steelblue"),
        xlim = c(0, 0.5), xlab = "Probabilidad",
        main = "Predecir la siguiente palabra:\n'El gato se subio al ___'")
dev.off()

## ---------- fig_pipeline: de modelo base a asistente ----------
pdf(fp("fig_pipeline.pdf"), width = 9, height = 2.6)
par(mar = c(0.5, 0.5, 2, 0.5))
plot(1, type = "n", xlim = c(0, 10), ylim = c(0, 3), axes = FALSE, xlab = "", ylab = "",
     main = "De texto crudo a asistente util")
labs <- c("Pre-entrenamiento\n(texto masivo)", "Instruction\ntuning", "RLHF /\nalineacion", "Asistente")
cols <- c("lightsteelblue", "lightsteelblue", "lightsteelblue", "mistyrose")
cx <- seq(1.3, 8.7, length = 4)
for (i in 1:4) {
  rect(cx[i] - 1.0, 1.0, cx[i] + 1.0, 2.4, col = cols[i],
       border = ifelse(i == 4, "firebrick", "navy"))
  text(cx[i], 1.7, labs[i], cex = 0.8)
  if (i < 4) arrows(cx[i] + 1.05, 1.7, cx[i + 1] - 1.05, 1.7, length = 0.08)
}
dev.off()

## ---------- fig_scaling: mas escala, mejor desempeno ----------
pdf(fp("fig_scaling.pdf"), width = 6.6, height = 4.2)
par(mar = c(4, 4, 3, 1))
x <- 10^seq(6, 11, length = 100)
y <- 0.95 - 0.55 * exp(-(log10(x) - 6) / 2.2)
plot(x, y, type = "l", lwd = 2.5, col = "firebrick", log = "x",
     xlab = "Escala (datos + parametros + computo, log)",
     ylab = "Desempeno", yaxt = "n",
     main = "Mas escala, mejor desempeno\n(con rendimientos decrecientes)")
dev.off()

cat("Figuras LLM generadas OK\n")
