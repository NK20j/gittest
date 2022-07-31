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
  return instance.post(endPoint, data);
};

const changePassword = (endPoint, data) => {
  return instance.put(endPoint, data);
};

const checkPassword = (endPoint, data) => {
  return instance.post(endPoint, data);
};

const httpClient = {
  postUser,
  login,
  updatePasswordFirstTime,
  changePassword,
  checkPassword
};

export default httpClient;
