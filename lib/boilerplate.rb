module F2h
  class Boilerplate

    #============================== WALLBOARD BANNER BOILERPLATE ==============================

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
</head>
<body>
  <!-- Start-of-the-Image-Tags -->
<!-- End-of-the-Image-Tags -->
  
  <!-- Following wallboard header image needs to be added from personal local files -->
  <img id="top_mask" src="banner_images/wallboard_header.png">
  <div id="overall_mask"></div>

  <!-- Start-of-the-ISI -->
  <div id="isi">
  </div>
  <!-- End-of-the-ISI -->
</body>
<script src="js/#{foldername}_#{type}.js"></script>
</html>
      eos
    end

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
}

/* Start-of-the-ISI */
#isi{
  position: absolute;
  background-color: white;
  top: 1145px;
  width: 1080px;
  height: 783px;
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
  // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.idleSlideTimeSeconds(20)");

  $("#pi").on("click", function(){
    console.log("pi button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('https://docs.google.com/gview?embedded=true&url=ENTER_FULL_URL_HERE', '<div data-advtype=banner-pres-info/>')");
    // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=banner-pres-info/>')");
  });

  $("#medguide").on("click", function(){
    console.log("medguide button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('https://docs.google.com/gview?embedded=true&url=ENTER_FULL_URL_HERE', '<div data-advtype=banner-med-guide/>')");
    // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=banner-med-guide/>')");
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
        elem.scrollTop += 1;
      }
    }, 40);
  }, 0);
}

function animation(){
  //Start-of-the-animation-code
  tl = new TimelineMax();
  tl
//End-of-the-animation-code
}

$(document).on("touchstart", "#isi", function(){
 clearInterval(ascroll);
 WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.idleSlideTimeSeconds(20)"); // Resets idle timer when ISI has been touched
});

function onWallboardIdleSlideDisplay(){
  console.log("onWallboardIdleSlideDisplay");
  startScrolling();
  animation();
}

function onWallboardIdleSlideTimerStart(){
  console.log("onWallboardIdleSlideTimerStart");
}

function onWallboardIdleSlideTimerStop(){
  clearInterval(ascroll);
}

// Remove or comment out below before final launch
startScrolling();
animation();
      eos
    end

    #============================== BOX AND BANNER HTML BOILERPLATE ==============================

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
  <!-- Start-of-the-Image-Tags -->
<!-- End-of-the-Image-Tags -->

  <div id="overall_mask"></div>

  <!-- Start-of-the-ISI -->
  <div id="isi"></div>
  <!-- End-of-the-ISI -->
</body>
</html>
      eos
    end

    #============================== BOX BOILERPLATE ==============================

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
  height: 75px;
  font-size: 12px;
  overflow-y: scroll;
  overflow-x: hidden;
  font-family: "Arial-Narrow";
  padding-left: 5px;
}

#isi::-webkit-scrollbar {
  width: 20px;
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

#isi::-webkit-scrollbar-button:vertical:start:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}

#isi::-webkit-scrollbar-button:vertical:end:decrement{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
  }
/* End-of-the-ISI */
      eos
    end

    def box_js_boilerplate
      <<-eos
$(function(){
  // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.flashAdImpressionTrack('box-ad')");

  //Start-of-the-animation-code
  tl = new TimelineMax();
  tl
//End-of-the-animation-code

  function autoScroll(){
    ascroll = setInterval(function(){
      elem = $("#isi")[0];
      if (elem.scrollTop != 1075){
        elem.scrollTop += 1;
      }
    }, 100);
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
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('https://docs.google.com/gview?embedded=true&url=ENTER_FULL_URL_HERE', '<div data-advtype=box-pres-info/>')");
    // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=box-pres-info/>')");
  });

  $("#medguide").on("click", function(){
    console.log("medguide button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('https://docs.google.com/gview?embedded=true&url=ENTER_FULL_URL_HERE', '<div data-advtype=box-med-guide/>')");
    // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=box-med-guide/>')");
  });
});
      eos
    end

    #============================== BANNER BOILERPLATE ==============================

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
  top: 90px;
  left: 728px;
  width: 300px;
  height: 90px;
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

#isi::-webkit-scrollbar-button:vertical:start:increment{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}

#isi::-webkit-scrollbar-button:vertical:end:decrement{
  display: block;
  background-image: url();
  background-repeat: no-repeat;
  background-position: center;
}
/* End-of-the-ISI */
      eos
    end

    def banner_js_boilerplate
      <<-eos
$(function(){
  // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.flashAdImpressionTrack('banner-ad')");

  //Start-of-the-animation-code
  tl = new TimelineMax();
  tl
//End-of-the-animation-code

  function autoScroll(){
    ascroll = setInterval(function(){
      elem = $("#isi")[0];
      if (elem.scrollTop != 1075){
        elem.scrollTop += 1;
      }
    }, 100);
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
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('https://docs.google.com/gview?embedded=true&url=ENTER_FULL_URL_HERE', '<div data-advtype=banner-pres-info/>')");
    // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=banner-pres-info/>')");
  });

  $("#medguide").on("click", function(){
    console.log("medguide button clicked");
    WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('https://docs.google.com/gview?embedded=true&url=ENTER_FULL_URL_HERE', '<div data-advtype=banner-med-guide/>')");
    // WebViewCommunicator.sendJavascriptTo("main", "javascript:appRouter.homeView.openChildBrowser('http://127.0.0.1:8081/', '<div data-advtype=banner-med-guide/>')");
  });
});
      eos
    end

    def pdf_html
      <<-eos
<!DOCTYPE html>
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
    .from(#{filename}, 1, {opacity: 0})
      eos
    end

  end
end
