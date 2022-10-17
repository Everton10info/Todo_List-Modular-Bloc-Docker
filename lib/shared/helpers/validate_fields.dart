class ValidadeHelp {
  static String? validateTodo(String todoName) {
    if (todoName.isEmpty || todoName.length < 3) {
      return 'Preencha o campo corretamente';
    } else {
      return null;
    }
  }
}
