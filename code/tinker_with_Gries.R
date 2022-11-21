dist.collexemes<-function(precbitsexponent=precbitsexponent) { # FUNCTION FOR DISTINCTIVE COLLEXEME ANALYSIS
  options(warn=-1)
  # introduction and first input
  cat("\nD i s t i n c t i v e   c o l l o c a t e / c o l l e x e m e   a n a l y s i s   . . .\n\nThis kind of analysis compares 2+ words or constructions with respect to n words they co-occur with differently frequently.\nYou must first enter whether you have two distinctive categories (e.g., when you look at English ditransitive\nvs. prep. dative) or more (e.g., when you compare English active vs. be-passive vs. get-passive)?\n")
  dists <- menu(title="How many distinctive categories do you have?",
                choices=c(" 2 alternatives", " 3+ alternatives"))
  
  if (dists==1) {
    # introduction
    cat("\nColl.analysis accepts two kinds of input for such an analysis of distinctive collexemes:\nOn the one hand, you can use as input a file with a table of all tokens. That is, the first column\ncontains for each co-occurrence item the code for one of the two words/constructions W1/C1 and\nW2/C2 you want to investigate; the second column contains the word co-occurring with W1/C1 and W2/C2\nas listed in the first column.\n\nW/C\tColl_Word\nA\tX\nB\tY\n...\t...\n\nOn the other hand, if you have already down more work, you can also use a text file\nwith the following kind of table (with informative column names!), where the columns 2 and 3\ncontain the co-occurrence frequencies of each word listed in column 1 with/in W/C1 and W/C2.\n\nColl_Word\tFreq_CollWord_&_W/C1\tFreq_CollWord_&_W/C2\nA\t\t...\t\t\t...\nB\t\t...\t\t\t...\n...\t\t...\t\t\t...\n\nWhichever input format you choose, your file must not have decimal points/separators and ideally has no spaces (for the latter, use '_' instead)!\nAlso, don't forget that R's treatment of alphanumeric characters is case-sensitive!\n\n")
    input.dc <- menu(title="Which input format do you want to use?",
                     choices=c("Raw list of all tokens", "Frequency table"))
    
    cat("\nDo want the results of (two-tailed!) Fisher-Yates exact tests ('yes' or 'no')?\n(I recommend not using this. The present script improves on the old one(s) by being able to avoid the (-)Inf problem of the old one, but (i) this means it requires the package Rmpfr for that, (ii) because that can take a very long time, this script uses multiple threads and, thus, recommends the package doParallel, (iii) even with parallelization and one other 'trick', this can STILL take a long time, (iv) the resulting -log10(pFYE) values can be 0.95 or more correlated with the fast-to-compute LLR/G^2-values or the superfast-to-compute Pearson residuals so why bother with the overkill?, and (v) as I wrote in multiple pubs by now, maybe keeping frequency and association more separate is a better approach (for all but the most exploratory studies!).\n")
    fye.mpfr <- scan(nmax=1, what=character(), quiet=TRUE)
    
    cat("\nLoad the tab-delimited input file:\n"); pause()
    input.matrix <- read.table(file.choose(), header=TRUE, sep="\t", quote="", comment.char="")
    
    if (input.dc==1) { # DCA
      interim <- t(table(input.matrix))
      input.matrix <- data.frame(
        as.vector(interim[,1]),
        as.vector(interim[,2]), row.names=rownames(interim))
      colnames(input.matrix) <- colnames(interim)
    } else {
      temp <- colnames(input.matrix)[2:3]
      input.matrix <- data.frame(
        as.vector(input.matrix[,2]),
        as.vector(input.matrix[,3]), row.names=input.matrix[,1])
      colnames(input.matrix) <- temp
    }
    construction1.name <- colnames(input.matrix)[1]; construction2.name <- colnames(input.matrix)[2]
    
    # computation
    options(warn=-1)
    pearson.residuals <- chisq.test(input.matrix, correct=FALSE)$residuals[,1]
    
    all.2.by.2.matrices <- apply(
      input.matrix, 1,
      \(af) { matrix(c(af, colSums(input.matrix)-af), byrow=TRUE, ncol=2) },
      simplify=FALSE)
    
    if (fye.mpfr=="yes") {
      FYE.values <- lapply(all.2.by.2.matrices,
                           \(af) fisher.test.mpfr(af))
    }
    glms <- lapply(all.2.by.2.matrices,
                   \(af) glm(rbind(af[1,], af[2,]) ~ c(1:2), family=binomial))
    log.odds.ratios <- -sapply(glms, coefficients)[2,]
    log.likelihood.values <- sapply(glms, "[[", "null.deviance")
    mi.scores <- sapply(all.2.by.2.matrices,
                        \(af) log2(af[1,1] / chisq.test(af, correct=FALSE)$exp[1,1]))
    delta.p.constr.cues.word <- sapply(all.2.by.2.matrices,
                                       \(af) af[1,1]/sum(af[,1]) - af[1,2]/sum(af[,2]))
    delta.p.word.cues.constr <- sapply(all.2.by.2.matrices,
                                       \(af) af[1,1]/sum(af[1,]) - af[2,1]/sum(af[2,]))
    relations <- sapply(pearson.residuals,
                        \(af) switch(sign(af)+2, construction2.name, "chance", construction1.name))
    
    # output
    output.table <- data.frame(WORD=rownames(input.matrix), CONSTRUCTION1=input.matrix[,1], CONSTRUCTION2=input.matrix[,2], row.names=NULL)
    output.table <- data.frame(output.table, PREFERENCE=relations, LLR=log.likelihood.values, PEARSONRESID=pearson.residuals,
                               LOGODDSRATIO=log.odds.ratios, MI=mi.scores,
                               DELTAPC2W=delta.p.constr.cues.word, DELTAPW2C=delta.p.word.cues.constr, row.names=NULL)
    if (fye.mpfr=="yes") {
      output.table <- data.frame(output.table,
                                 # FYE=sapply(FYE.values, formatMpfr, digits=12))
                                 FYE=sapply(sapply(FYE.values, \(af) -log10(af)), asNumeric))
    }
    colnames(output.table)[2:3] <- c(construction1.name, construction2.name)
    output.table <- output.table[order(output.table$PREFERENCE, -output.table$LOGODDSRATIO),]
    write.table(output.table, file=save.date <- gsub(":", "-", paste0(Sys.time(), ".csv")), sep="\t", row.names=FALSE, col.names=TRUE, quote=FALSE)
    cat("\n\nThe results are in the file called ", save.date, ".\n")
    
    plot(log2(output.table[,2]+output.table[,3]), output.table$LOGODDSRATIO, type="n",
         xlab="Logged co-occurrence frequency", ylab="Association (log odds ratio)")
    grid(); abline(h=0, lty=2); abline(v=0, lty=2)
    text(log2(output.table[,2]+output.table[,3]), output.table$LOGODDSRATIO, output.table$WORD, font=3)