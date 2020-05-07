void main(){
  var c = Complex(5,2);
  
  // this would works here because main() and class is inside the same .dart file
  //c._imaginary = 10;

  // this is the correct way in OOP w/ usual Getter Setter 
  //c.setImaginary(15);

  // this is with the Dart's way
  c.imaginary = 15;
  
  print(c.imaginary);
  print(c.real);
  print(c);

  var i = Complex.imaginary(-4);
  var r = Complex.real(10);

  print(i);
  print(r);
}

class Complex{
  // adding underscore to make it private
  num _imaginary;
  num _real;

  // this is the usual way to do Getter Setter
  // num getImaginary(){
  //   return _imaginary;
  // }
  // num setImaginary(num imaginary){
  //   this._imaginary = imaginary;
  // }
  // num getReal(){
  //   return _real;
  // }
  // num setReal(num real){
  //   this._real = real;
  // }

  // this is Dart's way to do Setter Getter
  get imaginary => _imaginary;
  set imaginary(num imaginary) => _imaginary = imaginary;
  get real => _real;
  set real(num real) => _real = real;

  Complex(this._imaginary, this._real);
  Complex.imaginary(num imaginary) : this(imaginary, 0);
  Complex.real(num real) : this(0, real);

  @override
  bool operator ==(other){
    if(!(other is Complex)){
      return false;
    }
    
    return this._real == other.real && this._imaginary == other.imaginary;
  }

  @override
  String toString(){
    if(_imaginary >= 0){
      return '${_real} + ${_imaginary}i';
    } else {
      return '${_real} - ${_imaginary.abs()}i';
    }
  }

}