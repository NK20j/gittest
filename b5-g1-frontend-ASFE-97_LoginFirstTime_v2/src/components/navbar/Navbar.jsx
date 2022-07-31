import { Link } from "react-router-dom";
import "./navbar.css";
import {useState} from "react";
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';


function Navbar(props) {

  const [show, setShow] = useState(false);
  const handleClose = () => {setShow(false);}
  const handleLogout = () =>{

  }
  const logoutModal = (
      <Modal show={show} onHide={handleClose}>
        <Modal.Header closeButton>
          <Modal.Title className="text-danger">Are you sure?</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <div>Do you want to log out?</div>
        </Modal.Body>
        <Modal.Footer>
          <div className='d-flex mx-4 flex-row-reverse'>
            <Button variant="" onClick={handleClose}>
              Cancel
            </Button>
            <Button variant="" onClick={handleLogout}>
              Logout
            </Button>
          </div>

        </Modal.Footer>
      </Modal>
  );

  const handleChangePassword = (event) => {
    event.preventDefault();
  };

  const handleChangeLogout = (event) => {
    event.preventDefault();
  };

  return (
    <>
      <nav
        className="navbar navbar-expand-lg "
        style={{ backgroundColor: "rgb(171, 42, 22)", marginBottom: "30px" }}
      >
        <div className="container-fluid container-fluid-custom">
          <a className="navbar-brand navbar-brand-custom" href="#">
            {props.title}
          </a>

          <div id="navbarSupportedContent" className="support-content">
            <ul className="navbar-nav me-auto mb-2 mb-lg-0"></ul>
            <ul className="navbar-nav me-auto mb-2 mb-lg-0">
              <li className="nav-item dropdown">
                <a
                  className="nav-link dropdown-toggle toggle-custom"
                  href="#"
                  role="button"
                  data-bs-toggle="dropdown"
                  aria-expanded="false"
                >
                  {props.username}
                </a>
                <ul className="dropdown-menu">
                  <li>
                    <div
                      className="dropdown-item"
                      onClick={handleChangePassword}
                    >
                      Change password
                    </div>
                  </li>
                  <li>
                    <div
                        className="dropdown-item"
                        onClick={handleChangeLogout}
                    >
                      Log out
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </>
  );
}

export default Navbar;
