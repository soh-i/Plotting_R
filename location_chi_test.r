# 各状態の結果をEditing siteとしてまとめ、コントロールサイトとChi-squared testする。
chi <- read.table("./result_data/Location_AGsite.txt", header=TRUE)

# merging 
EditExon<-chi[-5,2,]
EditIntron<-chi[-5,3,]
EditUTR<-chi[-5,4,]
ControlSite <- as.numeric(chi[5,-1.4,])

EditingSite <- matrix( c(sum(EditExon), sum(EditIntron), sum(EditUTR)), ncol=3)
mat <- rbind(EditingSite, ControlSite)
result <- chisq.test(mat)
print(result$p.value)

