import axios from "axios"

export default async function createCompliment(resourse){
  console.log("createCompliment")
  console.log(resourse.value)
  axios.post('api/compliments', {compliment: `${resourse.value}`});
}