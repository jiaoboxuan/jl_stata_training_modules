clear
version
cap log close
use third_grade.dta, clear

* Preserve just in case
preserve

* Generate variables
generate math_religious = math if religious == 1
generate math_secular = math if religious == 0
generate verb_religious = verb if religious == 1
generate verb_secular = verb if religious == 0

* Build histograms
histogram math_religious
histogram verb_religious
histogram math_secular
histogram verb_secular

* Label variables
label variable math_religious "Math score for students in religious schools"
label variable verb_religious "Verbal score for students in religious schools"
label variable math_secular "Math score for students in secular schools"
label variable verb_secular "Verbal score for students in secular schools"

* Export to LaTeX
esttab using "./tex/summary.tex", replace cells("mean(fmt(%6.2fc)) sd(fmt(%6.2fc)) min max count") nonumber nomtitle nonote noobs label booktabs collabels("Mean" "SD" "Min" "Max" "N") title("Table: Summary of statistics")

* Exporting graphs
graph export "C:\Users\bjiao\OneDrive - The University of Chicago\Desktop\College\Research\Datasets\img\hist_math_religious.eps", as(eps) name("Graph") preview(off)

graph export "C:\Users\bjiao\OneDrive - The University of Chicago\Desktop\College\Research\Datasets\img\hist_verb_religious.eps", as(eps) name("Graph") preview(off)

graph export "C:\Users\bjiao\OneDrive - The University of Chicago\Desktop\College\Research\Datasets\img\hist_math_secular.eps", as(eps) name("Graph") preview(off)

graph export "C:\Users\bjiao\OneDrive - The University of Chicago\Desktop\College\Research\Datasets\img\hist_verb_secular.eps", as(eps) name("Graph") preview(off)