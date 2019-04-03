$("#selectSite div select").change(function(){
    $("#queryScope").removeAttr("hidden");
})
$("#queryScope div select").change(function(){
    if($("#queryScope div select").val()=="day"){
        $("#select-time").removeAttr("hidden");
        $("#threshold").removeAttr("hidden");
        $("#startAnalysis").removeAttr("hidden");
    }
})

$("#startAnalysis").click(function(){
    $("#analysisResult").removeAttr("hidden");
});

