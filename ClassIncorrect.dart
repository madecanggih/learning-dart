void main(){
  var c1 = Complex();
  c1.imaginary = 2;
  c1.real = 5;

  print(c1.imaginary);
  print(c1.real);
  print(c1);

  var c2 = Complex()
    ..imaginary = 2
    ..real = 5;

  print(c1 == c2);
}

class Complex{
  num imaginary;
  num real;
  
  @override
  bool operator ==(other){
    if(!(other is Complex)){
      return false;
    }
    
    return this.real == other.real && this.imaginary == other.imaginary;
  }

  @override
  String toString(){
    if(imaginary >= 0){
      return '${real} + ${imaginary}i';
    } else {
      return '${real} - ${imaginary.abs()}i';
    }
  }

}