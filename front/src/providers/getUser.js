import axios from "axios";

export default async function getUser() {
  const response = await axios.get("/api/users/me");
  if (response.data.status == "error_access_not_allowed") {
    return "error_access_not_allowed"
  } else
    console.log(response.data.username)
    return response.data.username
  }
