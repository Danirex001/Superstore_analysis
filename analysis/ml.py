import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import OneHotEncoder, StandardScaler
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor

# Load data
store = pd.read_csv("../data/Cleaned/processed_superstore.csv")

# Select relevant columns
data = store[['Order Date','Region','Revenue', 'Quantity', 'Discount',
              'Unit_price','Discount_amount','Profit_margins', 'Profit']]

# Convert date
data['Order Date'] = pd.to_datetime(data['Order Date'], errors='coerce')
data['year'] = data['Order Date'].dt.year
data.drop(columns=['Order Date'], inplace=True)

# Features and target
X = data.drop('Revenue', axis=1)
y = data['Revenue']

# Preprocessing
categorical_features = ['Region']
numeric_features = [col for col in X.columns if col not in categorical_features]

preprocessor = ColumnTransformer([
    ('cat', OneHotEncoder(drop='first', handle_unknown='ignore'), categorical_features),
    ('num', StandardScaler(), numeric_features)
])

# Pipeline with Regressor
pipeline = Pipeline([
    ('preprocessor', preprocessor),
    ('model', RandomForestRegressor(random_state=42))
])

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Fit model
pipeline.fit(X_train, y_train)


from sklearn.metrics import r2_score, mean_absolute_error, mean_squared_error
y_pred = pipeline.predict(X_test)
print("R²:", r2_score(y_test, y_pred))
print("MAE:", mean_absolute_error(y_test, y_pred))
print("RMSE:", np.sqrt(mean_squared_error(y_test, y_pred)))

#feature importance 
feature_names=pipeline.named_steps['preprocessor'].get_feature_names_out()
importances=pipeline.named_steps['model'].feature_importances_
feature_importance = pd.Series(importances,index=feature_names)
feature_importance=feature_importance.sort_values(ascending=False)
feature_importance.plot(kind='bar')
plt.show()

