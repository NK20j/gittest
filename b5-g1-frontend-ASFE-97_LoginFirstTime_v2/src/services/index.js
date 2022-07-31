import httpClient from "../httpClient/httpClient";
import { END_POINT } from "../httpClient/config";
export const authenticate = (data) => {
  return httpClient.login(`${END_POINT.login}`, data);
};

export const updatePasswordFirstTime = (data) => {
  return httpClient.updatePasswordFirstTime(
    END_POINT.updatePasswordFirstTime,
    data
  );
};
