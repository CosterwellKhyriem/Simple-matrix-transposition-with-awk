#written by Costerwell Khyriem 
#pass a file command Line 
#if there's a specific delimiter that you have to deal with please use the -F option below
#For eg:
#	awk -F";" for colon
#Also if you would want to print the transposed matrix with a specific delimiting character please replace the "\t" in the line indecated below
awk '
{ 
    for (i=1; i<=NF; i++)  {
        array[NR,i] = $i
    }
}
NF>t { t = NF }
END {    
    for(a=1; a<=t; a++) {
        trans=array[1,a]
        for(i=2; i<=NR; i++){
	    #replace "\t" hear with the delimiter of your choosing
            trans=trans"\t"array[i,a];  
        }
        print trans
    }
}' $1 

