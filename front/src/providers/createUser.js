import axios from "axios";

export default async function createUser(resourseLogin, resoursePassword) {
  if (resourseLogin.value == null) {
    alert("Логин не может быть пустым");
  } else if (
    resoursePassword.value == null ||
    resoursePassword.value.length < 6 ||
    resoursePassword.value.length > 20
  ) {
    alert("Пароль должен быть не меньше 6 и не больше 20 символов");
  } else {
    console.log("createUser");
    console.log(resourseLogin.value);
    console.log(resoursePassword.value);
    axios.post("/api/users/register", {
      username: `${resourseLogin.value}`,
      password: `${resoursePassword.value}`,
    });
  }
}
