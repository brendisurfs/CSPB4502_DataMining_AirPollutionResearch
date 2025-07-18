#import "@preview/clean-acmart:0.0.1": acmart, acmart-ccs, acmart-keywords, acmart-ref, to-string

#let cuhk = super(sym.suit.spade)

#let title = [
 Air Pollution in South Korea: Relating Particle Readings to Time of Year
]

#let authors = (
  (
    name: [Brendan Prednis],
    email: [brendan.prednis\@pm.me],
    institute: [University of Colorado, Boulder],
    department: [],
  ),
)

#let conference = (
  name:  [Data Mining 4502],
  short: [Data Mining 4502],
  year:  [2025],
  date:  [July 7],
  venue: [San Diego, CA],
)
#let doi = ""
#let ccs = (
  (
    generic: [Software and its engineering],
    specific: ([Virtual machines], [Virtual memory], ),
  ),
  (
    generic: [Computer systems organization],
    specific: ([Heterogeneous (hybrid) systems], ),
  ),
)
#let keywords = ("Air Pollution", "Data Science", "Data Mining" )

#show: acmart.with(
  title: title,
  authors: authors,
  conference: conference,
  copyright: none,
)


// Variables for commonly referenced particles.
// O3
#let ozone = "O" + sub[3]

// Fine Particulate Matter
#let pm25 = "PM" + sub[2.5]
#let pm10 = "PM" + sub[10]

// Nitric Oxide and Nitrogen Dioxide.
// Two major pollutants. Usually written together as NOX
#let nox = "NO" + sub[x]

// Nitrogen Dioxide
#let nitrogen_dioxide = "NO" + sub[2]

//
#let carbon_monoxide = "CO" 

// 
#let sulfer_dioxide = "SO" + sub[2]

= Abstract

== Problem Statement & Motivation
Air pollution is a problem that affects the entire world, whether we are aware of it or not.
South Korea is one such country that has had a history of air pollution problems, and has struggled keeping it in check. 
By studying major pollution particles in the air in South Korea, we can determine when various particles in the air increase during different times of the year,
in order to reflect on events and determine actions to control those harmful particles.
This allows governments to make a clear plan, and inform the public of health impacts. 

// #acmart-ccs(ccs)
#acmart-keywords(keywords)

= Introduction

South Korea deals with various problems relating to air pollution, which has made an impact on the lives of the people living there.
I want to study the relation between various particulate matter in the air during various times of the year and the safety of the air.
My motivation for studying the pollution is partially inspired by my awareness of air pollution and it's widespread and long lasting impact on everything in the world. 
My girlfriend at the time of writing this paper is in South Korea, giving me the basis of inspiration.


== Paper overview
In this paper I will explore air pollution in South Korea, how it changes throughout the year, and potential various prediction methods to predict impact as the year moves.
By utilizing various data mining techniques and methods, we will infer whether different kind of pollution can be predicted and offset during different times of the year. 

@isairpolequalsk

= Methods <sec:methods>
#set math.equation(numbering: "1.")

