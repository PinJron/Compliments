import axios from "axios"

export default async function fetchCompliment(resourse){
  // тут надо сделать реквест на бек и сохранить в переменную комплимент
  console.log("fetchCompliment")
  let id = 19
  const response = await axios.get(`api/compliments/${id}`);
  console.log(resourse);
  if (response.data.status == "ok") {
    resourse.value = response.data.name;
  }
  else {
    resourse.value = "Технические шоколадки, попытаемся исправиться (комплимент юзался)";
  }
  console.log(resourse.value)
}