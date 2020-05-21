#include <stdio.h>

extern void vigenere_encrypt(char* input, char* key, char* output);


int main() {
	char* input = 	"menekuljetek";
	char* key = 	"EZAKULCSSZOE";
	char output[100];
	
	vigenere_encrypt(input, key, output);

	printf("%s -> %s\n", input, output);
	
	return 0;
}
