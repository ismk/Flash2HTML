module F2h
  class Boilerplate




       #===================== WALLBOARD BOX BOILERPLATE ==============================

    def html_boilerplate(foldername, type)
      <<-eos
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="css/#{foldername}_#{type}.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/TweenMax.min.js"></script>
  <script src="js/#{foldername}_#{type}.js"></script>
</head>
<body>
  <div id="overall_mask"></div>
  <!-- Start-of-the-Image-Tags -->
  <!-- End-of-the-Image-Tags -->
  <!-- Start-of-the-ISI -->
  <div id="isi"></div>
  <!-- End-of-the-ISI -->
</body>
</html>

eos
    end

    def wallboard_html_biolerplate(foldername, type)
      <<-eos
  <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="css/#{foldername}_#{type}.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/TweenMax.min.js"></script>
  <script src="js/#{foldername}_#{type}.js"></script>
</head>
<body>
  
  <div id="top_mask"></div>

  <!-- Start-of-the-Image-Tags -->
  <img id="main_image" src="banner_images/main_image.png" alt="">
  <div id="overall_mask"></div>
  <!-- End-of-the-Image-Tags -->
  <div class="pi_mask" id="pi_mask_main"></div>
  <div id="ppi_mask"></div>

  <!-- Start-of-the-ISI -->
  <div id="isi">
    <div class="pi_mask" id="pi_mask_isi"></div>
  </div>
  <!-- End-of-the-ISI -->

</body>
</html>

      eos
    end

    def box_css_boilerplate
      <<-eos
body{
  position: fixed;
  padding: 0;
  margin: 0;
  top: 0;
  left: 0;
}

#overall_mask{
  position: absolute;
  height: 250px;
  width: 300px;
}






  /* Start-of-the-ISI */
#isi{
  position: absolute;
  background-color: white;
  top: 250px;
  width: 300px;
  height: 76px;
  font-size: 12px;
  overflow-y: scroll;
  overflow-x: hidden;
  font-family: "Arial-Narrow";
  padding-left: 5px;
}

#isi::-webkit-scrollbar {
  width: 20px;
}

#isi::-webkit-scrollbar-button:vertical:start:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}

#isi::-webkit-scrollbar-button:vertical:end:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
  }

#isi::-webkit-scrollbar-track {
  background-image: url();
  background-position: center;
  background-repeat: no-repeat;
  background-size: 4px 97%;
}

#isi::-webkit-scrollbar-thumb {
  height: 25px;
  background-image: url();
  background-position: center;
  background-repeat: no-repeat;
}
  /* End-of-the-ISI */

eos
end

    def box_js_boilerplate
      <<-eos
$(function(){
// WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.flashAdImpressionTrack('box-ad')");

  //Start-of-the-animation-code
  //End-of-the-animation-code










    function autoScroll(){
    ascroll = setInterval(function(){
      elem = $("#isi")[0];
      if (elem.scrollTop != 1075){
        elem.scrollTop += 2;
      }
    }, 200);
  }

  $(document).on("touchstart", "#isi", function(){
   clearInterval(ascroll);
  });


  $("#overall_mask").on("click", function(){
    console.log("overall mask was clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('', '<div data-advtype=box-mainClickThrough/>')");
  });

  $("#fdaBtn").on("click", function(){
    console.log("fda btn open button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://www.fda.gov/medwatch/', '<div data-advtype=box-fda-medwatch/>')");
  });

  $("#pi").on("click", function(){
    console.log("pi button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=box-pres-info/>')");
  });

  $("#medguide").on("click", function(){
    console.log("medguide button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=box-med-guide/>')");
  });


});

eos
end




    #===================== BOX BOILERPLATE ==============================

    def html_boilerplate(foldername, type)
      <<-eos
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="css/#{foldername}_#{type}.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/TweenMax.min.js"></script>
  <script src="js/#{foldername}_#{type}.js"></script>
</head>
<body>

  <div id="overall_mask"></div>

  <!-- Start-of-the-Image-Tags -->
  <!-- End-of-the-Image-Tags -->

  <!-- Start-of-the-ISI -->
  <div id="isi"></div>
  <!-- End-of-the-ISI -->

