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
<style type="text/css">
 .topcorner{
   position:absolute;
   top:0;
   right:0;
  }
</style>
  <body>

    <!-- Wrap all page content here -->
    <div id="wrap">

        <div id="mySidenav" class="sidenav">
          <a href="#" class="closebtn" >&times;</a>
          <a href="/?r=main">Landing</a>
          <a href="/?r=main/about">About Me</a>
          <a href="/?r=main/resume">Resume</a>
          <a href="/?r=main/projects">Projects</a>
          <a href="/?r=main/site">Web Dev & Tools</a>
          <a href="/?r=main/gify">Gify</a>
          <a href="/?r=main/contact">Contact</a>
          <a href="/?r=main/test">Test</a>
        </div>
         <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
          <span id="openNavBut" style="font-size:30px;cursor:pointer;padding-right: 120px" >&#9776; Menu</span>
           <h1> Jason Mayfield </h1> 
        </nav>

        <div class="page-header" id="heading">
          <p class="lead">
            Navigate with Menu Button in the corner OR navigate with the game if you have a keyboard.
          </p>
        </div>

        <div class="topcorner"><a href ="https://github.com/j-mayfield-97"><img src="../../assets/img/github.png"  width="90" height="90" ></a></div>

        <canvas id = "canvas" width="100" height="100" style="border:5px solid #000000; background-color: #f1f1f1;">
        </canvas>

        <script>
          function drawsq(x, y, w, h, col){
          var canvass = document.getElementById("canvas");
          var ctxs = canvas.getContext("2d");
          ctxs.fillStyle = col; 
          ctxs.fillRect(x, y, w, h);
          ctxs.fillStyle = "#000000"; 
          return}
        </script>
      
     <?lua@client
        local input = 0
        
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
        --we dont want to do floating point calcs everytime so have sizes change only when window changed

        local resized = true

        function resize_canvas() 
        
          canvas.width = window.innerWidth * (7/10)
          canvas.height = window.innerHeight * (7/10)
          canvas.alignment = "center"
          --minimum size is 300x300 px
          if canvas.width < 300 then canvas.width = 300 end
          if canvas.height < 300 then canvas.height = 300 end

          resized = true
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
          pipes = {
            a = {ord = 1, x = 0, y = 1, w = 1, h = 1, col = "#007F00", link="/?r=main/resume", text="resume"},
            b = {ord = 2, x = 1, y = 1, w = 1, h = 1, col = "#009F00", link="/?r=main/about", text="about"},
            c = {ord = 3, x = 2, y = 1, w = 1, h = 1, col = "#007F00", link="/?r=main/site", text="site"},
            d = {ord = 4, x = 3, y = 1, w = 1, h = 1, col = "#009F00", link="/?r=main/contact", text="contact"},
            e = {ord = 5, x = 4, y = 1, w = 1, h = 1, col = "#007F00", link="/?r=main/projects", text="projects"}
          },
          blocks = {
            a = {ord = 1, x = 1, y = 1, w = 1, h = 1, col = "#B55E0C"},
            b = {ord = 2, x = 1, y = 1, w = 1, h = 1, col = "#B55E0C"}
          },
          bg = {x = 0, y = 0, w = canvas.width, h = canvas.height, col = "#7FB0FF"},
          floor = {x = 0, y = canvas.height*(9/10), w = canvas.height/10, h = canvas.height/10, col = "#B55E0C"},
          cloud = {x = 0, y = canvas.height*(3/10), w = canvas.height/10, h = canvas.height/10, col = "#F1F1F1"}
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
          jumps = 2,
          leftObs = false, lwall = 0,
          rightObs = false, rwall = 0,
          upObs = false, uwall = 0,
          botObs = false, dwall = 0,
          botHeight = canvas.height
        } 
        --update and draw cloud
        function cloud_func()
          map.cloud.x = map.cloud.x - 1
          if (map.cloud.x + map.cloud.w < 0) then
            map.cloud.x = canvas.width
          end
          ctx.fillStyle = map.cloud.col
          ctx:fillRect(map.cloud.x, map.cloud.y, map.cloud.w, map.cloud.h)
          ctx:fillRect(map.cloud.x + map.cloud.w -7, map.cloud.y + map.cloud.h/2 -7, map.cloud.w/3, map.cloud.h/3)
          ctx:fillRect(map.cloud.x + map.cloud.w/2 +10, map.cloud.y +  map.cloud.h -5, map.cloud.w/2, map.cloud.h/2)
          ctx:fillRect(map.cloud.x - 10, map.cloud.y - 10, map.cloud.w /5, map.cloud.h/2)
          ctx:fillRect(map.cloud.x + 10, map.cloud.y + map.cloud.h + 7, map.cloud.w /3, map.cloud.h/2)
          ctx:fillRect(map.cloud.x + map.cloud.w/2, map.cloud.y - map.cloud.h/4, map.cloud.w/4, map.cloud.h/4)
          ctx.fillStyle = "#000000"
        end

        function mapping_func()
          --text is set here from a previous function
          ctx.font = "25px Arial"
          --draw background
          window:drawsq(map.bg.x, map.bg.y, map.bg.w, map.bg.h, map.bg.col)
          window:drawsq(map.floor.x, map.floor.y, map.floor.w, map.floor.h, map.floor.col)
          cloud_func()

          --loop through pipes and place them out and draw
          for k, v in pairs(map.pipes) do 
            if resized then 
              v.w = canvas.width / 20
              v.h = canvas.height / 3
              v.x = (canvas.width * v.ord ) / 6
              v.y = canvas.height - v.h

              map.bg.w = canvas.width
              map.bg.h = canvas.height
              map.floor.y = canvas.height * (9/10)
              map.floor.w = canvas.width
              map.floor.h = canvas.height / 10
              map.cloud.w = canvas.width / 10
              map.cloud.h = canvas.height / 10
            end
            
            window:drawsq(v.x, v.y, v.w, v.h, v.col)
            ctx:fillText(v.text, v.x - 20 , v.y - (26 * ((v.ord % 2)+1)))
          end
          
        end

        function collision()
          for k,v in pairs(map.pipes) do

            -- right of plumber passes pipe's left AND left of plumber passes pipe right
            if ((plumber.x + plumber.w  > v.x)and(plumber.x < v.x + v.w)) then 
            -- bottom of plbr is lower than pipe block 
              if plumber.y + (plumber.h/2) > v.y then 

                if plumber.vx > 0 then 
                  plumber.rightObs = true
                  plumber.x = v.x - plumber.w -1
                  plumber.ax = 0
                  plumber.vx = 0
                elseif plumber.vx < 0 then
                  plumber.leftObs = true 
                  plumber.x = v.x + v.w + 1
                  plumber.ax = 0
                  plumber.vx = 0
                end -- velocity check
                
                --bounce off wall
              end -- y axis check 
              if (plumber.y + plumber.h) >= v.y and plumber.vy >= 0 then 
                --plumber.y =  v.y - (plumber.h)
                plumber.botObs = true
                plumber.vy = 0
                plumber.jumps = 1
                if plumber.crouch and plumber.y < v.y then 
                     window.location:replace(v.link)
                end --crouch check end
              end --set to floor              
           end -- x axis boundary check end        
          end -- loop end
        end --function end

        --char should happen every frame and not leave frame
        function charUpdate()
        --movement calculations
            
          plumber.vx = plumber.ax + plumber.vx
          plumber.vy = plumber.ay + plumber.vy
          if plumber.botObs then 
            plumber.vy = 0
          end
         
          if plumber.vx > plumber.maxspeed then plumber.vx = plumber.maxspeed end
          if plumber.vx < plumber.maxspeed*-1 then plumber.vx = plumber.maxspeed*-1 end
          --if plumber.vy > plumber.maxspeed then plumber.vy = plumber.maxspeed end
         --check collision
          collision()

          plumber.x = plumber.x + plumber.vx
          plumber.y = plumber.y + plumber.vy

          if resized then
          --char size scale
            if canvas.height / 10 < 10 then
              plumber.h = 10
            else
              plumber.h = canvas.height / 10
              --crouch
              if plumber.crouch then 
                plumber.h = canvas.height / 20 
              end
            end
            if plumber.w < 10 then
              plumber.w = 10
            else 
              plumber.w = canvas.width / 25
            end
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
          if plumber.y + plumber.h + 3 > (canvas.height*(9/10)) then
            plumber.y = (canvas.height*(9/10)) - plumber.h
            plumber.ay = 0
            plumber.vy = 0
            plumber.jumps = 1
            plumber.botObs = false
          else
          --gravity
            plumber.ay = 1.2
            plumber.botObs = false
          end
        end

        function moveChar()

        --if 'a' then acc left
          if aKeyDown  then
            plumber.ax = -1
        --id 'd' then acc right
          elseif dKeyDown then
            plumber.ax = 1
          else 
            --bring the player to a halt
            plumber.ax = plumber.ax / 4.5
            if math.abs(plumber.ax) < 0.0001 then 
              plumber.vx = 0
              plumber.ax = 0
            end
          end

          --crouch
          if sKeyDown then 
            plumber.crouch = true
          else
            plumber.crouch = false
          end
          --jump
          if wKeyDown and plumber.jumps > 0 then
            plumber.ay = -(5)
            plumber.vy = -(plumber.h / 4)
            plumber.jumps = plumber.jumps - 1
          end
        end

        function contUpdate()
            moveChar()
            charUpdate()
            ctx:clearRect(0, 0, canvas.width, canvas.height)
            mapping_func()
            window:drawsq(plumber.x, plumber.y, plumber.w, plumber.h, "#DD0022")
            ctx:fillText("Move with W A S D - Crouch on pipe to follow path", 10, 25)
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
                print("rununing set to true")
                return
            else
                running = false
                print("rununing set to false")
                return
            end
        end

        function init()
          ob:addEventListener('click', openNav)
          cb:addEventListener('click', closeNav)
          window:addEventListener("resize", resize_canvas)

          canvas:addEventListener('click', game_start)

          window.document:addEventListener("keydown", downKeys)
          window.document:addEventListener("keyup", upKeys)
          set_interval()
          resized = false
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
