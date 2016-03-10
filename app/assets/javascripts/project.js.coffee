jQuery ->
    $('#projects').dataTable(
      { bJQueryUI: true }
      )
      
    r = $( ".results" )
    for i in r
      if i.innerHTML == 'false'
        i.parentNode.className += " red";
      if i.innerHTML == 'true'
        i.parentNode.className += " green";
      

