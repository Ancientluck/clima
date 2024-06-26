
void main() {
  performTasks();
}

void performTasks()  async{
  task1();
 String task= await task2();
  task3(task);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2()  async{
  Duration three=Duration(seconds: 3);
  String result='';
  await Future.delayed(three,(){
     result = 'task 2 data';
    print('Task 2 complete');
  });
  return result;
}

void task3(String task) {
  String result = 'task 3 data';
  print('Task 3 complete $task');
}