import axios from "axios";
import ax from "../../main.js"
import router from "../../router/index.js";

export default async function loginUser(resourseLogin, resoursePassword) {
  if (resourseLogin.value == null) {
    alert("Логин не может быть пустым");
  } else if (
    resoursePassword.value == null ||
    resoursePassword.value.length < 6 ||
    resoursePassword.value.length > 20
  ) {
    alert("Пароль должен быть не меньше 6 и не больше 20 символов");
  } else {
    console.log("loginUser:front/src/providers/logUser.js");
    
    const response = await fetch("/api/v1/users/login", {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'include',
      body: JSON.stringify({
        username: resourseLogin.value,
        password: resoursePassword.value
      })});

      let result = await response.json()

    if (result.status == "error_user_not_exists") {
      alert("Пользователь не существует")
      console.error("Пользователь не существует");
    } else if (result.status == "error_wrong_password"){
      alert("Неверный пароль")
    } else {
      alert("Вы успешно вошли!")
      router.push('/')
    }
  }
}
