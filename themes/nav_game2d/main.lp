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
          <h1> NAV GAME TEST </h1> 
           
        </nav>

        <div class="page-header" id="heading">
          <h1>Testing Page!</h1>
          <p class="lead">
            Testing Page where I can practice with things I wanna mess with.
          </p>
        </div>

        <canvas id = "canvas" width="100" height="100" style="border:5px solid #000000; background-color: #f1f1f1;">
        </canvas>

        <p class="result" id ="input">0</p>
        <p><button id = "but">+1</button></p>

        <script>
          function drawsq(x, y, w, h, col){
          var canvass = document.getElementById("canvas");
          var ctxs = canvas.getContext("2d");
          ctxs.fillStyle = col; 
          ctxs.fillRect(x, y, w, h);
          ctxs.fillStyle = "#000000"; 
          return}
          //rsq();
          //function KeyPress(e) {
          //  var evtobj = window.event? event : e
          //  if (evtobj.keyCode == 90 && evtobj.ctrlKey) alert("Ctrl+z");}
          //document.onkeydown = KeyPress;
        </script>
      
     <?lua@client
        local counter = 0
        local input = 0
        
        local ui = {
          button1 = window.document:getElementById('but'),
          result = window.document:querySelector('.result'),
        }
        
        function keyUpdateUI ()
          ui.result.textContent = counter
        end
        
        function increment ()
          counter = counter + 1
          print(counter)
          keyUpdateUI()
        end
        
        function inity () 
          keyUpdateUI()
          ui.button1:addEventListener('click', increment)
        end
        
        print("running counter script")

        inity()
        running = false
        print("running this script")
        print(running)

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

        local canvas = window.document:getElementById("canvas")
        local ctx = canvas:getContext("2d")

        function resize_canvas() 
          canvas.width = window.innerWidth - 300
          canvas.height = window.innerHeight - 200
          --minimum size is 100x100 px
          if canvas.width < 100 then canvas.width = 100 end
          if canvas.height < 100 then canvas.height = 100 end
        end

        wKeyDown = false
        aKeyDown = false
        sKeyDown = false
        dKeyDown = false

        function downKeys(e)
          if e.keyCode == 87 then wKeyDown = true end
          if e.keyCode == 65 then aKeyDown = true end
          if e.keyCode == 68 then dKeyDown = true end
          if e.keyCode == 83 then sKeyDown = true end
        end

        function upKeys(e)
          if e.keyCode == 87 then wKeyDown = false end
          if e.keyCode == 65 then aKeyDown = false end
          if e.keyCode == 68 then dKeyDown = false end
          if e.keyCode == 83 then sKeyDown = false end
        end

        local map = {
          pipe1 = {x = 1, y = 1, w = 1, col = "#00FF00"},
          pipe2 = {x = 1, y = 1, w = 1, col = "#00FF00"},
          pipe3 = {x = 1, y = 1, w = 1, col = "#00FF00"},
          pipe4 = {x = 1, y = 1, w = 1, col = "#00FF00"},
        }

        local plumber = { 
        x = canvas.width / 2,
        y = canvas.height / 2,
        h = canvas.height / 10,
        w = canvas.width / 15,
        vx = 0,
        vy = 0,
        ax = 0,
        ay = 0,
        maxspeed = 7,
        crouch = false,
        jumps = 2
        } 

        function instructions()
          ctx.font = "20px Arial"
          ctx:fillText("click", 10,15)
          ctx:fillText("to", 10,35)
          ctx:fillText("start", 10,55)
        end

        --char should happen every frame and not leave frame
        function charUpdate()
          plumber.vx = plumber.ax + plumber.vx
          plumber.vy = plumber.ay + plumber.vy
          if plumber.vx > plumber.maxspeed then plumber.vx = plumber.maxspeed end
          if plumber.vx < plumber.maxspeed*-1 then plumber.vx = plumber.maxspeed*-1 end
          if plumber.vy > plumber.maxspeed then plumber.vy = plumber.maxspeed end
          plumber.x = plumber.x + plumber.vx
          plumber.y = plumber.y + plumber.vy

          --char size scale
          if canvas.height / 10 < 10 then
            plumber.h = 10
          else
            plumber.h = canvas.height / 10
          end
          if plumber.w < 10 then
            plumber.w = 10
          else 
            plumber.w = canvas.width / 15
          end
          --left border
          if plumber.x < 0 then
            plumber.x = 0
          end
          --right border
          if plumber.x + plumber.w > canvas.width then
            plumber.x = canvas.width - plumber.w
          end

          --bottom border hits the floor and resets double jump
          if plumber.y + plumber.h + 1 > canvas.height then
            plumber.y = canvas.height - (plumber.h + 1)
            plumber.ay = 0
            plumber.jumps = 2
          end
        
        end

        function moveChar()
        --if 'a' then acc left
          if aKeyDown then
            plumber.ax = -1
        --id 'd' then acc right
          elseif dKeyDown then
            plumber.ax = 1
          else 
            --bring the player to a halt
            plumber.ax = plumber.ax / 4
            if math.abs(plumber.ax) < 0.0001 then 
              plumber.vx = 0
              plumber.ax = 0
            end
          end

          if wKeyDown and plumber.jumps > 0 then
            plumber.ay = -(5)
            plumber.vy = -(plumber.h / 4)
            plumber.jumps = plumber.jumps - 1
          else 
          --gravity
            plumber.ay = 1
          end
        end

        function contUpdate()
            resize_canvas()
            window.document:getElementById("input").textContent = input
            moveChar()
            charUpdate()
            ctx:clearRect(0, 0, canvas.width, canvas.height)
            window:drawsq(plumber.x, plumber.y, plumber.w, plumber.h, "#FF00FF")
            ctx:fillText("Move with wasd", 10, 15)
        end

        function set_time()
            window:setTimeout(keyUpdate, 5)
        end

        function set_interval()
            window:setInterval(contUpdate, 25)
        end

        --game will start on click
        function game_start() 
            if not running then
                resize_canvas()
                running = true
                keyUpdate()
                print("rununing set to true")
                return
            else
                running = false
                print("rununing set to false")
                return
            end
        end

        function init()
          instructions()
          ob:addEventListener('click', openNav)
          cb:addEventListener('click', closeNav)
          window:addEventListener("resize", contUpdate)

          canvas:addEventListener('click', game_start)

          window.document:addEventListener("keydown", downKeys)
          window.document:addEventListener("keyup", upKeys)
          set_interval()
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
