local main = {}

function main.index(page)
    page:render('index')
end

function main.test(page)
    page:render('test')
end

function main.about(page)
    page:render('about')
end

function main.resume(page)
    page:render('resume')
end

function main.projects(page)
    page:render('projects')
end

function main.contact(page)
    page:render('contact')
end

function main.coming(page)
    page:render('coming')
end

function main.gify(page)
    page.theme = 'geo'
    page:render('gify', {msg = "Play with Flowy!"})
end

return main