== Literature Survey
Various studies have been done on air pollution trends in South Korea. Some research the chemical and particle density in the air during different seasons, while some look at the economic and political states that impact air quality control. 
One study, done by Harvard University, Yonsei University, University of Maryland, and NASA's Climate and Radiation Laboratory, looks at the trends of air quality throughout the year. 
It investigates how air quality and air pollution change unevenly across the country, with various times of the year bringing in different pollutants. 
South Korea's GDP has grown extensively over the last 30 years, resulting in high emissions of #carbon_monoxide and #sulfer_dioxide. 
The study states that roughly 30,000 premature deaths per year are attributed to air polution in South Korea @airqualitytrends20152025.
Fine Particulate Matter (#pm25) is one of the main items studied within air quality and air pollution research. 
The joint research article shows that #pm25 has been decreasing, but Nitrogen Dioxide and Nitric Oxide (#nox) density has not. 
In regards to #ozone, it is highest during the summer, but due to summer monsoons, clean marine air is brought to the land, resulting in lower #ozone levels in July through August, compared to May through June @airqualitytrends20152025.
The article concludes that #carbon_monoxide and #sulfer_dioxide levels have stayed below air quality standards since the late 1990s, while #nox is now below the air quality standard at almost all AirKorea study sites @airqualitytrends20152025.

Another article discusses a study led by POSTECH Professor Hyung Joo Lee, stating that #nitrogen_dioxide 
exposure levels are consistently higher in areas associated with higher socioeconomic status @isairpolequalsk.
The article asserts that #nitrogen_dioxide is a key air pollutant emitted from combustion sources, such as vehicles and power plants, 
and is regulated by South Korea's Clean Air Conservation Act, stemming from #nitrogen_dioxide's adverse impact on respiratory health.
The team at POSTECH used special satellite data for sensing #nitrogen_dioxide, which allowed them to produce a high resolution map of #nitrogen_dioxide exposure.
With the goal to assess whether the nations current ground monitoring network accurately recorded the population's exposure to #nitrogen_dioxide, 
their study revealed that national ground monitors underestimated #nitrogen_dioxide exposure by up to 11% in Gangwon-do,
and overestimated exposure by as much as 61% in Jeju-do@isairpolequalsk.
The study concluded that ground monitoring did not imporve accuracy just by adding more monitors, and that improving accuracy requires more monitoring methods and efforts to be put in place. 

In relation to the political and economic side, an article in 2014 by Jongsik Ha of the Korea Environment Institute stated that 
South Korea's air quality standards were insufficient in terms of establishing procedure for managing air pollution effectively.
In order to bring ideas to the table, the NAAQS of the US was examined in order to suggest ways, which consider health effects, to establish air quality standards in South Korea. 
The author concludes the study stating that "Realistically speaking, it is impossible to establish standards that protect an entire population from air pollution. Instead, it is necessary to find a balance between what should be done and what can be done." @aq_policy_sk.
The study further says that few are aware of the dangers of environmental risk factors, despite the fact that exposure to them contributes considerably to disease prevalence and mortality rates in local communities @aq_policy_sk.

The last major article researched looked at using Machine Learning to study and predict the health impact of #pm25. 
Since there are limited sources for #pm25 exposure and health data, research on #pm25 at a national level was limited@pm25_ml_nih. 
By using randomized sampling from a large scale data pool of participants 50 years of age or older from the National Health Insurance Service-National Sample Cohort (NHIS-NSC)@pm25_ml_nih, 
the researchers built a prediction model to identify patterns relating #pm25 to all-cause mortality and cause-specific mortality. 
The result of the study suggests a 1μg/m3 increase in #pm25 was associated with all-cause mortality hazard ratio (HR) 1.002 [95% confidence interval (CI): 0.998-1.007]@pm25_ml_nih.


= Proposed Work

== Data Collection
The data collection for this research project was straight forward, as it was just downloaded from Kaggle. 
In order to clean the data, I concluded that using a mean fill would be appropriate for filling in NaN or empty numeric values.
The data will be integrated in Polars, an alternative DataFrame library for Python that is fast and type-safe, providing the researcher (me) some semblance of sanity while working with Python.
The data does need to be transformed into a more appropriate structure, as each row corresponds to a single particle, rather than utilizing each particle as a feature. 
This ends up making the dataset 9x taller than it needs to be. 

== Workflow
The workflow for processing the data is not complex, but multi-step and involved. 
It starts with reading through the dataset, cleaning any data that may cause errors in our model. 
Next, we analyze the dataset for any interesting patterns. 
We will look at finding any single-level associations between features, starting with each major particle/compound. 
After looking at single-level associations, we will look at deeper multi-level associations.
This kind of data lends itself to cluster analysis, grouping similar data points together to further understand the relations between particles and health impacts.


== Dataset
The dataset is a structured document collected from various public data from the Seoul Metropolitan Government, put onto Kaggle. 
The dataset in total has 647,512 rows, making it a slightly smaller dataset for this project.
However, I believe the density and consistency of data provided is sufficient. 

The dataset provides useful attributes to improve our study. 
#figure(
  caption: [The relevant attributes of the dataset],
  placement: top,
  table(
    columns: (6em, auto),
    align: (left, right),
    inset: (x: 8pt, y: 4pt),
    stroke: (x, y) => if y <= 1 { (top: 0.5pt) },
    fill: (x, y) => if y > 0 and calc.rem(y, 2) == 0  { rgb("#efefef") },

    table.header[Name][Description],
    [Measurement Date], [
      - The date the measurement was taken, in hour segments.
    ],
    [Station Code], [
      - The code designation given to the sensor station. 
    ],
    [Address], [
      - The South Korean address of the sensor station.
    ],
    [Latitude], [
      - The latitude of the sensors location.
    ],
    [Longitude], [
      - The longitude of the sensors location.
    ],
    [#ozone], [
      - Ozone concentration in the sensor reading. 
      - Measured in *ppm*.
    ],
    [#carbon_monoxide], [
      - Carbon Monoxide concentration in the sensor reading. 
      - Measured in *ppm*.
    ],
    [#sulfer_dioxide], [
      - Sulfur Dioxide concentration in the sensor reading. 
      - Measured in *ppm*.
    ],
    [#nitrogen_dioxide], [
      - Nitrogen Dioxide concentration in the sensor reading. 
      - Measured in *ppm*.
    ],
    [#pm10], [
      - particulate matter that consists of tiny particles or droplets in the air with a diameter of 10 micrometers or smaller. 
      - This can be dust, smoke, and various emissions from vehicles and industrial machines.
      - Measured in *Mircrogram/m3*
    ],
    [#pm25], [
      - Fine particulate matter that is 2.5 micrometers or smaller in diameter. 
      - Major cause for respritory and cardiovascular health issues. 
      - Significant portion of air pollution.
      - Measured in *Mircrogram/m3*
    ]
  )
) <tab:attributes>


