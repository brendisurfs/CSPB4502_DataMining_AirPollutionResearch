# Evaluation 

## Correlation pairs and movement
- First test I decided to try 
- Findings:
┌───────┬───────┬────────┬────────┬───────┬────────┐
│ SO2   ┆ NO2   ┆ O3     ┆ CO     ┆ PM10  ┆ PM2.5  │
│ ---   ┆ ---   ┆ ---    ┆ ---    ┆ ---   ┆ ---    │
│ f64   ┆ f64   ┆ f64    ┆ f64    ┆ f64   ┆ f64    │
╞═══════╪═══════╪════════╪════════╪═══════╪════════╡
│ 1.0   ┆ 0.866 ┆ 0.692  ┆ 0.258  ┆ 0.043 ┆ 0.051  │
│ 0.866 ┆ 1.0   ┆ 0.665  ┆ 0.087  ┆ 0.039 ┆ 0.045  │
│ 0.692 ┆ 0.665 ┆ 1.0    ┆ -0.064 ┆ 0.003 ┆ -0.002 │
│ 0.258 ┆ 0.087 ┆ -0.064 ┆ 1.0    ┆ 0.143 ┆ 0.178  │
│ 0.043 ┆ 0.039 ┆ 0.003  ┆ 0.143  ┆ 1.0   ┆ 0.225  │
│ 0.051 ┆ 0.045 ┆ -0.002 ┆ 0.178  ┆ 0.225 ┆ 1.0    │
└───────┴───────┴────────┴────────┴───────┴────────┘

- SO2 and NO2 move closely, with O3 following. 
- Pm2 and pm10 emissions do not correlate heavily to gas chemical compound emissions.
- PM2 rises above 250 micrograms/m3 every few weeks, which is considered extremely hazardous. This happens with multiple sensor stations, 
suggesting not just small pockets are affected.
- The dates do not directly correlate to anything immediately, but their time groupings suggest a routine industry or weather pattern.


# Preprocessing updates
- Realized that while having address is not important, lat and long is 
- Added mean fill method for Null values, removed all NaN values. 
- Documented functions.

