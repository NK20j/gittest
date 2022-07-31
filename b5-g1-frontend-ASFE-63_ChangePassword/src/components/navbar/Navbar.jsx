import { Link } from "react-router-dom";
import "./navbar.css";
import React from 'react';
import Form from 'react-bootstrap/Form';
import { useState } from 'react';
import Modal from 'react-bootstrap/Modal';
import Button from 'react-bootstrap/Button';
import { validatePassword } from '../../util/validate';
import axios from 'axios';
import { EyeIcon, EyeOffIcon } from '@heroicons/react/solid';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import useAuth from "../../hooks/useAuth";
import { changePassword, checkPassword } from "../../services/index";


function Navbar(props) {
  const { user } = useAuth();

  let username = user.sub;
  const [show, setShow] = useState(false);

  const [revealOldPassword, setRevealOldPassword] = useState(false);
  const [revealNewPassword, setRevealNewPassword] = useState(false);

  const [oldPasswordErrorMessages, setOldPasswordErrorMessages] = useState("");
  const [newPasswordErrorMessages, setNewPasswordErrorMessages] = useState("");
  const [isSubmitted, setIsSubmitted] = useState(false);

  const [values, setValues] = useState({
    username: username,
    oldPassword: "",
    newPassword: ""
  });

  const handleClose = () => {
    setShow(false);
    setIsSubmitted(false);
    setValues({
      ...values,
      oldPassword: "",
      newPassword: ""
    })
    setTouched(false, false);
    setOldPasswordErrorMessages("");
    setNewPasswordErrorMessages("");
  }

  const [touched, setTouched] = useState({
    oldPassword: false,
    newPassword: false
  })

  const [focused, setFocused] = useState({
    oldPassword: false,
    newPassword: false
  })

  const handleSubmit = async (evt) => {
    evt.preventDefault();
    const response = await changePassword(values);
    setIsSubmitted(true);
  }

  const handleChange = evt => {
    setValues({
      ...values,
      [evt.target.name]: evt.target.value
    })
  }

  const handleBlur = async (evt) => {
    setTouched({
      ...touched,
      [evt.target.name]: true
    })

    if (values.oldPassword !== "") {
      const response = await checkPassword(values);
      setOldPasswordErrorMessages(response.data);
    }

    setNewPasswordErrorMessages(validatePassword(values.newPassword));
  }

  const formValid = oldPasswordErrorMessages == "" && newPasswordErrorMessages == ""
    && values.newPassword != "" && values.oldPassword != "";

  const successModal = (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title className="text-danger">Change password</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <div>Your password has been changed successfully!</div>
      </Modal.Body>
    </Modal>
  );

  const changePasswordModal = (
    <Modal show={show} onHide={handleClose}>
      <Modal.Header closeButton>
        <Modal.Title className="text-danger">Change password</Modal.Title>
      </Modal.Header>
      <Modal.Body>
        <Form onSubmit={handleSubmit} validated={false} method="put">
          <Form.Group as={Row} className="oldPassword mb-3">
            <Form.Label htmlFor='oldPassword' column sm="4">Old password</Form.Label>
            <Col sm="7">
              <Form.Control
                required
                name="oldPassword"
                value={values.oldPassword}
                onChange={handleChange}
                onBlur={handleBlur}
                maxLength="50"
                type={`${revealOldPassword ? 'text' : 'password'}`}
                isInvalid={touched.oldPassword && oldPasswordErrorMessages != ""}
              />
              <Form.Control.Feedback type="invalid">{oldPasswordErrorMessages}</Form.Control.Feedback>
            </Col>
            <Col sm="1" className='my-1 pl-2 pr-2'>
              {!revealOldPassword ? (
                <EyeIcon
                  className='cursor-pointer absolute text-gray-500'
                  onClick={() => setRevealOldPassword(true)}
                />
              ) : (
                <EyeOffIcon
                  className='cursor-pointer absolute text-gray-500'
                  onClick={() => setRevealOldPassword(false)}
                />
              )}
            </Col>
          </Form.Group>
          <Form.Group as={Row} className="newPassword mb-3">
            <Form.Label htmlFor='newPassword' column sm="4">New password</Form.Label>
            <Col sm="7">
              <Form.Control
                required
                name="newPassword"
                value={values.newPassword}
                onChange={handleChange}
                onBlur={handleBlur}
                maxLength="50"
                type={`${revealNewPassword ? 'text' : 'password'}`}
                isInvalid={touched.newPassword && newPasswordErrorMessages != ""}
              />
              <Form.Control.Feedback type="invalid">{newPasswordErrorMessages}</Form.Control.Feedback>
            </Col>
            <Col sm="1" className='my-1 pl-2 pr-2'>
              {!revealNewPassword ? (
                <EyeIcon
                  className='cursor-pointer absolute text-gray-500'
                  onClick={() => setRevealNewPassword(true)}
                />
              ) : (
                <EyeOffIcon
                  className='cursor-pointer absolute text-gray-500'
                  onClick={() => setRevealNewPassword(false)}
                />
              )}
            </Col>
          </Form.Group>
          <div className='d-flex mx-4 flex-row-reverse'>
            <Button variant="" onClick={handleClose}>
              Cancel
            </Button>
            <Button disabled={!formValid} className="d-flex mx-3 text-light bg-danger shadow-none border border-danger" type="submit" value="Submit">
              Save
            </Button>
          </div>
        </Form>
      </Modal.Body>
    </Modal>
  );

  const handleChangePassword = () => setShow(true);

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
                    {isSubmitted ? successModal : changePasswordModal}
                  </li>
                  <li>
                    <Link className="dropdown-item" to="/logout">
                      Logout
                    </Link>
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