== Preprocessing

In @tab:attributes, we can see all the attributes collected in the dataset. 
While each attribute is important, 
the main focus will be on the measurement date, latitude, longitutde, and the particles/compounds that have been recorded. 
We don't require the sensor address for now, and will be filtering out any sensors that have abnormal codes.
We will also be using mean averaging for filling in missing or NaN numeric values, and filtering out full rows with NaN values that aren't numeric. 
This ensures no data is empty, causing a skew in results or errors while iterating through the code. 

== Evaluation Methods
Evaluating the data for this project will use a standard supervised learning / classification model to determine which times of the year produce certain combinations of air pollution particles. 
This reduces the the need for external datasets, such as economic information or political changes. While these datasets could be useful, to reduce the scope of the project, we will isolate to pure sensor readings for now.


== Tools and Technologies
The tools used in this project are mostly tried-and-true tools used in the Data Science community. 

The language of choice for extracting, transforming, and loading the data is Python, due to its extensive libraries and ease of use. 
The trade off with Python is that it is dynamically typed, which slows the iteration process as the project grows. 

Handling DataFrame processing, I decided to use the Polars library. An alternative to Pandas, it is arguably faster than Pandas in certain areas, is type safe, and has a unique way of forming transformation expressions. 
I have used it in the past, and feel more comfortable with it and it's clear, detailed documentation.

For displaying data, I have chosen Matplotlib. Matplotlib is a classic library, and it made no sense to try and find another.

For writing reports and this project proposal, I am using Typst in place of LaTeX, for easier iteration and faster compile times. 

#bibliography("literature.yml", title: "References", style: "institute-of-electrical-and-electronics-engineers")

#colbreak(weak: true)
#set heading(numbering: "A.a.a")

