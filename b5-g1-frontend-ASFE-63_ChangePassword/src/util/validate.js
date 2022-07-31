export const validatePassword = password => {
  // if(!password) return "Required";
  if(password.length > 50) return "Password must be under 50 characters";
  if(!password.match(/^\S*$/)) return "Spaces";
  return "";
}
