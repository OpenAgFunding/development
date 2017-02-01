/**
 * Dynamic multiple language example code block.
 * Adapted from examplecode to work with multiple separate blocks. 
 */

function e1() {
  var u='',i=0;
  while(i++<36) {
    var c='xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'[i-1],r=Math.random()*16|0,v=c=='x'?r:(r&0x3|0x8);
    u+=(c=='-'||c=='4')?c:v.toString(16)
  }
  return u;
}

$(function() {

  $('div.doc-tabs').each(function() {
    var example_sel = $('<ul />', { class: "example-selector" });
    var i = 0;
    $(this).children('div').each(function() {
      tabid = e1()
      firstClass = $(this).attr('class').split(' ')[0]
      title = firstClass.replace("highlight-","").replace("admonition-","")
      
      var sel_item = $('<li />', {
          class: tabid,
          text: title
      });
      if (i++) {
        $(this).hide();
      } else {
        sel_item.addClass('selected');
      }
      example_sel.append(sel_item);
      $(this).addClass(tabid);
      $(this).addClass('example');
    });
    $(this).prepend(example_sel);
    example_sel = null;
    i = null;
  });

  $('div.doc-tabs ul.example-selector li').click(function(evt) {
    evt.preventDefault();
    $('ul.example-selector li').removeClass('selected');
    var sel_class = $(this).attr('class');
    $(this).parents("div.container").children("div.example").hide();
    // $('div.example').hide();
    $('div.' + sel_class).show();
    $('ul.example-selector li.' + sel_class).addClass('selected');
    sel_class = null;
  });

});

