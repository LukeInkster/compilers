int * field;

int * f(int i, int a, int b, int c){
	int arr[10];
	arr[0] = a;
	arr[1] = b;
	arr[2] = c;
}

int main(){
	int * arr = f(10000, 1,2,3);
	field = arr;
    return 0;
}
