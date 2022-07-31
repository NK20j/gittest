import Modal from "antd/lib/modal/Modal";
import { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import "antd/dist/antd.less";
import "./homepage.css";
import { Button } from "antd";
import useAuth from "../../hooks/useAuth";
import { updatePasswordFirstTime } from "../../services";
import jwt from "jwt-decode";
import { useNavigate } from "react-router-dom";

function HomePage() {
  let location = useLocation();

  let firstTimeLogin = false;
  if (location.state) {
    firstTimeLogin = location.state.firstTimeLogin;
  }

  const [isModalVisible, setIsModalVisible] = useState(firstTimeLogin);

  const [newPasswordFirstTimeLogin, setNewPasswordFirstTimeLogin] =
    useState("");

  const { user } = useAuth();

  const navigate = useNavigate();

  useEffect(() => {}, [isModalVisible]);

  const changePasswordFirstTimeSubmit = async (event) => {
    const userWithNewPassword = {
      username: user.sub,
      password: newPasswordFirstTimeLogin,
    };

    const response = await updatePasswordFirstTime(userWithNewPassword);
    navigate("/login", {
      state: {
        afterChangedPasswordFirstTimeToken: response.data.jwtToken,
      },
    });
  };
  return (
    <>
      <Modal
        className="newStyle"
        mask={false}
        closable={false}
        maskClosable={true}
        title="Change password"
        visible={isModalVisible}
        footer={
          <Button
            disabled={newPasswordFirstTimeLogin.length === 0}
            onClick={changePasswordFirstTimeSubmit}
            key={1}
            type="submit"
            style={{ color: "whitesmoke", backgroundColor: "rgb(171, 42, 22)" }}
          >
            Save
          </Button>
        }
      >
        <p>This is the first time you logged in</p>
        <p>You have to change your password to continue</p>
        <form className="form-inline">
          <div style={{ display: "flex", justifyContent: "space-between" }}>
            <label
              style={{
                textAlign: "center",
                paddingTop: "10px",
                marginRight: "5px",
              }}
              htmlFor="password"
            >
              New password
            </label>

            <input
              value={newPasswordFirstTimeLogin}
              onChange={(event) => {
                setNewPasswordFirstTimeLogin(event.target.value);
              }}
              type="password"
              className="form-control"
              id="password"
              style={{ width: "350px", textAlign: "right" }}
            />
          </div>
        </form>
      </Modal>
      Home page
    </>
  );
}

export default HomePage;
