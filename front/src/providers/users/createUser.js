import axios from "axios";

export default async function createUser(resourseLogin, resoursePassword) {
  if (resourseLogin.value == null) {
    alert("Логин не может быть пустым");
  } else if (
    resoursePassword.value == null ||
    resoursePassword.value.length < 6 ||
    resoursePassword.value.length > 20
  ) {
    alert("Пароль должен содержать не меньше 6 и не больше 20 символов");
  } else {
    console.log("createUser");
    console.log(`login: ${resourseLogin.value}`);
    console.log(`password: ${resoursePassword.value}`);

    let response = await axios.post("/api/v1/users/register", {
      name: `${resourseLogin.value}`,
      password: `${resoursePassword.value}`,
    });

    console.log(response)

    if (response.data.status == "error_user_exists") {
      alert("Пользователь существует!")
    }
    else {
      alert("Вы успешно зарегистрированы!")
    }
  }
}
