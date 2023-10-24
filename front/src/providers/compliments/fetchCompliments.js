import axios from "axios";

export default async function fetchCompliments(sortType, limit, offset) {

  const response = await fetch(`/api/v1/compliments/sorted?sorted_by=${sortType}&limit=${limit}&offset=${offset}`, {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "same-origin",
  });

  let result = await response.json();
  console.log(result);
  return result;
}
