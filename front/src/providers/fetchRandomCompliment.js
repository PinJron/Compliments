import axios from "axios";

export default async function fetchRandomCompliment(resourse) {
  console.log("fetchRandomCompliment");
  const response = await axios.get(`/api/compliments/random`);
  // console.log(resourse);
  if (response.data.status == "ok") {
    resourse.value = response.data.name;
  } else {
    resourse.value =
      "Технические шоколадки, попытаемся исправиться (заряжаем комплименты)";
  }
  // console.log(resourse.value)
}
