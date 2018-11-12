#include <iostream>

#include <cstdlib>

using namespace std;




struct carro {

       int cod;

       char placa[10];

       char modelo[100];       

};




struct no {

    //int valor;

    carro c;

    struct no *prox;    

    struct no *ant;    

};




struct no *inicio;




void iniciaLista (){

    inicio = NULL;

}




bool testaListaVazia (){

     return (inicio == NULL);

}

//Primeira Função -- Inserção

int insereLista(carro novo){

    struct no *pt;

    pt = new struct no;

    pt -> c = novo;

    pt -> prox = NULL;

    pt -> ant = NULL;    

    if(testaListaVazia()){

       inicio = pt;

     }else {

       pt -> prox = inicio;

       inicio -> ant = pt;

       inicio = pt;

     }

     return 1;

}




void viewInsere(){

     int cod,x;

     char placa[10], modelo[100];

     carro temp;

     cout<<"\nDigite um codigo:";

     cin>> temp.cod;

     cout<<"\nDigite a placa:";

     cin>> temp.placa;

     cout<<"\nDigite o modelo:";

     cin>> temp.modelo;

     x = insereLista(temp);

     if (x!=1) {

        cout<<"Erro na insercao";

     }else {

              cout<<"\nCarro novo: "<<temp.cod;

              cout<<"\t placa ("<< temp.placa;

              cout<<")\t modelo: "<< temp.modelo;              

              cout<<"\nInserido com sucesso!\n";

     }

}

 

void imprimeLista(){

     struct no *pt;

     if(testaListaVazia()){

        cout<<"A Lista estah vazia...";

        return;

     }

     cout << "Listagem: \n";

     pt = inicio;

     while(pt!=NULL){

          cout << pt->c.cod;

          cout << "\t (";

          cout << pt->c.placa;

          cout << ") \t - ";          

          cout << pt->c.modelo;

          cout << " \n";                       

          pt = pt -> prox;

     }

     cout<<"\nFim da Lista . . .\n";

 }

 



struct no *buscaLista (int novo){

       struct no *pt;

       if(testaListaVazia()){

          return NULL;

       }

       pt = inicio;

       while (pt != NULL){

             if(pt->c.cod == novo){

                return pt;

             }

             pt = pt-> prox;

       }

       return NULL;

}

       

void viewBusca(){

     struct no *pt;

     int cod;

     cout<<"Qual elemento quer buscar? ";

     cin>>cod;

     pt = buscaLista(cod);

     if(pt != NULL){

           cout<<"Achei o "<<pt->c.cod;

           cout<<" no endereco "<<pt;

           cout<<" ele eh o  "<<pt->c.modelo;
           }else{

                 cout<<"Elemento nao esta a lista";

           }

       }




/*bool alteraElementoLista(int dado, int novo){

	struct no *pt;

	pt = buscaLista(dado);

	if(pt == NULL){

		return false;

	}else{

		pt -> valor = novo;

		return true;

	}

   }




void viewAltera(){

	int elem, novo;

	cout <<"Qual elemento deve sair da lista?";

	cin >> elem;

	cout <<"E qual deve entrar no lugar?";

	cin >> novo;

		if(alteraElementoLista(elem, novo)){

		    cout<<"O elemento " << elem << " foi trocado pelo "<< novo;

	}else{

		cout<<"nao foi possivel fazer a alteracao...";

	}

    }


*/

bool excluirElementoLista(int cod){
	struct no *pt, *ant;
	pt = buscaLista(cod);
	if(pt == NULL) return false; // não achei o cara...
    pt->prox->ant = pt->ant;
    pt->ant->prox = pt->prox;
	delete pt;
    return true;
}




void viewExcluir(){

	int elem;

	cout<<"Qual o codigo do elemento deve ser excluido? ";

	cin>>elem;

		if(excluirElementoLista(elem)){

		   cout<<"O elemento "<<elem<<" foi excluido...";

		}else{

		   cout<<"nao foi possivel fazer a exclusao...";

		}

}      


int main(int argc, char* argv[]){

    int x, op;

    iniciaLista();

    do {

        cout << "\n\n1 - Testa Lista Vazia";

        cout << "\n2 - Incluir";

        cout << "\n3 - Listar";

        cout << "\n4 - Buscar";

        cout << "\n5 - Excluir";

        cout << "\n6 - Sair";

        cout << "\n\nDigite sua opcao: ";

        cin >> op;

        switch (op){

            case 1: if (testaListaVazia()){

                       cout << "\n A Lista estah Vazia!\n";

                    }else{

                       cout << "\n A Lista nao estah Vazia!\n";

                    }break;

            case 2: viewInsere();

                    break;

            case 3: imprimeLista();

                    break;

            case 4: viewBusca();

                    break;

            case 5: viewExcluir();

                    break;

            case 6: break;

            default: cout << "Opcao invalida . . .\n\n";

        }

    } while (op != 6);

    return 0;

}
