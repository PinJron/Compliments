import axios from "axios";

export default async function fetchComplimentById(resourse, counter) {
  console.log("fetchComplimentById");
  const response = await axios.get(`/api/compliments/${counter.count}`);
  // console.log(resourse);
  if (response.data.status == "ok") {
    resourse.value = response.data.name;
  } else {
    resourse.value =
      "Технические шоколадки, попытаемся исправиться (заряжаем комплименты)";
  }
  // console.log(resourse.value)
}
