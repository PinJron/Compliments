import axios from "axios";
import ax from "../../main.js";

function checkLength(message) {
  if (message == null || message.length < 10) {
    alert("Комплимент должен быть длиннее 10 символов");
    return false;
  }
}

export default async function createCompliment(resourse) {
  if (checkLength(resourse) != false) {
    const response = await fetch("/api/v1/compliments/create", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "same-origin",
      body: JSON.stringify({
        compliment: resourse,
      }),
    });

    let result = await response.json();

    if (result?.compliment) {
      alert(`Комплимент ${result?.compliment} успешно создан`);
      return true
    } else {
      if (result?.status == "error_you_are_not_logged_in") {
        alert("Сначала необходимо авторизоваться");
        return false
      }
    }
  }
}
