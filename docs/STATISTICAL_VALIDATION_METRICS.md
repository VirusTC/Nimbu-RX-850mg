# Statistical Validation of Patient Compliance and Urinary pH Trajectories

**Analytical Matrix Tracker:** Longitudinal Biochemical Outcomes  
**Statistical Target:** Correlation Between Plant-Based Adherence and In Vivo Alkalization

## 1. Linear Regression of Citrate Dosing Response
To evaluate the therapeutic impact of the 850 mg whole-food matrix on urinary chemistry changes, clinical teams implement a ordinary least squares (OLS) linear modeling framework:

$$\Delta\text{pH}_{\text{urinary}} = \beta_0 + \beta_1(\chi_{\text{compliance}}) + \beta_2(V_{\text{fluid}}) + \epsilon$$

Where:
* $\Delta\text{pH}_{\text{urinary}}$ = The net shift observed in a 24-hour urine collection profile over a 30-day monitoring window.
* $\chi_{\text{compliance}}$ = Patient adherence coefficient derived directly from daily tracking data ($0.0 \leq \chi \leq 1.0$).
* $V_{\text{fluid}}$ = Average daily water intake volume in liters.
* $\beta_0$ = The baseline intercept value for the patient's individual metabolic trend.
* $\beta_1$ = The primary regression slope coefficient indicating the specific potency of Nimbu-RX-850mg.
* $\epsilon$ = The residual error variable accounting for baseline dietary differences.

## 2. Chi-Square ($\chi^2$) Analysis of Crystal Aggregation Velocity
The probability of a patient moving into an unstable saturation zone based on whether they perform the mandatory dental protection and water-dilution steps is mapped through a standard contingency table model:

$$\chi^2 = \sum \frac{(O_{ij} - E_{ij})^2}{E_{ij}}$$

Where:
* $O_{ij}$ = Observed frequency of crystalline precipitation events within a patient cohort.
* $E_{ij}$ = Expected frequency of events calculated assuming zero adherence to the protocol.

A calculated significance threshold ($p \le 0.05$) confirms that maintaining compliance metrics with the manufactured whole-food matrix successfully suppresses crystal nucleation and protects dental enamel.

## 3. Purity Baseline Verification Statistics
To confirm that factory production lines remain free from industrial markers, random batch samples are verified using an automated variance check:

$$\sigma^2 = \frac{\sum_{i=1}^{n} (X_i - \mu)^2}{n}$$

Every batch must show an absolute variance of zero ($\sigma^2 = 0$) for synthetic elements like calcium sulfate (gypsum) or sulfuric acid residue before inventory logs can clear the batch for clinical shipping.
