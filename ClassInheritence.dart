void main(){
  var n1 = Complex(3, -2);
  var n2 = Complex(1, 4);
  
  print(n1 + n2);
  print(n1.multiply(n2));
  print(Complex.substract(n1, n2));

  print('counter = ${Complex.counter}');

  print(Quaternion(1,2,3));
}

class Complex{
  num _real;
  num _imaginary;

  static num counter = 0;

  get real => _real;
  set real(num real) => _real = real;
  get imaginary => _imaginary;
  set imaginary(num imaginary) => _imaginary = imaginary;

  Complex(this._real, this._imaginary){
    counter++;
  }

  Complex.imaginary(num imaginary) : this(0, imaginary);
  Complex.real(num real) : this(real, 0);

  Complex operator +(Complex c){
    return Complex(
      this.real + c.real,
      this.imaginary + c.imaginary
    );
  }

  Complex multiply (Complex c){
    var first = this.real * c.real;
    var inner = this.imaginary * c.real;
    var outer = this.real * c.imaginary;
    var last = -(this.imaginary * c.imaginary);

    return Complex(first + last, inner + outer);
  }

  static Complex substract(Complex c1, Complex c2){
    return Complex(
      c1.real - c2.real,
      c1.imaginary - c2.imaginary
    );
  }

  @override
  bool operator ==(other){
    if(!(other is Complex)){
      return false;
    }
    
    return this.real == other.real && this.imaginary == other.imaginary;
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

class Quaternion extends Complex{
  num jImage;

  Quaternion(
    num real,
    num imaginary,
    this.jImage,
  ) : super(
        real,
        imaginary,
  );

  @override
  String toString(){
    if (this.jImage >= 0 && this._imaginary >= 0){
      return '${this._real} + ${this.imaginary}i + ${this.jImage}j';
    }
    if (this.jImage >= 0 && this.imaginary < 0){
      return '${this._real} - ${this.imaginary.abs()}i + ${this.jImage}j';
    }
    else {
      return '${this._real} - ${this.imaginary.abs()}i - ${this.jImage.abs()}j';
    }
  }
}