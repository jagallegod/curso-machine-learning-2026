# Aprendizaje de Máquinas y Políticas Públicas

**Bogotá Summer School in Economics — 2026 · Pontificia Universidad Javeriana**
Profesor: **Jorge Gallego** · Banco Interamericano de Desarrollo · `jagallegod@gmail.com`

Curso introductorio y aplicado de *machine learning* para economía y políticas públicas (18 horas, 6 sesiones). Cada sesión incluye una presentación conceptual (**slides** en PDF) y uno o varios **talleres prácticos** en R.

📄 **[Syllabus del curso (PDF)](syllabus.pdf)**

## Cómo usar este repositorio

- **Slides**: PDF (se abren directamente en GitHub).
- **Talleres**: cuadernos de R (`.Rmd`) tejidos a **HTML interactivo**. 
- **Datos**: bases en formato `.csv` dentro de la carpeta `data/` de cada sesión.

> **Para correr los talleres**: necesitas [R](https://cran.r-project.org/) y [RStudio](https://posit.co/download/rstudio-desktop/). Cada taller indica los paquetes que usa (`install.packages(...)`). 

---

## Evaluación del curso

La nota final se compone de tres pruebas:

1. **Quiz — 33%.** Durante la **sesión 5**. Examen individual *a la antigua* (**lápiz y papel, sin ningún recurso**), enfocado en evaluar la comprensión de los **conceptos principales** de los modelos vistos en el curso.
2. **Proyecto / *policy report* — 33%.** Trabajo para la casa: cada estudiante aplica las herramientas del curso a un problema real de **política pública**. Debe plantear una **pregunta** de evaluación/investigación, conseguir una **base de datos** para responderla, diseñar una **estrategia empírica** (usando uno o varios de los modelos del curso), **implementarla** y escribir un **reporte de política** con los resultados. Aquí **sí** se puede usar todo: material del curso, datos externos, LLMs, etc.
3. **Sustentación — 34%.** Defensa **virtual** (videollamada) del proyecto, unos días después de la entrega, para verificar que cada estudiante **comprende a fondo** el trabajo entregado.

---

## Contenido

### 1. Introducción, KNN y Naive Bayes
- 📊 [Slides](01-intro-knn-naive-bayes/slides.pdf)
- 💻 Talleres:
  - [Clasificación con KNN — diagnóstico de cáncer de seno](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/01-intro-knn-naive-bayes/taller_knn.html) · datos: [`wisc_bc_data.csv`](01-intro-knn-naive-bayes/data/wisc_bc_data.csv)
  - [Naive Bayes — predecir el partido de legisladores](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/01-intro-knn-naive-bayes/taller_nb.html) · datos: [`votos84.csv`](01-intro-knn-naive-bayes/data/votos84.csv)
- 🎧 [Podcast](https://notebooklm.google.com/notebook/a3a865d2-7e48-45fe-aad5-6ba225aba170/artifact/9e2c8bb7-a44f-4e17-8e40-c69cb3e45712?utm_source=nlm_web_share&utm_medium=google_oo&utm_campaign=art_share_1&utm_content=&utm_smc=nlm_web_share_google_oo_art_share_1_)

### 2. SVM, Árboles de Decisión y Random Forests
- 📊 [Slides](02-svm-arboles-random-forests/slides.pdf)
- 💻 Talleres:
  - [Support Vector Machine — reconocimiento de caracteres](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_svm.html) · datos: [`letterdata.csv`](02-svm-arboles-random-forests/data/letterdata.csv)
  - [Árboles de decisión — riesgo de default crediticio](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_arboles.html) · datos: [`credit.csv`](02-svm-arboles-random-forests/data/credit.csv)
  - [Bagging y Random Forests — marketing bancario](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_rf.html) · datos: [`bank.csv`](02-svm-arboles-random-forests/data/bank.csv)
  - [Taller unificado: cinco modelos de clasificación (ingreso/desigualdad)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/02-svm-arboles-random-forests/taller_clasificacion_fusionado_ingreso.html) · datos: [`census_income.csv`](02-svm-arboles-random-forests/data/census_income.csv)
- 🎧 [Podcast](https://notebooklm.google.com/notebook/2cea0247-e0fb-49b8-959c-7a5d18e62c11/artifact/16526932-cb08-4133-95b7-776122104a2a?utm_source=nlm_web_share&utm_medium=google_oo&utm_campaign=art_share_1&utm_content=&utm_smc=nlm_web_share_google_oo_art_share_1_)

### 3. Regresión, Ridge y Lasso
- 📊 [Slides](03-regresion-ridge-lasso/slides.pdf)
- 💻 Talleres:
  - [Regresión lineal y logística — gasto médico](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/03-regresion-ridge-lasso/taller_regresion.html) · datos: [`insurance.csv`](03-regresion-ridge-lasso/data/insurance.csv)
  - [Ridge y Lasso — predicción de salarios](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/03-regresion-ridge-lasso/taller_ridge_lasso.html) · datos: [`Hitters.csv`](03-regresion-ridge-lasso/data/Hitters.csv)
  - [Taller unificado: predicción numérica (vivienda)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/03-regresion-ridge-lasso/taller_prediccion_numerica_fusionado.html) · datos: [`california_housing.csv`](03-regresion-ridge-lasso/data/california_housing.csv)
- 🎧 [Podcast](https://notebooklm.google.com/notebook/f22e5b6b-5c0f-44b0-97ea-e51054065363/artifact/32b48ec8-6cc4-4cad-afba-4ca89c8491f6?utm_source=nlm_web_share&utm_medium=google_oo&utm_campaign=art_share_1&utm_content=&utm_smc=nlm_web_share_google_oo_art_share_1_)

### 4. Desempeño de Modelos
- 📊 [Slides](04-desempeno-de-modelos/slides.pdf)
- 💻 Talleres:
  - [Evaluación del desempeño (ROC, AUC, validación cruzada)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_evaluacion.html) · datos: [`bank.csv`](04-desempeno-de-modelos/data/bank.csv)
  - [Selección e importancia de variables](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_seleccion_variables.html) · datos: [`credit.csv`](04-desempeno-de-modelos/data/credit.csv)
  - [Desbalance de clase y boosting](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_desbalance.html) · datos: [`bank.csv`](04-desempeno-de-modelos/data/bank.csv)
  - [Taller unificado: evaluación de modelos (ingreso)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/04-desempeno-de-modelos/taller_evaluacion_unificado.html) · datos: [`census_income.csv`](04-desempeno-de-modelos/data/census_income.csv)
- 🎧 [Podcast](https://notebooklm.google.com/notebook/379c4d06-ac6e-431b-a3a9-f8a8c3c78b8f/artifact/5f8a451e-7a52-4808-a6e2-745b3a33d633?utm_source=nlm_web_share&utm_medium=google_oo&utm_campaign=art_share_1&utm_content=&utm_smc=nlm_web_share_google_oo_art_share_1_)

### 5. Aprendizaje No Supervisado
- 📊 [Slides](05-no-supervisado/slides.pdf)
- 💻 Talleres:
  - [Clustering con k-medias — segmentación](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_clustering.html) · datos: [`teens.csv`](05-no-supervisado/data/teens.csv)
  - [Detección de anomalías (LOF) — fraude en transacciones](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_anomalias.html) · datos: [`anomalias.csv`](05-no-supervisado/data/anomalias.csv)
  - [Representación de datos con PCA](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_representacion.html) · datos: [`wisc_bc_data.csv`](05-no-supervisado/data/wisc_bc_data.csv)
  - [Taller unificado: no supervisado (clustering, anomalías, PCA)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/05-no-supervisado/taller_no_supervisado_unificado.html) · datos: [`wisc_bc_data.csv`](05-no-supervisado/data/wisc_bc_data.csv)
- 🎧 [Podcast](https://notebooklm.google.com/notebook/58418a34-1f1a-452f-8034-fc15474f714f/artifact/2e78ba25-ef13-477c-8b9d-2f7a315e41b7?utm_source=nlm_web_share&utm_medium=google_oo&utm_campaign=art_share_1&utm_content=&utm_smc=nlm_web_share_google_oo_art_share_1_)

### 6. Aprendizaje Profundo (Deep Learning)
- 📊 [Slides](06-aprendizaje-profundo/slides.pdf)
- 💻 Talleres:
  - [Redes neuronales (ANN) — gasto médico](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/06-aprendizaje-profundo/taller_ann.html) · datos: [`insurance.csv`](06-aprendizaje-profundo/data/insurance.csv) · (corre en R con `neuralnet`)
  - [Redes convolucionales (CNN) — MNIST](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/06-aprendizaje-profundo/taller_cnn.html) · *demo `keras` para Google Colab*
  - [Redes recurrentes (RNN/LSTM) — sentimiento IMDB](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/06-aprendizaje-profundo/taller_rnn.html) · *demo `keras` para Google Colab*
- 🎧 [Podcast](https://notebooklm.google.com/notebook/f59e1cd1-ffd4-4d8e-a1e1-96596b2b773c/artifact/f2c2cc79-291a-4b8a-b536-b68eab08adf5?utm_source=nlm_web_share&utm_medium=google_oo&utm_campaign=art_share_1&utm_content=&utm_smc=nlm_web_share_google_oo_art_share_1_)

---

## Apéndices (material opcional)

- **Fundamentos y gráficas en R** — [Fundamentos de R](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/apendices/fundamentos-y-graficas-r/fundamentos_r.html) · [Programación básica y gráficas](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/apendices/fundamentos-y-graficas-r/graficas_r.html)
- **Árboles de regresión** — 📊 [Slides](apendices/regression-trees/slides.pdf) · [Taller (whitewines)](https://htmlpreview.github.io/?https://github.com/jagallegod/curso-machine-learning-2026/blob/main/apendices/regression-trees/taller_arboles_regresion.html)
- **Reglas de asociación (Basket Analysis)** — 📊 [Slides](apendices/basket-analysis/slides.pdf) · [Taller (`.Rmd`)](apendices/basket-analysis/taller_basket.Rmd) · *requiere `install.packages("arules")`; teje el HTML desde RStudio*
- **Large Language Models (LLMs)** — 📊 [Slides](apendices/large-language-models/slides.pdf) 

---

## Bibliografía principal

- Lantz, B. (2015). *Machine Learning with R*. Packt Publishing. *(base de los talleres)*
- James, G., Witten, D., Hastie, T. y Tibshirani, R. (2013). *An Introduction to Statistical Learning*. Springer.
- Hastie, T., Tibshirani, R. y Friedman, J. (2009). *The Elements of Statistical Learning*. Springer.
- Chollet, F. y Allaire, J. J. (2018). *Deep Learning with R*. Manning.

---

