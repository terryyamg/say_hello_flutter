class Api {
  Future<void> sensSms(String mobile) async {
    print('Test1');
    await Future.delayed(Duration(seconds: 1), () {
      print("Future.delayed");
    });
    print('Test2');
  }

}
