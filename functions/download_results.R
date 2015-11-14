if(!require(rplos)){install.packages('rplos')}
library(rplos)

hits <- searchplos(q = '*:*',
                   c('publication_date', 'id'),
                   fq = 'doc_type:full',
                   start = 0,
                   limit = 1)$meta$numFound

resultstext <- searchplos('*:*',
           c('id', 'publication_date', 'results_and_discussion'),
           fq = 'doc_type:full',
           start = 0,
           limit = 3) # need to replace this with hits

save(resultstext, file = sprintf('data/%s_resultstext', format(Sys.time(), "%Y%m%d")))
