# Midterm Project for BIOL01301 (my data science class)

The primary goal for this project is to (attempt to) tidy data and reproduce analyses from this manuscript: [Overfishing and the ecological impacts of extirpating large parrotfish from Caribbean coral reefs](https://doi.org/10.1002/ecm.1403). This paper underwent peer review and was accepted for publication in December 2019, but it is still in the "proofing" stages meaning the PDF is not yet formatted to the journal specification. A PDF of the (unformatted) paper is available [here](./manuscript/exclusion.pdf) and the supplementary information is available [here](./manuscript/exclusion_SI.pdf). In fact, this article has been reported on in science media:

1. [Science Daily article](https://www.sciencedaily.com/releases/2020/01/200109160836.htm)
2. [phys.org article](https://phys.org/news/2020-01-large-herbivores-sea-coral-reefs.html)

In this paper, the authors sought to assess the effects of predator (here, parrotfishes) size and coral reef health, measured as algae abundance and coral growth, in coral reefs in the Florida Keys. There are two primary parts to this study:

+ An analysis of existing fish survey data from [AGRRA](https://www.agrra.org/) ("Atlantic and Gulf Rapid Assessment"). While this data is publicly available, the authors did not specifically provided their downloaded data with their manuscript. *This is unfortunate*.
+ An experiment and associated analysis to test the effect of predator (parrotfish) size on algal and coral communities. The authors DID provide this data in an associated DataDryad repository [here](https://datadryad.org/stash/dataset/doi:10.5061/dryad.70rxwdbsz).


## For this project, Iou will be re-analyzing their experimental data. 

### Overall goals

1. To effectively begin, let alone do, this project, you need to first **read and understand the paper, specifically the experimental setup, the measurements, and how measurements relate to the recorded data.**
	+ The data is presented as a single Excel spreadsheet in six sheets: One page of "metadata" explaining the contents of each data sheet, and five sheets of data.

		
## Specific task instructions

### Task One: Tidying the data

### Task Two: Visualizing the data
In the manuscript, the authors use primarily barplots with mean and standard error to display distributions of data. The task is to remake **FOUR** figures from the paper from the options below. 

The goal is NOT to simply regurgitate their figures, but rather to **reimagine their figures to be more informative and frankly with improved designs.** 

### Task Three: Visualizing the data with a flipbook

What will the flipbook be of? The authors make this claim: 

> "Additionally, we used linear mixed-effects models that included date as a random effect to test for differences in the bite rates and biomass corrected bite rates of parrotfishes and surgeonfishes in the Control and External plots. Because we detected no significant differences in any of these tests (see Supplemental Results in Appendix S1) we only include the Control, Partial, and Full exclosures in all the remaining analyses." 

**In other words** the authors determined that there was no significant difference in both bite rates and biomass-corrected bite rates of fishes *comparing between Control and External plots*. Let's check out this claim by plotting it and presenting in a flipbook.


