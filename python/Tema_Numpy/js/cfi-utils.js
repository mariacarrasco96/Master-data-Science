$(document).ready(function () {
    targetBlank();
    changeTitle();
    scrollToTop();
    pClassDo();
    pClassInfo();
    pClassWarning();
    pClassAd();
    divClassDo();
    divClassInfo();
    divClassWarning();
    divClassAd();
    divClassEj();
    wrapImages();
    generateTOC();
    imageModal();
    navegacion();
    highlightingCode();
    tables();
});

function highlightingCode() {
    hljs.initHighlighting();
}

function targetBlank() {
    $('a').attr('target', '_blank');
}

function tables() {
    $('table').addClass('table').wrap('<div class="table-responsive"></div>');
}

function navegacion(){
    $('#navegacion').append('<nav class="navbar navbar-default navbar-fixed-top" role="navigation"><div class="container-fluid"><div class="navbar-collapse"><ul class="nav navbar-nav navbar-left"><li class="resalte"><a id="anterior" href="lec81.html"><span class="glyphicon glyphicon-backward"></span><span class="hidden-xs">  Sección anterior</span></a></li></ul><div id="navtitle" class="navbar-brand">Título</div><ul class="nav navbar-nav navbar-right"><li class="resalte"><a id="siguiente" href="lec83.html"><span class="hidden-xs">Sección siguiente</span><span class="glyphicon glyphicon-forward"></span></a></li></ul></div></div></nav>');
    var prev = $('#navegacion').attr('prev');
    var next = $('#navegacion').attr('next');
    $('#anterior').attr('href', prev);
    $('#siguiente').attr('href',next);

    if(!prev)
        $('#anterior').remove();
    if(!next)
        $('#siguiente').remove();
    
    $('#navtitle').text($('h2').text());
}

function imageModal() {
    /** Image Modal **/
    $('.thumbnail').click(function(){
        $('.modal-body').empty();
        var title = $(this).parent('a').attr("title");
        $('.modal-title').html(title);
        var content = $(this).parents('div.figure').html();
        content = content || $(this).parents('figure').html();
        content = content || $(this).parents('div.imagen').html();
        $(content).appendTo('.modal-body');
        $('<button class="btn btn-default" data-dismiss="modal">Cerrar</button>').appendTo('.modal-body');
        
        $('#myModal').modal({show:true});
    });  

    $("body").append('<div tabindex="-1" class="modal fade" id="myModal" role="dialog"><div class="modal-dialog"><div class="modal-body"></div></div></div></div>');
}
function changeTitle() {
   $("title").text($("h1").text()); 
}

function scrollToTop() {
   $(window).scroll(function () {
        if ($(this).scrollTop() > 150) {
            $('#to_top').fadeIn();
        } else {
            $('#to_top').fadeOut();
        }
    });

    $('#to_top').click(function () {
        $("html, body").animate({
            scrollTop: 0
        }, 600);
        return false;
    }); 
}

function pClassDo() {
    var elements = $("p.do").wrap('<div class="do-container"></div>');
    /* Cambiar aquí el icono del do */
    elements = elements.before('<div class="beforedo"><span class="glyphicon glyphicon-cog"></span></div>');
    elements = elements.wrap('<div class="do-p"></div>');
}

function pClassInfo() {
    var elements = $("p.info").wrap('<div class="info-container"></div>');
    /* Cambiar aquí el icono del info */
    elements=elements.before('<div class="beforeinfo"><span class="glyphicon glyphicon-info-sign"></span></div>');
    elements = elements.wrap('<div class="info-p"></div>');
}

function pClassWarning() {
    var elements = $("p.warning").wrap('<div class="warn-container"></div>');
    /* Cambiar aquí el icono del do */
    elements=elements.before('<div class="beforewarn"><span class="glyphicon glyphicon-warning-sign"></span></div>');
    elements = elements.wrap('<div class="warn-p"></div>');
}

function pClassAd() {
    var elements = $("p.ad").wrap('<div class="ad-container"></div>');
    /* Cambiar aquí el icono del do */
    elements = elements.before('<div class="beforead"><span class="glyphicon glyphicon-ok-sign"></span></div>');
    elements = elements.wrap('<div class="ad-p"></div>');
}

function divClassDo() {
    var elements = $("div.do").wrap('<div class="do-container"></div>');
    /* Cambiar aquí el icono del do */
    elements = elements.before('<div class="beforedo"><span class="glyphicon glyphicon-cog"></span></div>');
    elements = elements.wrap('<div class="do-p"></div>');
}

function divClassInfo() {
    var elements = $("div.info").wrap('<div class="info-container"></div>');
    /* Cambiar aquí el icono del info */
    elements=elements.before('<div class="beforeinfo"><span class="glyphicon glyphicon-info-sign"></span></div>');
    elements = elements.wrap('<div class="info-p"></div>');
}

function divClassWarning() {
    var elements = $("div.warning").wrap('<div class="warn-container"></div>');
    /* Cambiar aquí el icono del do */
    elements=elements.before('<div class="beforewarn"><span class="glyphicon glyphicon-warning-sign"></span></div>');
    elements = elements.wrap('<div class="warn-p"></div>');
}

function divClassAd() {
    var elements = $("div.ad").wrap('<div class="ad-container"></div>');
    /* Cambiar aquí el icono del do */
    elements = elements.before('<div class="beforead"><span class="glyphicon glyphicon-ok-sign"></span></div>');
    elements = elements.wrap('<div class="ad-p"></div>');
}


function divClassEj() {
    $(".ej_content").each(function(index, elem) {
        var newElem;
        if (! $(elem).parent().is('.ej')) {
            newElem = $(elem).wrap('<div class="ej"></div>');
            newElem = newElem.before('<div class="icon"><span class="flaticon-write12"></span></div>');
        }
        var nextSibling;
        if (newElem)
            nextSibling = newElem.parent().next();
        else
            nextSibling = $(elem).next();
        console.log(nextSibling);
        if (nextSibling.is('.ej_solucion')) {
            console.log(newElem);
            var newElem = $(elem).wrap('<div class="ej_content_sol"></div>')
            newElem = newElem.after(nextSibling)
        }
    })
}


function wrapImages() {
    $(".imagen>img").wrap('<a class="thumbnail"></a>');
    $(".figure>img").wrap('<a class="thumbnail"></a>');
    $("figure > img").wrap('<a class="thumbnail"></a>');
}


function generateTOC() {

    var tocSection = $('#tableOfContents');
    /*
     * Parte nueva para crear las nuevas cabeceras de la tabla de contenidos
     */
    $("#tableOfContents").prepend('<a href="http://cursosinformatica.ucm.es" target="_blank"><img id="logo-CFI" src="../images/logo-CFI.png"></a>');
    var parSeccion = $('<p></p>').text($("h1").text());
    var parTitulo = $('<p></p>').text($("h2").text());
    $("#headTOC").append(parSeccion).append(parTitulo);

    /*
        Cabecera antigua:
        $("#headTOC").text($("h2").text());        
     */

    $("h3").each(function() {
        var innerText = $(this).text();
        var anchorName = innerText.split(' ').join('_');
        anchorName = anchorName.replace(/[^\w\s]/gi, '');
        $(this).attr("id",anchorName);
        tocSection.append('<li><a class="aTOC" href="#'+anchorName+'">'+innerText+'</a></li>');
    });
    
    $('.aTOC').click(function () {
        var name = $(this).attr("href");
        var target = $(name);
        var offset = target.offset();
        $("html, body").animate({
            scrollTop: offset.top-70 // -70 hack par la barra de navegación
        }, 600);
        return false;
    });
}