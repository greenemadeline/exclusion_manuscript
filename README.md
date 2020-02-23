# Midterm Project for BIOL01301

> Due as a **Pull Request** to `sjspielman/datascience_midterm` by **Sunday March 15th at 11:59 pm** for full credit. Submit by **Wednesday March 18th at 11:59 pm** for a 10% deduction.


The primary goal for this project is to (attempt to) tidy data and reproduce analyses from this manuscript: [Overfishing and the ecological impacts of extirpating large parrotfish from Caribbean coral reefs](https://doi.org/10.1002/ecm.1403). This paper underwent peer review and was accepted for publication in December 2019, but it is still in the "proofing" stages meaning the PDF is not yet formatted to the journal specification. A PDF of the (unformatted) paper is available [here](./manuscript/exclusion.pdf) and the supplementary information is available [here](./manuscript/exclusion_SI.pdf). In fact, this article has been reported on in science media:

1. [Science Daily article](https://www.sciencedaily.com/releases/2020/01/200109160836.htm)
2. [phys.org article](https://phys.org/news/2020-01-large-herbivores-sea-coral-reefs.html)

In this paper, the authors sought to assess the effects of predator (here, parrotfishes) size and coral reef health, measured as algae abundance and coral growth, in coral reefs in the Florida Keys. There are two primary parts to this study:

+ An analysis of existing fish survey data from [AGRRA](https://www.agrra.org/) ("Atlantic and Gulf Rapid Assessment"). While this data is publicly available, the authors did not specifically provided their downloaded data with their manuscript. *This is unfortunate*.
+ An experiment and associated analysis to test the effect of predator (parrotfish) size on algal and coral communities. The authors DID provide this data in an associated DataDryad repository [here](https://datadryad.org/stash/dataset/doi:10.5061/dryad.70rxwdbsz).


## For your project, you will be re-analyzing their experimental data. This is just about as real-world as it gets!

### Overall instructions and goals

1. To effectively begin, let alone do, this project, you need to first **read and understand the paper, specifically the experimental setup, the measurements, and how measurements relate to the recorded data.**
	+ The data is presented as a single Excel spreadsheet in six sheets: One page of "metadata" explaining the contents of each data sheet, and five sheets of data.
2. Do all of your work in a github repository which you will obtain by **forking** [`https://www.github.com/sjspielman/datascience_midterm`](https://github.com/sjspielman/datascience_midterm). Inside your repository, create a directory called "lastname-firstname" (e.g. mine would be `spielman-stephanie`). **All your work MUST BE IN THIS DIRECTORY.**
	+ You'll note the directory `manuscript/` which contains the paper and the SI (mostly you might want to look at Figure S1 which, in horribly bad resolution, depicts the experimental setup).
	+ You'll also note the directory `raw_data/` which contains the spreadsheet. **Do not ever modify or move this file.** 
3. You will perform the following tasks, split into three different files to save in your `lastname-firstname` directory:
	+ **Clean** the data for use in an R script. You should end up saving TWO tidy tibbles:
		+ All sheets _except plotBites_ should be merged into a single dataset. Save this to a csv called "treatment_results.csv".
		+ plotBites itself should be cleaned and saved as its own dataset "plot_bites.csv".
	+ **Visualize** (and wrangle when needed) the data in an Rmarkdown file. This file will begin by reading in the data you created in your R script, but should NOT duplicate that code. The resulting figures should be embedded in the Rmarkdown but NOT saved as stand-alone files. See below for more information.
	+ **Visualize** the data yet again as a **Flipbook** in a special Rmarkdown file. See below for more information. The resulting figure will be part of the fancy document you'll learn about for this project.

		
## Specific task instructions

### Task One: Tidying the data
+ Perform this in an **R script** called `tidy_exclusion_data.R` which has been templated out for you. Be sure to move this script into your name directory before starting! 
	+ To read in your data, use the `tidyverse` package `readxl`. This will not be loaded with the "primary" tidyverse libraries, but it will be installed when you install tidyverse. Make sure to load this package and read about its function `readxl::read_excel`.
+ Generally speaking, R scripts are NOT interactive documents! Therefore, you don't have to "show" or "print" the data for the FINAL product. When working on building up the script though, you have to be going line-by-line to make sure it all works.
+ There are three (four for plotBites) treatments which are not given consistently in the raw data. For your final product, ensure the levels of this variable are "Control", "Partial", "Full", and for the extra one in plotBites "External". Make sure you understand what these are from the paper itself.
+ Make sure your data is TIDY with one column per variable. You should consider "month" and "year" to be separate variables for this project - "date" is not an acceptable column to retain. But, this is not the only case of untidiness in the data!
+ All years should be converted to their 4-digit form, i.e. "2014" not "14".
+ Make sure there are no duplicate rows in your tidied data - one way to absolutely confirm this is to use `dplyr::distinct()`
+ There WILL be NA's in the final output because some data is indeed missing! This is completely fine, but you must ensure that you are not accidentally (usually done by poor choices in joining) replacing known values with NAs.
+ **BONUS is possible here** by including at least TWO assertions in your script that check _properties of the data_. 

### Task Two: Visualizing the data
In the manuscript, the authors use primarily barplots with mean and standard error (GROAN) to display distributions of data. Your task is to remake **FOUR** figures from the paper from the options below. Choose choose one panel from each option, unless of course there is only one option. Your adventure!

+ Figure 3 either panel B or C
+ Figure 5 any of A-F
+ Figure 6 A
+ Figure 6 either panel B or C

The goal is NOT to simply regurgitate their figures, but rather to **reimagine their figures to be more informative and frankly with improved designs.** For all figures you recreate, you must show _actual distributions of the data_, for example with boxplots, violin plots, histograms, density plots, etc. **Summarized means and SE/SD are absolutely not allowed and will receive NO CREDIT.** Rules:

+ Perform all wrangling and plotting in a *well-organized* Rmarkdown file called `plot_exlusion_data.Rmd` which should knit to `plot_exclusion_data.html`. This file has been templated for you - keep it organized as templated! Again, be sure to move this script into your name directory before starting!
+ Each figure MUST:
	+ Use a colorblind-friendly palette. You can check this with `colorblindr` if you need to.
	+ Adhere to best plotting practices from "Fundamentals of Data Visualization." If you have not yet read this ENTIRE book, you will be in trouble. Read the book, it takes an hour to get through the whole thing.
	+ Reveal itself legibly and with an appropriate aspect ratio
+ Your RMarkdown document must use a **different baseline theme** from the default as well as a **syntax highlighting style** of your choosing
+ Each section should be titled with the name of the figure you are recreating, e.g. "Figure 3B" could be a section header.
+ For each plot you should write a few sentences (in regular color) about whether the updated figure "agrees" with the figure in the manuscript, or whether they communicate different messages about the results.
 
**You can also get a BONUS** here!! Make a fifth plot of YOUR CHOOSING that is entirely unique and is NOT a reimagined figure from the paper. To get credit for your bonus, you must explain:

+ What scientific question does the plot address?
+ What trends does the plot show? What can you conclude from this figure? 

### Task Three: Visualizing the data with a flipbook
You're going to make a flipbook! What's a flipbook?

+ Get familiar with flipbooks conceptually by watching this [rstudio::conf 2020 talk](https://resources.rstudio.com/rstudio-conf-2020/flipbooks-evangeline-reynolds).
+ It comes in the package `flipbookr`[https://github.com/EvaMaeRey/flipbookr/]()! Learn more about this package.
	+ This [tweet](https://twitter.com/evamaerey/status/1222303004541341696?s=12) is nice, BUT I don't recommend `devtools`. Read next bullet...
	+ Because this package is not yet on CRAN, you will need to install it from the github repository using the `remotes` package. Many times this is written instead as the `devtools` package, but the maintainers of `devtools` are no longer retaining this specific functionality in future releases, so it is best to use `remotes`.
	
	```{r}
	### Run this in the console for install flipbookr. 
	### remotes is ONLY needed for this installation! NOT NEEDED IN R SCRIPTS!
	install.packages("remotes")
	library(remotes)
	install_github("EvaMaeRey/flipbookr/")
	```
+ You will have to create this file yourself (which, if you watch the video, install `flipbookr`, and read it's vignette, will be trivial), save it in your name directory, and call it `exclusion_flipbook.Rmd`.	


What will your flipbook be of? The authors make this claim: 

> "Additionally, we used linear mixed-effects models that included date as a random effect to test for differences in the bite rates and biomass corrected bite rates of parrotfishes and surgeonfishes in the Control and External plots. Because we detected no significant differences in any of these tests (see Supplemental Results in Appendix S1) we only include the Control, Partial, and Full exclosures in all the remaining analyses." 

**In other words** the authors determined that there was no significant difference in both bite rates and biomass-corrected bite rates of fishes *comparing between Control and External plots*. Let's check out this claim by plotting it:

+ Choose EITHER bite rates OR biomass-corrected bite rates.
+ Display the distribution of that SINGLE variable for each of Control and External ONLY (not Full and Partial), considering both types of fishes, over time. Each sampled time should be on the x-axis in an understandable format
+ With any luck, your plot will agree with their conclusions - Control and External bites are about the same, on average.
+ Seriously, just choose one variable. Both will LOSE YOU POINTS!
+ Any wrangling for this plot should take place in a code chunk in the flipbook which has `include=FALSE` as an option so it does not appear in the final rendered flipbook.
+ Your flipbook should be formatted with at least TWO OPTIONS that differ from the "minimal" default, such as.. background color? font? text styling? code styling? etc. Note: This is not referring to figure themes or colors, but DOCUMENT themes and colors.





### How will you be graded?

+ **DO YOU HAVE ENOUGH COMMITS?**
	+ For full credit there should be at least FIVE commits with INFORMATIVE ASSOCIATED MESSAGES. For example, only the first 2 commit messages in this XKCD are informative: [this](https://xkcd.com/1296/).
+ Did you submit as a pull request by the deadline? If you do NOT submit by a pull request but instead by email, you will automatically lose 50%. It's gotta be a PR timestamped by the deadline! 
	+ I may not merge your PR before the deadline, but this will not affect your grade. As long as you send the PR on time you are fine! Like the post office.
+ Do all R files run/knit without errors **when run from the directory where they reside**?
	+ Is your knitted Rmarkdown document PROFESSIONAL? Think: Would I be comfortable sharing this document with a potential **future employer**?
+ Did you COMMENT your code?
+ Did you actually do the questions/tasks you were asked to do? For example,
	+ Is part 1 actually tidy and saved appropriately? You didn't merge in plotBites with the rest, right?
	+ Did you do the right plots for part 2? Do your explanations match what the instructions tell you to do?
	+ Is part 3 actually a flipbook with the right plot in it?
+ Are all documents filled out appropriately for the template? Are all documents in the right directory and named appropriately?
+ Have you ONLY LOADED libraries that are relevant for the GIVEN file? E.g., libraries used only in the R script should not be loaded into the RMarkdown document(s).
+ Have you removed extraneous code?
+ You will lose major points if you ever print out the _whole_ data frame in your document. It's too big. Don't do it.
+ You will lose points for any lines of code that INSTALL libraries in your files. Installations must happen separately. When grading on my end, I will ensure all installations.
+ All plots must be made with `ggplot()`. There are no exceptions.
+ Do all Rmarkdown chunks appropriately kept with `echo=TRUE, include=TRUE`? Never turn these off!! (Except for the ONE `include=FALSE` chunk as part of your flipbook, but that's a separate concept).
+ Finally, as usual, do not cheat. Do. Not. Cheat. **This is not a group project**. You MUST write YOUR OWN CODE for aspects. However, also as usual, you SHOULD be talking with classmates about how to solve the questions and get insight into how to execute your plan. Google is fine! Copy/pasting from StackOverflow or similar is bad, but using an internet person's code as a guiding concept to help you write your code is fine!



