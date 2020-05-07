void main(){
  // This make c cant use method 'hi' and 'bye', it's not exist on Class A
  A c = C('C');
  c.hello();

  // Casting make it possible to call the methods, but still act like Class C
  (c as B).hi();
  (c as C).bye();
  (c as C).printStamp();
}

class Timestamp {
  DateTime time = DateTime.now();
  
  void printStamp(){
    print(time);
  }
}

class A{
  void hello(){
    print('Hello from Class A');
  }
}

class B{
  String b;
  B(this.b);

  void hi(){
    print('Hi from Class B');
  }

  void bye(){
    print('Bye from Class B');
  }
}

// Implements MUST declare all instance, method, property of the implemented class
// With (Mixin) work differently than inheritence, they don't need to re-declare the Mixed Class. The class cannot has declared constructor, the class cant extends and can't use super
class C with Timestamp implements A,B{
  C(this.b);

  @override
  void hello(){
    print('Hello from Class C');
  }

  @override
  void hi(){
    print('Hi from Class C');
  }

  @override
  String b;

  @override
  void bye(){
    print('Bye from Class ${b}');
  }
}