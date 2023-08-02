import axios from "axios"

export default async function createUser(resourseLogin, resoursePassword){
  console.log("createUser")
  console.log(resourseLogin.value)
  console.log(resoursePassword.value)
  axios.post('api/users/register', {username: `${resourseLogin.value}`, password: `${resoursePassword.value}`});
}