<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">   
    <style>
        .nav-link{color: black;}
        .nav-link:hover{color: gray;}
    </style>
</head>
<body>
    <%@ include file="./inc/top.jsp" %>
    <div class="container-fluid">
    <div id="demo" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active bg-info">
            <img src="./images/pay.png" class="d-block" style="width:70%">
            <div class="carousel-caption">
            </div>
          </div>
          <div class="carousel-item bg-secondary">
            <img src="./images/kakao.png" class="d-block" style="width:70%">
            <div class="carousel-caption">
            </div> 
          </div>
          <div class="carousel-item bg-dark">
            <img src="./images/first.png" class="d-block" style="width:70%">
            <div class="carousel-caption">
            </div>  
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
          <span class="carousel-control-next-icon"></span>
        </button>
      </div>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="card ms-5" style="width:200px">
            <a href="#">
              <img class="card-img-top" src="./images/mac.jpg" alt="Card image" style="width:100%">
            </a>
              <div class="card-body">
                <h4 class="card-title">2,000,000</h4>
                <p class="card-text">(무료배송)맥북 M1 Pro </p>
                <!-- 크리스마스날짜 계산했던거 쓰기 -->
                <small>6시간 전</small>
              </div>
            </div>
            <div class="card card ms-5" style="width:200px">
                <a href="#">
                  <img class="card-img-top" src="./images/mac.jpg" alt="Card image" style="width:100%">
                </a>
                  <div class="card-body">
                    <h4 class="card-title">2,000,000</h4>
                    <p class="card-text">(무료배송)맥북 M1 Pro </p>
                    <!-- 크리스마스날짜 계산했던거 쓰기 -->
                    <small>6시간 전</small>
                  </div>
            </div>
            <div class="card card ms-5" style="width:200px">
                <a href="#">
                  <img class="card-img-top" src="./images/mac.jpg" alt="Card image" style="width:100%">
                </a>
                  <div class="card-body">
                    <h4 class="card-title">2,000,000</h4>
                    <p class="card-text">(무료배송)맥북 M1 Pro </p>
                    <!-- 크리스마스날짜 계산했던거 쓰기 -->
                    <small>6시간 전</small>
                  </div>
            </div>
            <div class="card card ms-5" style="width:200px">
                <a href="#">
                  <img class="card-img-top" src="./images/mac.jpg" alt="Card image" style="width:100%">
                </a>
                  <div class="card-body">
                    <h4 class="card-title">2,000,000</h4>
                    <p class="card-text">(무료배송)맥북 M1 Pro </p>
                    <!-- 크리스마스날짜 계산했던거 쓰기 -->
                    <small>6시간 전</small>
                  </div>
            </div>
            <div class="card card ms-5" style="width:200px">
                <a href="#">
                  <img class="card-img-top" src="./images/mac.jpg" alt="Card image" style="width:100%">
                </a>
                  <div class="card-body">
                    <h4 class="card-title">2,000,000</h4>
                    <p class="card-text">(무료배송)맥북 M1 Pro </p>
                    <!-- 크리스마스날짜 계산했던거 쓰기 -->
                    <small>6시간 전</small>
                  </div>
            </div>
        </div>
        <br>
        <div class="col d-flex justify-content-center">
            <!-- 각종 버튼 부분 -->
            <button type="button" class="btn btn-light">더보기</button>
        </div>
        <br>
    </div>
    <div class="row border border-dark border-bottom-0 border-right-0 border-left-0"></div>
    <%@ include file="./inc/copy.jsp" %>
</body>
</html>