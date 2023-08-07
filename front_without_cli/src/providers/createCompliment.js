import axios from "axios";

export default function createCompliment(resourse) {
  if (resourse.value == null || resourse.value.length < 10) {
    alert("Комплимент должен быть длиннее 10 символов");
    return false
  } else {
    console.log("createCompliment");
    console.log(resourse.value);
    axios.post("api/compliments", { compliment: `${resourse.value}` });
    return true
  }
}
