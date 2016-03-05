//
//  quoteparsing.cpp
//  
//
//  Created by Talia McCormick on 2016-03-04.
//
//   openGL (C graphics)

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

/*
//Increases an array of char from oldSize to newSize
char *growArray(char *pastArray, int oldSize, int newSize){
    //Allocates space for new array
    char *newArray = malloc(newSize * sizeof(char));
    
    //Copies old array into new array & frees old array
    for (int i = 0; i < oldSize; i++){
        newArray[i] = *pastArray;
        free(pastArray);
        pastArray++;
    }
    
    //Returns new (larger) array
    return newArray;
}*/

void parseQuotes (FILE *readFrom, FILE *writeTo){

    //Boolean value that tracks whether the pointer is within a quote
    int inQuote = 0;
    
    char temp = 0;
    
    //Iterates through, to the end of the read file
    while ((temp = fgetc(readFrom)) != EOF){
        if ((temp == '"') && inQuote){
            inQuote = 0;
            temp = '\n';
            fputc(temp,writeTo);
        }
        else if (temp == '"'){
            inQuote = 1;
        }
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