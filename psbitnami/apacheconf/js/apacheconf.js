var ApacheConfApp = angular.module('ApacheConfApp', []);

ApacheConfApp.controller('ApacheConfCtrl', function ($scope) {
    $scope.main_store = {
        domain: '',
        dir: '/'
    };
    $scope.multistores = [];

    $scope.addStore = function () {
        $scope.multistores.push({
            domain: '',
            dir: '/'
        });
    };

    $scope.removeStore = function (index) {
        if (index > -1) {
            $scope.multistores.splice(index, 1);
        }
    };

    $.ajax( 'static/apacheconf.tpl' )
        .done(function(data) {
            $scope.conftpl = data;
        });

    $scope.generate = function () {
        var multistores = $.extend(true, [], $scope.multistores);
        var main_store = $.extend(true, {},  $scope.main_store);
        var config = {
            main_store: main_store
        };

        // Add indexes for mustache js and remove dir if necessary. Also strip / from dir.
        for (var i = 0; i < multistores.length; i++) {
            multistores[i].index = i;
            if (multistores[i].dir == '/') {
                delete multistores[i].dir;
            } else if (/^\/(.*\/)*$/.test(multistores[i].dir)) {
                multistores[i].dir = multistores[i].dir.substring(1, multistores[i].dir.length);
                multistores[i].dir = multistores[i].dir.substring(0, multistores[i].dir.length - 1);
            }
        }
        if (main_store.dir == '/') {
            delete main_store.dir;
        }
        if (/^\/(.*\/)*$/.test(main_store.dir)) {
            main_store.dir = main_store.dir.substring(1, main_store.dir.length);
            main_store.dir = main_store.dir.substring(0, main_store.dir.length - 1);
        }
        if (multistores.length > 0) {
            config.multistores = multistores;
        }

        $('#apacheconf').html(Mustache.render($scope.conftpl, config));
        $('pre code').each(function(i, block) {
            hljs.highlightBlock(block);
        });
    }
});

function fnSelect(objId) {
    fnDeSelect();
    if (document.selection) {
        var range = document.body.createTextRange();
        range.moveToElementText(document.getElementById(objId));
        range.select();
    }
    else if (window.getSelection) {
        var range = document.createRange();
        range.selectNode(document.getElementById(objId));
        window.getSelection().addRange(range);
    }
}
function fnDeSelect() {
    if (document.selection)
        document.selection.empty();
    else if (window.getSelection)
        window.getSelection().removeAllRanges();
}

$(document).ready(function () {
    $("#apacheconf").click(
        function () {
            fnSelect("apacheconf");
        });
});
