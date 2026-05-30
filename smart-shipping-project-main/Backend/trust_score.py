def calculate_trust_score(user: dict) -> float:
    rating = user.get("rating")
    predicted_time = user.get("predicted_delivery_time")
    actual_time = user.get("actual_delivery_time")

    try:
        rating_score = float(rating) if rating is not None else 3.0
    except (TypeError, ValueError):
        rating_score = 3.0

    performance_score = 3.0

    if predicted_time is not None and actual_time is not None:
        try:
            predicted_time = float(predicted_time)
            actual_time = float(actual_time)

            delay = actual_time - predicted_time

            if delay <= 0:
                performance_score = 5.0
            elif delay <= 5:
                performance_score = 4.0
            elif delay <= 10:
                performance_score = 3.0
            elif delay <= 20:
                performance_score = 2.0
            else:
                performance_score = 1.0

        except (TypeError, ValueError):
            performance_score = 3.0

    trust_score = (0.7 * rating_score) + (0.3 * performance_score)

    return round(min(max(trust_score, 1.0), 5.0), 2)