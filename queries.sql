USE carbon_calc;


SELECT * FROM Transportation;
SELECT * FROM Energy;
SELECT * FROM Food;


SET @user_id = 1;
SET @distance_km = 15;
SET @energy_units = 6;
SET @transport_mode = 'Car';


SET @food_type = (SELECT food_type FROM Food WHERE emission = 1.2 LIMIT 1);


INSERT INTO CarbonEmissions (user_id, transport_emission, energy_emission, food_emission, total_emission)
VALUES (
  @user_id,
  (SELECT emission_per_km FROM Transportation WHERE mode=@transport_mode LIMIT 1) * @distance_km,
  (SELECT emission_per_unit FROM Energy WHERE source='Electricity' LIMIT 1) * @energy_units,
  (SELECT emission FROM Food WHERE food_type=@food_type LIMIT 1),
  ((SELECT emission_per_km FROM Transportation WHERE mode=@transport_mode LIMIT 1) * @distance_km) +
  ((SELECT emission_per_unit FROM Energy WHERE source='Electricity' LIMIT 1) * @energy_units) +
  (SELECT emission FROM Food WHERE food_type=@food_type LIMIT 1)
);


SELECT * FROM CarbonEmissions;
SELECT * FROM CarbonEmissions ORDER BY carbon_id DESC LIMIT 5;
