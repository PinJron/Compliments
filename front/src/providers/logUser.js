import axios from "axios";

export default async function logUser(resourseLogin, resoursePassword) {
  if (resourseLogin.value == null) {
    alert("Логин не может быть пустым");
  } else if (
    resoursePassword.value == null ||
    resoursePassword.value.length < 6 ||
    resoursePassword.value.length > 20
  ) {
    alert("Пароль должен быть не меньше 6 и не больше 20 символов");
  } else {
    console.log("loginUser");
    
    const response = await axios.post("/api/users/login", {
      username: `${resourseLogin.value}`,
      password: `${resoursePassword.value}`,
    });
    if (response.data.status == "error_user_not_exists") {
      alert("Пользователь не существует")
    } else if (response.data.status == "error_wrong_password"){
      alert("Неверный пароль")
    } else {
      alert("Вы успешно вошли!")
    }
  }
}