</body>
</html>
eos
    end

    def box_css_boilerplate
      <<-eos
body{
  position: fixed;
  padding: 0;
  margin: 0;
  top: 0;
  left: 0;
}

#overall_mask{
  position: absolute;
  height: 250px;
  width: 300px;
}






  /* Start-of-the-ISI */
#isi{
  position: absolute;
  background-color: white;
  top: 250px;
  width: 300px;
  height: 76px;
  font-size: 12px;
  overflow-y: scroll;
  overflow-x: hidden;
  font-family: "Arial-Narrow";
  padding-left: 5px;
}

#isi::-webkit-scrollbar {
  width: 20px;
}

#isi::-webkit-scrollbar-button:vertical:start:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}

#isi::-webkit-scrollbar-button:vertical:end:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
  }

#isi::-webkit-scrollbar-track {
  background-image: url();
  background-position: center;
  background-repeat: no-repeat;
  background-size: 4px 97%;
}

#isi::-webkit-scrollbar-thumb {
  height: 25px;
  background-image: url();
  background-position: center;
  background-repeat: no-repeat;
}
  /* End-of-the-ISI */

eos
end

    def box_js_boilerplate
      <<-eos
$(function(){
// WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.flashAdImpressionTrack('box-ad')");

  //Start-of-the-animation-code
  //End-of-the-animation-code










    function autoScroll(){
    ascroll = setInterval(function(){
      elem = $("#isi")[0];
      if (elem.scrollTop != 1075){
        elem.scrollTop += 2;
      }
    }, 200);
  }

  $(document).on("touchstart", "#isi", function(){
   clearInterval(ascroll);
  });


  $("#overall_mask").on("click", function(){
    console.log("overall mask was clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('', '<div data-advtype=box-mainClickThrough/>')");
  });

  $("#fdaBtn").on("click", function(){
    console.log("fda btn open button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://www.fda.gov/medwatch/', '<div data-advtype=box-fda-medwatch/>')");
  });

  $("#pi").on("click", function(){
    console.log("pi button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=box-pres-info/>')");
  });

  $("#medguide").on("click", function(){
    console.log("medguide button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=box-med-guide/>')");
  });


});

eos
end



    ######################## BANNER WALLBOARD BOILERPLATE ##########################

    def wallboard_banner_css_boilerplate
      <<-eos
body{
  position: fixed;
  padding: 0;
  margin: 0;
  top: 0;
  left: 0;
}

#overall_mask{
  position: absolute;
  height: 1920px;
  width: 1080px;
}

#top_mask{
  position: absolute;
  height: 150px;
  width: 1080px;
  /*background-color: purple;*/
}

#main_image{
  position: absolute;
}

.isi_image{
  position: relative;
  display: inline-block;
  width: 100%;
}

#pi_mask_main{
  position: absolute;
  width: 248px;
  height: 35px;
  top: 157px;
  left: 250px;
}

#ppi_mask{
  position: absolute;
  width: 290px;
  height: 35px;
  top: 157px;
  left: 516px;
}

#pi_mask_isi{
  position: absolute;
  width: 240px;
  height: 30px;
  top: 3733px;
  left: 223px;
}

  /* Start-of-the-ISI */
#isi{
  position: absolute;
  background-color: white;
  top: 1147px;
  width: 1080px;
  height: 772px;
  font-size: 11px;
  overflow-y: scroll;
  overflow-x: hidden;
  font-family: "Arial-Narrow";
  padding-left: 5px;
}

#isi::-webkit-scrollbar {
  width: 30px;
  margin-top: 10px
}

#isi::-webkit-scrollbar-track {
  background-position: center;
  background-repeat: no-repeat;
  background-color: black;
  background-size: 4px 90%;
}

#isi::-webkit-scrollbar-thumb {
  height: 25px;
  background-color: gray;
  background-position: center;
  background-repeat: no-repeat;
}
  /* End-of-the-ISI */

eos
    end

    def wallboard_banner_js_boilerplate
      <<-eos
