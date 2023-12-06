<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Zigbang Navigation Bar</title>
    <style>
      .navbar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 0 20px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
      }

      .navbar-left {
          display: flex;
      }

      .navbar-logo {
        display: flex;
        align-items: center;
      }

      .navbar-logo img {
        height: 50px; /* Example size */
      }

      .navbar-menu {
        list-style: none;
        display: flex;
        gap: 20px;
        margin-left: 20px;
        padding: 0;
      }

      .navbar-menu li {
        padding: 20px 10px;
      }

      .navbar-menu a {
        text-decoration: none;
        color: #333;
        font-weight: bold;
      }

      .navbar-menu .highlight {
        color: #ff6600;
      }
    </style>
  </head>

  <body>
    <div class="navbar">
      <div class="navbar-left">
        <div class="navbar-logo">
          <img src="https://placehold.co/100x50" alt="Zigbang Logo" />
        </div>
        <ul class="navbar-menu">
          <li><a href="#">빌라, 투룸+</a></li>
          <li><a href="#" class="highlight">원룸</a></li>
        </ul>
      </div>
      <div>
        <a href="#" class="highlight">로그인 및 회원가입</a>
      </div>
    </div>
  </body>
</html>
