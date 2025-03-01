# The role of religion in an individual's happiness in Canada
**GitHub link**: https://github.com/Anton21a/DAT_AI.git

The dataset comes from WVS (**2020**). It presents a subset for one country - **Canada**. 
Research Question:
"How does the importance of religion influence individual happiness in Canada, and how do financial satisfaction, social trust, and demographic factors moderate this relationship?"
#### 1. Dataset Overview
* Total Observations: 4,018 respondents
* Total Variables: 12
Data Types: All variables are integer-coded categorical variables (no text or floating-point values).
#### 2. Variables Summary
* Unnamed: 0 → Appears to be an index column that isn't needed.
* year → All observations are from 2020, meaning there's no time variation.
* religion_importance (Q6) → Importance of religion in life (1 = Very important, 4 = Not at all important).
* happiness (Q46) → Self-reported happiness (1 = Very happy, 4 = Not at all happy).
* gender (Q260) → 1 = Male, 2 = Female.
* age (Q262) → Respondent's age (numeric).
* religion (Q289) → Religious denomination (country-specific coding).
* financial_satisfaction (Q50) → Satisfaction with financial situation (1 = Dissatisfied, 10 = Satisfied).
* living_standard (Q56) → Compared to parents (1 = Much higher, 5 = Much lower).
* trust_people (Q57) → General trust (1 = Most people can be trusted, 2 = Need to be careful).
* trust_family (Q58) → Trust in family (likely ordinal).
* trust_foreigners (Q63) → Trust in people of another nationality (ordinal).

For our analysis of happiness (Q46), the five most valuable predictors are: financial satisfaction (Q50), religion importance (Q6), trust in people (Q57), living standard compared to parents (Q56), and age (Q262). Financial satisfaction is the strongest predictor, as economic well-being directly influences happiness. Religion importance may enhance happiness by providing purpose and emotional support. Trust in people reflects social capital, which is linked to greater well-being. Living standard compared to parents captures perceived economic mobility, influencing life satisfaction. Lastly, age follows a U-shaped relationship with happiness, often decreasing in mid-life and increasing later. These factors together provide a comprehensive view of happiness determinants.

#### 3. Descriptive statistics
| Unnamed:               |   count |       mean |       std |   min |   25% |   50% |   75% |   max |
|:-----------------------|--------:|-----------:|----------:|------:|------:|------:|------:|------:|
| religion_importance    |    4018 |    2.87506 |  1.08229  |     1 |     2 |     3 |     4 |     4 |
| happiness (Y)          |    4018 |    1.94624 |  0.622055 |     1 |     2 |     2 |     2 |     4 |
| age                    |    4018 |   46.5647  | 16.8775   |    18 |    32 |    45 |    61 |    93 |
| financial_satisfaction |    4018 |    6.52364 |  2.21915  |     1 |     5 |     7 |     8 |    10 |
| living_standard        |    4018 |    1.77352 |  0.862158 |     1 |     1 |     1 |     3 |     3 |
| trust_people           |    4018 |    1.50498 |  0.500037 |     1 |     1 |     2 |     2 |     2 |


