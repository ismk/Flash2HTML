# Flash2HTML

##### Current Version: 0.9.4

Boilerplate code that provides sane default settings when making html5 assets using html,css and js from Flash creatives
We use GreenSock TweenMax library to create javascript animations for images

Gem has a couple of dependencies: image magik to generate images from PDFs



## Installation

Install the gem:

```ruby
gem install 'f2h'
```

## Usage
The f2h gem takes simple arugments to generate files:

To initialize a directory with the files, run:
```ruby
f2h new
```

This command takes the root directory as path name and using the foldername generates the following files:

```
|____banner_images
|____box_images
|____css
| |____<foldername>_banner.css
| |____<foldername>_box.css
|____js
| |____jquery.min.js
| |____<foldername>_banner.js
| |____<foldername>_box.js
| |____TweenMax.min.js
|____<foldername>_banner.html
|____<foldername>_box.html
```



Example if you run `f2h new` IN a folder named `Lorem`

```
|____banner_images
|____box_images
|____css
| |____Lorem_banner.css
| |____Lorem_box.css
|____js
| |____jquery.min.js
| |____Lorem_banner.js
| |____Lorem_box.js
| |____TweenMax.min.js
|____Lorem_banner.html
|____Lorem_box.html
```

With boilerplate code in HTML, CSS and JS files.

##### BOX HTML
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="css/Lorem_box.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/TweenMax.min.js"></script>
  <script src="js/Lorem_box.js"></script>
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
```

##### BOX CSS
```css
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

```

##### BOX JS
```js
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

```



Use the following command to generate image tags in html

```ruby
f2h g img box | banner | both <filename>
```

* We can pass `box` , `banner` or `both` to specify in what type of image tags needs to be inserted in.
* Currently all the filenames that are passed into as args are appended the extension of PNG
* When image is inserted in the html, it yanks the name and uses it to define as the id
* Using the id selector the tag is generated in CSS and JS as well

Example if we run `f2h g img box ipsum` the following code will be inserted in the box type files

####Lorem_box.html

```
...

  <img id="ipsum" src="box_images/ipsum.png" alt="">

...
```

####Lorem_box.css

```
...

#ipsum{
  position: absolute;
  top: 0;
  left: 0;
}

...
```
####Lorem_box.js

```
...

  TweenMax.to(ipsum, 0.0, {});

...
```




## Development
[x] Generate Tags in HTML, CSS and JS

[ ] Implement Destroy method to delete generated tags in all 3 files ( HTML, CSS, JS)

[ ] Migrate to TimeLine instead of using TweenMax for animations

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ismk/Flash2HTML. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

