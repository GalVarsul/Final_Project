import os
import joblib
import pandas as pd

MODEL_PATH = os.path.join(os.path.dirname(__file__), "delivery_time_model.pkl")

model = joblib.load(MODEL_PATH)

FEATURE_COLUMNS = [
    "Delivery_person_Age",
    "Delivery_person_Ratings",
    "Weather_conditions",
    "Road_traffic_density",
    "Vehicle_condition",
    "Type_of_order",
    "Type_of_vehicle",
    "multiple_deliveries",
    "Festival",
    "City",
    "Distance_km",
    "Order_DayOfWeek",
]

def predict_delivery_time(features):
    features_df = pd.DataFrame([features], columns=FEATURE_COLUMNS)
    return model.predict(features_df)[0]