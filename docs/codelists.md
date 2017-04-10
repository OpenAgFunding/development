<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-sheetrock/1.1.4/dist/sheetrock.min.js"></script>
<style><!--
.itemcode { display:block; }
table td:nth-child(5) { display:none; }
table th:nth-child(5) { display:none; }
--></style>


Codelists
=========

The most widely used codelist for classifying aid activities and investments (the OECD DAC CRS Purpose codes) does not provide enough specificity when it comes to agriculture and food security. 

As a result, the [Open Ag Funding framework](framework.md) asks funders to provide additional activity classification using a detailed agricultural vocabulary.

We are working to develop an extract of the GACS, the [Global Agricultural Concept Scheme](http://www.agrisemantics.org/gacs/) that supports tagging on the following dimensions

* Crops - Does this activity focus on a particular kind of crop?
* Animal products - Does this activity focus on particular livestock or animals?
* Processing - Does this activity focus on a particular form of processing?
* Products - Does this activity focus on a particular form of product?
* Technology - Does this activity has a particular technology focus?
* Nutrition - Does this activity have a specific nutrition focus?

GACS is a structured thesaurus, with a cross-walk for many terms to AGROVOC. 

Terms are arranged in a hierarchy, allowing tagging and search interfaces to support classification and retrieval of IATI activities at various levels of granularity. 

## Example codelist extract

You can use the search box below to find tags currently included in our draft list.

When you select a tag, the term hierarchy will be displayed.

<script type="text/javascript">
function selectBox(error,options,data){
    var selectData = []
    for(i = 1; i < data.rows.length; i++) {
        selectData.push({
            id:data.rows[i].cellsArray[1],
            text:data.rows[i].cellsArray[2],
            path:data.rows[i].cellsArray[4],
            group:data.rows[i].cellsArray[0]})
        }
    $('.codelist').select2({
        data:selectData,
        templateSelection: function(item) {
            return item.text.replace(/-\W/g,"");
        }
    }
   );
   $('select').on('select2:select', function (evt) {  
    data = evt.params.data
    var output = []
    path = data['path'].split(">")
    for(p = 0; p < path.length; p++) {
        var pathname = $.grep(selectData, function(e){ return e.id == path[p]; });
        output.push("<a target='_blank' href='http://id.agrisemantics.org/gacs/"+pathname[0].id+"'>"+pathname[0].text.replace(/-\W/g,"") +"</a>")
    }
    $(".selectedcodes").append("<span class='itemcode' id='"+data.id+"'>"+output.join(" &gt; ")+"</span>")
   });
   $('select').on('select2:unselect', function (evt) {  
    console.log(evt.params.data)
    $("#"+data.id).remove()
    });
   $(".js-warning").remove()
}
$(function(){
    var mySpreadsheet = 'https://docs.google.com/spreadsheets/d/1wCjOiVLsGNwp7Cz4KZOXUy9eaGZpoeztk1BoFo2JLxk/edit#gid=0';
    var query = "SELECT B, E, G, K, D WHERE A = 'GACS' AND H = 1";
// Load an entire worksheet.
$('#codes').sheetrock({
  url: mySpreadsheet,
  query: query,
  callback: selectBox
});
});
</script>

<select class="codelist" multiple="multiple" style="width: 50%">
</select>
<div class="selectedcodes"></div>

<span class="js-warning">(Note: Javascript required; loading may be slow)</span>

### Full codelist

The full draft codelist is displayed below. Work is ongoing to reduce this down to a more manageable size by editorially removing certain terms.

<table id="codes" class="table table-condensed table-striped"></table>