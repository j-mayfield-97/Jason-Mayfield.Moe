--canvas game script
		
print(running)
local input = 0
local num = 0

local canvas = window.document:getElementById("canvas")
local ctx = canvas:getContext("2d")

local plumber = { x = 10,
            y = 10,
            h = canvas.height / 10,
            w = canvas.width / 10
        }

--instructions to start game
function instructions()
    ctx.font = "20px Arial"
    ctx:fillText("click", 10,15)
    ctx:fillText("to", 10,35)
    ctx:fillText("start", 10,55)
end

--canvas resizes when window resizes
function resize_canvas() 
    canvas.width = window.innerWidth - 300
    canvas.height = window.innerHeight - 200
    --minimum size is 100x100 px
    if canvas.width < 100 then canvas.width = 100 end
    if canvas.height < 100 then canvas.height = 100 end
end

--game will start on click
function game_start() 
    if not running then
        resize_canvas()
        running = true
        print("rununing set to true")
        num = num + 1
        return
    else
        print("rununing set to false")
        num = num + 1
        return
    end
end

log = window.document:getElementById('para')
log.textContent = "log :"

function inputFunc(e) 
    log.textContent = e.keyCode
    input = e.keyCode
end

function update()
    plumber.x = plumber.x + 1
    print(plumber.x)
    ctx.fillStyle = #ff0000;
    ctx.fillRect(plumber.x, plumber.y, plumber.width, plumber.height)
end

function game()
    print(plumber.x)
    --clear 
    ctx:clearRect(0, 0, canvas.width, canvas.height)
    --update logic and draw
    setInterval(update(), 20)


end

function inity()
    print (num)

    canvas:addEventListener('click', game_start)
    window:addEventListener("resize", resize_canvas)
    window.document:addEventListener("keydown", inputFunc)
    while running do
    --if game not running then show instructions to start
     print("end of init" .. running)
     end
    print(num)
end

inity()
print (num)