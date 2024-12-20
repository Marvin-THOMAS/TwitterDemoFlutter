void wait2SecBeforePrint() async{
  print("avant l'attente");
  await Future.delayed(Duration(seconds: 2));
  print("après l'attente");
}


Future<String> getAsyncName() async{
  return "Michel";
}

Future<void> main() async {
  wait2SecBeforePrint();
  var name = await getAsyncName();
  print(name);
}