<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Home</title>
  
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="css/mdb.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
</head>

<body>

        <header>
          <!-- Navbar -->
		<nav
			class="navbar navbar-expand-lg navbar-dark fixed-top scrolling-navbar">
			<div class="container">
				<a class="navbar-brand" href="/"> <strong><b>Grocery Application </b></strong>
				</a>
				<div class="collapse navbar-collapse" id="navbarSupportedContent-7">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active"><a class="nav-link" href="index"><i class="fa fa-home" aria-hidden="true"></i>
								<span class="sr-only">(current)</span>
						</a></li>
					</ul>
					<div class="form-inline">
						<div class="md-form my-0">
							<ul class="navbar-nav mr-auto">
								<li class="nav-item ">
									<a class="nav-link" href="login">Login </a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- Navbar -->
       
        <div><br></br></div>
		
		<div class="view"
			style="background-image: url('images/'); background-repeat: no-repeat; background-size: cover; background-position: center center; position: absulate">
        <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-6">
            <div class="p-5 ">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Free Plan</h1>
				<hr>
                  <h4>Free plan for 7 day</h4>
				  <br>
                  <p>If you want free plan then click this button</p>
				  <br>
				  <br>
				  <br>
				  <br>
				  <br>
				  <hr>
              </div>
              <div class="text-center">
                <form class="user" action="../register" method="post" id="registration_form">
			  <input type="hidden" name="registrationType" value="free"/>
                <input type="submit" class="btn badge-primary" value="Free Registration">			  
				</form>
				      <!--   <div class="text-center" >
				             <c:set var="type" value="free"></c:set>
         					<a class="btn btn-primary btn-user" href="registerShop/free">Free Registration</a>
               			 </div> -->
              </div>
              
            </div>
          </div>
          <div class="col-lg-6">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Paid Plan</h1>
                <hr>
                <h3>Paid plan base on your income</h3>
                <p>When you sold you grocery up 10000<sup>nd</sup>Rs then you will pay only 2% amount of 10000<sup>nd</sup>Rs</p>
                <p>When you sold you grocery up 20000<sup>nd</sup>Rs then you will pay only 1.5% amount of 20000<sup>nd</sup>s</p>
                <p>When you sold you grocery up 50000<sup>nd</sup>Rs then you will pay only 1% amount of 50000<sup>nd</sup>Rs</p>
                 <hr>
             </div>
             <div class="text-center">
            <form class="user" action="../register" method="post" id="registration_form">
			  <input type="hidden" name="registrationType" value="paid"/>
                <input type="submit" class="btn badge-primary" value="Paid Registration">			  
				</form> 
				         <!-- <div class="text-center" >
				             <c:set var="type" value="Piad"></c:set>
         					<a class="btn btn-primary btn-user" href="registerShop/paid">Paid Registration</a>
               			 </div> -->
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
  </div>
 </header>     
  
 </body>
</html>
