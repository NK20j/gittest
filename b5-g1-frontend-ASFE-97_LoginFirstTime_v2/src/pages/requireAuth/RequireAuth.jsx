import { Navigate, Outlet, useLocation } from "react-router-dom";
import useAuth from "../../hooks/useAuth";

function RequireAuth({ allowedRoles }) {
  const { user } = useAuth();
  const location = useLocation();

  if (!user) {
    return <Navigate to={"/login"} replace />;
  } else if (user && !allowedRoles.includes(user.role[0].authority)) {
    return <Navigate to={"/unauthorized"} state={{ from: location }} replace />;
  }

  return <Outlet />;
}

export default RequireAuth;
