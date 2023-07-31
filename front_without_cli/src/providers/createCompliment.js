import axios from "axios"

export default async function createCompliment(resourse){
  // запушить в бд реализовать
  console.log("createCompliment")
  console.log(resourse.value)
  axios.post('api/compliments', {name: `${resourse.value}`});
}