<!DOCTYPE html>
<!-- DEFAULT THEME -->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Jason Mayfield Portfolio Website">
    <meta name="author" content="Jason Mayfield">
    <link rel="shortcut icon" href="../../assets/ico/icon.png">

    <title><%=page.title%></title>

    <!-- Bootstrap core CSS -->
    <link href="<%=page.theme_path%>/css/bootstrap.css" rel = "stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=page.theme_path%>/css/sticky-footer-navbar.css" rel="stylesheet">
	<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

    <!-- Wrap all page content here -->
    <div id="wrap">

        <div id="mySidenav" class="sidenav">
          <a href="#" class="closebtn" >&times;</a>
          <a href="/?r=main">Landing</a>
          <a href="/?r=main/about">About</a>
          <a href="/?r=main/resume">Resume</a>
          <a href="/?r=main/projects">Projects</a>
          <a href="/?r=main/gify">Gify</a>
          <a href="/?r=main/contact">Contact</a>
          <a href="/?r=main/test">Test</a>
          <a href="/?r=main/coming">COMING SOON</a>
        </div>
         <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
          <span id="openNavBut" style="font-size:30px;cursor:pointer;padding-right: 120px" >&#9776; Menu</span>
          <h1> Jason Mayfield </h1> 
           
        </nav>

      <?lua@client
        --side navbar script

        ob = window.document:getElementById("openNavBut")
        cb = window.document:getElementById("mySidenav")

       function openNav() 
        cb.style.width = "250px"
        print('open button hit')
        end

       function closeNav() 
        cb.style.width = "0"
        print('close button hit')
        end

        function init()
        ob:addEventListener('click', openNav)
        cb:addEventListener('click', closeNav)
        end
        
        init()
      ?>
     

      <!-- Begin page content -->
      <div class="container" style="padding-top: 50px">
        {{content}}
      </div>
    </div>

    <div style="padding-top: 0px" id="footer">
      <div class="container">
        <p class="text-muted">© 2019 Jason Mayfield. Thank You to Etiene Dalcol. Powered by <a href="http://sailorproject.org" target="_blank">Sailor MVC</a>
        - <a href="http://lua.org" target="_blank">Lua</a> -
         Icon from  <a href="https://pngtree.com/">pngtree.com</a>
        </p>
      </div>
    </div>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<%=page.theme_path%>/js/jquery-1.10.2.min.js"></script>
    <script src="<%=page.theme_path%>/js/bootstrap.min.js"></script>
  </body>
</html>
