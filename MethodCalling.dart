int add(int a, int b){
  return a + b;
}

int sub(int a, int b) => a - b;

void main(){
  int addition = add(2, 5);
  int substraction = sub(3, 5);

  print("Addition result = ${addition}");
  print("Substraction result = ${substraction}");
}