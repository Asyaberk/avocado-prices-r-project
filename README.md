# 🥑 Avocado Prices Analysis in R

## 📖 Story & Motivation
This project was born out of curiosity about how avocado prices change across time, regions, and types. I wanted to explore a **real-world dataset** that combines both economic and agricultural perspectives. The [Avocado Prices dataset](https://www.kaggle.com/datasets/neuromusic/avocado-prices) from Kaggle provided the perfect playground: structured, rich, yet simple enough to analyze with the tools we learned in class.

## 🔍 Project Flow
The journey of this analysis unfolded in three main steps:

### 1️⃣ Getting to Know the Data
- Imported the CSV dataset into R.
- Explored its structure with `str()`, `summary()`, and `head()`.
- Checked for missing values and unique counts per column.
- This step helped me understand the variables before diving deeper.

### 2️⃣ Detecting Outliers
- Focused on **AveragePrice**, **Total.Volume**, and **Total.Bags**.
- Used **boxplots** to reveal unusual values.
- Outliers gave insight into extreme cases of pricing and sales volume that could impact analysis.

### 3️⃣ Visual Storytelling with Plots
- **Histogram of Average Price** → to see how prices are distributed.
- **Histogram of log(Total Volume)** → log transform made skewed values easier to interpret.
- **Scatter plot of Price vs Log(Volume)** → revealed the relationship between sales volume and pricing.

### 4️⃣ Predictive Modeling with Decision Trees
- Built a **Decision Tree regression model** using log-transformed variables.
- Split the dataset into **training (80%)** and **testing (20%)**.
- Visualized the tree and calculated **Mean Squared Error (MSE)**.
- The model achieved a low error (~0.07), showing it captured the key patterns well.

## 📊 Results & Insights
- **Outliers** highlighted unusual pricing and sales activity.
- **Visualizations** clarified data distribution and trends.
- **Decision Tree Model** successfully predicted avocado prices using volume, year, and type.
- The analysis remained simple, interpretable, and faithful to classroom methods.

## 📂 Repository Structure
```
.
├── avocado.R                 # Main R script
├── avocado.csv               # Dataset (ignored in .gitignore if excluded)
└── presentation/             # Presentation materials & plots
    ├── Asya_Berk_Avocado_Prices_Presentation.pdf
    ├── Avocado_Prices_Presentation.pdf
    └── plots/
        ├── plot1.png ... plot7.png
```

## 🚀 How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/username/avocado-prices-r-project.git
   ```
2. Download the dataset from [Kaggle](https://www.kaggle.com/datasets/neuromusic/avocado-prices) if not included.
3. Place `avocado.csv` in the project root.
4. Run the analysis in R:
   ```R
   source("avocado.R")
   ```

## 🙋‍♀️ Author
👩‍💻 **Asya Berk**  
CMPE343 – Business Intelligence and Applied Analytics  
Spring 2025  

---

✨ This project was not just about coding — it was about **telling a story with data**. From exploring raw numbers to visual insights and predictive modeling, the journey showed how even something as simple as avocados can reveal fascinating economic patterns.

