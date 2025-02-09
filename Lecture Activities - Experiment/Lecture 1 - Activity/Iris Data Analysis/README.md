# 🌸 Iris Dataset Analysis

## 📌 Overview

This project analyzes the **Iris Dataset** obtained from the [UC Irvine Machine Learning Repository](https://archive.ics.uci.edu/dataset/53/iris). The dataset includes **sepal length, sepal width, petal length, and petal width** measurements for three species of iris flowers: **Setosa, Versicolor, and Virginica**.

The goal is to explore the dataset using **statistical analysis and visualization techniques** while performing a **paired T-test** to compare petal lengths of Setosa and Versicolor species.

---

## 📂 Files in this Repository

| File Name | Description |
|-----------|------------|
| `iris.csv` | Original Iris dataset (raw) |
| `cleaned_iris_dataset.csv` | Processed dataset with cleaned formatting |
| `descriptive_statistics.csv` | Summary statistics (mean, variance, std, etc.) |
| `iris_summary_statistics.csv` | Overall dataset statistics |
| `paired_t_test_results.csv` | Results of paired T-Test between Setosa and Versicolor |
| `iris.ipynb` | Jupyter Notebook containing all analysis and visualizations |

---

## 🛠 Methods & Analysis

The Jupyter Notebook (`iris.ipynb`) includes the following:

1. **Data Preprocessing**
   - Cleaning and formatting dataset
   - Ensuring uniform species labels
   - Saving cleaned data

2. **Descriptive Statistics**
   - Computing mean, variance, standard deviation, min, and max values
   - Saving statistics as CSV files

3. **Visualizations**
   - **Histograms**: Distribution of petal lengths for Setosa and Versicolor
   - **Boxplot**: Comparing petal lengths across species
   - **Correlation Matrix Heatmap**: Relationship between sepal and petal features
   - **KDE Plot**: Distribution fit check for numerical columns

4. **Paired T-Test (Hypothesis Testing)**
   - Comparing Setosa vs. Versicolor petal lengths
   - Checking statistical significance
   - Reporting **T-Statistic, P-Value, and Cohen’s d**
   - Interpreting results

---

## 📊 Results & Interpretation

- **Paired T-Test Outcome:**
  - **T-Statistic:** -37.88
  - **P-Value:** 2.02e-37 (**p < 0.05, statistically significant**)
  - **Cohen’s d:** -7.82

✅ Since **p < 0.05**, we **reject the null hypothesis**, confirming that **Setosa and Versicolor petal lengths are significantly different**.

---

## 📥 How to Use

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-repository/iris-analysis.git
   cd iris-analysis

   run Jupyter have the dependencies
   pandas, numpy, seaborn, matplotlib, scipy

📚 References
Iris Dataset: UC Irvine Machine Learning Repository
Scipy & Statistical Analysis: https://docs.scipy.org/doc/scipy/reference/stats.html
Seaborn Visualization: https://seaborn.pydata.org/

