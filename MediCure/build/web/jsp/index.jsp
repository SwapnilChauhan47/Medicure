<!DOCTYPE html>
<html>
<head>

<style>
.body {
  height: 100%;
  margin: 0;
  filter: blur(8px);
  -webkit-filter: blur(8px);
}

.bg {
  /* The image used */
   background-image : url( "C:\Users\PCW\Desktop\mohit\images\h1.jpg");

  /* Full height */
  max-height: 100%;
  max-width: 100%;

  /* Center and scale the image nicely */
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;



  
}






.covertext {
  position: absolute; /* To make the div to be place anywhere. It is out of the document flow */
  top: 200px; /* The distance between the div with the top of document */
  left: 0px; /* Make the div full width */
  right: 0px; /* Make the div full width */
}

.title {
  font-family: Verdana;
  font-weight: 600;
  font-size: 60px;
  color: #ffffff;
  text-align: center;
}

.subtitle {
  font-family: Verdana;
  font-size: 23px;
  color: #ffffff;
  text-align: center;
}















.explore {
  text-align: center;
  margin-top: 10px;
}

.explore .btn-lg,
.explore .btn-lg:hover {
  border-radius: 30px;
  padding: 15px 25px;
  font-size: 22px;
  background-image: none;
  background-color: #FF4000;
  border-color: #FF4000;
  color: #ffffff;
}





.btn,
.btn:hover {
  border-radius: 0px;
  background-image: none;
  background-color: #FF4000;
  border-color: #FF4000;
  color: #ffffff;
  margin-bottom: 20px;
  box-shadow: none;
  outline: none;
}

.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
  color: #ffffff;
  outline: none;
}


.bg-text {
  background-color: rgb(255,255,255); /* Fallback color */
  background-color: rgba(255,255,255, 0.7); /* Black w/opacity/see-through */
  color: white;
  font-weight: bold;
  border: 3px solid #f1f1f1;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 2;
  width: 55%;
  padding: 50px;
  text-align: center;
}


</style>
</head>
<body >  


  

    <div class="bg"   > <img width="100%" src='<%= application.getContextPath() %>/images/bg.jpg' />
</div>
  <div class="covertext bg-text">
    <div class="col-lg-10" style="float:none; margin:0 auto;">
      <h1 class="title" style="color:Black">Medicure</h1>
      <h3 class="subtitle" style="color:Black">An easy to use health management</h3>
    </div>
    <div class="col-xs-12 explore">
      <a href="<%= application.getContextPath() %>/jsp/Login.jsp"><button type="button" class="btn btn-lg explorebtn" >EXPLORE >> </button></a>
    </div>
  </div>
 





</body>
</html>