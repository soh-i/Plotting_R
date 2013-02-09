pos <- rbind(
  c(11,4),
  c(1,15)
  #c(1,11),
  #c(5,40)
  )

tx <- as.table(
  matrix(
    pos,
    nr=2,
    dimnames=list(
      #B=c("Active","Tun", "Rec_80m", "Rec_3h"),
      B=c("Genome","Transcript"),
      A=c("Match", "Mismatch")
      )
    )
  )



for ( i in tx ) 
  print (i)



chi <- chisq.test(tx)
fisher <- fisher.test(tx)

cat("chi", chi$p.value)
cat("  fisher", fisher$p.value)

