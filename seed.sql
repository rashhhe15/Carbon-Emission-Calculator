Seed data for Carbon Emission Calculator

INSERT INTO Users (name, email, password)
VALUES ('DemoUser', 'demo@example.com', 'demo123');

INSERT INTO Transportation (mode, emission_per_km)
VALUES ('Bike', 0.05), ('Car', 0.21), ('Bus', 0.11), ('Train', 0.02);

INSERT INTO Energy (source, emission_per_unit)
VALUES ('Electricity', 0.7), ('LPG', 1.5), ('Solar', 0.02);

INSERT INTO Food (food_type, emission)
VALUES ('Veg Meal', 0.3), ('Non-Veg Meal', 1.2), ('Vegan Meal', 0.15);
