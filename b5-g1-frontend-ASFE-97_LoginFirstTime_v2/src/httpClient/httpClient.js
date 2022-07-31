import instance from "./axiosInstance";
//example

const postUser = (endPoint, data) => {
  return instance.post(endPoint, data, {
    // header : {...JWT}
  });
};

const login = (endPoint, data) => {
  return instance.post(endPoint, data);
};

const updatePasswordFirstTime = (endPoint, data) => {
  return instance.post(endPoint, data, {
    headers: {
      "UpdatePasswordFirstTimeToken": `${localStorage.getItem("token")}`,
    },
  });

};

const httpClient = {
  postUser,
  login,
  updatePasswordFirstTime,
};

export default httpClient;
