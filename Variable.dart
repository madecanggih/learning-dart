void main(){
  int x = 10;
  double y = 20.0;

  String s = "${x+y}";
  print(s);
  
  bool b = true;
  print(b);
  
  List l = [1, 2, 3];
  print(l[0]);
  
  List<String> ls = ["1", "2", "3"];
  print(ls[1]);

  Map<String, int> map = {
    'A': 1,
    'B': 2,
    'C': 3
  };
  print(map["A"]);
}