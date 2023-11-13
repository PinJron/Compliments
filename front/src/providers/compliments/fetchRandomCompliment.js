import axios from "axios";

export default async function fetchRandomCompliment() {
  console.log("fetchRandomCompliment");

  const response = await axios.get(`/api/v1/compliments/random`);
  if (response.statusText == "OK") {
    return response.data;
  } else {
    return "Технические шоколадки, попытаемся исправиться (заряжаем комплименты)";
  }
  // console.log(resourse.value)
}
