<!--- Math --->

<cfparam name="mathRows" default="0">
<cfparam name="mathCols" default="0">

<cfif mathRows GT 0 OR mathCols GT 0>

    <cfoutput>
      <script src="#absoluteURL#bower_components/jquery/dist/jquery.min.js"></script>
   

    <script type="text/javascript">
    $(document).ready(function() {
        calculateSum();

        <cfloop from="1" to="#mathRows#" index="index">
            $(".row#index#").on("keydown keyup click", function() {
            calculateSum();
            validateTotals();
        });
        </cfloop>
        <cfloop from="1" to="#mathCols#" index="index">
             $(".col#index#").on("keydown keyup click", function() {
            calculateSum();
            validateTotals();
        });
        </cfloop>
        
    });
        
    function calculateSum() {
        <cfloop from="1" to="#mathRows#" index="index">
            var sumR#index# = 0;
            //iterate through each textboxes and add the values
            $(".row#index#").each(function() {
                //add only if the value is number
                if (!isNaN(this.value) && this.value.length != 0) {
                    sumR#index# += parseInt(this.value);
                }
                else if (this.value.length != 0){
                }
            });
            $("input##sumR#index#").val(sumR#index#);
        </cfloop>
        <cfloop from="1" to="#mathCols#" index="index">
            var sumC#index# = 0;
            //iterate through each textboxes and add the values
            $(".col#index#").each(function() {
                //add only if the value is number
                if (!isNaN(this.value) && this.value.length != 0) {
                    sumC#index# += parseInt(this.value);
                }
                else if (this.value.length != 0){
                }
            });
            $("input##sumC#index#").val(sumC#index#);
        </cfloop>
    }


    function validateTotals() {
        validatePersons();
        validateAdults();
        validateLonelyChildren();
        validateAdultsPlusKids();
        validateAgeUnknown();
        validateLeavers();
        validateStayers();
    }
                
                           
     function validatePersons() {
        var subtotals = $(".subtotal_persons").map(function () {
            return $(this).val(); }).get();
        var subtotalcheck = Number($("##persons").val());
        if (window.console) console.log(subtotals); 
        if (window.console) console.log(subtotals[0]);
        if (window.console) console.log(subtotalcheck);
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    if (window.console) console.log("Unequal");
                    $(".subtotal_persons").removeClass("BGLightGray");
                    $(".subtotal_persons").addClass("BGOrange");
                }
                else {
                    if (window.console) console.log("Equal");
                    $(".subtotal_persons").removeClass("BGOrange");
                    $(".subtotal_persons").addClass("BGLightGray");
                }
            }
        }
     }
 
        
    function validateAdults() {
        var subtotals = $(".subtotal_adults").map(function () {
            return $(this).val(); }).get();
        var subtotalcheck = Number($("##adults").val());
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    $(".subtotal_adults").removeClass("BGLightGray");
                    $(".subtotal_adults").addClass("BGOrange");
                }
                else {
                    $(".subtotal_adults").removeClass("BGOrange");
                    $(".subtotal_adults").addClass("BGLightGray");
                }
            }
        }
    }
     
        
        
    function validateLonelyChildren() {
        var subtotals = $(".subtotal_children").map(function () {
            return $(this).val(); }).get();
        var subtotalcheck = Number($("##children").val());
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    $(".subtotal_children").removeClass("BGLightGray");
                    $(".subtotal_children").addClass("BGOrange");
                }
                else {
                    $(".subtotal_children").removeClass("BGOrange");
                    $(".subtotal_children").addClass("BGLightGray");
                }
            }
        }
     }
    
    function validateAdultsPlusKids() {
        var subtotals = $(".subtotal_adultspluskids").map(function () {
            return $(this).val(); }).get();
        var subtotalcheck = Number($("##adults").val()) + Number($("##children").val());
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    $(".subtotal_adultspluskids").removeClass("BGLightGray");
                    $(".subtotal_adultspluskids").addClass("BGOrange");
                }
                else {
                    $(".subtotal_adultspluskids").removeClass("BGOrange");
                    $(".subtotal_adultspluskids").addClass("BGLightGray");
                }
            }
        }
     }
        
    function validateAgeUnknown() {
        var subtotals = $(".subtotal_ageunknown").map(function () {
            return $(this).val(); }).get();
        var subtotalcheck = Number($("##ageUkwn").val());
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    $(".subtotal_ageunknown").removeClass("BGLightGray");
                    $(".subtotal_ageunknown").addClass("BGOrange");
                }
                else {
                    $(".subtotal_ageunknown").removeClass("BGOrange");
                    $(".subtotal_ageunknown").addClass("BGLightGray");
                }
            }
        }
     }    
        
        
    function validateLeavers() {
       var subtotals = $(".subtotal_leavers").map(function () {
            return $(this).val(); }).get();
       var subtotalcheck = Number($("##leavers").val());
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    $(".subtotal_leavers").removeClass("BGLightGray");
                    $(".subtotal_leavers").addClass("BGOrange");
                }
                else {
                    $(".subtotal_leavers").removeClass("BGOrange");
                    $(".subtotal_leavers").addClass("BGLightGray");
                }
            }
        }
     }
        
        
    function validateStayers() {
        var subtotals = $(".subtotal_stayers").map(function () {
            return $(this).val(); }).get();
        var subtotalcheck = Number($("##stayers").val());
        if (subtotals.length > 0) {
            for ( var i = 0; i < subtotals.length; i++) {
                if(Number(subtotals[i]) != subtotalcheck) {
                    $(".subtotal_stayers").removeClass("BGLightGray");
                    $(".subtotal_stayers").addClass("BGOrange");
                }
                else {
                    $(".subtotal_stayers").removeClass("BGOrange");
                    $(".subtotal_stayers").addClass("BGLightGray");
                }
            }
        }
     }
           
    </script>
     </cfoutput>
</cfif>

<!---/ Math --->