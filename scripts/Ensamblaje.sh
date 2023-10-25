#Este script consiste en hacer un ensamblaje de los transcriptomas 
#Los datos a usar son de la glándula de veneno de Bothrops asper y Bothrops jararaca

#Los datos a usar son: SRR12800503 y SRR12915695
#Desde SRA explorer se obtienen los links con los que se descarga los archivos

#SRR12915695 corresponde a B. asper
echo "Datos pareados de B. asper"

echo "Secuencia forward"
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR129/095/SRR12915695/SRR12915695_1.fastq.gz -o SRR12915695_1.fastq.gz

echo "Secuencia reverse"
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR129/095/SRR12915695/SRR12915695_2.fastq.gz -o SRR12915695_2.fastq.gz

#SRR12800503 corresponde a B. jararaca
#!/usr/bin/env bash
echo "Datos pareados de B. jararaca"

echo "Secuencia forward"
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR128/003/SRR12800503/SRR12800503_1.fastq.gz -o SRR12800503_1.fastq.gz

echo "secuencia reverse"
curl -L ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR128/003/SRR12800503/SRR12800503_2.fastq.gz -o SRR12800503_2.fastq.gz

#Se descargan en archivos comprimidos .gz

echo "Descomprimir archivo de B. asper"
gzip -d SRR12915695_1.fastq.gz
gzip -d SRR12915695_2.fastq.gz

echo "Descomprimir archivo de B. jararaca"
gzip -d SRR12800503_1.fastq.gz
gzip -d SRR12800503_2.fastq.gz


#Ver el estado de calidad de las secuencias con fastqc
echo "EStado de calidad de las secuencias de B. asper"
fastqc SRR12915695_1.fastq
fastqc SRR12915695_2.fastq

echo "Estado de calidad de las secuencias de B. jararaca"
fastqc SRR12800503_1.fastq
fastqc SRR12800503.2_fastq


