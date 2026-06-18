# Aprendizaje de Máquinas y Análisis de Datos

**Bogotá Summer School in Economics — 2026 · Pontificia Universidad Javeriana**
Profesor: **Jorge Gallego** · Banco Interamericano de Desarrollo · `jagallegod@gmail.com`

Curso introductorio y aplicado de *machine learning* para economía y políticas públicas (18 horas, 6 sesiones). Cada sesión incluye una presentación conceptual (**slides** en PDF) y uno o varios **talleres prácticos** en R.

## Cómo usar este repositorio

- **Slides**: PDF (se abren directamente en GitHub).
- **Talleres**: cuadernos de R (`.Rmd`) tejidos a **HTML interactivo**. Los enlaces "(taller)" abren el HTML renderizado vía `htmlpreview`; el código fuente `.Rmd` está en la misma carpeta.
- **Datos**: bases en formato `.csv` dentro de la carpeta `data/` de cada sesión.

> **Para correr los talleres**: necesitas [R](https://cran.r-project.org/) y [RStudio](https://posit.co/download/rstudio-desktop/). Cada taller indica los paquetes que usa (`install.packages(...)`). 

---

## Contenido

### 1. Introducción, KNN y Naive Bayes
- 📊 [Slides](01-intro-knn-naive-bayes/slides.pdf)
- 💻 Talleres:
  - [Clasificación con KNN — diagnóstico de cáncer de seno](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/01-intro-knn-naive-bayes/taller_knn.html) · datos: [`wisc_bc_data.csv`](01-intro-knn-naive-bayes/data/wisc_bc_data.csv)
  - [Naive Bayes — predecir el partido de legisladores](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/01-intro-knn-naive-bayes/taller_nb.html) · datos: [`votos84.csv`](01-intro-knn-naive-bayes/data/votos84.csv)

### 2. SVM, Árboles de Decisión y Random Forests
- 📊 [Slides](02-svm-arboles-random-forests/slides.pdf)
- 💻 Talleres:
  - [Support Vector Machine — reconocimiento de caracteres](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_svm.html) · datos: [`letterdata.csv`](02-svm-arboles-random-forests/data/letterdata.csv)
  - [Árboles de decisión — riesgo de default crediticio](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_arboles.html) · datos: [`credit.csv`](02-svm-arboles-random-forests/data/credit.csv)
  - [Bagging y Random Forests — marketing bancario](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_rf.html) · datos: [`bank.csv`](02-svm-arboles-random-forests/data/bank.csv)

### 3. Regresión, Ridge y Lasso
- 📊 [Slides](03-regresion-ridge-lasso/slides.pdf)
- 💻 Talleres:
  - [Regresión lineal y logística — gasto médico](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/03-regresion-ridge-lasso/taller_regresion.html) · datos: [`insurance.csv`](03-regresion-ridge-lasso/data/insurance.csv)
  - [Ridge y Lasso — predicción de salarios](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/03-regresion-ridge-lasso/taller_ridge_lasso.html) · datos: [`Hitters.csv`](03-regresion-ridge-lasso/data/Hitters.csv)

### 4. Desempeño de Modelos
- 📊 [Slides](04-desempeno-de-modelos/slides.pdf)
- 💻 Talleres:
  - [Evaluación del desempeño (ROC, AUC, validación cruzada)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_evaluacion.html) · datos: [`bank.csv`](04-desempeno-de-modelos/data/bank.csv)
  - [Selección e importancia de variables](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_seleccion_variables.html) · datos: [`credit.csv`](04-desempeno-de-modelos/data/credit.csv)
  - [Desbalance de clase y boosting](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_desbalance.html) · datos: [`bank.csv`](04-desempeno-de-modelos/data/bank.csv)

### 5. Aprendizaje No Supervisado
- 📊 [Slides](05-no-supervisado/slides.pdf)
- 💻 Talleres:
  - [Clustering con k-medias — segmentación](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_clustering.html) · datos: [`teens.csv`](05-no-supervisado/data/teens.csv)
  - [Detección de anomalías (LOF) — fraude en transacciones](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_anomalias.html) · datos: [`anomalias.csv`](05-no-supervisado/data/anomalias.csv)
  - [Representación de datos con PCA](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_representacion.html) · datos: [`wisc_bc_data.csv`](05-no-supervisado/data/wisc_bc_data.csv)

### 6. Aprendizaje Profundo (Deep Learning)
- 📊 [Slides](06-aprendizaje-profundo/slides.pdf)
- 💻 Talleres:
  - [Redes neuronales (ANN) — gasto médico](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/06-aprendizaje-profundo/taller_ann.html) · datos: [`insurance.csv`](06-aprendizaje-profundo/data/insurance.csv) · (corre en R con `neuralnet`)
  - [Redes convolucionales (CNN) — MNIST](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/06-aprendizaje-profundo/taller_cnn.html) · *demo `keras` para Google Colab*
  - [Redes recurrentes (RNN/LSTM) — sentimiento IMDB](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/06-aprendizaje-profundo/taller_rnn.html) · *demo `keras` para Google Colab*

---

## Apéndices (material opcional)

- **Fundamentos y gráficas en R** — [Fundamentos de R](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/apendices/fundamentos-y-graficas-r/fundamentos_r.html) · [Programación básica y gráficas](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/apendices/fundamentos-y-graficas-r/graficas_r.html)
- **Árboles de regresión** — 📊 [Slides](apendices/regression-trees/slides.pdf) · [Taller (whitewines)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/apendices/regression-trees/taller_arboles_regresion.html)
- **Reglas de asociación (Basket Analysis)** — 📊 [Slides](apendices/basket-analysis/slides.pdf) · [Taller (`.Rmd`)](apendices/basket-analysis/taller_basket.Rmd) · *requiere `install.packages("arules")`; teje el HTML desde RStudio*

---

## Bibliografía principal

- Lantz, B. (2015). *Machine Learning with R*. Packt Publishing. *(base de los talleres)*
- James, G., Witten, D., Hastie, T. y Tibshirani, R. (2013). *An Introduction to Statistical Learning*. Springer.
- Hastie, T., Tibshirani, R. y Friedman, J. (2009). *The Elements of Statistical Learning*. Springer.
- Chollet, F. (2021). *Deep Learning with Python* (2.ª ed.). Manning.

---

*Slides en LaTeX/Beamer; talleres en R Markdown. El código que genera las figuras de cada sesión está en los archivos `figuras_*.R`.*
