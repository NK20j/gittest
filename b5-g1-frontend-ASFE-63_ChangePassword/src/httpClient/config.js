import { updatePasswordFirstTime } from "../services";

export const CONFIG = {
  baseUrl: "http://localhost:8080",
  headers: {
    "Content-Type": "application/json",
  },
};

export const END_POINT = {
  login: "/authenticate",
  updatePasswordFirstTime: "/UpdatePasswordFirstTime",
  changePassword: "/users/change-password",
  checkPassword: "/users/get-password"
};
