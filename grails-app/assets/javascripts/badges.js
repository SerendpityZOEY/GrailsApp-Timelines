// When Document is ready, build treehouse Badge Widget
$(document).ready(function () {

    // Replace the value for var 'e' with your Treehouse Username
    var e = "rileyhilliard",

    // Treehouse Json
        t = "https://teamtreehouse.com/" + e + ".json",

    // Badges JQuery Identifier
        n = $("#badges"),

    // Badges Array
        r = [],

    // Badges Count
        i = 0;

    // Json Parse Treehouse User Badges Info
    $.getJSON(t, function (e) {

        // User Json Parse Select Badges Info
        var t = e.badges;

        // Construct Each badge's HTML
        for(i=0;i<13;i++){
            r+='<li><a href="' + t.url + '" target="_blank"><img src="https://achievement-images.teamtreehouse.com/Generic_Newbie.png" alt="' + t.name + '" title="' + t.name + '"/></a></li>';
        }

        // Append Badge to #badges
        n.append(r);

    });
});