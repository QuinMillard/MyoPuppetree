#include <stdio.h>
#include <stdlib.h>

void parseQuotes (FILE *readFrom, FILE *writeTo){

    //Boolean value that tracks whether the pointer is within a quote
    int inQuote = 0;
    
    char temp = 0;
    
    //Iterates through, to the end of the read file
    while ((temp = fgetc(readFrom)) != EOF){
        
        //Checks if at the end of a quote
        if ((temp == '"') && inQuote){
            inQuote = 0;
            temp = '\n';
            fputc(temp,writeTo);
        }
        
        //Checks if at beginning of a quote
        else if (temp == '"'){
            inQuote = 1;
        }
        
        //Copies if in quote
        else if (inQuote){
            fputc(temp,writeTo);
        }
    }
    
    fputc(EOF,writeTo);
}

int main(){
    FILE *readFile = fopen("quotes.rtf","r");
    FILE *newFile = fopen("parsedquotes.txt","w");
    parseQuotes(readFile, newFile);
    fclose(readFile);
    fclose(newFile);
}