import axios from "axios";
import ax from "../../main.js";

export default async function getUser() {
  const response = await fetch("/api/v1/users/me", {
    method: "GET",
    headers: {
      'Content-Type': 'application/json'
    },
    credentials: 'same-origin',
  });

  let result = await response.json()

  if (result.status == "error_access_not_allowed") {
    console.log("error_access_not_allowed");
    return "error_access_not_allowed";
  }
  if (result.status == "error_you_are_not_logged_in") {
    console.log("error_you_are_not_logged_in");
    return "error_you_are_not_logged_in";
  }

  if (result?.username) {
    return result;
  }
}
