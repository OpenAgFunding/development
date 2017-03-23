import json
import requests
from string import Template
import csv



## Get rid of all the types - just give the values
def simplify_bindings(row):
    ret = {}
    for field in row:
        ret.update({field: row[field]['value']})
    return ret


def term_tree(term,termlist,path=[]):
    path.insert(0,term.split("/")[-1])
    if termlist[term]['parent'] in termlist:
        path = term_tree(termlist[term]['parent'],termlist,path)
    return path


def generate_tree(starting_term,title="",namespace="http://id.agrisemantics.org/gacs"):
    
    output = []

    # First we want to get the label and Agrovoc mapping of the root term
    root_query = Template("""PREFIX skosxl: <http://www.w3.org/2008/05/skos-xl#>

    SELECT DISTINCT ?label, ?match WHERE { 
        {
            <$namespace/$term> skos:prefLabel ?label.
             FILTER(lang(?label) = "en")
        } UNION {
            <$namespace/$term> skosxl:prefLabel ?labelURI.
            ?labelURI skosxl:literalForm ?label.
            FILTER(regex(str(?labelURI),"xl_en"))
        }
        OPTIONAL { 
            <$namespace/$term> skos:exactMatch ?match. 
            FILTER(regex(str(?match), "agrovoc")) 
        }
        
        }""").substitute(term=starting_term,namespace=namespace)

    print(root_query)

    data = requests.get("http://localhost:8890/sparql",{'format':"application/sparql-results+json", 'query':root_query})

    root_term = simplify_bindings(data.json()['results']['bindings'][0])

    output.append({'term_path':starting_term,'term_id':starting_term,'term_url':'http://id.agrisemantics.org/gacs/'+starting_term,'title':root_term['label'].capitalize(),'agrovoc':root_term.get('match',''),'level':1})



    query = Template("""PREFIX skosxl: <http://www.w3.org/2008/05/skos-xl#>

        SELECT DISTINCT * WHERE {
      
       <$namespace/$term> skos:narrower+ ?t.
       
       {
            ?t skos:prefLabel ?label.
            FILTER(lang(?label) = "en")
       } UNION {
            ?t skosxl:prefLabel ?labelURI.
            ?labelURI skosxl:literalForm ?label.
            FILTER(regex(str(?labelURI),"xl_en"))
       }
       
       {
        ?t skos:broader ?parent.
        ?parent skos:prefLabel ?parentLabel. 
        ?parent skos:broader+ <$namespace/$term>. 
       } UNION {
         ?t skos:broader ?parent.
         ?parent skos:prefLabel ?parentLabel. 
         FILTER(?parent=<$namespace/$term>)
       }

       OPTIONAL { ?t skos:exactMatch ?match. 
       FILTER(regex(str(?match), "agrovoc")) }
       
       FILTER(lang(?parentLabel) = "en")
     } ORDER BY ?parentLabel""").substitute(term=starting_term,namespace=namespace)

    print(query)

    data = requests.get("http://localhost:8890/sparql",{'format':"application/sparql-results+json", 'query':query})


    termlist = {}

    # Build a dictionary with the term as the key, and the results as the values
    # Note - if a term appears multiple times, we're over-writing its data...
    # This could be an issue we need to check-on...
    for row in data.json()['results']['bindings']:
        termlist.update({row['t']['value']: simplify_bindings(row)})




    for term in termlist:
        tree = term_tree(term,termlist,[])
        tree.insert(0,starting_term)
        output.append({'term_path':">".join(tree),'term_id':term.split("/")[-1],'term_url':term,'title':("- "*(len(tree)-1) + "" + termlist[term]['label'].capitalize()),'agrovoc':termlist[term].get('match',''),'level':len(tree)})

    output.sort(key=lambda term: term['term_path'])
    #print(json.dumps(output,indent=2))

    keys = output[0].keys()
    with open(title+"-"+starting_term + '.csv', 'w') as output_file:
        dict_writer = csv.DictWriter(output_file, ['level','term_path','term_id','term_url','title','agrovoc'])
        dict_writer.writeheader()
        dict_writer.writerows(output)

# Crops
generate_tree("C422","GACS-Crops")

# Processing
generate_tree("C1156","GACS-Processing")

# Products
generate_tree("C4648","GACS-Products")

#Technology
generate_tree("C2308","GACS-Technology")

#Technology
generate_tree("C584","GACS-Nutrition")


