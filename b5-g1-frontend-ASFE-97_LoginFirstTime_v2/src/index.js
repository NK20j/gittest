import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { AuthProvider } from "./context/AuthProvider";
import Layout from "./layouts/Layout";
import HomePage from "./pages/homepage/HomePage";
import LoginPage from "./pages/login/LoginPage";
import RequireAuth from "./pages/requireAuth/RequireAuth";
import UnauthorizedPage from "./pages/unauthorized/UnauthorizedPage";
import reportWebVitals from "./reportWebVitals";
import { ROLE } from "./util/enum";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <BrowserRouter>
    <ToastContainer
      position="top-right"
      autoClose={5000}
      hideProgressBar={false}
      newestOnTop={false}
      closeOnClick
      rtl={false}
      pauseOnFocusLoss
      draggable
      pauseOnHover
    />
    {/* Same as */}
    <ToastContainer />
    <AuthProvider>
      <Routes>
        <Route path="/">
          <Route
            element={
              <RequireAuth
                allowedRoles={[ROLE.ADMIN, ROLE.STAFF]}
              ></RequireAuth>
            }
          >
            <Route
              index
              element={
                <Layout title="Home">
                  <HomePage />
                </Layout>
              }
            />
          </Route>

          <Route path="user">
            <Route index >
          
            </Route>
            
            <Route path="create" ></Route>
            <Route path="edit"></Route>
          </Route>
          <Route path="asset">
            <Route index></Route>
            <Route path="create"></Route>
            <Route path="edit"></Route>
          </Route>
          <Route path="assignment">
            <Route index></Route>
            <Route path="create"></Route>
            <Route path="edit"></Route>
          </Route>
          <Route path="RequestForReturning">
            <Route index></Route>
          </Route>
          <Route path="report">
            <Route index></Route>
          </Route>
        </Route>
        <Route path="/login" element={<LoginPage />} />
        <Route path="/unauthorized" element={<UnauthorizedPage />} />
      </Routes>
    </AuthProvider>
  </BrowserRouter>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
