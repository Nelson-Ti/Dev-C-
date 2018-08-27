#include <iostream>
using namespace std;
int main (void){
	
	int soma=0, mult=0, valor=0;
	do{
	//	system("cls");
		cout<<"Digite um valor diferente de 0:" <<endl;
		cout<<"Digite 0 pra parar"<<endl;
		scanf("%i", &valor);
		if(valor%2==0){
			soma+=valor;
	}else{

			
			mult=valor*valor;
}


    }while(valor!=0);
	cout<<"A soma dos numeros pares sao:" <<soma <<endl;
	cout<<"A multiplicao dos numeros impares sao:" <<mult <<endl;


system("PAUSE");
return 0;

}
