#Este script consiste en hacer un ensamblaje de los transcriptomas 
#Los datos a usar son de la glándula de veneno de Bothrops asper y Bothrops jararaca

#Ingresar a la base de datos del NCBI y escribir: SRR12800503 y SRR12915695
#SRR12915695 corresponde a B. asper
#SRR12800503 corresponde a B. jararaca

install.packages("rentrez", dependencies=TRUE, type="binary")
if (!requireNamespace("rentrez", quietly = TRUE)) {
  install.packages("rentrez")
}
library(rentrez)


getncbiseq = function(accession)
{
  require("seqinr") # this function requires the SeqinR R package
  # first find which ACNUC database the accession is stored in:
  dbs = c("genbank","SRA")
  numdbs <- length(dbs)
  for (i in 1:numdbs)
  {
    db <- dbs[i]
    choosebank(db)
    # check if the sequence is in ACNUC database 'db':
    resquery <- try(query(".tmpquery", paste("AC=", accession)), silent = TRUE)
    if (!(inherits(resquery, "try-error")))
    {
      queryname <- "query2"
      thequery <- paste("AC=",accession,sep="")
      query(`queryname`,`thequery`)
      # see if a sequence was retrieved:
      seq <- getSequence(query2$req[[1]])
      closebank()
      return(seq)
    }
    closebank()
  }
  print(paste("ERROR: accession",accession,"was not found"))
}

bothrops_seq = getncbiseq("SRR12800503")

#Elegir el formato de los datos
	#Formato fastq.

#Se descargan en archivos comprimidos .gz

#Descomprimir los archivos

#Ver el estado de calidad de las secuencias con fastqc

#De existir fallos en adaptadores
	#Eliminar los adaptadores

#