$(function(){
  // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.flashAdImpressionTrack('banner-ad')");
  WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.idleSlideTimeSeconds(20)");

  $(".pi_mask").on("click", function(){
    console.log("pi button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/atripla_wallboard/pi_atripla.html', '<div data-advtype=banner-pres-info/>')");
  });

  $("#ppi_mask").on("click", function(){
    console.log("ppi button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/atripla_wallboard/ppi_atripla.html', '<div data-advtype=banner-med-guide/>')");
  });

  var pressTimer;

  $("#overall_mask").on("touchend", function(){
    clearTimeout(pressTimer);
    return false;
  }).on("touchstart", function(){
    pressTimer = window.setTimeout(function(){
      WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.idleSlideActivateLauncherPanel('100', '700')");
    },1000)
    return false;
  });

});

function startScrolling(){
  setTimeout(function autoScroll(){
    ascroll = setInterval(function(){
      elem = $("#isi")[0];
      if (elem.scrollTop != 3200){
        elem.scrollTop += 2;
      }
    }, 12);
  }, 0);
}

$(document).on("touchstart", "#isi", function(){
 clearInterval(ascroll);
});

function onWallboardIdleSlideDisplay(){
  console.log("onWallboardIdleSlideDisplay");
}

function onWallboardIdleSlideTimerStart(){
  console.log("onWallboardIdleSlideTimerStart");
  startScrolling();
}

function onWallboardIdleSlideTimerStop(){
  clearInterval(ascroll);
}
    

eos
end

    ######################## BANNER BOILERPLATE ##########################

    def banner_css_boilerplate
      <<-eos
body{
  position: fixed;
  padding: 0;
  margin: 0;
  top: 0;
  left: 0;
}

#overall_mask{
  position: absolute;
  height: 90px;
  width: 728px;
}







  /* Start-of-the-ISI */
#isi{
  position: absolute;
  background-color: white;
  border-left: 1px solid gray;
  top: 18px;
  left: 428px;
  width: 300px;
  height: 72px;
  font-size: 11px;
  overflow-y: scroll;
  overflow-x: hidden;
  font-family: "Arial-Narrow";
  padding-left: 5px;
}

#isi::-webkit-scrollbar {
  width: 30px;
  margin-top: 10px
}

#isi::-webkit-scrollbar-button:vertical:start:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}

#isi::-webkit-scrollbar-button:vertical:end:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}

#isi::-webkit-scrollbar-track {
  background-image: url();
  background-position: center;
  background-repeat: no-repeat;
  background-size: 4px 90%;
}

#isi::-webkit-scrollbar-thumb {
  height: 25px;
  background-image: url();
  background-position: center;
  background-repeat: no-repeat;
}
  /* End-of-the-ISI */

eos
    end

    def banner_js_boilerplate
      <<-eos
$(function(){
// WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.flashAdImpressionTrack('banner-ad')");

  //Start-of-the-animation-code
  //End-of-the-animation-code







    function autoScroll(){
    ascroll = setInterval(function(){
      elem = $("#isi")[0];
      if (elem.scrollTop != 1075){
        elem.scrollTop += 2;
      }
    }, 200);
  }

  $(document).on("touchstart", "#isi", function(){
   clearInterval(ascroll);
  });


  $("#overall_mask").on("click", function(){
    console.log("overall mask was clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('', '<div data-advtype=banner-mainClickThrough/>')");
  });

  $("#fdaBtn").on("click", function(){
    console.log("fda btn open button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://www.fda.gov/medwatch/', '<div data-advtype=banner-fda-medwatch/>')");
  });

  $("#pi").on("click", function(){
    console.log("pi button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=banner-pres-info/>')");
  });

  $("#medguide").on("click", function(){
    console.log("medguide button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=banner-med-guide/>')");
  });


});

eos
    end

    def pdf_html
      <<-eos
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <style>
img{
  display: block;
  width:100%;
}
    </style>
  </head>

  <body>
  </body>
</html>
eos
    end



    #==================================================

    def img_html(filename, loc)
      <<-eos
<img id="#{filename}" src="#{loc}_images/#{filename}.png" alt="">
eos
    end

    def img_css(filename)
      <<-eos

##{filename}{
  position: absolute;
  top: 0;
  left: 0;
}

eos
    end

    def img_js(filename)
      <<-eos
TweenMax.to(#{filename}, 0.0, {});
eos
    end

  end
end
