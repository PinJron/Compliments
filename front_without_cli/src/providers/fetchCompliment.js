import axios from "axios"

export default async function fetchCompliment(resourse){
  // тут надо сделать реквест на бек и сохранить в переменную комплимент
  console.log("fetchCompliment")
  const response = await axios.get('api/compliments');
  console.log(resourse);
  if (response.data.status == "ok") {
    resourse.value = response.data.name;
  }
  else {
    resourse.value = "idi nahuy";
  }
  console.log(resourse)
}