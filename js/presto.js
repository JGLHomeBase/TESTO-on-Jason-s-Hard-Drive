// Wait for document to laod
$(document).ready(function () {
    // START: TABLE LINKS
        // Hide table links
        $(".tableLink").hide();
        // Toggle table links as user hovers over row
        $(".tableLink").closest("tr").on("mouseenter", function () {
            $(this).find(".tableLink").show();
            $(this).addClass("HighlightBlue");
        });
        $(".tableLink").closest("tr").on("mouseleave", function () {
            $(this).find(".tableLink").hide();
            $(this).removeClass("HighlightBlue");
        });

        // Toggle highlighting as user hovers over row
        $(".tableHighlight").closest("tr").on("mouseenter", function () {
            $(this).addClass("HighlightBlue");
        });
        $(".tableHighlight").closest("tr").on("mouseleave", function () {
            $(this).removeClass("HighlightBlue");
        });
    // END: TABLE LINKS
    
    // START: PANEL LINKS
        // Hide panel links
        $(".panelLink").hide();
        // Toggle panel links as user hovers over panel
        $(".panelLink").closest(".panel").on("mouseenter", function () {
            $(this).find(".panelLink").show();
            $(this).addClass("HighlightBlue");
        });
        $(".panelLink").closest(".panel").on("mouseleave", function () {
            $(this).find(".panelLink").hide();
            $(this).removeClass("HighlightBlue");
        });

        // Toggle highlighting as user hovers over panel
        $(".tableHighlight").closest(".panel").on("mouseenter", function () {
            $(this).addClass("HighlightBlue");
        });
        $(".tableHighlight").closest(".panel").on("mouseleave", function () {
            $(this).removeClass("HighlightBlue");
        });
    // END: PANEL LINKS

    
    // Heading Entry Effect
    $(".CFHeader").fadeIn(750);
    
    // Page Nav
    $(".pageNavButton").hide();
    $(".pageNavButton").on("click",function(){
        $(".pageNav").show(1000);
        $(".pageNavButton").hide();
        $(".pageNavHideButton").show();
    });
    $(".pageNavHideButton").on("click",function(){
        $(".pageNav").hide(1000);
        $(".pageNavHideButton").hide();
        $(".pageNavButton").show();
    });
});